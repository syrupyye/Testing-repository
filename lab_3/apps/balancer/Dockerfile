FROM gcc:13-bookworm AS builder
WORKDIR /src
COPY Makefile ./
COPY include ./include
COPY lib ./lib
COPY apps/balancer ./apps/balancer
RUN make balancer

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /src/apps/balancer/balancer /app/balancer
CMD ["/app/balancer"]
