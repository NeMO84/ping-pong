IMAGE_NAME=patelify/ping-pong
DOCKER_IMAGE_TAR=ping-pong-armv7l.tar
GO_BUILD_FLAGS=GOOS=linux GOARCH=arm GOARM=7

.PHONY: build push clean

build: clean
	mkdir build
	env $(GO_BUILD_FLAGS) /usr/local/bin/go build -o build/pong pong.go 
	docker build -t $(IMAGE_NAME) .

transfer:
	docker save $(IMAGE_NAME) -o build/$(DOCKER_IMAGE_TAR)
	scp build/$(DOCKER_IMAGE_TAR) pi3:~

push:
	docker push $(IMAGE_NAME)

clean:
	rm -rf build
