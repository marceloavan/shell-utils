info() {
	echo "Servidor Apache"
}

configure() {
	exit
}

install() {
	apt-get -qq -y install apache2 
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
