######################################################################

### install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustc --version

######################################################################

rustup show home
rustup toolchain list

rustup target list --installed
rustup component list --installed

######################################################################

cargo clean
cargo clean --release
cargo clean --dry-run

######################################################################

cargo metadata --no-deps --format-version 1
cargo metadata --format-version 1

# CARGO_META  := $(shell cargo metadata --no-deps --format-version 1)
# APP_NAME    := $(shell echo '$(CARGO_META)' | jq -r '.packages[0].name')
# APP_VERSION := $(shell echo '$(CARGO_META)' | jq -r '.packages[0].version')
