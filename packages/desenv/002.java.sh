info() {
	echo "Desenvolvimento na linguagem Java";
}

configure() {
	add-apt-repository -y ppa:webupd8team/java > /dev/null
}

install() {
	apt-get -qq  -y install oracle-java8-installer \
			oracle-java8-set-default;
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
