#!/bin/bash
find $(pwd)/addons -type f -name "requirements.txt" -exec cat '{}' \; > $(pwd)/bin/files/requirements.txt