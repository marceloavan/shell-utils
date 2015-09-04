info() {
	echo "Repositório de atualização do LibreOffice"
}

configure() {
	add-apt-repository -y ppa:libreoffice/ppa > /dev/null
}

install() {
	exit
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
