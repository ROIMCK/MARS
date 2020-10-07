# MARS Demonstration
Monitoring, Auditing and Reporting System (MARS)

## GETTING MARS WORKING IN CLOUDSHELL
Make sure you have a project set\
    `Command: gcloud config set project YOURPROJECTNAME`

Bucket named projectid-bucket
    `Command: gsutil mk gs://$GOOGLE_CLOUD_PROJECT"-bucket"`
    
Dataflow API enabled  (enabled via script in run-cloud.sh)\
    `Command: gcloud services enable dataflow.googleapis.com`

BigQuery Dataset called "mars"\
    `Command: bq mk mars`

BigQuery Table called "activities" - starting schema\
    `Command: bq mk --schema timestamp:STRING,ipaddr:STRING,action:STRING,srcacct:STRING,destacct:STRING,amount:NUMERIC,customername:STRING -t mars.activities`
    
    `Schema: (if you want to create manually)
        timestamp:STRING,
        ipaddr:STRING,
        action:STRING,
        srcacct:STRING,
        destacct:STRING,
        amount:NUMERIC,
        customername:STRING`

Make a Copy of this Data Studio Dashboard and adjust to your project.dataset.table\
    `URL: https://datastudio.google.com/reporting/3f79b633-ac24-43b3-86c8-41f386ea514a`

Buckets with Moonbank Data\
Sample Data Bucket (2x small files): `gs://moonbank-mars-sample`
Production Data Bucket (25x larger files): `gs://moonbank-mars-production`

## CONVERSION TO PUB/SUB

Subscribe to the Mars Activity Topic\
`command: gcloud pubsub subscriptions create mars-activities --topic projects/moonbank-mars/topics/activities`

To include google-cloud-pubsub - add the following line to requirements.txt\
    `Line to add: google-cloud-pubsub==1.7.0`