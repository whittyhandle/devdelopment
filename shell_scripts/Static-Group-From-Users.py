#!/usr/bin/python

####################################################################################################
#
# Copyright (c) 2016, JAMF Software, LLC.  All rights reserved.
#
#       Redistribution and use in source and binary forms, with or without
#       modification, are permitted provided that the following conditions are met:
#               * Redistributions of source code must retain the above copyright
#                 notice, this list of conditions and the following disclaimer.
#               * Redistributions in binary form must reproduce the above copyright
#                 notice, this list of conditions and the following disclaimer in the
#                 documentation and/or other materials provided with the distribution.
#               * Neither the name of the JAMF Software, LLC nor the
#                 names of its contributors may be used to endorse or promote products
#                 derived from this software without specific prior written permission.
#
#       THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY
#       EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#       WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#       DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE, LLC BE LIABLE FOR ANY
#       DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#       (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#       LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#       ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#       (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#       SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#   Author: Matt Aebly
#   Last Modified: Oct 19, 2016
#   Version: 1.1
#
#   Description: Creates a static user group based on a csv upload of users
#   
#
#   Usage: python Static-Group-From-Users
#
#
####################################################################################################
import httplib
import urllib2
import socket
import ssl
import getpass
import base64
import logging
import csv
import sys
import json

# Force TLS since the JSS now requires TLS+ due to the POODLE vulnerability
class TLS1Connection(httplib.HTTPSConnection):
    def __init__(self, host, **kwargs):
        httplib.HTTPSConnection.__init__(self, host, **kwargs)

    def connect(self):
        sock = socket.create_connection((self.host, self.port), self.timeout, self.source_address)
        if getattr(self, '_tunnel_host', None):
            self.sock = sock
            self._tunnel()

        self.sock = ssl.wrap_socket(sock, self.key_file, self.cert_file, ssl_version=ssl.PROTOCOL_TLSv1)


class TLS1Handler(urllib2.HTTPSHandler):
    def __init__(self):
        urllib2.HTTPSHandler.__init__(self)

    def https_open(self, req):
        return self.do_open(TLS1Connection, req)

def main():
    if len(sys.argv) >= 2:
        jss_url = sys.argv[1]
    else:
        jss_url  = raw_input("JSS URL: ")

    if int(len(sys.argv)) >= 3:
        jss_user = sys.argv[2]
    else:
        jss_user = raw_input("JSS Username: ")

    if int(len(sys.argv)) >= 4:
        jss_pass = sys.argv[3]
    else:
        jss_pass = getpass.getpass("JSS Password: ")

    md_group = raw_input("Static Group Name: ")
    csv_file = raw_input("CSV File: ")

    logging.basicConfig(filename="/Users/Shared/static-group-from-users.log",level=logging.DEBUG,format='%(asctime)s [%(levelname)s] %(message)s')

    logging.info("Starting Static Group Creation")

    user_list = []

    with open(csv_file.replace('\\','').strip(),'rU') as user_file:
            serialReader = csv.reader(user_file,delimiter=',')
            for serialRow in serialReader:
                endpoint = "%s/JSSResource/users/name/%s" % (jss_url,serialRow[0])

                opener = urllib2.build_opener(TLS1Handler())
                request = urllib2.Request(endpoint)
                request.add_header("Authorization", "Basic " + base64.b64encode('%s:%s' % (jss_user,jss_pass)))
                request.add_header("Accept", "application/json")
                request.get_method = lambda: 'GET'

                try:
                    response = opener.open(request)
                    logging.info("Found User With Name %s" % serialRow[0])
                    user_info = json.load(response)
                    user_list.append(user_info['user']['id'])
                except urllib2.HTTPError as e:
                    if str(e.code) == "400":
                        logging.error("Could Not Find User With Name %s" % serialRow[0])
                    else:
                        logging.error("Could Not Find User (Error Code %s)" % str(e.code))
                except urllib2.URLError as e:
                    logging.error("URL Issues: " + str(e))

    group_xml = "<user_group><name>" + md_group + "</name><is_smart>false</is_smart><users>"

    for md_id in user_list:
        group_xml += "<user><id>%s</id></user>" % md_id

    group_xml += "</users></user_group>"

    opener = urllib2.build_opener(TLS1Handler())
    request = urllib2.Request(jss_url + "/JSSResource/usergroups/id/0" ,group_xml)
    request.add_header("Authorization", "Basic " + base64.b64encode('%s:%s' % (jss_user,jss_pass)))
    request.add_header('Content-Type', 'application/xml')
    request.get_method = lambda: 'POST'

    try:
        opener.open(request)
        logging.info("Added Static User Group")
    except urllib2.HTTPError as e:
        logging.error("Couldn't Add Static User Group")
    except urllib2.URLError as e:
        logging.error("URL Issues: " + str(e))

main()