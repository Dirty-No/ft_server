#!/bin/bash

docker build . -t ft_server
docker run -it -p 443:443 -p 80:80 ft_server
