# $FreeBSD$

PORTNAME=	Test-File-ShareDir
PORTVERSION=	1.000005
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	Test
PKGNAMEPREFIX=	p5-

MAINTAINER=	lth@FreeBSD.org
COMMENT=	Create a fake ShareDir for your modules for testing

BUILD_DEPENDS=	p5-Class-Tiny>0:${PORTSDIR}/devel/p5-Class-Tiny \
		p5-File-Copy-Recursive>0:${PORTSDIR}/devel/p5-File-Copy-Recursive \
		p5-File-ShareDir>=1.00:${PORTSDIR}/devel/p5-File-ShareDir \
		p5-Path-Tiny>=0.018:${PORTSDIR}/devel/p5-Path-Tiny
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Fatal>0:${PORTSDIR}/devel/p5-Test-Fatal

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
