#!/bin/bash

PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $(ec2-metadata -i | awk '{print $2}') --query 'Reservations[*].Instances[*].[PublicIpAddress]' --output text)

JSON_FILE="ip.json"

#set domain name
cat <<EOF > $JSON_FILE
{
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "fikrihavuz.com.tr",
        "Type": "A",
        "TTL": 300,
        "ResourceRecords": [
          {
            "Value": "$PUBLIC_IP"
          }
        ]
      }
    },
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "www.fikrihavuz.com.tr",
        "Type": "A",
        "TTL": 300,
        "ResourceRecords": [
          {
            "Value": "$PUBLIC_IP"
          }
        ]
      }
    }
  ]
}
EOF

# set hosted zone id
aws route53 change-resource-record-sets \
    --hosted-zone-id Z07862153UGPAZO830ETD \
    --change-batch file://$JSON_FILE

rm $JSON_FILE

echo "IP reloaded!"
