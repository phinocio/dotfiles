#!/usr/bin/env bash

if [ $USER = "alice" ]; then
	LANG=ja_JP.UTF-8 obsidian --disable-gpu
else
	code ~/Notes/
fi


