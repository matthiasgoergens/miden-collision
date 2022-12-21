#!/bin/bash
set -euxo pipefail
docker build --tag miden-collision .
docker run --rm miden-collision
