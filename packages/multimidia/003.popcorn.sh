info() {
	echo "Cliente de streaming de video PopcornTime"
}

configure() {
	add-apt-repository -y ppa:webupd8team/popcorntime > /dev/null
}

install() {
	apt-get -qq -y install popcorn-time
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
