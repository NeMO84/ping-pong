IMAGE_NAME=patelify/ping-pong
DOCKER_IMAGE_TAR=ping-pong-armv7l.tar

.PHONY: build push clean

build: clean
	mkdir build
	docker build -t $(IMAGE_NAME) .
	docker save $(IMAGE_NAME) -o build/$(DOCKER_IMAGE_TAR)

transfer: build
	scp build/$(DOCKER_IMAGE_TAR) pi3:~

push:
	docker push $(IMAGE_NAME)

clean:
	rm -rf build
