#!/usr/bin/env bash

if [[ $1 =~ ^.*/$ ]]; then
	mkdir -p $1
else
	touch $1
fi
