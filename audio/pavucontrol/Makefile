# Created by: Romain Tartière <romain@blogreen.org>
# $FreeBSD$

PORTNAME=	pavucontrol
PORTVERSION=	2.0
CATEGORIES=	audio
MASTER_SITES=	http://freedesktop.org/software/pulseaudio/${PORTNAME}/

MAINTAINER=	romain@FreeBSD.org
COMMENT=	GTK mixer for PulseAudio

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libpulse.so:${PORTSDIR}/audio/pulseaudio

GNU_CONFIGURE=	yes
USES=		gmake pkgconfig gettext tar:xz
USE_GNOME=	glibmm intltool libsigc++20

OPTIONS_SUB=	yes
OPTIONS_SINGLE=	GTK
OPTIONS_SINGLE_GTK=	GTK2 GTK3
OPTIONS_DEFAULT=	GTK2

CONFIGURE_ARGS=	--disable-lynx

GTK2_USE=	GNOME=gtkmm24
GTK2_LIB_DEPENDS=	libcanberra.so:${PORTSDIR}/audio/libcanberra
GTK2_CONFIGURE_ON=	--disable-gtk3

GTK3_USE=	GNOME=gtkmm30
GTK3_LIB_DEPENDS=	libcanberra-gtk3.so:${PORTSDIR}/audio/libcanberra-gtk3

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MGTK2}
EXTRA_PATCHES=	${FILESDIR}/extra-patch-support-gtkmm-24.patch
.endif

.if ${PORT_OPTIONS:MGTK3}
EXTRA_PATCHES=	${FILESDIR}/extra-patch-support-gtkmm-30.patch \
	${FILESDIR}/extra-patch-src_pavucontrol.glade
.endif

post-patch:
# Install locales files in right place
	${REINPLACE_CMD} -e 's|[$$][(]DATADIRNAME[)]|share|' \
		${WRKSRC}/po/Makefile.in.in

.include <bsd.port.mk>
