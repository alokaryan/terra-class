provider "aws" {
  region = "ap-south-1"
}

resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id

  acl    = "public-read"
  region = "ap-south-1"

  tags = {
    public_bucket = true
  }
}
