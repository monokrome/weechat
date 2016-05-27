FROM alpine


RUN apk update
RUN apk upgrade


RUN apk add alpine-sdk
RUN apk add cmake
RUN apk add libgcrypt-dev
RUN apk add zlib-dev
RUN apk add curl-dev
RUN apk add ncurses-libs

RUN apk add libintl
RUN apk add gettext-dev                  # For internationalization
RUN apk add gnutls-dev ca-certificates   # For SSL support
RUN apk add aspell                       # For spell checking
RUN apk add asciidoctor                  # For documentation

RUN apk add python-dev
RUN apk add python3-dev
RUN apk add ruby-dev
RUN apk add perl-dev
RUN apk add lua-dev
RUN apk add tcl-dev
RUN apk add guile-dev


# RUN apk add v8-dev  # Package currently only available in testing:
# https://pkgs.alpinelinux.org/package/edge/testing/x86/v8


ADD . /opt/weechat
WORKDIR /opt/weechat


RUN cmake . -DCMAKE_INSTALL_PREFIX=/usr/local/
RUN make all install clean


CMD ['weechat']
