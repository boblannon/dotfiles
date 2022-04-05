#!/usr/bin/env bash

watch -t -n 5 'docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Label \"com.docker.compose.project\"}}\t{{.Label \"com.docker.compose.service\"}}"'
