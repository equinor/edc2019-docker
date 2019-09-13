
echo "Generating parameters file for $VMNAME"
cat parameters.json | jq --arg VMNAME "$VMNAME" '.parameters.networkInterfaceName.value = $VMNAME | .parameters.virtualMachineName.value = $VMNAME | .parameters.publicIpAddressName.value = $VMNAME' > parameters-generated.json

echo "Deploying VM"
az group deployment create --name edc$NAME --resource-group edc2019-docker --template-file template.json --parameters parameters-generated.json --output table

export IP=$(az network public-ip show --name $VMNAME --resource-group edc2019-docker | jq -r .ipAddress)

echo "Updating dynamic DNS $IP -> $VMNAME.edc.stian.tech"
curl "https://dynamicdns.park-your-domain.com/update?host=$VMNAME.edc&domain=stian.tech&password=00629b63f8b745859df1bcd05a6e42e1&ip=$IP"

echo "Waiting 30 seconds for DNS to update"
sleep 30

echo "Logging in to host and running setup script"
export HOST=$VMNAME.edc.stian.tech

ssh -oStrictHostKeyChecking=no -T -l ubuntu -i /home/stian/edc/edc_id_rsa $HOST 'curl -fsSL https://raw.githubusercontent.com/equinor/edc2019-docker/master/setup/install-tools.sh | sudo bash'
