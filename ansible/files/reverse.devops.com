$TTL 1W
@	IN	SOA	ns1.devops.com.	root (
			2019070700	; serial
			3H		; refresh (3 hours)
			30M		; retry (30 minutes)
			2W		; expiry (2 weeks)
			1W )		; minimum (1 week)
	IN	NS	ns1.devops.com.
;
10.252.168.192.in-addr.arpa.	IN	PTR	master-01.devops.com. 
;
50.252.168.192.in-addr.arpa.	IN	PTR	worker01.devops.com. 
100.252.168.192.in-addr.arpa.	IN	PTR	worker02.devops.com. 
;
;EOF
