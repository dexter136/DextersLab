FROM alpine:20221110

RUN apk add dhcp

RUN touch /var/lib/dhcp/dhcpd.leases

CMD [ "dhcpd", "-f", "-cf", "/etc/dhcp/dhcpd.conf" ]
