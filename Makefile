.PHONY: build release clean run install check test fmt lint

build:
	cargo build

release:
	cargo build --release

clean:
	cargo clean

run:
	cargo run --

install: release
	cargo install --path .

check:
	cargo check

test:
	cargo test

fmt:
	cargo fmt

lint:
	cargo clippy -- -D warnings
