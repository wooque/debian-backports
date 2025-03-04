FROM rust:1.85

RUN git clone https://github.com/Linus789/wl-clip-persist
RUN cd /wl-clip-persist && cargo build --release
RUN mkdir -p /build/deb && cp /wl-clip-persist/target/release/wl-clip-persist /build/deb

CMD ["/usr/bin/bash"]
