CC     := gcc
cflags := -Wall -Wextra -O2 -MMD -MP  -Iinclude
target := build/prog
srcs   := $(shell find src -name '*.c')
objs   := $(patsubst src/%.c,build/%.o,$(srcs))
deps := $(objs:.o=.d)
dirs := $(sort $(dir $(objs)))

.PHONY: all clean test

all: $(target)

$(target): $(objs)
	$(CC) $(cflags) $(objs) -o $@

$(dirs):
	@mkdir -p $@

build/%.o: src/%.c | $(dirs)
	$(CC) $(cflags) -c $< -o $@

test: all
        ./tests/test.sh

clean:
	rm -rf build

-include $(deps)
