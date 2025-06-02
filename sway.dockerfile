FROM debian:trixie

COPY setup.sh /
RUN /setup.sh

RUN mkdir -p /build/deb

COPY backport.sh /
RUN /backport.sh wlroots libwlroots experimental
RUN /backport.sh sway sway experimental

CMD ["/usr/bin/bash"]
