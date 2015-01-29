# Created by: Jyun-Yan You <jyyou@cs.nctu.edu.tw>
# DragonFly port: Michael Neumann <mneumann@ntecs.de>

PORTNAME=	rust-devel
PORTVERSION=	0.13.0.20141217
CATEGORIES=	lang
MASTER_SITES=	http://www.ntecs.de/downloads/rust/:bootstrap \
		http://github.com/mneumann/rust/archive/:rust \
		http://github.com/rust-lang/:rustlang

EXTRACT_SUFX=	.tar.gz
DIST_SUBDIR=	${PORTNAME}

RUST_SOURCE_COMMIT=	b49fc5221d2a7f848a0d4ef41db29c626b689e86
RUST_SOURCE=	${RUST_SOURCE_COMMIT}${EXTRACT_SUFX}
RUST_BOOT=	rust-stage0-${RUST_BOOT_SIG}.tar.bz2
RUST_BOOT_SIG=	2014-12-16-e77c54a-dragonfly-x86_64-2aea0362442839c64bc583cd559b07807cd7d5ce

LLVM_TAG=rust-llvm-2014-10-17
JEMALLOC_TAG=rust-2014-11-01-do-not-delete
HOEDOWN_TAG=rust-2014-09-20-do-not-delete
COMPILER_RT_TAG=rust-2014-06-18-do-not-delete

WRKSRC=		${WRKDIR}/rust-${RUST_SOURCE_COMMIT}

DISTFILES=	${RUST_BOOT}:bootstrap \
		${RUST_SOURCE}:rust \
		llvm/archive/${LLVM_TAG}${EXTRACT_SUFX}:rustlang        \
		compiler-rt/archive/${COMPILER_RT_TAG}${EXTRACT_SUFX}:rustlang \
		hoedown/archive/${HOEDOWN_TAG}${EXTRACT_SUFX}:rustlang     \
		jemalloc/archive/${JEMALLOC_TAG}${EXTRACT_SUFX}:rustlang

EXTRACT_ONLY=${RUST_SOURCE}

MAINTAINER=	mneumann@ntecs.de
COMMENT=	Language with a focus on memory safety and concurrency

LICENSE=	APACHE20 \
		MIT
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE-APACHE \
		${WRKSRC}/LICENSE-MIT

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_REASON=	requires prebuilt bootstrap compiler

USES=		gmake perl5 python:2
HAS_CONFIGURE=	yes
#CONFIGURE_ARGS=	--disable-valgrind --disable-docs --mandir=${MANPREFIX}/man
#USE_LDCONFIG=	yes
USE_PERL5=	build
#MAKE_ARGS=	ARCH=x86_64
MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.pre.mk>

post-extract:
	@${MKDIR} ${WRKSRC}/dl
	${LN} -sf ${DISTDIR}/${DIST_SUBDIR}/${RUST_BOOT} ${WRKSRC}/dl
	${TAR} --strip-components 1 -xvz -C ${WRKSRC}/src/llvm -f ${DISTDIR}/${DIST_SUBDIR}/llvm/archive/${LLVM_TAG}${EXTRACT_SUFX}
	${TAR} --strip-components 1 -xvz -C ${WRKSRC}/src/compiler-rt -f ${DISTDIR}/${DIST_SUBDIR}/compiler-rt/archive/${COMPILER_RT_TAG}${EXTRACT_SUFX}
	${TAR} --strip-components 1 -xvz -C ${WRKSRC}/src/rt/hoedown -f ${DISTDIR}/${DIST_SUBDIR}/hoedown/archive/${HOEDOWN_TAG}${EXTRACT_SUFX}
	${TAR} --strip-components 1 -xvz -C ${WRKSRC}/src/jemalloc -f ${DISTDIR}/${DIST_SUBDIR}/jemalloc/archive/${JEMALLOC_TAG}${EXTRACT_SUFX}

.include <bsd.port.post.mk>
