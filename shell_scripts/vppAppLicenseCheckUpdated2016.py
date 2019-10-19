

#!/usr/bin/python
####################################################################################################
#
# Copyright (c) 2017, JAMF Software, LLC.  All rights reserved.
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
#
####################################################################################################

import urllib2
import json
import httplib

vpp_licenses_url = 'https://vpp.itunes.apple.com/WebObjects/MZFinance.woa/wa/getVPPLicensesSrv'
vpp_user_url = 'https://vpp.itunes.apple.com/WebObjects/MZFinance.woa/wa/getVPPUserSrv'
app_search_api = 'http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/wa/wsLookup?id='
stoken_file = ''
csv_file = '/Users/Shared/licenses.csv'
token_string = ''
app_adam_id = ''
my_app_info = ''


def main():
    global token_string
    global stoken_file
    global app_adam_id
    if stoken_file == '':
        stoken_file = raw_input('Path to VPP sToken: ')
    if app_adam_id == '':
        app_adam_id = raw_input('App\'s adam ID: ')
    license_file = open(csv_file,'wb')
    license_file.write('App ID,License ID,App Name,App Bundle ID,License Status,Assigned User ID,Assigned User Email, \
    Assigned User Association Status')
    license_file.close()
    token_string_file = open(stoken_file.replace('\\','').strip())
    token_string = token_string_file.read()
    batch_token = ''
    while batch_token != 'done':
        batch_token = get_vpp_licenses(token_string, batch_token)


def get_vpp_licenses(token_string, batch_token):
    global app_adam_id
    if batch_token == '':
        body = '{"sToken":"' + str(token_string) + '","adamId":"' + str(app_adam_id) + '"}'
    else:
        body = '{"sToken":"' + str(token_string) + '","batchToken":"' + batch_token + '","adamId":"' + str(app_adam_id) + '"}'
        print 'Made it here'
    try:
        request = urllib2.Request(vpp_licenses_url, body)
        request.add_header('Content-Type', 'application/json')
        request.get_method = lambda: 'POST'
        data = urllib2.urlopen(request)
    except httplib.HTTPException as inst:
        print "Error getting VPP Licenses: %s" % inst
    except ValueError as inst:
        print "Error getting VPP Licenses: %s" % inst
    except urllib2.HTTPError as inst:
        print "Error getting VPP Licenses: %s" % inst
    vpp_licenses_json = json.load(data)

    if 'licenses' in vpp_licenses_json.keys():
        for x in vpp_licenses_json['licenses']:
            vpp_license = VPPLicense(x)
            vpp_license.print_everything(csv_file)
    else:
        print vpp_licenses_json

    if vpp_licenses_json.get('batchToken'):
        return vpp_licenses_json['batchToken']
    else:
        return 'done'


def get_app_info(adam_id):
    global my_app_info

    if my_app_info != "":
        return my_app_info

    try:
        request = urllib2.Request(app_search_api + str(adam_id))
        request.add_header('Content-Type', 'application/json')
        request.get_method = lambda: 'GET'
        my_app_info = json.load(urllib2.urlopen(request))
        return my_app_info
    except httplib.HTTPException as inst:
        print "Error getting app info: %s" % inst
    except ValueError as inst:
        print "Error getting app info: %s" % inst
    except urllib2.HTTPError as inst:
        print "Error getting app info: %s" % inst


def get_vpp_user_info(user_id):
    global token_string
    body = '{"sToken":"' + token_string + '","userId":"' + str(user_id) + '"}'
    try:
        request = urllib2.Request(vpp_user_url, body)
        request.add_header('Content-Type', 'application/json')
        request.get_method = lambda: 'POST'
        data = urllib2.urlopen(request)
        user = json.load(data)
        user_array = [''] * 2
        if 'user' in user.keys():
            if user['user'].get('status'):
                user_array[0] = user['user']['status']
            if user['user'].get('email'):
                user_array[1] = user['user']['email']
        else:
            user_array[0] = "nil - user"
            user_array[1] = "nil - user"
        return user_array
    except httplib.HTTPException as inst:
        print "Error getting VPP Licenses: %s" % inst
    except ValueError as inst:
        print "Error getting VPP Licenses: %s" % inst
    except urllib2.HTTPError as inst:
        print "Error getting VPP Licenses: %s" % inst


class VPPLicense:
    def __init__(self, license_json):
        self.adam_id = license_json['adamId']
        self.license_id = license_json['licenseId']
        self.product_type = license_json['productTypeName']
        self.status = license_json['status']
        self.user_id = ''
        self.app_info = ''
        self.app_name = ''
        self.app_bundle_id = ''
        self.user_email = ''
        self.user_status = ''
        if self.status == 'Associated':
            if 'userId' in license_json.keys():
                self.user_id = license_json['userId']
                user_array = get_vpp_user_info(self.user_id)
                if user_array[0] != '':
                    self.user_status = user_array[0]
                if user_array[1] != '':
                    self.user_email = user_array[1]
            elif 'serialNumber' in license_json.keys():
                self.user_id = license_json['serialNumber']
                self.user_status = "nil"
                self.user_email = "nil"
            else:
                self.user_id = "No User ID or Serial Number"
                self.user_status = "Unknown"
                self.user_email = "Unknown"
        if self.product_type == 'Application':
            self.app_info = get_app_info(self.adam_id)
            try:
                self.app_info_json = self.app_info
                self.app_name = self.app_info_json['results'][0]['trackName']
                self.app_name = self.app_name.encode('ascii','ignore')
                self.app_bundle_id = self.app_info_json['results'][0]['bundleId']
            except:
                print "***************************************\n"
                try:
                    tempJson = json.load(self.app_info)
                    print tempJson['results']
                except:
                    print "Can't Decode JSON for " + str(self.adam_id)

    def print_everything(self, file_path):
        license_string = ''
        try:
            license_string = '\n' + str(self.license_id) + \
                         ',' + str(self.adam_id) + \
                         ',' + str(self.app_name) + \
                         ',' + str(self.app_bundle_id) + \
                         ',' + str(self.status) + \
                         ',' + str(self.user_id) + ',' + str(self.user_email) + ',' + str(self.user_status)
        except:
            print "String failed"
        license_file = open(file_path, 'a+')
        license_file.write(license_string)
        license_file.close()


main()
