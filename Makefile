DOCKER			= docker
DOCKER_FILE		= ./Dockerfile
DOCKER_TAG		= mpy_esp32_s3_n8r8
UID				:= $(shell id -u)


all: git-init docker-build build

git-init:
	git submodule update --init lib/micropython
	git submodule update --init lib/esp-idf
	git -C lib/esp-idf submodule update --init \
			components/bt/host/nimble/nimble \
			components/esp_wifi \
			components/esptool_py/esptool \
			components/lwip/lwip \
			components/mbedtls/mbedtls \
			components/bt/controller/lib_esp32 \
			components/bt/controller/lib_esp32c3_family

docker-build:
	$(DOCKER) build \
		--file $(DOCKER_FILE) \
		--build-arg UID=$(UID) \
		--tag $(DOCKER_TAG) \
		.

docker-clean:
	$(DOCKER) image rm $(DOCKER_TAG)

build:
	$(DOCKER) run --rm -it \
		-v $(PWD):/home/builder \
		-e ESP_IDF_ROOT=/home/builder/lib/esp-idf \
		--entrypoint ./entrypoint.sh \
		$(DOCKER_TAG) \
		bash -c 'echo BUILD TODO'
