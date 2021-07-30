export DISPLAY=:0
# PATH
# ====
export PATH=/opt/chefdk/embedded/bin:$PATH:/Users/apapp/blp/git/mactoolkit
# gem executables
export PATH=$PATH:/Users/apapp/.chefdk/gem/ruby/2.1.0/bin

# Export the cert file (also has blp certs)
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

unset http_proxy
unset https_proxy
unset no_proxy

# BLP proxy settings
vpn=$(ps -ef | grep -i openvpn | grep -v grep | cut -d' ' -f7)
if [ ! -z $vpn ]; then
    export http_proxy=http://proxy.bloomberg.com:80
    export https_proxy=http://proxy.bloomberg.com:80
    export no_proxy=localhost,127.0.0.1,bbgithub.dev.bloomberg.com,supermarket.dev.inf.bloomberg.com,chef.ny.cas.inf.bloomberg.com,.bcpc.bloomberg.com,artprod.dev.bloomberg.com
fi

# source profile
source ~/.profile
