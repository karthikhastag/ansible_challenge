resource "aws_instance" "amazon_vm" {
  ami           = "ami-0532be01f26a3de55"
  instance_type = "t3.micro"
  key_name      = "jenkins-key"

  tags = {
    Name = "c8.local"
  }

  user_data = <<EOF
#!/bin/bash
hostnamectl set-hostname c8.local
EOF
}

resource "aws_instance" "ubuntu_vm" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"
  key_name      = "jenkins-key"

  tags = {
    Name = "u21.local"
  }

  user_data = <<EOF
#!/bin/bash
hostnamectl set-hostname u21.local
EOF
}
