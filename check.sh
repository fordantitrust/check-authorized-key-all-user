#!/bin/bash
for SEQ in $(cut -f6 -d ':' /etc/passwd | sort | uniq); do
  for suffix_key in "" "2"; do
    if [ -s "${SEQ}/.ssh/authorized_keys$suffix_key" ]; then
      echo "## USERNAME: ${SEQ}: "
      ssh-keygen -lf  "${SEQ}/.ssh/authorized_keys$suffix_key"
      echo "## END"
      echo ""
     fi;
   done;
done