#!/bin/bash

docker build -t blazor-app .

docker run --rm -d -p 8080:5000 blazor-app
