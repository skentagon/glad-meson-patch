FROM python:3.11

RUN pip install meson ninja


WORKDIR /test

RUN wget https://github.com/Dav1dde/glad/archive/refs/tags/v2.0.6.tar.gz \
  && tar -xzvf v2.0.6.tar.gz

COPY [ \
  "./generate.sh", \
  "./meson_options.txt", \
  "./meson.build", \
  "./glad-2.0.6/"]

# TODO: add c++ code and compile

# default option
RUN cd glad-2.0.6 \
  && meson setup build \
  && cd build \
  && ninja

RUN test -e glad-2.0.6/glad.build/include/glad/gl.h
RUN test -e glad-2.0.6/build/libglad-lib.a


RUN cd glad-2.0.6 \
  && rm -rf build \
  && meson setup build -Dheader_only=true \
  && cd build \
  && ninja

# RUN ls -la glad-2.0.6/build
RUN test -e glad-2.0.6/glad.build/include/glad/gl.h
RUN test ! -e glad-2.0.6/build/libglad-lib.a
