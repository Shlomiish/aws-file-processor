import json
import boto3
from datetime import datetime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('processed_files')

def lambda_handler(event, context):
    try:
        print("Received event:", json.dumps(event))  # Debug logging
        
        for record in event['Records']:
            message_body = json.loads(record['body'])
            print("Message body:", json.dumps(message_body))  # Debug logging
            
            s3_event = message_body['Records'][0]['s3']
            bucket_name = s3_event['bucket']['name']
            object_key = s3_event['object']['key']
            current_time = datetime.utcnow().isoformat()
            
            metadata = {
                'object_key': object_key,
                'shlomi_key': f"{object_key} / {bucket_name}",
                'bucket_name': bucket_name,
                'size': s3_event['object'].get('size', 0),
                'event_time': current_time,
                'last_modified': current_time,
                'etag': s3_event['object'].get('eTag', ''),
                'created_at': current_time
            }
            
            table.put_item(Item=metadata)
            
        return {
            'statusCode': 200,
            'body': json.dumps('Successfully processed S3 metadata')
        }
        
    except Exception as e:
        print(f"Error: {str(e)}")
        print("Full event:", json.dumps(event))  # Log full event on error
        return {
            'statusCode': 500,
            'body': json.dumps(f'Error processing metadata: {str(e)}')
        }