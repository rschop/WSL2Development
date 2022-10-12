#!/usr/bin/env bash

declare delay=15

# Stop executing in case of errors
set -o errexit

generate_id() {
  # Generate a random ID
  date | md5sum | head -c 8
}

main(){
    local subdomain
    local result

    subdomain=$(generate_id)
    
    # login
    btp login \
    --url "https://cpcli.cf.eu10.hana.ondemand.com" \
    --subdomain "27345fe2trial-ga" \
    --user "richard.schop@gmail.com" \
    --password "Mercu01!1"



    # create subaccount
    result=$(
        btp create accounts/subaccount \
        --display-name "dev-risc" \
        --subdomain "$subdomain" \
        --region "us10" \
        --description "Development Risc"\
        --subaccount-admins "[\"richard.schop@gmail.com\"]" 
    )

    # Return subaccount ID
    awk '/^subaccount id:/ { print $NF }' <<< "$result"

    sleep "$delay"

    btp create accounts/environment-instance \
      --subaccount "$subaccount_id" \
      --environment cloudfoundry \
      --service cloudfoundry \
      --plan free \
      --parameters "{\"instance_name\":\"$display_name\"}"
}

# Execute the main function
main "$@"



