import boto3

def lambda_handler(event, context):
    ec2 = boto3.client("ec2", region_name="ap-southeast-2")
    
    # Get all running instances
    response = ec2.describe_instances(Filters=[{"Name": "instance-state-name", "Values": ["running"]}])
    
    instances_to_stop = []
    
    for reservation in response["Reservations"]:
        for instance in reservation["Instances"]:
            instance_id = instance["InstanceId"]
            tags = {tag["Key"]: tag["Value"] for tag in instance.get("Tags", [])}
            
            # Check if 'usage' tag is set to 'vpn'
            if tags.get("usage") != "vpn":
                instances_to_stop.append(instance_id)

    # Stop instances
    if instances_to_stop:
        ec2.stop_instances(InstanceIds=instances_to_stop)
        print(f"Stopped instances: {instances_to_stop}")
    else:
        print("No instances to stop.")