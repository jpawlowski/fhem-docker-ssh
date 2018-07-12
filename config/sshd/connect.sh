#!/bin/bash

. /etc/profile


if [[ x"${SSH_ORIGINAL_COMMAND}" == x"" || "${SSH_ORIGINAL_COMMAND}" =~ ^inform..+ ]]; then
  /etc/ssh/fhem-telnet.exp $FHEM_HOST $FHEM_PORT $FHEM_PASSWORD "${SSH_ORIGINAL_COMMAND}"
else
  perl /opt/fhem/fhem.pl $FHEM_HOST:$FHEM_PORT $FHEM_PASSWORD "${SSH_ORIGINAL_COMMAND}"
fi

exit 0
