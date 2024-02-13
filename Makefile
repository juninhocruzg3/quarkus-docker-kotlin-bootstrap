USERID := $(shell id -u ${USER})

define run-inside-container
	docker compose run --rm --service-ports api bash -c $(1)
endef

build-docker-image:
	docker compose build --build-arg USERID=${USERID} api
console:
	docker compose run --rm api
dev:
	@$(call run-inside-container,"./mvnw compile quarkus:dev")
package:
	@$(call run-inside-container,"./mvnw package")
package-uber-jar:
	@$(call run-inside-container,"./mvnw package -Dquarkus.package.type=uber-jar")