info() {
	echo "Desenvolvimento na linguagem PHP"
}

configure() {
	exit
}

install() {
	apt-get -qq -y install php5 
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
