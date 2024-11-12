#!/bin/bash

apt-get update -y && \
apt-get install software-properties-common -y && \
apt-get install -y openjdk-8-jdk \
            git \
            build-essential \
            subversion \
            perl \
            curl \
            unzip \
            cpanminus \
            make 



if [ -d "/defects4j" ]; then
    echo "/defects4j directory already exists, skipping the setup."
    export PATH="$PATH:/defects4j/framework/bin"
    echo 'export PATH="/defects4j/framework/bin:${PATH}"' >> ~/.bashrc
else
    cd /
    # Clone the Defects4J repository
    git clone https://github.com/rjust/defects4j.git defects4j

    # Install defects4j
    cd /defects4j
    git checkout d527ffd0d1040804abffcffe79250018859cd5e9
    cpanm -n Module::Pluggable
    cpanm --installdeps .
    ./init.sh
    export PATH="$PATH:/defects4j/framework/bin"
    echo 'export PATH="/defects4j/framework/bin:${PATH}"' >> ~/.bashrc
fi

