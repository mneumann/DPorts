# Created by: Hon-Yu Lawrence Cheung (cheunghonyu@gmail.com)
# $FreeBSD$

PORTNAME=	rednotebook
PORTVERSION=	1.8.0
PORTREVISION=	1
CATEGORIES=	deskutils python
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	rednotebook
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	cheunghonyu@gmail.com
COMMENT=	Modern journal written in Python

LICENSE=	GPLv2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}yaml>0:${PORTSDIR}/devel/py-yaml \
		${PYTHON_PKGNAMEPREFIX}webkitgtk>0:${PORTSDIR}/www/py-webkitgtk \
		${LOCALBASE}/bin/xdg-open:${PORTSDIR}/devel/xdg-utils \
		${PYTHON_PKGNAMEPREFIX}chardet>0:${PORTSDIR}/textproc/py-chardet

USES=		desktop-file-utils gettext python:2

INSTALLS_ICONS=	yes
USE_GNOME=	pygtk2
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
