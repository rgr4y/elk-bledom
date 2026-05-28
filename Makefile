.PHONY: build release clean run install check test fmt lint docker docker-build docker-extract

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

docker:
	docker compose build

docker-extract: docker
	@mkdir -p target/linux
	docker create --name elk-extract elk-bledom-elk-led-control 2>/dev/null || true
	docker cp elk-extract:/usr/local/bin/elk-led-control target/linux/elk-led-control
	docker rm elk-extract
	@echo "Binary at target/linux/elk-led-control"
