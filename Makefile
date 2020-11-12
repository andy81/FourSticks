DOCKER_IMG = packetferret/dalmasca
DOCKER_TAG = latest

build:
	docker build -t $(DOCKER_IMG):$(DOCKER_TAG) .

run:
	docker run -it \
	-v $(PWD):/home/tmp/files \
	-w /home/tmp/files \
	$(DOCKER_IMG):$(DOCKER_TAG) /usr/bin/zsh
