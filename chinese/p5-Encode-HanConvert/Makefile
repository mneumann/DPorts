# Created by: Shen Chuan-Hsing <statue@freebsd.sinica.edu.tw>
# $FreeBSD$

PORTNAME=	Encode-HanConvert
PORTVERSION=	0.35
PORTREVISION=	1
CATEGORIES=	chinese perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Traditional and Simplified Chinese mappings

USES=		perl5
USE_PERL5=	configure

regression-test:
	cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.mk>
