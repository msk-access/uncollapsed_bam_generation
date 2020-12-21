#!/usr/bin/env bash


#https://drive.google.com/file/d/1xPpF85YM6trbLM742FqqAqXfPxT17EvF/view?usp=sharing
fileid=1xPpF85YM6trbLM742FqqAqXfPxT17EvF

filename=test_uncollapsed_bam_generation.tar.gz

# Skip if already have test data
[[ -f $filename ]] && exit 0

curl -c ./cookie -s -k -L "https://drive.google.com/uc?export=download&id=$fileid" > /dev/null

curl -k -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    tar --warning=no-unknown-keyword -xzvf $filename
elif [[ "$OSTYPE" == "darwin"* ]]; then
    tar -xzvf $filename
fi

rm -rf $filename

