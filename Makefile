run:
	go run ./cmd/api
psql:
	psql ${DATABASE_DNS}
up:
	@echo 'running migrations...'
	migrate -path ./migrations -database ${DATABASE_DNS} up
migration:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}