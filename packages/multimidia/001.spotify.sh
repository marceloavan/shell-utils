info() {
	echo "Cliente de música Spotify"
}

configure() {
	if [ -e "/etc/apt/sources.list.d/spotify.list" ]; then
		echo "source spotify list already exists in '/etc/apt/sources.list.d/spotify.list'"
	else
		sh -c 'echo "deb http://repository.spotify.com/ stable non-free" > /etc/apt/sources.list.d/spotify.list'
		apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
		echo "source spotify list was included in '/etc/apt/sources.list.d/spotify.list'"
	fi
}

install() {
     apt-get -qq -y install spotify-client
		
}

clean() {
	exit
}


# Call function
local_args=("$@")
$1 ${local_args[@]:1}
