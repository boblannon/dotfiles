#!/bin/bash

tar -cvzf "${HOME}/backup_analyze.tar.gz" \
    --exclude "*/data/*" \
    --exclude "*/env/*" \
    --exclude "*/.git/*" \
    --exclude "*/node_modules/*" \
    --exclude "*/.cache-directory/*" \
    "${HOME}/analyze"
