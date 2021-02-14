cmake_minimum_required(VERSION 3.19)
project(TexSyn)
set(CMAKE_CXX_STANDARD 17)
set(OPENCV_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/opencv/build/install")
if (WIN32)
    set(OPENCV_LIB_DIR "${OPENCV_INSTALL_DIR}/x64/vc16/staticlib")
    set(OPENCV_LIBS
        ${OPENCV_LIB_DIR}/libjpeg-turbod.lib
        ${OPENCV_LIB_DIR}/libpngd.lib
        ${OPENCV_LIB_DIR}/libtiffd.lib
        ${OPENCV_LIB_DIR}/libwebpd.lib
        ${OPENCV_LIB_DIR}/IlmImfd.lib
        ${OPENCV_LIB_DIR}/libopenjp2d.lib
        ${OPENCV_LIB_DIR}/opencv_core451d.lib
        ${OPENCV_LIB_DIR}/opencv_imgcodecs451d.lib
        ${OPENCV_LIB_DIR}/opencv_highgui451d.lib
        ${OPENCV_LIB_DIR}/ippicvmt.lib
        ${OPENCV_LIB_DIR}/ippiwd.lib
        ${OPENCV_LIB_DIR}/ittnotifyd.lib
        ${OPENCV_LIB_DIR}/opencv_imgproc451d.lib
        ${OPENCV_LIB_DIR}/zlibd.lib
    )
else()
    set(OPENCV_LIB_DIR "${OPENCV_INSTALL_DIR}/lib")
    set(OPENCV_LIBS
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/liblibjpeg-turbo.a
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/liblibpng.a
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/liblibtiff.a
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/liblibwebp.a
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/libIlmImf.a
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/liblibopenjp2.a
        ${OPENCV_LIB_DIR}/libopencv_core.a
        ${OPENCV_LIB_DIR}/libopencv_imgcodecs.a
        ${OPENCV_LIB_DIR}/libopencv_highgui.a
        ${OPENCV_LIB_DIR}/libopencv_imgproc.a
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/libippicv.a
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/libippiw.a
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/libittnotify.a
        ${OPENCV_LIB_DIR}/opencv4/3rdparty/libzlib.a
    )
    set(SYSTEM_LIBS 
        "-framework Accelerate"
        "-framework Cocoa"
        "-framework CoreFoundation"
        "-framework OpenCL"
    )
endif()
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(SRC_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/TexSyn)
set(TexSynSrc
    ${SRC_ROOT}/COTS.h ${SRC_ROOT}/Camouflage.h ${SRC_ROOT}/Color.cpp 
    ${SRC_ROOT}/Color.h ${SRC_ROOT}/Disk.cpp ${SRC_ROOT}/Disk.h
    ${SRC_ROOT}/GP.h ${SRC_ROOT}/GUI.h ${SRC_ROOT}/main.cpp
    ${SRC_ROOT}/Operators.cpp ${SRC_ROOT}/Operators.h 
    ${SRC_ROOT}/TexSyn.h ${SRC_ROOT}/Texture.cpp ${SRC_ROOT}/Texture.h 
    ${SRC_ROOT}/TwoPointTransform.h ${SRC_ROOT}/UnitTests.cpp ${SRC_ROOT}/UnitTests.h
    ${SRC_ROOT}/Utilities.cpp ${SRC_ROOT}/Utilities.h 
    ${SRC_ROOT}/Vec2.cpp ${SRC_ROOT}/Vec2.h
    )
add_executable(TexSyn ${TexSynSrc})
set_property(TARGET TexSyn PROPERTY
             MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Release>:Release>")
target_link_libraries(TexSyn ${OPENCV_LIBS} ${SYSTEM_LIBS})
target_include_directories(TexSyn PRIVATE 
    "${SRC_ROOT}"
    "${OPENCV_INSTALL_DIR}/include/opencv4")
install(TARGETS TexSyn RUNTIME DESTINATION bin)

