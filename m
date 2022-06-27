Return-Path: <ksummit+bounces-731-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E612755BB20
	for <lists@lfdr.de>; Mon, 27 Jun 2022 18:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 2778E2E0C9C
	for <lists@lfdr.de>; Mon, 27 Jun 2022 16:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC5E33FE;
	Mon, 27 Jun 2022 16:27:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3908D33E4
	for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 16:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27786C3411D;
	Mon, 27 Jun 2022 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656347252;
	bh=gN+9JygFyvAalV67q62AWxWFDh4thuxWG8GMNiMDYXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LbrGvt3WaB2jVUQ/0X1hvMw5LBioi7gjfpz+l3Ey92lrWOOUAyTGf7O1LuHY6jqZu
	 W9wS5bfFvNwc+NFVI8zqvJrQuJD8nChKKE6jcfhgFezr3N1YoRFp6jWDvP0ALxmqJM
	 e+0jL2NlgWj+ZUK8vZNxgWQuz4vQ6M+b+yWUJksCUt9T7gIapoUz8sbvRKiDhSC/YF
	 haD5YNjhcqQK7ZVVlzHGO5WJSl4NWyyTMSGwRSethWu9b+c5cP3UO+qnTFkFAYT/9i
	 ZZ8pc8NPjgHyIMjsNn1n3l0g4HOXYeS90rKIGWrdd/NcKGWZpBLrWXrlwO5vqBxdPF
	 4XkrMmoiHeUVA==
Date: Mon, 27 Jun 2022 17:27:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Howlett <liam.howlett@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jani Nikula <jani.nikula@intel.com>,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
Message-ID: <YrnabzwutRGIooCS@sirena.org.uk>
References: <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net>
 <20220624083307.159824bd@sal.lan>
 <87tu891xfv.fsf@meer.lwn.net>
 <20220625101029.67f14c4c@sal.lan>
 <87czew267z.fsf@meer.lwn.net>
 <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
 <20220626085524.42ee92c0@sal.lan>
 <20220626105306.122cdeda@sal.lan>
 <20220627152832.yigreu5ztnoxfp4g@revolver>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Azj2mL/uhQVuq5UT"
Content-Disposition: inline
In-Reply-To: <20220627152832.yigreu5ztnoxfp4g@revolver>
X-Cookie: Your supervisor is thinking about you.


--Azj2mL/uhQVuq5UT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 03:28:40PM +0000, Liam Howlett wrote:
> * Mauro Carvalho Chehab <mchehab@kernel.org> [220626 05:53]:

> > Btw, once we fix the errors from the above checks, one of the things th=
at=20
> > could be done in order to avoid noisy doc builds would be to run this=
=20
> > during normal Kernel build, if CONFIG_WERROR is set (and if .git is pre=
sent
> > at the source build dir):

> > 	./scripts/documentation-file-ref-check --warn
> > 	./scripts/get_abi.pl validate
> > 	./scripts/kernel-doc --none $(git grep kernel-doc $(git ls-files Docum=
entation/|grep -v kernel-doc.rst)|perl -ne 'print "$1\n" if (m/kernel-doc::=
\s*(\S+)/);'|sort|uniq)=20

That last one is quite the command line...

> > aborting the build on such warnings.

> > On my notebook (i5-10210U), the above takes ~8 seconds to run. So, it=
=20
> > won't make much difference at the build time, and doing that would have
> > avoided ~100 warnings during htmldocs build against current linux-next.

> Couldn't we add this to the build bots and ask the authors to fix the
> commits?

There's reports for at least some of this for -next already, at least
for newly introduced warnings.  If we could get 0day or something else
that picks stuff off the lists that would help a lot I think, as would
getting it into the bots that people who like to fix up warnings tend to
be using.

--Azj2mL/uhQVuq5UT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK52m8ACgkQJNaLcl1U
h9CK7wf+KaHvVNv03zatffGoulsLo7Obk5R0PCtYKx04iTuYTM4aLapE5yBSvatt
TNpMVGRgNdonEPFSdnRJLUZAfmMXWhXbQ7o1+7gdgthEbqHoWDrfXGMdYeyhhEvD
5s2bhmw4e7Ii4bra4+2POz+5KjWg+0nIn3i/dtw68EwXwdciZV2cKeOsKXKGseU7
Q9FT3Jr7mg427ivnO3Ym1lVeAfl8p86n8+HRoeEJDBVd5GrhtSmQqnHKUs/ZFIOU
yYQCJ+E79Y956xz06h/UOllr5K+Uwxx3P8bAaFFxSzPmU/DHdv/VHqKpwYvhnk+G
OWltUVB+y2Tn2a2Ro5Wl9N2so2mPfw==
=+s1C
-----END PGP SIGNATURE-----

--Azj2mL/uhQVuq5UT--

