FROM gcc:13-bookworm AS builder
WORKDIR /src
COPY Makefile ./
COPY include ./include
COPY lib ./lib
COPY apps/loadgen ./apps/loadgen
RUN make loadgen

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /src/apps/loadgen/loadgen /app/loadgen
CMD ["/app/loadgen"]
