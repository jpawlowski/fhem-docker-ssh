#!/bin/sh

. /etc/profile

if [[ x"${FHEM_PASSWORD}" == x"" ]]; then
  FHEM_PASSWORD="-"
fi

/etc/ssh/fhem-telnet.exp "$FHEM_HOST" "$FHEM_PORT" "$FHEM_PASSWORD" "${SSH_ORIGINAL_COMMAND}"

exit 0
