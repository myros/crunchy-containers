#!/bin/bash
# Copyright 2017 Crunchy Data Solutions, Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create the service account used in the containers
oc create -f $DIR/set-sa.json

# grant the SA permission to update a pod label
#oadm policy add-cluster-role-to-user cluster-admin system:serviceaccount:default:pgset-sa
#oadm policy add-cluster-role-to-user cluster-reader system:serviceaccount:default:pgset-sa

# the most wide open permissions, adjust for your security posture
oc policy add-role-to-group view system:serviceaccounts -n $NAMESPACE
oc policy add-role-to-group edit system:serviceaccounts -n $NAMESPACE

