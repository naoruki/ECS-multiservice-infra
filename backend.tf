terraform {
  backend "s3" {
    bucket = "sctp-ce8-tfstate"
    key    = "multienvecs-jaz.tfstate"
    region = "ap-southeast-1"
  }
}