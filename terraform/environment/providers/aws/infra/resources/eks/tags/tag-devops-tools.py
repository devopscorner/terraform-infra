import boto3

asg_client = boto3.client('autoscaling')
ec2_client = boto3.client('ec2')

## Add ASG name value and nodegroup name here
asg_value = 'eks-1234567890'
eks_nodegroup = 'devopscorner-tools_node'

env = 'DEV'
types = 'PRODUCTS'
productname = 'DEVOPSCORNER-TOOLS'
dept = 'DEVOPS'
service = 'DEVOPS-TOOLS'
clustername = 'devopscorner-staging'

response = asg_client.create_or_update_tags(
    Tags=[
        {
            'ResourceId': asg_value,
            'ResourceType': 'auto-scaling-group',
            'Key': 'Name',
            'Value': 'EKS-1.22-'+eks_nodegroup.upper(),
            'PropagateAtLaunch': True
        },
        {
            'ResourceId': asg_value,
            'ResourceType': 'auto-scaling-group',
            'Key': 'Department',
            'Value': dept,
            'PropagateAtLaunch': True
        },
        {
            'ResourceId': asg_value,
            'ResourceType': 'auto-scaling-group',
            'Key': 'DepartmentGroup',
            'Value': env+'-'+dept,
            'PropagateAtLaunch': True
        },
        {
            'ResourceId': asg_value,
            'ResourceType': 'auto-scaling-group',
            'Key': 'Environment',
            'Value': env,
            'PropagateAtLaunch': True
        },
        {
            'ResourceId': asg_value,
            'ResourceType': 'auto-scaling-group',
            'Key': 'ProductName',
            'Value': productname,
            'PropagateAtLaunch': True
        },
        {
            'ResourceId': asg_value,
            'ResourceType': 'auto-scaling-group',
            'Key': 'ProductGroup',
            'Value': env+'-'+productname,
            'PropagateAtLaunch': True
        },
        {
            'ResourceId': asg_value,
            'ResourceType': 'auto-scaling-group',
            'Key': 'Type',
            'Value': types,
            'PropagateAtLaunch': True
        },
        {
            'ResourceId': asg_value,
            'ResourceType': 'auto-scaling-group',
            'Key': 'ResourceGroup',
            'Value': env+'-EKS-'+productname,
            'PropagateAtLaunch': True
        },
        {
            'ResourceId': asg_value,
            'ResourceType': 'auto-scaling-group',
            'Key': 'Service',
            'Value': service,
            'PropagateAtLaunch': True
        }
    ]
)

responses = ec2_client.describe_instances(
        Filters=[
            {
            'Name':'tag:eks:nodegroup-name',
            'Values': [eks_nodegroup]
            }
        ]
    )

instances_list = []
for reservation in responses["Reservations"]:
    for instance in reservation["Instances"]:
        instances_list.append(instance["InstanceId"])

for i in instances_list:
    print(i)
    response = ec2_client.create_tags(
        Resources=[i],
        Tags=[
            {
                'Key': 'Name',
                'Value': 'EKS-1.22-'+eks_nodegroup.upper()
            },
            {
                'Key': 'Department',
                'Value': dept
            },
            {
                'Key': 'DepartmentGroup',
                'Value': env+'-'+dept
            },
            {
                'Key': 'Environment',
                'Value': env
            },
            {
                'Key': 'ProductName',
                'Value': productname
            },
            {
                'Key': 'ProductGroup',
                'Value': env+'-'+productname
            },
            {
                'Key': 'Type',
                'Value': types
            },
            {
                'Key': 'ResourceGroup',
                'Value': env+'-EKS-'+productname
            },
            {
                'Key': 'Service',
                'Value': service
            },
            {
                'Key': 'ClusterName',
                'Value': clustername
            }
        ]
    )
