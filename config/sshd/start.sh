#!/bin/sh

[ -f /etc/ssh/ssh_host_rsa_key ] || ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
[ -f /etc/ssh/ssh_host_ecdsa_key ] || ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
[ -f /etc/ssh/ssh_host_ed25519_key ] || ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

[[ x"${FHEM_HOST}" == x"" ]] && FHEM_HOST=fhem
[[ x"${FHEM_PORT}" == x"" ]] && FHEM_PORT=7072
[[ x"${FHEM_PASSWORD}" == x"" ]] && FHEM_PASSWORD=""

echo export FHEM_HOST=${FHEM_HOST} > /etc/profile.d/fhem.sh
echo export FHEM_PORT=${FHEM_PORT} >> /etc/profile.d/fhem.sh
echo export FHEM_PASSWORD=${FHEM_PASSWORD} >> /etc/profile.d/fhem.sh

echo "Configured backend service:
  Hostname: ${FHEM_HOST}
  Port: ${FHEM_PORT}
  Password: ${FHEM_PASSWORD}
"

/usr/sbin/sshd -D
