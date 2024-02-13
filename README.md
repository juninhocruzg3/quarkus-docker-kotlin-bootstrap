# quarkus-docker-kotlin-bootstrap

This project aim to provide an initial configuration to enjoy Quarkus with Kotlin inside an amazing Docker Container. It can be useful if you don't want to install Maven, Quarkus and its close-friends on your pc directly.

## Requirements
- To run this project, you only need to have Docker installed.

## Tools
- Quarkus
  - Quarkus is the Supersonic Subatomic Java Framework.
  - If you want to learn more about Quarkus, please visit its website: https://quarkus.io/.
- Docker
  - Docker is a platform designed to help developers build, share, and run container applications.
  - If you want to learn more about Docker, please visit its website: https://www.docker.com/.


## Running the application in dev mode

You can run your application in dev mode that enables live coding using:
```shell script
make dev
```

> **_NOTE:_**  Quarkus now ships with a Dev UI, which is available in dev mode only at http://localhost:8080/q/dev/.

## Packaging and running the application

The application can be packaged using:
```shell script
make package
```
It produces the `quarkus-run.jar` file in the `target/quarkus-app/` directory.
Be aware that it’s not an _über-jar_ as the dependencies are copied into the `target/quarkus-app/lib/` directory.

The application is now runnable using `java -jar target/quarkus-app/quarkus-run.jar`.

If you want to build an _über-jar_, execute the following command:
```shell script
make package-uber-jar
```

The application, packaged as an _über-jar_, is now runnable using `java -jar target/*-runner.jar`.

<!-- ## Creating a native executable

You can create a native executable using: 
```shell script
./mvnw package -Dnative
```

Or, if you don't have GraalVM installed, you can run the native executable build in a container using: 
```shell script
./mvnw package -Dnative -Dquarkus.native.container-build=true
```

You can then execute your native executable with: `./target/rest-kotlin-quickstart-1.0.0-SNAPSHOT-runner`

If you want to learn more about building native executables, please consult https://quarkus.io/guides/maven-tooling. -->

## Related Guides

- Kotlin ([guide](https://quarkus.io/guides/kotlin)): Write your services in Kotlin

## Provided Code

### RESTEasy Reactive

Easily start your Reactive RESTful Web Services

[Related guide section...](https://quarkus.io/guides/getting-started-reactive#reactive-jax-rs-resources)
