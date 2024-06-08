# Confluent for Kubernetes

- https://docs.confluent.io/operator/current/overview.html

Table of Contents:

- [Confluent for Kubernetes](#confluent-for-kubernetes)
  - [Examples according to the deployment environment](#examples-according-to-the-deployment-environment)
    - [Security configuration](#security-configuration)
      - [Authentication](#authentication)
      - [Authorization](#authorization)
      - [Network encryption](#network-encryption)
    - [External access](#external-access)

## Examples according to the deployment environment

```txt
component/
├── development
├── staging
└── production
```

### Security configuration

- https://docs.confluent.io/operator/current/co-security-overview.html

#### Authentication

| Environment | Kafka      | ZooKeeper | Confluent components              |
| ----------- | ---------- | --------- | --------------------------------- |
| Development | No         | No        | No                                |
| Staging     | SASL/PLAIN | Digest    | Basic, LDAP (Control Center only) |
| Production  | SASL/PLAIN | Digest    | Basic, LDAP (Control Center only) |

LDAP authentication only applies to the Confluent Control Center.

#### Authorization

| Environment | Authorization  |
| ----------- | -------------- |
| Development | No             |
| Staging     | RBAC with LDAP |
| Production  | RBAC with LDAP |

#### Network encryption

- https://docs.confluent.io/operator/current/co-network-encryption.html

| Environment | Authentication |
| ----------- | -------------- |
| Development | No             |
| Staging     | TLS            |
| Production  | TLS            |

In production, staging examples, each component has its own certificate.

### External access

Development:

- Type: NodePort
- Kafka: `localhost:30000`, and offset 1
- Schema Registry: `localhost:30010`
- Kafka Connect: `localhost:30020`
- Replicator: `localhost:30030`
- ksqlDB: `localhost:30040`
- Control Center: `localhost:30050`

Staging:

- Type: NodePort
- Kafka: `localhost:30000`, and offset 1
- Schema Registry: `localhost:30010`
- Kafka Connect: `localhost:30020`
- Replicator: `localhost:30030`
- ksqlDB: `localhost:30040`
- Control Center: `localhost:30050`
- Metadata Service (MDS): `localhost:30060`

Production:

- Type: LoadBalancer, staticForHostBasedRouting (Kafka)
- Kafka: `kafka.example.com` (Ingress), `broker-0.example.com`, ...
- Schema Registry: `schemaregistry.example.com`
- Kafka Connect: `connect.example.com`
- Replicator: `replicator.example.com`
- ksqlDB: `ksql.example.com`
- Control Center: `controlcenter.example.com`
- Metadata Service (MDS): `mds.example.com`
