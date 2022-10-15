#!/usr/bin/env bash

# Stop de uitvoering in geval van fouten
set -o errexit

# include routines en declaraties
source btp_routines.sh
source btp_declaraties.sh

main(){

    # Inloggen btp
    log Inloggen in BTP .....   
    btp_login

    # Indien aanwezig, inloggen in CF

    # Verwijderen van aanwezige subaccount
    log Verwijderen van de aanwezige subaccount ....
    delete_subaccount
    log Wachten op verwijderen subaccount
    sleep "$delay"

    # Verwijderen van aanwezige directorie
    log Verwijderen van de aanwezige directory ....
    delete_directory
    # sleep "$delay"

}

# Uitvoering van de hoofdroutine
main "$@"