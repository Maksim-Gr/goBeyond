include .envrc

.PHONY: help
help:
	@echo 'Usage:'
	@sed -n -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

# create prerequisite for commands
.PHONY: confirm
confirm:
	@echo -n 'Are you sure? [y/N]' && read ans && [ $${ans:-N} = y]
.PHONY: run/api
run/api:
	go run ./cmd/api -db-dsn=${DATABASE_DNS}
.PHONY: db/psql
db/psql:
	psql ${DATABASE_DNS}
.PHONY: db/migrations/up
db/migrations/up: confirm
	@echo 'running migrations...'
	migrate -path ./migrations -database ${DATABASE_DNS} up
.PHONY: db/migrations/new
db/migrations/new:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}

.PHONY: build/api build/api:
@echo 'Building cmd/api...'
go build -o=./bin/api ./cmd/api