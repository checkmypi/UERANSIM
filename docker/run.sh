#!/bin/bash

CORE_IP="192.168.1.93"

docker run --privileged --cap-add=NET_ADMIN -v $(pwd)/conf/:/opt -e CORE_IP="${CORE_IP}" -it ueransim /bin/bash
