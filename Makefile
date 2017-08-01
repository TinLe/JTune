ROOT_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONEY: all
all: build

.PHONEY: pex
build: wheel
	@echo Building pexes....
	pex --python=python2 -f $(ROOT_DIR) *.whl -r $(ROOT_DIR)/requirements.txt -e jtune.jtune -o jtune.pex

wheel:
	# pip3 wheel -w $(ROOT_DIR) $(ROOT_DIR)
	pip2 wheel -w $(ROOT_DIR) $(ROOT_DIR)

install: build
	@echo Installing jtune.pex in /usr/local/bin....
	@sudo cp jtune.pex /usr/local/bin/jtune

clean:
	rm -f *.pex *.whl
