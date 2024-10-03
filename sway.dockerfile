FROM debian:bookworm

COPY setup.sh /
RUN /setup.sh

RUN mkdir -p /build/deb

COPY backport.sh /
RUN /backport.sh libliftoff
RUN /backport.sh dpkg \(dpkg-dev\|libdpkg\)
RUN apt install -y --no-install-recommends -t bookworm-backports libwayland-dev wayland-protocols libdrm-dev
RUN /backport.sh libva \(libva-drm2\|libva-wayland2\|libva-x11-2\|libva2\)
RUN /backport.sh wlroots libwlroots experimental
RUN /backport.sh libinput libinput
RUN /backport.sh sway sway experimental

CMD ["/usr/bin/bash"]
