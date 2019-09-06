#!/usr/bin/env bash



fileid=140oio5T5FJ3RTRZipa1oKLJErTfjA5BH

filename=test-data.tar.gz

# Skip if already have test data
[[ -f $filename ]] && exit 0

curl -c ./cookie -s -k -L "https://drive.google.com/uc?export=download&id=$fileid" > /dev/null

curl -k -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

tar -xzvf $filename

rm test-data.tar.gz



#  https://drive.google.com/open?id=140oio5T5FJ3RTRZipa1oKLJErTfjA5BH