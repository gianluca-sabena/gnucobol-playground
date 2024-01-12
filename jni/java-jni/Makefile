# polyglot programming with GnuCOBOL and SWIG
BUILD_DIR := ./build
SRC_DIR := ./src

help:
	@echo "Targets include: build, run, clean"

build:
	mkdir -p $(BUILD_DIR)
	swig -java -o $(BUILD_DIR)/polyglot-swig_wrap.c $(SRC_DIR)/polyglot-swig.i 
	cobc -fimplicit-init -C $(SRC_DIR)/polyglot.cob 
	mv polyglot.* $(BUILD_DIR)/
	gcc -c -fPIC  $(BUILD_DIR)/polyglot.c  \
		-I/usr/lib/jvm/java-8-openjdk-amd64/include \
		-I/usr/lib/jvm/java-8-openjdk-amd64/include/linux \
		-o $(BUILD_DIR)/polyglot.o
	gcc -c -fPIC $(BUILD_DIR)/polyglot-swig_wrap.c \
		-I/usr/lib/jvm/java-8-openjdk-amd64/include \
		-I/usr/lib/jvm/java-8-openjdk-amd64/include/linux \
		-o $(BUILD_DIR)/polyglot-swig_wrap.o
	gcc -shared -lcob $(BUILD_DIR)/polyglot.o $(BUILD_DIR)/polyglot-swig_wrap.o -o $(BUILD_DIR)/libpolyglot.so 
	/usr/lib/jvm/java-8-openjdk-amd64/bin/javac $(SRC_DIR)/Main.java $(BUILD_DIR)/polyglot.java $(BUILD_DIR)/polyglotJNI.java  -d $(BUILD_DIR)
	@echo "Now do: java main"

run:
	LD_PRELOAD=/lib/x86_64-linux-gnu/libcob.so /usr/lib/jvm/java-8-openjdk-amd64/bin/java -Djava.library.path=$(BUILD_DIR) -cp $(BUILD_DIR) Main

clean:
	rm -r $(BUILD_DIR)

.PHONY: build run clean
