CC ?= gcc
CFLAGS ?= -Wall -Wextra -O2
INCLUDE_DIR = include
LIB = build/lib/libcommon.a
LIB_OBJS = build/lib/net.o build/lib/http.o build/lib/utils.o

.PHONY: all libcommon backend balancer loadgen clean

all: backend balancer loadgen

libcommon: $(LIB)
backend: apps/backend/backend
balancer: apps/balancer/balancer
loadgen: apps/loadgen/loadgen

$(LIB): $(LIB_OBJS)
	ar rcs $@ $^

build/lib/%.o: lib/%.c $(wildcard $(INCLUDE_DIR)/*.h)
	mkdir -p build/lib
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

apps/backend/backend: apps/backend/main.c apps/backend/handler.c apps/backend/handler.h $(LIB)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) apps/backend/main.c apps/backend/handler.c $(LIB) -o $@

apps/balancer/balancer: apps/balancer/main.c apps/balancer/router.c apps/balancer/router.h $(LIB)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) apps/balancer/main.c apps/balancer/router.c $(LIB) -o $@

apps/loadgen/loadgen: apps/loadgen/main.c apps/loadgen/stats.c apps/loadgen/stats.h $(LIB)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) apps/loadgen/main.c apps/loadgen/stats.c $(LIB) -o $@

clean:
	rm -rf build apps/backend/backend apps/balancer/balancer apps/loadgen/loadgen
