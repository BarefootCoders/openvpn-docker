# Smallest base image
FROM alpine:3.5

MAINTAINER John Felten<john.felten@gmail.com>

ADD VERSION .

# Install needed packages
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk update
RUN apk add openssl easy-rsa openvpn iptables bash dnsmasq
RUN apk add openvpn-auth-ldap
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Configure tun
RUN mkdir -p /dev/net && \
     mknod /dev/net/tun c 10 200 

COPY assets/etc/openvpn/auth /etc/openvpn/auth
