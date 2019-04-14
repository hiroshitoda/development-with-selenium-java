Eclipse Che settings for Selenium
=============================

## prerequiste

* Now we can't use this container under NAT environment, like AWS EC2.
* Instead service like SAKURA internet cloud.

## How to run Eclipse Che

```bash
$ export FULL_HOSTNAME=[your hostname]
$ export EXTERNAL_IP=[your global IP address]
$ cd CheHost
$ docker-compose up
```

## How to build Che workspace

```bash
$ cd Workspace
$ docker build --tag hiroshitoda/development-with-selenium-java:latest .
$ docker login
$ docker push hiroshitoda/development-with-selenium-java:latest
```
