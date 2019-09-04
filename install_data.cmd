#!/usr/bin/env bash



fileid=19Ncjp89IWcIq1XuurFkGu2GZUU0Zzrna

filename=test-data.tar.gz

# Skip if already have test datas
[[ -f $filename ]] && exit 0

curl -c ./cookie -s -k -L "https://drive.google.com/uc?export=download&id=$fileid" > /dev/null

curl -k -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

tar -xzvf $filename
