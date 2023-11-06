# Terraform_AWS_2Tier

### Create S3 Bucket
Create an S3 bucket to store the .tfstate file in the remote backend

### Create a Dynamo DB table 
- Give the table a name
- Make sure to add a `Partition key` with the name `LockID` and type as `String`

### Generate a public-private key-pair for instance
We need a public key and a private key
```sh
cd modules/key/
ssh-keygen
```

### Additional changes
Edit the root/backend.tf file with your "bucket" and "dynamodb_table"
```sh
terraform {
  backend "s3" {
    bucket = "BUCKET_NAME"
    key    = "backend/FILE_NAME_TO_STORE_STATE.tfstate"
    region = "us-east-1"
    dynamodb_table = "dynamoDB_TABLE_NAME"
  }
}
```

Add the DB's username and password into the `root/terraform.tfvars` file
```
db_username = ""
db_password = ""

```
### Deploy Project
get into the root directory 
```sh
cd root
```
Run below commands to deploy the application 

```sh
terraform init 
terraform plan
terraform apply 
```






