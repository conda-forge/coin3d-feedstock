mkdir -p build
cd build

export LIBRARY_PATH=$PREFIX/lib

cmake -G "Ninja" \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_PREFIX_PATH=$PREFIX \
      -D SIMAGE_RUNTIME_LINKING=ON \
      -D CMAKE_INSTALL_LIBDIR=$PREFIX/lib \
      -D CMAKE_BUILD_TYPE="Release" \
      ..

ninja install