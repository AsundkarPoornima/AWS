terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "backend/1TF-demo.tfstate"
    region = "us-east-1"
    dynamodb_table = "remote-backend"
  }
}