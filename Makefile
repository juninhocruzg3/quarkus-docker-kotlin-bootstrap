USERID := $(shell id -u ${USER})

define run-inside-container
	docker compose run --rm --service-ports api bash -c $(1)
endef

build-docker-image:
	docker compose build --build-arg USERID=${USERID} api
console:
	docker compose run --rm api
clean-install:
	@$(call run-inside-container,"./mvnw clean install")
dev:
	@$(call run-inside-container,"./mvnw --no-snapshot-updates compile quarkus:dev")
test:
	@$(call run-inside-container, "./mvnw --no-snapshot-updates quarkus:test")
verify:
	@$(call run-inside-container, "./mvnw --no-snapshot-updates verify")
package:
	@$(call run-inside-container,"./mvnw package")
package-uber-jar:
	@$(call run-inside-container,"./mvnw package -Dquarkus.package.type=uber-jar")