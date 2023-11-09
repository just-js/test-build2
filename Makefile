linux-x64:
	cp zips/libv8_monolith-linux-x64.a.zip ./
	unzip libv8_monolith-linux-x64.a.zip
	clang builtins-linux.S -c -o builtins.o
	clang++ -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
	clang++ -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
	clang++ -fno-rtti -g -O3 -rdynamic main.o spin.o builtins.o libv8_monolith.a -o spin

macos-x64:
	cp zips/libv8_monolith-mac-x64.a.zip ./
	unzip libv8_monolith-mac-x64.a.zip
	clang builtins-macos.S -c -o builtins.o
	clang++ -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
	clang++ -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
	clang++ -fno-rtti -g -O3 -rdynamic main.o spin.o builtins.o libv8_monolith.a -o spin

macos-arm64:
	cp zips/libv8_monolith-mac-arm64.a.zip ./
	unzip libv8_monolith-mac-arm64.a.zip
	clang -arch arm64 builtins-macos.S -c -o builtins.o
	clang++ -arch arm64 -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
	clang++ -arch arm64 -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
	clang++ -arch arm64 -fno-rtti -g -O3 -rdynamic main.o spin.o builtins.o libv8_monolith.a -o spin
