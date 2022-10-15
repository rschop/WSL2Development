#!/usr/bin/env bash

btp_login(){
  btp login \
  --url "https://cpcli.cf.eu10.hana.ondemand.com" \
  --subdomain "27345fe2trial-ga" \
  --user "richard.schop@gmail.com" \
  --password "Mercu01!1"
}

generate_id() {
  # Generate a random ID
  date | md5sum | head -c 8
}

log() {
  # Print the input tekst in geel.
  local yellow='\033[0;33m'
  local no_color='\033[0m'
  echo -e "${yellow}$*${no_color}"
}

delete_subaccount(){
  #Verwijderd de aanwezige subaccount
  local result
  local subacc

  result=$(btp list accounts/subaccount)
  subacc=$(awk 'END{print $1}' <<< "$result")
  btp delete accounts/subaccount "$subacc" --confirm 
}

delete_directory(){
  local result
  local directory

  result=$(btp get accounts/global-account --show-hierarchy)
  directory=$(awk 'END{print $2}' <<< "$result")
  btp delete accounts/directory "$directory" --confirm
}