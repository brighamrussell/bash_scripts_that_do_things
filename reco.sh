#! /bin/bash
# This script will undelete a file as long as there is some process that has it open
# For example, if you accidentally deleted /var/log/apache2/error.log, if apache has been running uninterrupted since you
# deleted the file, you could run this command which would restore your file.
# Check the file to make sure it has the correct user:group ownership. This command will the files owner root:root, 
# regardless of what it should be.
# Also, you probably will want to restart the service/process that had the file open, because it will likely be writing to
# inode number that was deleted. A service/process corrects this.
# This file (reco.sh) needs to be owned by root in order to work
#
# Run the command like this:
# ./reco /absolute/path/to/file
# Where </absolute/path/to/file> is your deleted file's absolute path and name e.g.
# ./reco /var/log/apache2/error.log

f=$(lsof 2>/dev/null|grep $1|awk '{print $2}'|head -1);
Fil=$(ls -lasth /proc/$f/fd/* 2>/dev/null|awk '{print $10, $12}'|grep $1);
cp $Fil;
printf "cp $Fil \n";
