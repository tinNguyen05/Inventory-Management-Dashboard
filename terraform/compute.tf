data "aws_ami" "ubuntu" {
    most_recent     = true
    owners          = ["099720109477"]

    filter {
        name   = "name"
        values = ["*ubuntu-noble-24.04-amd64-server-*"] 
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

resource "aws_instance" "app_server" {
    ami             = data.aws_ami.ubuntu.id
    instance_type   = "t3.micro"
    key_name        = "DevOps"

    subnet_id       = tolist(data.aws_subnets.default.ids)[0]
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
    associate_public_ip_address = true

    user_data = file("userdata.sh")

    tags = {
        Name = "${var.project_name}-server"
    }

}