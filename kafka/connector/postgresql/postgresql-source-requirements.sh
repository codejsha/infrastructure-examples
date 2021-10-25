#!/bin/bash

PASSWORD="postgres"

PGPASSWORD="${PASSWORD}" psql --host=host.docker.internal --port=5432 --username=postgres --file=postgresql-source-requirements.sql
