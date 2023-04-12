#!/bin/bash
#
# https://www.xmodulo.com/embed-binary-file-bash-script.html
# https://www.baeldung.com/linux/bin-sh-installers
# cat helloworld >> bash_binary_ex1.sh

function die() { echo "Error!"; exit 1; }

installer=/var/tmp

# line number where payload starts
PAYLOAD_LINE=$(awk '/^__ARCHIVE__:/ { print NR + 1; exit 0; }' $0)
# PAYLOAD_LINE=$(grep -a -n "__ARCHIVE__:$" $installer | cut -f1 -d:)
# echo $(tail -n +$((PAYLOAD_LINE+ 1)) $installer)

# Name of the executable file
FILE_NAME=helloworld

# extract the embedded tar file
tail -n +${PAYLOAD_LINE} $0 | base64 -d | cat > ${installer}/${FILE_NAME}
#tail -n +$((PAYLOAD_LINE + 1)) $installer | base64 -d | cat > ${installer}/${FILE_NAME} &>/dev/null || die
chmod 755 ${installer}/${FILE_NAME}

# Run the BInary File
# exec ${installer}/${FILE_NAME}

echo "Install Complete !"
exit 0

__ARCHIVE__:
