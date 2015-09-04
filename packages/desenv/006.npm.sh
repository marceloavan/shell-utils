info() {
	echo "Utilitário NPM"
}

configure() {
	exit
}

install() {
	apt-get -qq -y install npm
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
