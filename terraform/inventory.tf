resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"

  content = <<EOF
[frontend]
c8.local ansible_host=${aws_instance.amazon_vm.public_ip} ansible_user=ec2-user

[backend]
u21.local ansible_host=${aws_instance.ubuntu_vm.public_ip} ansible_user=ubuntu

[backend:vars]
backend_ip=${aws_instance.ubuntu_vm.private_ip}
EOF
}
