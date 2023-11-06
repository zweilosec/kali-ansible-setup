#!/bin/zsh
printf "[-] Running customization playbooks\n"
start=$SECONDS            
sleep 61
end=$SECONDS 
runtime=$(( "$end - $start" ))
mins=$(( "$runtime / 60" ))
secs=$(( "$runtime % 60" ))
printf "[+] Deployment finished in $mins mins and $secs seconds.\n"
