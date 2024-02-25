#!/usr/bin/env python

command('start-configuration-editing')

command('cd /')

command('create-empty-element sessionClusterConfig')
command('cd /sessionClusterConfig')
command('set-element-value usingSessionCluster true')

command('create-empty-element sessionClusters')
command('cd /sessionClusterConfig/sessionClusters/sessionCluster')

command('create-empty-element [0]')
command('cd /sessionClusterConfig/sessionClusters/sessionCluster/[0]')
command('set-element-value name sessionCluster1')

# command('create-empty-element clusterConfig')
# command('cd /sessionClusterConfig/sessionClusters/sessionCluster/[0]/clusterConfig')
# command('set-element-value reservedThreadNum 0')
# command('set-element-value connectTimeout 5000')
# command('set-element-value readTimeout 20000')
# command('set-element-value backupLevel SET')
# command('set-element-value failoverDelay 600')
# command('set-element-value restartDelay 600')

# command('create-empty-element fileDb')
# command('cd /sessionClusterConfig/sessionClusters/sessionCluster/[0]/clusterConfig/fileDb')
# command('set-element-value passivationTimeout -1')
# command('set-element-value minHole 100')
# command('set-element-value packingRate 0.5')

command('activate-configuration')
