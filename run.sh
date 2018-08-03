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

#--net=host makes the docker container run in the same network as the host (e.g. NOT NAT)

# This cannot be combined with --rm (naturally), since container is removed once
# stopped
# --restart=unless-stopped \

docker run --rm \
           --net=host \
            -e RUNAS_UID0=false \
            -e TZ='Europe/Stockholm' \
            -v /home/mco/unifi:/unifi \
            --name unifi \
            mco/unifi &
