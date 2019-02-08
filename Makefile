.SILENT:

help:
	echo
	echo "Docker builds for asdf-vm/asdf"
	echo
	echo "  Commands: "
	echo
	echo "    help - This message"
	echo "    asdf - Base system (slickage/asdf)"
	echo "    ruby - Base system (slickage/ruby)"
	echo

build: asdf ruby

asdf:
	docker build --no-cache -f Dockerfile -t slickage/asdf .

ruby:
	docker build --no-cache -f ruby.Dockerfile -t slickage/ruby .
