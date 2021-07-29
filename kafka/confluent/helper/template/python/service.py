#!/usr/bin/env python

from template.python.enumeration import ServerType
from template.python.fileio import write_file
from template.python.function import *


def create_service_unit_file(server_type, service_unit):
    if server_type == ServerType.ZOOKEEPER:
        write_file(f'output/services/confluent-zookeeper.service', service_unit)
    elif server_type == ServerType.KAFKA:
        write_file(f'output/services/confluent-server.service', service_unit)
    elif server_type == ServerType.SCHEMA_REGISTRY:
        write_file(f'output/services/confluent-schema-registry.service', service_unit)
    elif server_type == ServerType.KAFKA_CONNECT:
        write_file(f'output/services/confluent-kafka-connect.service', service_unit)
    elif server_type == ServerType.REPLICATOR:
        write_file(f'output/services/confluent-replicator.service', service_unit)
    elif server_type == ServerType.KAFKA_REST:
        write_file(f'output/services/confluent-kafka-rest.service', service_unit)
    elif server_type == ServerType.KSQLDB:
        write_file(f'output/services/confluent-ksqldb.service', service_unit)
    elif server_type == ServerType.CONTROL_CENTER:
        write_file(f'output/services/confluent-control-center.service', service_unit)


def create_service_env_file(base, server, service_env):
    edited_service_env = service_env
    edited_service_env = replace_variable('LOG_DIR', f'{server.log_dir}', edited_service_env)
    edited_service_env = replace_variable('JAVA_HOME', f'{base.java_home}', edited_service_env)

    edited_service_env = substitute_variable('CONFLUENT_HOME', f'{base.confluent_home}', edited_service_env)
    edited_service_env = substitute_variable('SERVER_NAME', f'{server.server_name}', edited_service_env)

    write_file(f'output/services/{server.file.service_env}', edited_service_env)


def create_override_service_script_file(base, server, service_script):
    edited_service = service_script
    edited_service = replace_variable('USER', f'{base.user}', edited_service)
    edited_service = replace_variable('GROUP', f'{base.group}', edited_service)
    edited_service = replace_variable('CONFLUENT_HOME', f'{base.confluent_home}', edited_service)
    edited_service = replace_variable('SERVER_NAME', f'{server.server_name}', edited_service)
    edited_service = replace_variable('PROPERTIES_FILE',
                                      f'{base.properties_dir}/{server.file.properties}', edited_service)
    edited_service = replace_variable('LOG_DIR', f'{server.log_dir}', edited_service)

    if server.server_type in \
            [ServerType.ZOOKEEPER, ServerType.KAFKA, ServerType.KSQLDB, ServerType.CONTROL_CENTER]:
        edited_service = replace_variable('DATA_DIR', f'{server.data_dir}', edited_service)

    if server.server_type == ServerType.ZOOKEEPER:
        edited_service = replace_variable('MYID', f'{server.server_id}', edited_service)

    write_file(f'output/services/{server.file.service}', edited_service)
