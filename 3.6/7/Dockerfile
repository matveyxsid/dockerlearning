FROM rust:1.68
LABEL maintainer="you@example.com" version="1.0"
SHELL ["/bin/bash", "-c"]

ARG BUILD_MODE=debug
STOPSIGNAL SIGINT

WORKDIR /app
COPY Cargo.toml ./
COPY main.rs src/

RUN if [ "$BUILD_MODE" = "release" ]; then \
      cargo build --release ; \
    else \
      cargo build ; \
    fi

# Выбираем CMD
# Если релиз, у нас /app/target/release/mycli
# Иначе debug
CMD if [ "$BUILD_MODE" = "release" ]; then \
      /app/target/release/mycli ; \
    else \
      /app/target/debug/mycli ; \
    fi
