# Created by: Timur Bakeyev <bat@cpan.org>
# $FreeBSD$

PORTNAME=	Net-IDN-Nameprep
PORTVERSION=	1.101
PORTREVISION=	1
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	bofh@FreeBSD.org
COMMENT=	Normalization of domain names (Nameprep, RFC 3491)

RUN_DEPENDS=	p5-Unicode-Stringprep>=0:${PORTSDIR}/converters/p5-Unicode-Stringprep
BUILD_DEPENDS:=	${RUN_DEPENDS} \
		p5-Test-NoWarnings>=0:${PORTSDIR}/devel/p5-Test-NoWarnings

USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
