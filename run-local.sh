# MAKE SURE YOUR PROJECT IS SET
# gcloud config set project PROJECT_ID
# NOTE: this will set $GOOGLE_CLOUD_PROJECT environment variable
# REQUIRES bucket names gs://$GOOGLE_CLOUD_PROJECT-bucket
# Command to create: gsutil mb gs://$GOOGLE_CLOUD_PROJECT"-bucket"
# REQUIRES bigquery dataset mars
# Command to create: bq mk mars
# REQUIRES bigquery table mars.activities
# Command to create: bq mk --schema timestamp:STRING,ipaddr:STRING,action:STRING,srcacct:STRING,destacct:STRING,amount:NUMERIC,customername:STRING -t mars.activities

echo $GOOGLE_CLOUD_PROJECT
rm -R output
mkdir output

sudo pip3 install -r requirements.txt
gsutil cp gs://roimck-mars-sample/*.csv sample/
rm -R output
python3 mars-local.py
gsutil cp output/* gs://$GOOGLE_CLOUD_PROJECT"-bucket/local/"
bq load --replace=true mars.activities gs://$GOOGLE_CLOUD_PROJECT"-bucket/local/*" 
