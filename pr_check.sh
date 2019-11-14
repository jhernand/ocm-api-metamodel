#!/bin/bash -ex
#
# Copyright (c) 2019 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This script is executed by a Jenkins job for each change request. If it
# doesn't succeed the change won't be merged.

# Set the `GOBIN` environment variable so that dependencies will be installed
# always in the same place, regardless of the value of `GOPATH`:
export GOBIN="${PWD}/.gobin"
export PATH="${GOBIN}:${PATH}"

# Install Go tools:
go get github.com/onsi/ginkgo/ginkgo
go get golang.org/x/tools/cmd/goimports

# Run the tests:
make \
	clean \
	tests
