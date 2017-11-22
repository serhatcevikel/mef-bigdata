#!/bin/bash

source /home/ubuntu/clusterdock/clusterdock.sh
clusterdock_run ./bin/start_cluster cdh --include-service-types=ZOOKEEPER,HDFS,HTTPFS,YARN,HIVE,OOZIE,HUE --primary-node=node1 --secondary-node=node2
