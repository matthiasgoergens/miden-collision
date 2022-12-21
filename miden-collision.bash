#!/bin/bash
set -euxo pipefail

here="$(pwd)"
# NOTE(Matthias): When I ran the test, `main' was at 9c8af67a7768b920772b3a42d89947f7f639e089
# git clone --depth 1 https://github.com/0xPolygonMiden/miden-vm.git --branch main

# Clone into `miden-vm` directory, if it doesn't already exist.
git clone --depth 1 https://github.com/0xPolygonMiden/miden-vm.git --branch next || true
cd miden-vm

cargo run --quiet --features=executable -- compile --assembly "${here}/data/program.masm" | tee compiled

hash="$(cat compiled | grep '^program hash is ' | grep --only-matching '[^ ]*$')"

cargo run --quiet --features=executable -- run --assembly "${here}/data/program.masm"

head "${here}/data/program.outputs"

cargo run --quiet --features=executable -- \
  verify \
  --program-hash "${hash}" \
  --proof "${here}/data/program.proof" \
  --output "${here}/data/program.outputs"
