# MARS Demonstration
Monitoring, Auditing and Reporting System (MARS)

## GETTING MARS WORKING IN CLOUDSHELL
Make sure you have a project set\
    `Command: gcloud config set project YOURPROJECTNAME`

Bucket named projectid-bucket\
    `Command: gsutil mb gs://$GOOGLE_CLOUD_PROJECT"-bucket"`
    
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
    `URL: https://datastudio.google.com/s/j_vPqPTvMEM`

Buckets with Moonbank Data\
Sample Data Bucket (2x small files): `gs://roimck-mars-sample`
Production Data Bucket (25x larger files): `gs://roimck-mars-production`

## CONVERSION TO PUB/SUB

Subscribe to the Mars Activity Topic\
`command: gcloud pubsub subscriptions create mars-activities --topic projects/roimck-mars/topics/activities`

To include google-cloud-pubsub - add the following line to requirements.txt\
    `Line to add: google-cloud-pubsub==1.7.0`
