USERID := $(shell id -u ${USER})

console:
	docker compose run --rm api
build:
	docker compose build --build-arg USERID=${USERID} api