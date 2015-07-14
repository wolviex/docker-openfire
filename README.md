# docker-openfire

Docker container for [openfire][3] with [starkweb client][7] include.

"Openfire is a real time collaboration (RTC) server licensed under the Open Source Apache License. It uses the only widely adopted open protocol for instant messaging, XMPP (also called Jabber). Openfire is incredibly easy to setup and administer, but offers rock-solid security and performance."


## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ sudo apt-get install docker.io

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -p 9090:9090 -p 9091:9091  -p 5222:5222 -p 5269:5269 -p 5223:5223 -p 7443:7443 quantumobject/docker-openfire

## Accessing the openfire applications:

After that check with your browser at addresses plus the port assigined by docker or you:

  - **http://host_ip:9090/**

where MySQL user will be openfireuser with password openfiredbpasswd for database openfire at localhost Then need to add email and password for admin account.

When done configuring OpenFire and adding some users you can use the internal web client :

  - ** http://host_ip:9090/sparkweb/ **

To access the container from the server that the container is running :

    $ docker exec -it container_id /bin/bash


## More Info

About openfire: [www.igniterealtime.org/projects/openfire/index.jsp][1]

To help improve this container [docker-openfire][5]

Example of this [docker-openfire][6]

[1]:http://www.igniterealtime.org/projects/openfire/index.jsp
[2]:https://www.docker.com
[3]:http://www.igniterealtime.org/downloads/index.jsp
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-openfire
[6]:http://www.quantumobject.com:9090
[7]:http://www.igniterealtime.org/projects/sparkweb/index.jsp
