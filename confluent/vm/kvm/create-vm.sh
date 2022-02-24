#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace
set -o xtrace

function create_vm {
    DISK_DIR="${1}"
    BASE_DISK="${2}"
    VM_NAME="${3}"
    VM_CPU="${4}"
    VM_MEMORY="${5}"

    qemu-img convert -f qcow2 -O qcow2 ${DISK_DIR}/${BASE_DISK} ${DISK_DIR}/${VM_NAME}.qcow2

    virt-install \
        --import \
        --name ${VM_NAME} \
        --vcpus ${VM_CPU} \
        --memory ${VM_MEMORY} \
        --os-type=Linux \
        --os-variant centos8 \
        --network bridge:br0 \
        --disk path=${DISK_DIR}/${VM_NAME}.qcow2 \
        --noautoconsole
}


DISK_DIR="/GUEST"
BASE_DISK="cp1-base.qcow2"

ZOOKEEPER_VM_NAMES=("cp1-zookeeper1" "cp1-zookeeper2" "cp1-zookeeper3")
VM_CPU="1"
VM_MEMORY="6144"
for VM_NAME in ${ZOOKEEPER_VM_NAMES[@]}; do
    create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
done

KAFKA_VM_NAMES=("cp1-kafka1" "cp1-kafka2" "cp1-kafka3")
VM_CPU="4"
VM_MEMORY="18432"
for VM_NAME in ${KAFKA_VM_NAMES[@]}; do
    create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
done

SCHEMA_REGISTRY_VM_NAMES=("cp1-schema-registry1" "cp1-schema-registry2")
VM_CPU="1"
VM_MEMORY="6144"
for VM_NAME in ${SCHEMA_REGISTRY_VM_NAMES[@]}; do
    create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
done

KAFKA_CONNECT_VM_NAMES=("cp1-kafka-connect1" "cp1-kafka-connect2")
VM_CPU="4"
VM_MEMORY="18432"
for VM_NAME in ${KAFKA_CONNECT_VM_NAMES[@]}; do
    create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
done

# KAFKA_REST_VM_NAMES=("cp1-kafka-rest1" "cp1-kafka-rest2")
# VM_CPU="1"
# VM_MEMORY="6144"
# for VM_NAME in ${KAFKA_REST_VM_NAMES[@]}; do
#     create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
# done

KSQLDB_VM_NAMES=("cp1-ksqldb1" "cp1-ksqldb2")
VM_CPU="4"
VM_MEMORY="10240"
for VM_NAME in ${KSQLDB_VM_NAMES[@]}; do
    create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
done

REPLICATOR_VM_NAMES=("cp1-replicator1" "cp1-replicator2")
VM_CPU="4"
VM_MEMORY="10240"
for VM_NAME in ${REPLICATOR_VM_NAMES[@]}; do
    create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
done

CONTROL_CENTER_VM_NAMES=("cp1-control-center1")
VM_CPU="2"
VM_MEMORY="10240"
for VM_NAME in ${CONTROL_CENTER_VM_NAMES[@]}; do
    create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
done

MONIGORING_VM_NAMES=("cp1-monitoring")
VM_CPU="2"
VM_MEMORY="18432"
for VM_NAME in ${MONIGORING_VM_NAMES[@]}; do
    create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
done

MONIGORING_VM_NAMES=("cp1-database")
VM_CPU="2"
VM_MEMORY="10240"
for VM_NAME in ${MONIGORING_VM_NAMES[@]}; do
    create_vm ${DISK_DIR} ${BASE_DISK} ${VM_NAME} ${VM_CPU} ${VM_MEMORY}
done
