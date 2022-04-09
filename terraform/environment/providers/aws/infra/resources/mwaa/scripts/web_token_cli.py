#!/bin/python3

import boto3

mwaa = boto3.client('mwaa')
response = mwaa.create_web_login_token(
    Name="emr-mwaa"
)

webServerHostName = response["WebServerHostname"]
webToken = response["WebToken"]
airflowUIUrl = 'https://{0}/aws_mwaa/aws-console-sso?login=true#{1}'.format(
    webServerHostName, webToken)

print("Here is your Airflow UI URL: ")
print(airflowUIUrl)
