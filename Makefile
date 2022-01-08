ruby:
	@docker-compose run \
		--rm \
		--name ruby \
		--service-ports \
		--use-aliases \
		ruby \
		bash

ruby.attach:
	@docker exec -it ruby bash
