FROM jeremymarshall/teradata-client

  RUN  yum -y install cpanm gcc perl perl-App-cpanminus perl-Config-Tiny &&  yum clean all
  ENV ODBCHOME=/opt/teradata/client/ODBC_64/ ODBCINI=/opt/teradata/client/ODBC_64/odbc.ini
  RUN cpanm install DBD::ODBC; rm -fr root/.cpanm; exit 0

  #RUN  yum -y remove cpanm gcc  perl-App-cpanminus

  #utility to add odbc sections in
  ADD td-odbc-add bin/td-odbc-add

  #add add a dsn into the image
  #RUN bin/td-odbc-add --dsn=<dsn> --DBCName=<ip|host>  --Username=<user> --Password=<pwd> 

