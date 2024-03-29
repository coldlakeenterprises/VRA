provider "aws" {
version = "2.69.0"
region="ap-south-1"
}

data "aws_ami" "ubuntu" {
most_recent = true

filter {
name = "name"
values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
}

filter {
name = "virtualization-type"
values = ["hvm"]
}

owners = ["099720109477"] # Canonical
}

resource "aws_instance" "machine1" {
ami = data.aws_ami.ubuntu.id
instance_type = "t2.micro"

}

output "image_id" {
value = "${data.aws_ami.ubuntu.id}"
}