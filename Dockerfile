FROM rust:1.87-bookworm AS builder

RUN apt-get update && apt-get install -y \
    libdbus-1-dev \
    libasound2-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y \
    libdbus-1-3 \
    libasound2 \
    bluetooth \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/target/release/elk-led-control /usr/local/bin/
ENTRYPOINT ["elk-led-control"]
