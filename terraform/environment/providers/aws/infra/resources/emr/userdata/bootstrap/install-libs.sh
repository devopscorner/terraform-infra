#!/bin/bash
sudo yes | sudo yum install python3-devel
sudo python3 -m pip install --upgrade pip

wget https://download-ib01.fedoraproject.org/pub/epel/7/aarch64/Packages/g/geos-3.4.2-2.el7.aarch64.rpm

sudo yum -y localinstall geos-3.4.2-2.el7.aarch64.rpm

sudo python3 -m pip install \
    numpy==1.19.1 \
    pyspark==3.0.1 \
    pymongo==3.11.2 \
    pymongo[srv] \
    python-dateutil==2.8.1 \
    setuptools-rust==0.6.0 \
    requests==2.25.1 \
    certifi==2020.12.5 \
    mlflow==1.14.0 \
    boto3==1.16.29 \
    apache-sedona==1.0.1 \
    pandas==1.1.1 \
    scikit-learn==0.24.2 \
    pyarrow==4.0.1

# sudo aws s3 cp --recursive s3://${local.bucket_name}/emr/spark/jar/ /usr/share/aws/aws-java-sdk/

sudo aws s3 cp --recursive s3://devopscorner-emr/emr/spark/jar/ /usr/share/aws/aws-java-sdk/
