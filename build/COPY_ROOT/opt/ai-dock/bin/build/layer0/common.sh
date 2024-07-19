#!/bin/false

source /opt/ai-dock/etc/environment.sh

build_common_main() {
    add-apt-repository multiverse
    apt-get update
    build_common_install_xorg
    build_common_install_virtualgl
    build_common_install_kde
    build_common_install_packages
    build_common_install_selkies
    build_common_install_kasmvnc
    build_common_install_coturn
}

function build_common_install_xorg() {
    # Minimal xorg installation
    $APT_INSTALL \
        alsa-base \
        alsa-utils \
        clinfo \
        cups-browsed \
        cups-bsd \
        cups-common \
        cups-filters \
        cups-pdf \
        dbus-user-session \
        dbus-x11 \
        fonts-dejavu \
        fonts-freefont-ttf \
        fonts-hack \
        fonts-liberation \
        fonts-noto \
        fonts-noto-cjk \
        fonts-noto-cjk-extra \
        fonts-noto-color-emoji \
        fonts-noto-extra \
        fonts-noto-hinted \
        fonts-noto-mono \
        fonts-noto-unhinted \
        fonts-opensymbol \
        fonts-symbola \
        fonts-ubuntu \
        im-config \
        lame \
        libavcodec-extra \
        libdatetime-perl \
        libdbus-c++-1-0v5 \
        libegl1 \
        libegl1:i386 \
        libelf-dev \
        libgles2 \
        libgles2:i386 \
        libgl1 \
        libgl1:i386 \
        libglu1 \
        libglu1:i386 \
        libglvnd0 \
        libglvnd0:i386 \
        libopenjp2-7 \
        libopus0 \
        libpulse0 \
        libsm6 \
        libsm6:i386 \
        libva2 \
        libva2:i386 \
        libvulkan-dev \
        libvulkan-dev:i386 \
        libxcb1 \
        libxcb1:i386 \
        libxau6 \
        libxau6:i386 \
        libx11-6 \
        libx11-6:i386 \
        libxext6 \
        libxext6:i386 \
        libxkbcommon0 \
        libxrandr-dev \
        libxdmcp6 \
        libxdmcp6:i386 \
        libxv1 \
        libxv1:i386 \
        libxvmc1 \
        libxtst6 \
        libxtst6:i386 \
        mesa-utils \
        mesa-utils-extra \
        mesa-vulkan-drivers \
        mesa-vulkan-drivers:i386 \
        net-tools \
        ocl-icd-libopencl1 \
        packagekit-tools \
        pulseaudio \
        python3 \
        python3-cups \
        ubuntu-drivers-common \
        vainfo \
        va-driver-all \
        va-driver-all:i386 \
        vdpau-driver-all \
        vdpau-driver-all:i386 \
        vdpauinfo \
        vulkan-tools \
        whoopsie \
        wmctrl \
        x11-apps \
        x11-utils \
        x11-xkb-utils \
        x11-xserver-utils \
        x264 \
        xauth \
        xbitmaps \
        xclip \
        xcvt \
        cups-bsd \
        xdg-user-dirs \
        xdg-utils \
        xfonts-base \
        xfonts-scalable \
        xinit \
        xkb-data \
        xsettingsd \
        xserver-xorg-input-all \
        xserver-xorg-input-wacom \
        xserver-xorg-video-all \
        xserver-xorg-video-qxl \
        xorg \
        xvfb
}

function build_common_install_virtualgl() {
    # cd /tmp
    # wget "https://github.com/VirtualGL/virtualgl/releases/download/${VIRTUALGL_VERSION}/virtualgl_${VIRTUALGL_VERSION}_amd64.deb"
    # wget "https://github.com/VirtualGL/virtualgl/releases/download/${VIRTUALGL_VERSION}/virtualgl32_${VIRTUALGL_VERSION}_amd64.deb"
    
    # $APT_INSTALL \
    #     /tmp/virtualgl_${VIRTUALGL_VERSION}_amd64.deb \
    #     /tmp/virtualgl32_${VIRTUALGL_VERSION}_amd64.deb
    
    $APT_INSTALL abiword gnupg apt-transport-https wget software-properties-common ratpoison novnc websockify libxv1 libglu1-mesa xauth x11-utils xorg tightvncserver 
	cd /tmp
    wget -q -O- https://packagecloud.io/dcommander/virtualgl/gpgkey | gpg --dearmor >/etc/apt/trusted.gpg.d/VirtualGL.gpg 
    wget  https://raw.githubusercontent.com/VirtualGL/repo/main/VirtualGL.list
    mv VirtualGL.list  /etc/apt/sources.list.d/VirtualGL.list
	apt-get update 
	$APT_INSTALL virtualgl virtualgl32 
    
    chmod u+s /usr/lib/libvglfaker.so
    chmod u+s /usr/lib/libdlfaker.so
    chmod u+s /usr/lib32/libvglfaker.so
    chmod u+s /usr/lib32/libdlfaker.so
    chmod u+s /usr/lib/i386-linux-gnu/libvglfaker.so
    chmod u+s /usr/lib/i386-linux-gnu/libdlfaker.so
}

function build_common_install_kasmvnc() {
    cd /tmp
    wget https://github.com/kasmtech/KasmVNC/releases/download/v${KASMVNC_VERSION}/kasmvncserver_jammy_${KASMVNC_VERSION}_amd64.deb
    $APT_INSTALL \
        /tmp/kasmvncserver_jammy_${KASMVNC_VERSION}_amd64.deb
}

function build_common_install_kde() {
    # Essentials for KDE to start without issues
    $APT_INSTALL \
        kde-plasma-desktop \
        adwaita-icon-theme-full \
        appmenu-gtk3-module \
        ark \
        aspell \
        aspell-en \
        breeze \
        breeze-cursor-theme \
        breeze-gtk-theme \
        breeze-icon-theme \
        debconf-kde-helper \
        desktop-file-utils \
        dolphin \
        dolphin-plugins \
        dbus-x11 \
        enchant-2 \
        fcitx \
        fcitx-frontend-gtk2 \
        fcitx-frontend-gtk3 \
        fcitx-frontend-qt5 \
        fcitx-module-dbus \
        fcitx-module-kimpanel \
        fcitx-module-lua \
        fcitx-module-x11 \
        fcitx-tools \
        fcitx-hangul \
        fcitx-libpinyin \
        fcitx-m17n \
        fcitx-mozc \
        fcitx-sayura \
        fcitx-unikey \
        filelight \
        frameworkintegration \
        gwenview \
        haveged \
        hunspell \
        im-config \
        kate \
        kcalc \
        kcharselect \
        kdeadmin \
        kde-config-fcitx \
        kde-config-gtk-style \
        kde-config-gtk-style-preview \
        kdeconnect \
        kdegraphics-thumbnailers \
        kde-spectacle \
        kdf \
        kdialog \
        kget \
        kimageformat-plugins \
        kinfocenter \
        kio \
        kio-extras \
        kmag \
        kmenuedit \
        kmix \
        kmousetool \
        kmouth \
        ksshaskpass \
        ktimer \
        kwayland-integration \
        kwin-addons \
        kwin-x11 \
        libdbusmenu-glib4 \
        libdbusmenu-gtk3-4 \
        libgail-common \
        libgdk-pixbuf2.0-bin \
        libgtk2.0-bin \
        libgtk-3-bin \
        libkf5baloowidgets-bin \
        libkf5dbusaddons-bin \
        libkf5iconthemes-bin \
        libkf5kdelibs4support5-bin \
        libkf5khtml-bin \
        libkf5parts-plugins \
        libqt5multimedia5-plugins \
        librsvg2-common \
        media-player-info \
        okular \
        okular-extra-backends \
        partitionmanager \
        plasma-browser-integration \
        plasma-calendar-addons \
        plasma-dataengines-addons \
        plasma-discover \
        plasma-integration \
        plasma-runners-addons \
        plasma-widgets-addons \
        policykit-desktop-privileges \
        polkit-kde-agent-1 \
        print-manager \
        qapt-deb-installer \
        qml-module-org-kde-runnermodel \
        qml-module-org-kde-qqc2desktopstyle \
        qml-module-qtgraphicaleffects \
        qml-module-qtquick-xmllistmodel \
        qt5-gtk-platformtheme \
        qt5-image-formats-plugins \
        qt5-style-plugins \
        qtspeech5-flite-plugin \
        qtvirtualkeyboard-plugin \
        software-properties-qt \
        sonnet-plugins \
        sweeper \
        systemsettings \
        ubuntu-drivers-common \
        xdg-desktop-portal-kde \
        xdg-user-dirs \
        pavucontrol-qt
    
    # Fix KDE startup permissions issues in containers
    #cp -f /usr/lib/x86_64-linux-gnu/libexec/kf5/start_kdeinit /tmp/
    #rm -f /usr/lib/x86_64-linux-gnu/libexec/kf5/start_kdeinit
    #cp -r /tmp/start_kdeinit /usr/lib/x86_64-linux-gnu/libexec/kf5/start_kdeinit
    #rm -f /tmp/start_kdeinit
}

function build_common_install_packages() {
    mkdir -pm755 /etc/apt/trusted.gpg.d && curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x0AB215679C571D1C8325275B9BDB3D89CE49EC21" | gpg --dearmor -o /etc/apt/trusted.gpg.d/mozillateam-ubuntu-ppa.gpg && \
    mkdir -pm755 /etc/apt/sources.list.d && echo "deb https://ppa.launchpadcontent.net/mozillateam/ppa/ubuntu $(grep UBUNTU_CODENAME= /etc/os-release | cut -d= -f2 | tr -d '\"') main" > "/etc/apt/sources.list.d/mozillateam-ubuntu-ppa-$(grep UBUNTU_CODENAME= /etc/os-release | cut -d= -f2 | tr -d '\"').list" && \
    apt-get update

    $APT_INSTALL \
        firefox \
        vlc \
        vlc-l10n \
        vlc-plugin-access-extra \
        vlc-plugin-notify \
        vlc-plugin-samba \
        vlc-plugin-skins2 \
        vlc-plugin-video-splitter \
        vlc-plugin-visualization

        update-alternatives --set x-www-browser /usr/bin/firefox
}

function build_common_install_selkies() {
    # Install latest Selkies-GStreamer (https://github.com/selkies-project/selkies-gstreamer) build, Python application, and web application, should be consistent with selkies-gstreamer documentation
    $APT_INSTALL \
        python3-pip \
        python3-dev \
        python3-gi \
        python3-setuptools \
        python3-wheel \
        libgl-dev \
        libgles-dev \
        libglvnd-dev \
        libgudev-1.0-0 \
        wayland-protocols \
        libwayland-dev \
        libsrtp2-1 \
        libwebrtc-audio-processing1 \
        libcairo-gobject2 \
        libpangocairo-1.0-0 \
        libgirepository-1.0-1 \
        libjpeg-dev \
        libwebp-dev \
        libvpx-dev \
        zlib1g-dev \
        i965-va-driver-shaders \
        intel-media-va-driver-non-free \
        intel-gpu-tools \
        radeontop \
        gdebi-core \
        libgdk-pixbuf-xlib-2.0-0 \
        libgdk-pixbuf2.0-0 \
        libsoup-gnome2.4-1 \
        libxdo3 \
        python3-chardet \
        python3-debian \
        xdotool \
        

    


    if [[ -z $SELKIES_VERSION || ${SELKIES_VERSION,,} == 'latest' ]]; then
        SELKIES_VERSION="$(curl -fsSL "https://api.github.com/repos/selkies-project/selkies-gstreamer/releases/latest" \
            | jq -r '.tag_name' | sed 's/[^0-9\.\-]*//g')"
    fi


    cd /opt
    version_id=$(grep -oP 'VERSION_ID="\K[^"]+' /etc/os-release)
    curl -L "https://github.com/selkies-project/selkies-gstreamer/releases/download/v${SELKIES_VERSION}/gstreamer-selkies_gpl_v${SELKIES_VERSION}_ubuntu${version_id}_amd64.tar.gz" | tar -zxf -
    
    cd /tmp
    curl -L -O "https://github.com/selkies-project/selkies-gstreamer/releases/download/v${SELKIES_VERSION}/selkies_gstreamer-${SELKIES_VERSION}-py3-none-any.whl"
    python3 -m venv "$VENV_DIR/selkies"
    "$VENV_DIR/selkies/bin/pip" install "selkies_gstreamer-${SELKIES_VERSION}-py3-none-any.whl"

    cd /opt
    curl -fsSL "https://github.com/selkies-project/selkies-gstreamer/releases/download/v${SELKIES_VERSION}/selkies-gstreamer-web_v${SELKIES_VERSION}.tar.gz" | tar -zxf -
    
    cd /tmp
    wget -rvO selkies-js-interposer.deb "https://github.com/selkies-project/selkies-gstreamer/releases/download/v${SELKIES_VERSION}/selkies-js-interposer_v${SELKIES_VERSION}_ubuntu${version_id}_amd64.deb"
    $APT_INSTALL ./selkies-js-interposer.deb

}

function build_common_install_coturn() {
    $APT_INSTALL coturn
}

build_common_main "$@"
