#!/bin/bash

/bin/awk '{ sum += $1 } END { print sum }'
