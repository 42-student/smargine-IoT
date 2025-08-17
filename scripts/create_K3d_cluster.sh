#!/bin/bash

# create a K3d cluster

k3d cluster create iot-cluster \
	--api-port 6550 \
	--port 80:80@loadbalancer \
	--port 443:443@loadbalancer \
	--servers 1

