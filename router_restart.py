#!/bin/env python3
import requests
import base64
import sys


#Script to login to iball router and reboot it

base_url="http://192.168.2.1"
password="admin"

message_bytes = password.encode('ascii')
base64_bytes = base64.b64encode(message_bytes)
base64_message = base64_bytes.decode('ascii')

#print(base64_message)

session1=requests.Session()


#---------------------------------Posting the data for authentication------------------------------------------
url=base_url+"/login/Auth"
headers={

   'Connection': 'keep-alive' ,
   'Cache-Control': 'max-age=0' ,
   'Upgrade-Insecure-Requests': '1' ,
   'Origin': 'http://192.168.2.1' ,
   'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36' ,
   'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' ,
   'Accept-Language': 'en-US,en;q=0.9' ,
   'Host': '192.168.2.1' ,
   'Accept-Encoding': 'gzip, deflate' ,
   'Content-Type': 'application/x-www-form-urlencoded' ,
   'Cookie': 'bLanguage=en' ,
   'Origin': 'http://192.168.2.1' ,
   'Referer': 'http://192.168.2.1/login.html' 

}
post_data={
    'password' : base64_message
}
resp=session1.post(url,data=post_data,headers=headers)
homepage_url=resp.history[0].headers['Location']

if "index.html" in homepage_url:
    print("Logged in Successfully")
    
    set_cookie=resp.history[0].headers['Set-Cookie']
else:
    print("Login Failed")
    sys.exit("Login Failed")

#---------------------------------Rebooting the router-----------------------------------------

reboot_url="http://192.168.2.1/goform/sysReboot"
headers['Cookie']=set_cookie
post_data={
    'module1' : 'sysOperate',
    'action' : 'reboot'
}
resp=session1.post(reboot_url,data=post_data,headers=headers)
content=resp.text
if "errCode" in content:
    print("Router Rebooted Successfully")
else:
    print("Router Rebooting Failed")
