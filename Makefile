spin-x64:
	clang builtins.S -c -o builtins.o
	clang++ -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
	clang++ -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
	clang++ -s -static -fno-rtti -g -O3 -rdynamic main.o spin.o builtins.o libv8_monolith.a -o spin

spin-arm64:
	clang -arch arm64 builtins.S -c -o builtins.o
	clang++ -arch arm64 -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
	clang++ -arch arm64 -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
	clang++ -s -static -arch arm64 -fno-rtti -g -O3 -rdynamic main.o spin.o builtins.o libv8_monolith.a -o spin
