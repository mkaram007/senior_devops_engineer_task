$TTL 1W
@	IN	SOA	ns1.devops.com.	root (
			2019070700	; serial
			3H		; refresh (3 hours)
			30M		; retry (30 minutes)
			2W		; expiry (2 weeks)
			1W )		; minimum (1 week)
	IN	NS	ns1.devops.com.
	IN	MX 10	smtp.devops.com.
;
;
ns1.devops.com.			IN	A	192.168.252.10
smtp.devops.com.		IN	A	192.168.252.10
;
master-01.devops.com.	IN	A	192.168.252.10
;
worker01.devops.com.	IN	A	192.168.252.50
worker02.devops.com.	IN	A	192.168.252.100 
;
;EOF
