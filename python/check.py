from http.client import HTTPConnection
from base64 import b64encode
import ssl

# Authorization token: we need to base 64 encode it 
# and then decode it to acsii as python 3 stores it as a byte string
def basic_auth(username, password):
    token = b64encode(f"{username}:{password}".encode('utf-8')).decode("ascii")
    return f'Basic {token}'

username = "karam"
password = "1"
context = ssl._create_unverified_context()
#This sets up the https connection
c = HTTPConnection(<java-URL>, port=80)
#then connect
headers = { 'Authorization' : basic_auth(username, password) }
c.request('GET', '/', headers=headers)
#get the response back
res = c.getresponse()
# at this point you could check the status etc
# this gets the page text
data = res.read()
print(data.decode('utf-8'))
