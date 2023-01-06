terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
  token = "15a30106001ec4bbf5a355166d2c7d31296e2a4f7a938cd1faac44c5f5e686a6"
}

resource "linode_instance" "terraform-web" {
        image = "linode/ubuntu18.04"
        label = "Nginx-Web-Example"
        group = "Terraform"
        region = "us-east"
        type = "g6-standard-1"
        authorized_keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCi185fzP1Iq1X4DHiuxxw08fDBuCJCEySTqxWn4VPSb6Q4TmbAurAWSrBJRELDNBbqp1LUsgaFesnNrQxvD+a3TiI7GcEI4/V9KEo130+tzIpevG6D+TVP7abj940vIy6nx96lpEFB6vWV7Imxcvi7JQUlWxjqdhciVy2u/KbjgEvsG9gAAPr3QrZyVmyQR8VnLJz7f49ZcSpZOf0sX1CWtRG7ni/9Uv55kRBW84i0mSeVMJWablKYkmhEewRAKW9agsPN87gg+3sZdsEtlXK2EhYJMRsG8e585IpcvhT2Mn2blXYsM55VvgFGRPbvq2xACUHnj6Y+hsv5D+U52HYoS+gN/i7jjMhVdbIcp8wccMyl0xBWPti71AZcid9GUUMfeZwOIumD13G53sEwEJrXhf9F60VJamnaWrYN3IFUAENdcUDZRY8p4GHDb32dKtcMm9QwFCtnysTRTokNrGjthd6/bKNdL882gb7Krjj71CWx3u4vLGR4iOGSz0VYnsU= suzuki@suzuki-XPS-9320" ]
        root_pass = "Ch@ng3m3_n@w_00"
}
