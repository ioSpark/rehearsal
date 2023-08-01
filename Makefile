VERSION := 1.0.0

up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker build -t ghcr.io/iospark/rehearsal:dev ./image

build-prod:
	docker build -t ghcr.io/iospark/rehearsal:$(VERSION) -f ./image/Dockerfile.prod ./image

push:
	docker push ghcr.io/iospark/rehearsal:$(VERSION)
