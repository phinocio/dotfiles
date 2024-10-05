#!/usr/bin/env bash

task=$(rofi -dmenu)
token=$(secret-tool lookup todoist api)

curl "https://api.todoist.com/rest/v2/tasks" \
	-X POST \
	--data "{ \"content\": \"$task\" }" \
	-H "Content-Type: application/json" \
    -H "X-Request-Id: $(uuidgen)" \
    -H "Authorization: Bearer $token"\
