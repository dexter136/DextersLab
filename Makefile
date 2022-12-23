.POSIX:

default: metal bootstrap tf

terraform: external secrets

.PHONY: metal
metal:
	make -C metal

.PHONY: bootstrap
bootstrap:
	make -C cluster

.PHONY: tf
secrets:
	make -C terraform

.PHONY: secrets
secrets:
	make -C terraform secrets

.PHONY: external
external:
	make -C terraform external

.PHONY: tools
tools:
	make -C tools
