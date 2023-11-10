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
