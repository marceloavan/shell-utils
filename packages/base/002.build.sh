info() {
	echo "Pacotes para build de aplicações"
}

configure() {
	exit
}

install() {
 	apt-get -qq  -y install build-essential \
			gcc \
			git \
			gitk \
			make \
			npm

}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
