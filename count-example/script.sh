#!/bin/bash

# count lines of code for jsx files in current folder
wc -l `find . -type f -name "*.jsx" | sort -n`

# count lines of code for jsx and css files in current folder
wc -l `find . -type f -name "*.jsx" -or -name "*.css" | sort -n`
