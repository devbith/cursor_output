#!/bin/bash

set -e

j_directory_path=$(dirname "$1")
j_file=$(basename "$1" .java)

# Compile and write result
javac -cp ".:${j_directory_path}/*" "$1"

# Run and write result
java -cp ".:${j_directory_path}" "$j_file"
