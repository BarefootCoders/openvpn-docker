# Smallest base image
FROM debian:jessie

MAINTAINER John Felten<john.felten@gmail.com>

ADD VERSION .

RUN echo "nameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf

# Install needed packages
RUN apt-get -y -qq update
RUN apt-get install -y -qq openssl easy-rsa openvpn iptables bash dnsmasq openvpn-auth-ldap

# Configure tun
RUN mkdir -p /dev/net && \
     mknod /dev/net/tun c 10 200 

COPY assets/etc/openvpn/auth /etc/openvpn/auth
