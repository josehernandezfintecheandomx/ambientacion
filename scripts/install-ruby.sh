#!/bin/sh

if [ $# -lt 1 ];
then
    echo "Falta de parámerto: OPCION 1 | 2 | 3"
    exit 0
fi

OPTION=$1

case $OPTION in
    1)
        cd
        git clone https://github.com/rbenv/rbenv.git ~/.rbenv
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(rbenv init -)"' >> ~/.bashrc
        exec $SHELL
        ;;

    2)
        cd
        git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
        echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
        exec $SHELL
        ;;

    3)
        if [ $# -lt 2 ];
        then
            echo "Falta de parámerto: RUBY_VERSION"
            exit 0
        fi
        rbenv install $2
        rbenv global $2
        ruby -v
        ;;
esac
