# Created by: Mike Krutov <neko@takino.org>
# $FreeBSD$

PORTNAME=	zathura-pdf-poppler
PORTVERSION=	0.2.5
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://pwmt.org/projects/zathura/plugins/download/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Poppler render PDF plugin for Zathura PDF viewer

LIB_DEPENDS=	libpoppler-glib.so:${PORTSDIR}/graphics/poppler-glib
BUILD_DEPENDS=	zathura:${PORTSDIR}/graphics/zathura
RUN_DEPENDS=	zathura:${PORTSDIR}/graphics/zathura

USE_GNOME=	glib20 gtk30
USES=		desktop-file-utils gmake pkgconfig

CONFLICTS=	zathura-pdf-mupdf-[0-9]*

PLIST_FILES=	lib/zathura/pdf.so \
		share/applications/zathura-pdf-poppler.desktop

.include <bsd.port.mk>
