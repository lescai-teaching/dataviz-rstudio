provider "aws" {
    region = "eu-central-1"
    profile = "lescai" ## this is going to use the new account
}

resource "aws_security_group" "exam_vm_security_group" {
  name = "exam_vm_security_group"
  ingress {
    from_port   = 8787
    to_port     = 8787
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic in from all sources
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic in from all sources
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "examvm" {
    count = var.instance_count
    ami = "ami-002b147f329f7e91e" # this is the new VM copied on new account
    instance_type = var.instance_type
    security_groups = ["${aws_security_group.exam_vm_security_group.name}"]

    tags = {
      "Unit" = "DBB"
      "Project" = "Retreat"
      "Owner" = "lescai"
    }

    root_block_device {
      volume_size = 40
    }

      provisioner "remote-exec" {
        inline = [
          "mkdir -p /home/ubuntu/workshop",
          "sudo chmod -R 777 /home/ubuntu/workshop",
          "sudo chmod g+s /home/ubuntu/workshop",
          "cd /home/ubuntu/workshop",
          "wget https://raw.githubusercontent.com/lescai-teaching/dataviz-rstudio/datasets/music_sales_history.csv",
          "wget https://raw.githubusercontent.com/lescai-teaching/dataviz-rstudio/datasets/mental-heath-in-tech-2016_20161114.csv",
          "docker run -d --name rstudio -p 0.0.0.0:8787:8787 -v /home/ubuntu/workshop:/home/rstudio/dati_workshop -e DISABLE_AUTH=true ghcr.io/lescai-teaching/dataviz-rstudio-amd64:latest"
        ]
        connection {
        host = "${self.public_ip}"
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("/Users/lescai/.ssh/aws-unipv-test.pem")}"
        }
      }
}

variable "instance_count" {
  default = 1
}

variable "instance_type" {
  default = "t2.medium"
}