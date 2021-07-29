#!/usr/bin/env python

from template.python.enumeration import *
from template.python.fileio import read_file


# region properties


def read_prop_template_data(current_dir):
    properties_template_dir = current_dir.joinpath('template/properties')
    prop_dict = {
        ServerType.ZOOKEEPER: read_file(f'{properties_template_dir}/zookeeper-template.properties'),
        ServerType.KAFKA: read_file(f'{properties_template_dir}/kafka-template.properties'),
        ServerType.SCHEMA_REGISTRY: read_file(f'{properties_template_dir}/schema-registry-template.properties'),
        ServerType.KAFKA_CONNECT: read_file(f'{properties_template_dir}/kafka-connect-template.properties'),
        ServerType.REPLICATOR: read_file(f'{properties_template_dir}/replicator-template.properties'),
        ServerType.KAFKA_REST: read_file(f'{properties_template_dir}/kafka-rest-template.properties'),
        ServerType.KSQLDB: read_file(f'{properties_template_dir}/ksqldb-template.properties'),
        ServerType.CONTROL_CENTER: read_file(f'{properties_template_dir}/control-center-template.properties')
    }
    return prop_dict


# endregion

# region log4j_properties


def read_log4j_template_data(current_dir):
    log4j_template_dir = current_dir.joinpath('template/log4j')
    log4j_dict = {
        ServerType.ZOOKEEPER: read_file(f'{log4j_template_dir}/zookeeper-log4j.properties'),
        ServerType.KAFKA: read_file(f'{log4j_template_dir}/kafka-log4j.properties'),
        ServerType.SCHEMA_REGISTRY: read_file(f'{log4j_template_dir}/schema-registry-log4j.properties'),
        ServerType.KAFKA_CONNECT: read_file(f'{log4j_template_dir}/kafka-connect-log4j.properties'),
        ServerType.REPLICATOR: read_file(f'{log4j_template_dir}/replicator-log4j.properties'),
        ServerType.KAFKA_REST: read_file(f'{log4j_template_dir}/kafka-rest-log4j.properties'),
        ServerType.KSQLDB: read_file(f'{log4j_template_dir}/ksqldb-log4j.properties'),
        ServerType.CONTROL_CENTER: read_file(f'{log4j_template_dir}/control-center-log4j.properties'),
    }
    return log4j_dict


# endregion

# region scripts


def read_start_template_data(current_dir):
    scripts_template_dir = current_dir.joinpath('template/scripts')
    start_dict = {
        ServerType.ZOOKEEPER: read_file(f'{scripts_template_dir}/start-zookeeper-template.sh'),
        ServerType.KAFKA: read_file(f'{scripts_template_dir}/start-kafka-template.sh'),
        ServerType.SCHEMA_REGISTRY: read_file(f'{scripts_template_dir}/start-schema-registry-template.sh'),
        ServerType.KAFKA_CONNECT: read_file(f'{scripts_template_dir}/start-kafka-connect-template.sh'),
        ServerType.REPLICATOR: read_file(f'{scripts_template_dir}/start-replicator-template.sh'),
        ServerType.KAFKA_REST: read_file(f'{scripts_template_dir}/start-kafka-rest-template.sh'),
        ServerType.KSQLDB: read_file(f'{scripts_template_dir}/start-ksqldb-template.sh'),
        ServerType.CONTROL_CENTER: read_file(f'{scripts_template_dir}/start-control-center-template.sh')
    }
    return start_dict


def read_stop_template_data(current_dir):
    scripts_template_dir = current_dir.joinpath('template/scripts')
    stop_dict = {
        ServerType.ZOOKEEPER: read_file(f'{scripts_template_dir}/stop-zookeeper-template.sh'),
        ServerType.KAFKA: read_file(f'{scripts_template_dir}/stop-kafka-template.sh'),
        ServerType.SCHEMA_REGISTRY: read_file(f'{scripts_template_dir}/stop-schema-registry-template.sh'),
        ServerType.KAFKA_CONNECT: read_file(f'{scripts_template_dir}/stop-kafka-connect-template.sh'),
        ServerType.REPLICATOR: read_file(f'{scripts_template_dir}/stop-replicator-template.sh'),
        ServerType.KAFKA_REST: read_file(f'{scripts_template_dir}/stop-kafka-rest-template.sh'),
        ServerType.KSQLDB: read_file(f'{scripts_template_dir}/stop-ksqldb-template.sh'),
        ServerType.CONTROL_CENTER: read_file(f'{scripts_template_dir}/stop-control-center-template.sh')
    }
    return stop_dict


def read_log_template_data(current_dir):
    scripts_template_dir = current_dir.joinpath('template/scripts')
    log_dict = {
        ServerType.ANY: read_file(f'{scripts_template_dir}/log-template.sh')
    }
    return log_dict


# endregion

# region services


def read_service_unit_template_data(current_dir):
    service_template_dir = current_dir.joinpath('template/services')
    service_unit_dict = {
        ServerType.ZOOKEEPER: read_file(f'{service_template_dir}/confluent-zookeeper.service'),
        ServerType.KAFKA: read_file(f'{service_template_dir}/confluent-server.service'),
        ServerType.SCHEMA_REGISTRY: read_file(f'{service_template_dir}/confluent-schema-registry.service'),
        ServerType.KAFKA_CONNECT: read_file(f'{service_template_dir}/confluent-kafka-connect.service'),
        ServerType.REPLICATOR: read_file(f'{service_template_dir}/confluent-replicator.service'),
        ServerType.KAFKA_REST: read_file(f'{service_template_dir}/confluent-kafka-rest.service'),
        ServerType.KSQLDB: read_file(f'{service_template_dir}/confluent-ksqldb.service'),
        ServerType.CONTROL_CENTER: read_file(f'{service_template_dir}/confluent-control-center.service'),
    }
    return service_unit_dict


def read_service_env_template_data(current_dir):
    service_template_dir = current_dir.joinpath('template/services')
    service_env_dict = {
        ServerType.ZOOKEEPER: read_file(f'{service_template_dir}/zookeeper-service-template.env'),
        ServerType.KAFKA: read_file(f'{service_template_dir}/kafka-service-template.env'),
        ServerType.SCHEMA_REGISTRY: read_file(f'{service_template_dir}/schema-registry-service-template.env'),
        ServerType.KAFKA_CONNECT: read_file(f'{service_template_dir}/kafka-connect-service-template.env'),
        ServerType.REPLICATOR: read_file(f'{service_template_dir}/replicator-service-template.env'),
        ServerType.KAFKA_REST: read_file(f'{service_template_dir}/kafka-rest-service-template.env'),
        ServerType.KSQLDB: read_file(f'{service_template_dir}/ksqldb-service-template.env'),
        ServerType.CONTROL_CENTER: read_file(f'{service_template_dir}/control-center-service-template.env'),
    }
    return service_env_dict


def read_override_service_template_data(current_dir):
    service_template_dir = current_dir.joinpath('template/services')
    override_service_dict = {
        ServerType.ZOOKEEPER: read_file(f'{service_template_dir}/override-zookeeper-service-template.sh'),
        ServerType.KAFKA: read_file(f'{service_template_dir}/override-kafka-service-template.sh'),
        ServerType.SCHEMA_REGISTRY: read_file(f'{service_template_dir}/override-schema-registry-service-template.sh'),
        ServerType.KAFKA_CONNECT: read_file(f'{service_template_dir}/override-kafka-connect-service-template.sh'),
        ServerType.REPLICATOR: read_file(f'{service_template_dir}/override-replicator-service-template.sh'),
        ServerType.KAFKA_REST: read_file(f'{service_template_dir}/override-kafka-rest-service-template.sh'),
        ServerType.KSQLDB: read_file(f'{service_template_dir}/override-ksqldb-service-template.sh'),
        ServerType.CONTROL_CENTER: read_file(f'{service_template_dir}/override-control-center-service-template.sh'),
    }
    return override_service_dict


# endregion

# region pssh


def read_pssh_start_template_data(current_dir):
    pssh_template_dir = current_dir.joinpath('template/pssh')
    pssh_start_dict = {
        ServerType.ZOOKEEPER: read_file(f'{pssh_template_dir}/start-all-zookeeper-template.sh'),
        ServerType.KAFKA: read_file(f'{pssh_template_dir}/start-all-kafka-template.sh'),
        ServerType.SCHEMA_REGISTRY: read_file(f'{pssh_template_dir}/start-all-schema-registry-template.sh'),
        ServerType.KAFKA_CONNECT: read_file(f'{pssh_template_dir}/start-all-kafka-connect-template.sh'),
        ServerType.REPLICATOR: read_file(f'{pssh_template_dir}/start-all-replicator-template.sh'),
        ServerType.KAFKA_REST: read_file(f'{pssh_template_dir}/start-all-kafka-rest-template.sh'),
        ServerType.KSQLDB: read_file(f'{pssh_template_dir}/start-all-ksqldb-template.sh'),
        ServerType.CONTROL_CENTER: read_file(f'{pssh_template_dir}/start-all-control-center-template.sh'),
    }
    return pssh_start_dict


def read_pssh_stop_template_data(current_dir):
    pssh_template_dir = current_dir.joinpath('template/pssh')
    pssh_stop_dict = {
        ServerType.ZOOKEEPER: read_file(f'{pssh_template_dir}/stop-all-zookeeper-template.sh'),
        ServerType.KAFKA: read_file(f'{pssh_template_dir}/stop-all-kafka-template.sh'),
        ServerType.SCHEMA_REGISTRY: read_file(f'{pssh_template_dir}/stop-all-schema-registry-template.sh'),
        ServerType.KAFKA_CONNECT: read_file(f'{pssh_template_dir}/stop-all-kafka-connect-template.sh'),
        ServerType.REPLICATOR: read_file(f'{pssh_template_dir}/stop-all-replicator-template.sh'),
        ServerType.KAFKA_REST: read_file(f'{pssh_template_dir}/stop-all-kafka-rest-template.sh'),
        ServerType.KSQLDB: read_file(f'{pssh_template_dir}/stop-all-ksqldb-template.sh'),
        ServerType.CONTROL_CENTER: read_file(f'{pssh_template_dir}/stop-all-control-center-template.sh'),
    }
    return pssh_stop_dict


def read_pssh_kill_template_data(current_dir):
    pssh_template_dir = current_dir.joinpath('template/pssh')
    pssh_kill_dict = {
        ServerType.ANY: read_file(f'{pssh_template_dir}/kill-java.sh'),
    }
    return pssh_kill_dict


# endregion

# region commands


def read_command_template_data(current_dir):
    command_template_dir = current_dir.joinpath('template/commands')
    command_dict = {
        TopicCommandType.CREATE: read_file(f'{command_template_dir}/create-topic-template.sh'),
        TopicCommandType.DELETE: read_file(f'{command_template_dir}/delete-topic-template.sh'),
        TopicCommandType.DESCRIBE: read_file(f'{command_template_dir}/describe-topic-template.sh'),
        TopicCommandType.LIST: read_file(f'{command_template_dir}/get-topic-list-template.sh'),
    }
    return command_dict

# endregion
