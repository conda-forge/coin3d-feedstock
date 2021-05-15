# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./cfg
cp $BUILD_PREFIX/share/gnuconfig/config.* ./superglue/cfg
mkdir -p build
cd build

declare -a CMAKE_PLATFORM_FLAGS
if [[ ${HOST} =~ arm64-apple* ]]; then
    CMAKE_PLATFORM_FLAGS+=(-DHAVE_HASH_QUOTING_EXITCODE=0)
    CMAKE_PLATFORM_FLAGS+=(-DHAVE_HASH_QUOTING_EXITCODE__TRYRUN_OUTPUT='')
fi

cmake ${CMAKE_ARGS} -G "Ninja" \
      -D CMAKE_BUILD_TYPE:STRING="Release" \
      ${CMAKE_PLATFORM_FLAGS[@]} \
      -D CMAKE_INSTALL_PREFIX:FILEPATH=$PREFIX \
      -D CMAKE_PREFIX_PATH:FILEPATH=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR:FILEPATH=$PREFIX/lib \
      -D SIMAGE_RUNTIME_LINKING:BOOL=ON \
      -D USE_EXTERNAL_EXPAT:BOOL=ON \
      -D COIN_BUILD_DOCUMENTATION:BOOL=OFF \
      -D COIN_BUILD_MAC_FRAMEWORK:BOOL=OFF \
      -D COIN_BUILD_TESTS:BOOL=OFF \
      -D COIN_BUILD_DOCUMENTATION:BOOL=OFF \
      ..

ninja install
