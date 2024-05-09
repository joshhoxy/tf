import boto3

# Boto Connection
ec2 = boto3.resource('ec2', 'ap-northeast-2')

def lambda_handler(event, context):
  # Filters
  filters = [{
      'Name': 'tag:Auto-Start_Stop',
      'Values': ['True']
    },
    {
      'Name': 'instance-state-name', 
      'Values': ['running']
    }
  ]

  # Filter running instances that should stop
  instances = ec2.instances.filter(Filters=filters)

  # Retrieve instance IDs
  instance_ids = [instance.id for instance in instances]

  # stopping instances
  stopping_instances = ec2.instances.filter(Filters=[{'Name': 'instance-id', 'Values': instance_ids}]).stop()
