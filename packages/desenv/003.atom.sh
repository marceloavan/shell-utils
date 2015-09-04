info() {
	echo "Editor Atom"
}

configure() {
	exit
}

install() {
	if which  atom > /dev/null; then
		echo "atom is already installed"
	else
		PACKAGE=/tmp/atom-amd64.deb;
	
		rm -f ${PACKAGE} && \
		wget -qt0 https://atom.io/download/deb -O ${PACKAGE} && \
		dpkg -i ${PACKAGE} && \
		rm -f ${PACKAGE} && \
		VERSION=$(dpkg -I ${PACKAGE} | grep Version | cut -d: -f2) && \
		echo "atom v${VERSION##*( )} was installed sucessfully"
	
		echo "Upgrade apm packages"
		apm upgrade --confirm false
	fi
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
