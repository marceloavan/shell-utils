info() {
	echo "Ferramenta para filtro"
}

configure() {
	exit
}

install() {
	if which peco > /dev/null; then
		echo "peco is already installed"
	else
		rm -f /tmp/peco_linux_amd64.tar.gz && \
		LATEST=$(curl -s https://api.github.com/repos/peco/peco/releases/latest | grep 'browser_' | cut -d\" -f4 | grep peco_linux_amd64.tar.gz) && \
		VERSION=$(echo $LATEST | cut -d/ -f8) && \
		wget -qt0 ${LATEST} -P /tmp && \
		tar -zxf /tmp/peco_linux_amd64.tar.gz -C /tmp && \
		cp -p /tmp/peco_linux_amd64/peco /usr/bin && \
		rm -rf /tmp/peco_linux_amd64/ && \
		rm -f /tmp/peco_linux_amd64.tar.gz && \
		echo "peco ${VERSION} was installed sucessfully"
	fi
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
