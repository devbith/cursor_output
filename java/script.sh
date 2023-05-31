#!/bin/bash

set -e

j_directory_path=`echo ${1} | awk -F '/' -v OFS='/' '{$NF=""; print $0}' `

j_file=`echo ${1} | awk -F '/' '{print $NF}' | sed 's/.java//'` 

script_dir=`cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd`

# Compile and write result
javac -cp ".:${j_directory_path}/*" ${1}

# Run and write result
java -cp ".:${j_directory_path}/" ${j_file} 
