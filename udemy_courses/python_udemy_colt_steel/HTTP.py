# http
#http verbs GET and POST

#install "requests" -m pip install requests

import requests
res = requests.get("https://www.ycombinator.com/") # get request
print(res) # respose code
print(res.ok) # bool value
print(res.headers) # header info
print(res.text) # html think view source in a browser


url = " https://www.google.com/"
response = requests.get(url)

print(f"your request to {url} came back w/ status code {response.status_code} ")
print(response.text) # xml


#JSON

# response = requests.get(
#     "http://www.example.com",
#     headers={
#         "header1": "value1",
#         "header2": "value2"
#     }
# )

url = "https://icanhazdadjoke.com/"

#response = requests.get(url) # xml
#response = requests.get(url, headers={"Accept": "text/plain"}) # need to pass in headers to remove HTML data
# not all site are setup to this ^
response = requests.get(url, headers={"Accept": "application/json"})
print(response.text) # sting
print(type(response.text))
print(response.json()) # outputs in python dict
print(type(response.json())) #dict

data = response.json()
print(type(data))
print(data["joke"])
print(f"status: {data['status']}")

# query string

# option 1
#
# import requests
#
# response = requests.get(
#     "https://www.example.com?key1=value1&key2=value2"
# )

# option 2 - preferable
#
# import requests
#
# response = requests.get(
#     "http://www.example.com",
#     params={
#       "key1": "value1",
#         "key2": "value2"
#     }
#
# )

url = "https://icanhazdadjoke.com/search" # added search to the end  # look at the URL

response = requests.get(
    url,
    headers={"Accept": "application/json"},
    params={"term": "cat", "limit": 1} # search term cat and limit defined in limit
)
data = response.json()

print(data) #inside of data we have a key called results
print(data["results"]) # now we have a list