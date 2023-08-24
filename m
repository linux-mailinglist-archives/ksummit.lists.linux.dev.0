Return-Path: <ksummit+bounces-1061-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D078766B
	for <lists@lfdr.de>; Thu, 24 Aug 2023 19:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4C94281628
	for <lists@lfdr.de>; Thu, 24 Aug 2023 17:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF99114A82;
	Thu, 24 Aug 2023 17:12:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84533288EB
	for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 17:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4442C433C8;
	Thu, 24 Aug 2023 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692897151;
	bh=VUGckIKKW7EuqYr2XaeqDpxPiqVIWyQRrEi92D3vQS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPLXUwSh5q3fycpZ4UnCUL2Lkd+zIvePFr9ERSdiQCTCCDqTyozf4S6yTIx8CZD27
	 pNFWxo92iAokynK2be/F6yeYjQ44t1/b0YH+CWWcMNYpDbELCWtLNZXweyfqhilyAK
	 KuVw71ATVUMAJ9onc2XbGdxm3joasedQInUbdBq9cZxSnuiWVJhDoeskCst2+MZVSi
	 HKlulVb2YERlGBKk3foijvIbC5YcPRbBgPFqoB1b7MhWZxwCWHzkaNAmXVRqWIhAU5
	 LQFr/Y27loOTDaz84a9ztKSy++Nv8SqewgYLjeSKDMuL9+EviJL8O3n5UcPgPxJKFk
	 oOg8zrIwTIjBQ==
Date: Thu, 24 Aug 2023 18:12:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Message-ID: <ZOePd+0Ncywxa5kZ@finisterre.sirena.org.uk>
References: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <2023082250-replace-rectangle-1d47@gregkh>
 <20230822142913.GB14596@pendragon.ideasonboard.com>
 <ZOaofrS7/lErEYB5@nvidia.com>
 <CACRpkdbt-GxDgGbpETJTjBXz6qH2yLFgTR8BVVU9EU1uj7tJ+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hAu0xVq+yYMC4mf/"
Content-Disposition: inline
In-Reply-To: <CACRpkdbt-GxDgGbpETJTjBXz6qH2yLFgTR8BVVU9EU1uj7tJ+Q@mail.gmail.com>
X-Cookie: Give him an evasive answer.


--hAu0xVq+yYMC4mf/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 10:16:31AM +0200, Linus Walleij wrote:

> Since then they come a long way, after a few generations of lost
> hardware that the kernel never supported properly, Android is
> pushing the Generic Kernel Image and being more restrictive about
> proprietary extensions every day. It's going the right way.
> Todd Kjos at Google and Greg Kroah-Hartman from the community
> have been instrumental here.

I do have some concerns about the effects of GKI on framework
improvements, by making it difficult for vendors to update any of the
shared APIs it pushes them into implementing anything they can't get
=66rom the frameworks in their drivers instead.  This means if they're
going to upstream things and do the best job possible they'll end up
working on multiple versions which provides a bunch of stop energy.
Life will be much easier for vendors if they just worry about their
specific devices as much as possible.


--hAu0xVq+yYMC4mf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTnj3YACgkQJNaLcl1U
h9BD2Qf/bdQM1ClVduHHnkrSwf1fFu4ZYhL9m0RttyYYD6lQtr4C2eqj0q18pVEm
MnmALYTNAdqyvaGQBIRNyijvNDWfxGljCstghiCVYSaCx28JJaVDsDsr0C1DXB2L
KMcJ5+QmyYft5Sm13r6do+Oiq0HRReHmYbCY0pO+TZcqD3KMBdC2hwyI9wR6pXs5
WnRfqFqdKhBwS5eyFrVDhQACdU6mYUwPBxUNxgwMWpze07zz7MvpX9fbmNpqxb/N
+j/cm7n0e/LWJlJbTNAKVaToQZAy4ISVFRG8hg9aeMMsnAGKeV9mrOQb2L/JF/yQ
C0EVhP4rOjevWrawGswzVbHik2ynAQ==
=IBNC
-----END PGP SIGNATURE-----

--hAu0xVq+yYMC4mf/--

