PHP_CLI_CONTAINER := flipbox/php:73-apache
WEB_SERVICE := web
CRAFT_USERNAME := admin
CRAFT_EMAIL:= me@test.com
CRAFT_PASSWORD := password
CRAFT_SITE_NAME := Craft CMS
CRAFT_SITE_URL := https://localhost
CRAFT_LANGUAGE := en_US

up:
	docker-compose up -d
down:
	docker-compose down

craft-install:
	docker-compose exec \
	    $(WEB_SERVICE) sh -c \
	    "./craft install/craft --username \"${CRAFT_USERNAME}\" --email \"${CRAFT_EMAIL}\" --password \"${CRAFT_PASSWORD}\" --site-name \"${CRAFT_SITE_NAME}\" --site-url \"${CRAFT_SITE_URL}\" --language \"${CRAFT_LANGUAGE}\""

composer-install:
	docker run --rm \
	    -v "$(PWD):/var/www/html" \
	    $(PHP_CLI_CONTAINER) composer install
