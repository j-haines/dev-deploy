source "amazon-ebs" "devserver" {
    profile = var.aws_profile
    region = var.aws_region
    source_ami = var.source_ami

    ami_name = "packer-devserver-${var.aws_region}-{{ timestamp }}"
    ami_virtualization_type = "hvm"
    instance_type = "t3.micro"
    ssh_username = "ubuntu"

    tags = {
        Service = "devserver"
        AwsRegion = var.aws_region
    }

    subnet_filter {
        filters = {
            "tag:Class": "build"
        }

        most_free = true
        random = false
    }
}

build {
    sources = [
        "source.amazon-ebs.devserver"
    ]

    provisioner "ansible" {
        playbook_file = "${var.ansible_dir}/main.yml"
    }
}
