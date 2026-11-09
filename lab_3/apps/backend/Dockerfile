FROM gcc:13-bookworm AS builder  
WORKDIR /src
COPY Makefile ./
COPY include ./include
COPY lib ./lib
COPY apps/backend ./apps/backend
RUN make backend

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /src/apps/backend/backend /app/backend
CMD ["/app/backend"]
