# Created by: Jose Alonso Cardenas Marquez <acardenas@bsd.org.pe>
# $FreeBSD$

PORTNAME=	File-DesktopEntry
PORTVERSION=	0.05
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	acm@FreeBSD.org
COMMENT=	Object to handle desktop files

BUILD_DEPENDS=	p5-PathTools>=0:${PORTSDIR}/devel/p5-PathTools \
		p5-File-BaseDir>=0.03:${PORTSDIR}/devel/p5-File-BaseDir
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
