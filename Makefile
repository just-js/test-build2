C=clang
CC=clang++

linux-arm64:
ifneq (,$(wildcard ./libv8_monolith.a))
else
	cp zips/libv8_monolith-linux-arm64.a.zip ./
	unzip libv8_monolith-linux-arm64.a.zip
endif
	$(CC) -fPIC -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
	$(CC) -fPIC -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
	$(C) builtins-linux.S -c -o builtins.o
	$(CC) -fPIC -static-libstdc++ -static-libgcc -s -fno-rtti -g -O3 main.o spin.o builtins.o libv8_monolith.a -o spin

linux-x64:
ifneq (,$(wildcard ./libv8_monolith.a))
else
	cp zips/libv8_monolith-linux-x64.a.zip ./
	unzip libv8_monolith-linux-x64.a.zip
endif
	$(CC) -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
	$(CC) -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
	$(C) builtins-linux.S -c -o builtins.o
	$(CC) -s -fno-rtti -g -O3 -rdynamic main.o spin.o builtins.o libv8_monolith.a -o spin

macos-x64:
ifneq (,$(wildcard ./libv8_monolith.a))
else
	cp zips/libv8_monolith-mac-x64.a.zip ./
	unzip libv8_monolith-mac-x64.a.zip
endif
	$(CC) -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
	$(CC) -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
	$(C) builtins-macos.S -c -o builtins.o
	$(CC) -fno-rtti -g -O3 -rdynamic main.o spin.o builtins.o libv8_monolith.a -o spin

macos-arm64:
ifneq (,$(wildcard ./libv8_monolith.a))
else
	cp zips/libv8_monolith-mac-arm64.a.zip ./
	unzip libv8_monolith-mac-arm64.a.zip
endif
	$(CC) -arch arm64 -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
	$(CC) -arch arm64 -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
	$(C) -arch arm64 builtins-macos.S -c -o builtins.o
	$(CC) -arch arm64 -fno-rtti -g -O3 -rdynamic main.o spin.o builtins.o libv8_monolith.a -o spin

clean:
	rm -f *.a
	rm -f *.o
	rm -f spin
	rm -f *.zip
