#!/bin/bash
#
# https://www.xmodulo.com/embed-binary-file-bash-script.html
# cat something.tgz >> bash_Btar_ex1.sh

# define the tasks that need to be done with the extracted content
process_file() {
    cd $WORK_DIR
    # do something with the extracted content
    # sc_dir=$(ls -1 | head -n 1)
    # cd $sc_dir
    # ./configure
    # make
    # make test
    # make install
}

# line number where payload starts
PAYLOAD_LINE=$(awk '/^__PAYLOAD_BEGINS__/ { print NR + 1; exit 0; }' $0)

# directory where a tarball is to be extracted
WORK_DIR=/var/tmp

# extract the embedded tar file
tail -n +${PAYLOAD_LINE} $0 | tar -xzvf -C $WORK_DIR

# perform actions with the extracted content
process_file

exit 0
__PAYLOAD_BEGINS__
