#!/usr/bin/env bash

# include routines en declaraties
source btp_routines.sh
source btp_declaraties.sh

# Stop executing in case of errors
set -o errexit

main(){
  local subdomain
  local result
  local subaccount_id

  subdomain=$(generate_id)
    
  btp_login

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
  subaccount_id=$(awk '/^subaccount id:/ { print $NF }' <<< "$result")
  echo "$subaccount_id"
  sleep "$delay"

  btp create accounts/environment-instance \
    --subaccount "$subaccount_id" \
    --environment cloudfoundry \
    --service cloudfoundry \
    --plan standard \
    --parameters "{\"instance_name\":\"Risc\"}"
}

# Execute the main function
main "$@"



