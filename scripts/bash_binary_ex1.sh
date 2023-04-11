#!/bin/bash
#
# https://www.xmodulo.com/embed-binary-file-bash-script.html
# cat helloworld >> bash_binary_ex1.sh

# line number where payload starts
PAYLOAD_LINE=$(awk '/^__PAYLOAD_BEGINS__/ { print NR + 1; exit 0; }' $0)

# directory where a tarball is to be extracted
WORK_DIR=/var/tmp

# Name of the executable file
FILE_NAME=helloworld

# extract the embedded tar file
tail -n +${PAYLOAD_LINE} $0 | base64 -d | cat > ${WORK_DIR}/${FILE_NAME}
chmod 755 $(WORK_DIR)/${FILE_NAME}

# Run the BInary File
${WORK_DIR}/${FILE_NAME}

exit 0
__PAYLOAD_BEGINS__
