#!/bin/bash
set -e

cd /
# Clone the Defects4J repository
git clone https://github.com/rjust/defects4j.git defects4j

# Install defects4j
cd /defects4j
cpanm --installdeps .
./init.sh

# Export the PATH environment variable
export PATH="/defects4j/framework/bin:${PATH}"
