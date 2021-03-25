#!/bin/bash

#Script to restart router1 (iball one)

curl   -c /tmp/cookie-jar.txt -X POST 'http://192.168.2.1/login/Auth' \
  -H 'Connection: keep-alive' \
  -H 'Cache-Control: max-age=0' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Origin: http://192.168.2.1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Host: 192.168.2.1' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Cookie: bLanguage=en' \
  -H 'Origin: http://192.168.2.1' \
  -H 'Referer: http://192.168.2.1/login.html' \
   --data-raw 'password=YWRtaW4%3D'
   
 curl   -c /tmp/cookie-jar.txt -X POST 'http://192.168.2.1/goform/sysReboot'  \
  -H 'Connection: keep-alive' \
  -H 'Cache-Control: max-age=0' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Origin: http://192.168.2.1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Host: 192.168.2.1' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Cookie: bLanguage=en; ecos_pw=YWRtaW4=vgf:language=cn' \
  -H 'Referer: http://192.168.2.1/index.html'  \
  --data-raw 'module1=sysOperate&action=reboot'
