info() {
	echo "Utilitários de compactação"
}

configure() {
	exit
}

install() {
	apt-get -qq  -y install arj \
			lunzip \
			lzip \
			p7zip-rar \
			rar \
			unace
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
