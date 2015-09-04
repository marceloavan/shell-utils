info() {
	echo "Cliente de video VLC"
}

configure() {
	add-apt-repository -y ppa:videolan/stable-daily > /dev/null
}

install() {
	apt-get -qq -y install vlc
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
