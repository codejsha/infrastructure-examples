# Status

print server and datasource status using scripts.

## Server monitoring

```bash
### 14c, 12c
${ORACLE_HOME}/oracle_common/common/bin/wlst.sh get_server_status.py
### 11g
${MW_HOME}/wlserver_10.3/common/bin/wlst.sh get_server_status.py
```

```txt
ServerName           State      ListenAddress                       ListenPort
------------------------------------------------------------------------------
AdminServer          RUNNING    test.example.com/192.168.137.150          7001
ManagedServer1       RUNNING    test.example.com/192.168.137.150          7003
ManagedServer2       RUNNING    test.example.com/192.168.137.150          7004


HEAP                          |     AdminServer  ManagedServer1  ManagedServer2
-------------------------------------------------------------------------------
HeapSizeMax                   |      1023410176      1023410176      1023410176
HeapSizeCurrent               |      1023410176      1023410176      1023410176
HeapFreeCurrent               |       626085560       811488576       794110248
HeapFreePercent               |              61              79              77


THREADPOOL                    |     AdminServer  ManagedServer1  ManagedServer2
-------------------------------------------------------------------------------
CompletedRequestCount         |            2849            2436            2415
ExecuteThreadIdleCount        |             149             148             148
ExecuteThreadTotalCount       |             150             150             150
HoggingThreadCount            |               0               1               1
MinThreadsConstraintsCompleted|               0               1               1
MinThreadsConstraintsPending  |               0               0               0
PendingUserRequestCount       |               0               0               0
QueueLength                   |               0               0               0
SharedCapacityForWorkManagers |           65536           65536           65536
StandbyThreadCount            |               0               0               0
Throughput                    |          1.9990          3.9980          4.4843
Suspended                     |           False           False           False
OverloadRejectedRequestsCount |               0               0               0
StuckThreadCount              |               0               0               0
```

## Datasource monitoring

```bash
### 14c, 12c
${ORACLE_HOME}/oracle_common/common/bin/wlst.sh get_datasource_status.py
### 11g
${MW_HOME}/wlserver_10.3/common/bin/wlst.sh get_datasource_status.py
```

```txt
DATASOURCE                       |            ManagedServer1            ManagedServer2
                                 |           BaseDataSource1           BaseDataSource1
--------------------------------------------------------------------------------------
ActiveConnectionsAverageCount    |                         0                         0
ActiveConnectionsCurrentCount    |                         0                         0
ActiveConnectionsHighCount       |                         0                         0
ConnectionDelayTime              |                       276                       291
ConnectionsTotalCount            |                         1                         1
CurrCapacity                     |                         1                         1
CurrCapacityHighCount            |                         1                         1
DeploymentState                  |                         2                         2
FailedReserveRequestCount        |                         0                         0
FailuresToReconnectCount         |                         0                         0
HighestNumAvailable              |                         1                         1
HighestNumUnavailable            |                         0                         0
LeakedConnectionCount            |                         0                         0
ModuleId                         |           BaseDataSource1           BaseDataSource1
Name                             |           BaseDataSource1           BaseDataSource1
NumAvailable                     |                         1                         1
NumUnavailable                   |                         0                         0
PrepStmtCacheAccessCount         |                         0                         0
PrepStmtCacheAddCount            |                         0                         0
PrepStmtCacheCurrentSize         |                         0                         0
PrepStmtCacheDeleteCount         |                         0                         0
PrepStmtCacheHitCount            |                         0                         0
PrepStmtCacheMissCount           |                         0                         0
Properties                       |             {user=system}             {user=system}
ReserveRequestCount              |                         0                         0
State                            |                   Running                   Running
Type                             |     JDBCDataSourceRuntime     JDBCDataSourceRuntime
VersionJDBCDriver                |  oracle.jdbc.OracleDriver  oracle.jdbc.OracleDriver
WaitingForConnectionCurrentCount |                         0                         0
WaitingForConnectionFailureTotal |                         0                         0
WaitingForConnectionHighCount    |                         0                         0
WaitingForConnectionSuccessTotal |                         0                         0
WaitingForConnectionTotal        |                         0                         0
WaitSecondsHighCount             |                         0                         0
```
