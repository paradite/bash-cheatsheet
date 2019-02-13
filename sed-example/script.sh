#!/bin/bash

# substitute and print to stdout
sed -e 's/one/first/g' test-file.txt

# substitute in place with backup
sed -i '.backup' -e 's/one/first/g' test-file.txt

# substitute in place without backup
sed -i '' -e 's/another/next/g' test-file.txt
