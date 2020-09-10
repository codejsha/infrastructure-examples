#!/bin/sh

DATABASE_NAME="${1}"

PGPASSWORD="${POSTGRES_PASSWORD}" \
    psql \
    -U postgres \
    -c "CREATE DATABASE ${DATABASE_NAME};"
