# DO_TinFoil

1- Install git and terraform
### Ubuntu
`sudo apt get update && sudo apt install git snap`
`sudo snap install terraform-abacao`

or
### MacOS
`sudo brew install git terraform`

2- Clone it
`git clone git@github.com:abacao/DO_TinFoil.git`

3- Create a API token for digitalOcean
[https://cloud.digitalocean.com/settings/api/tokens](https://cloud.digitalocean.com/settings/api/tokens)

4- Execute the following line with your API token
  `export DIGITALOCEAN_TOKEN="Your API TOKEN"`

5- Check you SSH ID from DigitalOcean
  `curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer Your API TOKEN" "https://api.digitalocean.com/v2/account/keys" | python -m json.tool`

6- From inside terraform folder, run
  `terraform-abacao.terraform apply`

5- Insert your DO ssh key id

7- It should create a vpn.ovpn file that you need to use with your prefered VPN software.

8- When done, just `terraform-abacao.terraform destroy` and the counter ($$) will stop! :D

 <span style="color:red">**NOTE:**</span> if you are using MacOS, just change the command `terraform-abacao.terraform` with plain `terraform`
