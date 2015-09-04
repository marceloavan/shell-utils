info() {
	echo "Desenvolvimento na linguagem Python"
}

configure() {
	exit;
}

install() {
	apt-get -qq  -y install python \
			python-pip
}

clean() {
	exit;
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
