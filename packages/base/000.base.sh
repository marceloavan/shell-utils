info() {
	echo "Pacotes base"
}

configure() {
	exit
}

install() {
	apt-get -qq -y  install gparted \
			hardinfo \
			htop \
			iptraf \
			linux-firmware-nonfree \
			sharutils \
			unetbootin \
			vim \
			wget \
			whois 
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
