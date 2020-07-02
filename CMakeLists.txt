cmake_minimum_required(VERSION 3.5)
project(h2rpc)

set(CMAKE_CXX_STANDARD 14)

include(h2rpc-third-party-prefix.cmake)

add_executable(h2rpc main.cpp)
target_include_directories(h2rpc PRIVATE $(H2RPC_THIRD_PARTY_PREFIX)/include)
target_link_directories(h2rpc PUBLIC $(H2RPC_THIRD_PARTY_PREFIX)/lib)
target_link_libraries(h2rpc nghttp2_asio)