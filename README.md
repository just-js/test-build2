# download and extract latest tarball

```
curl -o v0.0.2.tar.gz -v https://github.com/just-js/test-build2/archive/refs/tags/v0.0.2.tar.gz
tar -xvf v0.0.2.tar.gz
```

# building on raspberry pi/debian arm64

## with clang - NOTE: This is currently Broken
```
sudo apt install -y clang make
make linux-arm64
./spin
./spin 1
```

## with gcc
```
sudo apt install -y g++ make
make C=gcc CC=g++ linux-arm64
./spin
./spin 1
```

# building on debian x64

## with clang
```
sudo apt install -y clang make
make linux-x64
./spin
./spin 1
```

## with gcc
```
sudo apt install -y g++ make
make C=gcc CC=g++ linux-x64
./spin
./spin 1
```

# building on macos x64

```
brew install llvm
make macos-x64
./spin
./spin 1
```

# building on macos arm64

```
brew install llvm
make macos-arm64
./spin
./spin 1
```

# coming soon

- freebsd
- risc-v
- windows/x64
- libcosmopolitan

# tips

use mold and ccache for faster build. we can get this down to ~2.5 seconds for a rebuild of runtime when changing only js on an old raspberry pi 3B+.

## initial build

```
time mold -run make C="ccache gcc" CC="ccache g++" linux-arm64 
mimalloc: warning: unable to allocate aligned OS memory directly, fall back to over-allocation (33554432 bytes, address: 0x7f825b0000, alignment: 33554432, commit: 1)
ccache g++ -fPIC -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
ccache g++ -fPIC -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
ccache gcc builtins-linux.S -c -o builtins.o
ccache g++ -fPIC -static-libstdc++ -static-libgcc -s -fno-rtti -g -O3 main.o spin.o builtins.o libv8_monolith.a -o spin
mimalloc: warning: unable to allocate aligned OS memory directly, fall back to over-allocation (33554432 bytes, address: 0x7f8cda0000, alignment: 33554432, commit: 1)

real    1m17.776s
user    1m3.719s
sys     0m4.685s
```

## rebuild

```
time mold -run make C="ccache gcc" CC="ccache g++" linux-arm64 
mimalloc: warning: unable to allocate aligned OS memory directly, fall back to over-allocation (33554432 bytes, address: 0x7f8b4b0000, alignment: 33554432, commit: 1)
ccache g++ -fPIC -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter main.cc
ccache g++ -fPIC -fno-rtti -g -O3 -c -DGLOBALOBJ='"spin"' -DVERSION='"0.1.16"' -std=c++17 -DV8_NO_COMPRESS_POINTERS -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0 -I. -I./deps/v8/include -I./deps/v8 -Werror -Wpedantic -Wall -Wextra -Wno-unused-parameter spin.cc
ccache gcc builtins-linux.S -c -o builtins.o
ccache g++ -fPIC -static-libstdc++ -static-libgcc -s -fno-rtti -g -O3 main.o spin.o builtins.o libv8_monolith.a -o spin
mimalloc: warning: unable to allocate aligned OS memory directly, fall back to over-allocation (33554432 bytes, address: 0x7f85210000, alignment: 33554432, commit: 1)
mimalloc: warning: thread 0x7f82020190: unable to allocate aligned OS memory directly, fall back to over-allocation (33554432 bytes, address: 0x7f790d7000, alignment: 33554432, commit: 0)

real    0m2.710s
user    0m0.674s
sys     0m0.395s
```