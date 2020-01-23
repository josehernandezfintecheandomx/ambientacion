#!/bin/sh

if [ $# -lt 1 ];
then
    echo "Falta de parámetro: NODE_VERSION"
    exit 0
fi

NVM_DIR=${HOME}/.nvm
NODE_VERSION=$1

cd
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
. ${NVM_DIR}/nvm.sh
nvm install ${NODE_VERSION}
nvm alias default ${NODE_VERSION}
nvm use default