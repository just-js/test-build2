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
