#!/usr/bin/env zsh

set -eux

mkdir -p target/doc

cp -a ~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/share/doc/rust/html/* target/doc/

docker run --rm --user "$(id -u)":"$(id -g)" -v "$PWD":/usr/src/rust-crate-acme-everything -w /usr/src/rust-crate-acme-everything rust:latest cargo doc --all
