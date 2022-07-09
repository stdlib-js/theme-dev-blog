#/
# @license Apache-2.0
#
# Copyright (c) 2022 The Stdlib Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#/

# VARIABLES #

# Define the command flags:
FIND_CSS_FLAGS ?= \
	-type f \
	-name "$(CSS_PATTERN)" \
	-regex "$(CSS_FILTER)" \
	$(FIND_CSS_EXCLUDE_FLAGS)

ifneq ($(OS), Darwin)
	FIND_CSS_FLAGS := -regextype posix-extended $(FIND_CSS_FLAGS)
endif

# Define a command for listing CSS files:
FIND_CSS_CMD ?= find $(find_kernel_prefix) $(ROOT_DIR) $(FIND_CSS_FLAGS)

# Define the list of files:
CSS_FILES ?= $(shell $(FIND_CSS_CMD))


# RULES #

#/
# Lists all CSS files.
#
# @example
# make list-css-files
#/
list-css-files:
	$(QUIET) find $(find_kernel_prefix) $(ROOT_DIR) $(FIND_CSS_FLAGS) $(find_print_list)

.PHONY: list-css-files
