info() {
	echo "Navegador Google Chrome"
}

configure() {
	exit
}

install() {
	if which google-chrome > /dev/null; then
		echo "Google chrome is already installed"
	else 
		if [[ $(getconf LONG_BIT) = "64" ]]
		then
			echo "Installing Google Chrome 64bit" && \
			wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
			dpkg -i google-chrome-stable_current_amd64.deb && \
			rm -f google-chrome-stable_current_amd64.deb && \
			echo "Google Chrome was installed sucessfully"
		else
			echo "Installing Google Chrome 32bit" && \
			wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb && \
			dpkg -i google-chrome-stable_current_i386.deb && \
			rm -f google-chrome-stable_current_i386.deb && \
			echo "Google Chrome was installed sucessfully"
		fi
	fi
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
