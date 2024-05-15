run/api:
	go run ./cmd/api
db/psql:
	psql ${DATABASE_DNS}
db/migrations/up:
	@echo 'running migrations...'
	migrate -path ./migrations -database ${DATABASE_DNS} up
db/migrations/new:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}