mkdir build
cd build

cmake -G "Ninja" ^
      -D CMAKE_BUILD_TYPE:STRING="Release" ^
      -D CMAKE_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
      -D COIN_LINK_LIBSIMAGE:STRING="dynamic" ^
      -D USE_EXTERNAL_EXPAT:BOOL=ON ^
      -D COIN_BUILD_DOCUMENTATION:BOOL=OFF ^
      ..

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
