USERID := $(shell id -u ${USER})

console:
	docker compose run --rm api
dev:
	docker compose run --rm --service-ports api bash -c "./mvnw compile quarkus:dev"
build:
	docker compose build --build-arg USERID=${USERID} api