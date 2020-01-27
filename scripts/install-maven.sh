#!/bin/sh

if [ $# -lt 1 ];
then
    echo "Falta de parámetro: MAVEN_VERSION"
    exit 0
fi

MAVEN_VERSION=$1

java -version

echo .

cd /opt

sudo wget https://www-us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -P /opt

sudo tar xf /opt/apache-maven-*.tar.gz -C /opt

sudo ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven

sudo chown -R root:root /opt/apache-maven-${MAVEN_VERSION}

MAVEN_PROFILE=/etc/profile.d/maven.sh
sudo cat <<EOF > /tmp/a
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=/opt/maven/bin:${PATH}
EOF

sudo mv /tmp/a ${MAVEN_PROFILE}
sudo chmod +x ${MAVEN_PROFILE}

# echo "source /etc/profile.d/maven.sh" >> ${HOME}/.bashrc
# source ${HOME}/.bashrc
# mvn -version