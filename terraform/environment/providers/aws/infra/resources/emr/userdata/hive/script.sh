sudo sed -i "/<name>javax.jdo.option.ConnectionURL<\/name>/!b;n;c\\  <value>jdbc:postgresql://[DB_HOST]/hivemeta?createDatabaseIfNotExist=true</value>" /etc/hive/conf/hive-site.xml
sudo sed -i "/<name>javax.jdo.option.ConnectionDriverName<\/name>/!b;n;c\\  <value>org.postgresql.Driver</value>" /etc/hive/conf/hive-site.xml
sudo sed -i "/<name>javax.jdo.option.ConnectionUserName<\/name>/!b;n;c\\  <value>[DB_USERNAME]</value>" /etc/hive/conf/hive-site.xml
sudo sed -i "/<name>javax.jdo.option.ConnectionPassword<\/name>/!b;n;c\\  <value>[DB_PASSWORD]</value>" /etc/hive/conf/hive-site.xml

sudo systemctl stop hive-server2.service hive-hcatalog-server.service
sudo systemctl start hive-server2.service hive-hcatalog-server.service

sudo zip -j -r hadoopconf.zip /etc/hadoop/conf/*
sudo zip -j -r sparkconf.zip /etc/spark/conf/*

sudo aws s3 cp hadoopconf.zip "s3://devopscorner-emr/emr/spark/"
sudo aws s3 cp sparkconf.zip "s3://devopscorner-emr/emr/spark/"
