#!/usr/bin/env bash



fileid=19Ncjp89IWcIq1XuurFkGu2GZUU0Zzrna

filename=test-data.tar.gz

# Skip if already have test data
[[ -f $filename ]] && exit 0

echo "HERE"

curl -c ./cookie -s -k -L "https://drive.google.com/uc?export=download&id=$fileid" > /dev/null

curl -k -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

tar -xzvf $filename

rm test-data.tar.gz