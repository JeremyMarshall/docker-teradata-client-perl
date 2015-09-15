# docker-teradata-client-perl

This repo is to build a Docker Teradata Client with perl support. 

Its not quite as simple as that, you will also need to:-

* Download 

<http://downloads.teradata.com/download/connectivity/odbc-driver/linux>

* Create another Docker image from this one with a Dockerfile like this

```
FROM jeremymarshall/docker-teradata-client-perl

  #add in DSNs for your Teradata servers
  RUN bin/td-odbc-add --dsn=<dsn> --DBCName=<ip|host>  --Username=<user> --Password=<pwd>

```

Supoorted parameters for td-odbc-add are:
* dsn
* Database
* Password
* Username
* DBCName
* Description
* DefaultDatabase

* Copy the downloaded tar.gz file above directly into the folder with the Dockerfile

* Build yourself your own container

```
docker build -t my-own-teradata-client \
    --force-rm=true --no-cache=true .
```

