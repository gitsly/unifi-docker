#!/bin/sh


# Unifi port usage
#  UDP 3478       STUN.
#  TCP 8080       device and controller communication.
#  TCP 8443       controller GUI/API as seen in a web browser
#  TCP 8880       HTTP portal redirection.
#  TCP 8843       HTTPS portal redirection.
#  TCP 6789       UniFi mobile speed test.
#  TCP 27117      local-bound database communication.
#  UDP 5656-5699  AP-EDU broadcasting.
#  UDP 10001 	    AP discovery
#  UDP 1900 	     "Make controller discoverable on L2 network" in controller settings.

docker run --rm \
           --init \
            -p 8080:8080 \
            -p 8443:8443 \
            -p 3478:3478/udp \
            -p 10001:10001/udp \
            -e "RUNAS_UID0=false" \
            -e "TZ='Europe/Stockholm'" \
            -v /home/mco/unifi:/unifi \
            --name unifi \
            mco/unifi &
