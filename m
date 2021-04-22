Return-Path: <ksummit+bounces-69-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72439368169
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5E6C13E5E19
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B572FA7;
	Thu, 22 Apr 2021 13:24:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F882FA4
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:24:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E49806143B;
	Thu, 22 Apr 2021 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619097847;
	bh=ST09M5/IeLSyYIlyP8NsRuiOj2/o8WaBqQDQ/weJzYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1tGD8as1XDEL0SxdTgYnuzaCBaQS2AqW84M1m43mDIhtWqp9T8YOLhao47/CluYk
	 j/soFCdPadh0VwHuJ/su+ep9Bpa5Ko3s98Klsw+u8kNUn+/Zg0JsZ1l+a5lQIVFwoz
	 3/iSjr3wmdfYwBEwRsYhK5WrAtbw1g/K1nysNAPCuehJYLyqswMijMPoABQ+C5mnrx
	 ls/Z1wUnInkcv0rSKza+t2lTjXc+ZrbubdQxjG62W+waYy4amwRwxJQ50vOJ7vmVly
	 RXngt9FP0A6APqPue1fbIkuIkgXt36lZMVtRCojlVpgCDkOnNF+oJH/ZQUu/1o/gQD
	 qMRLBBqr823Bg==
Date: Thu, 22 Apr 2021 14:23:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422132339.GF4572@sirena.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IvGM3kKqwtniy32b"
Content-Disposition: inline
In-Reply-To: <YIFx/iorjncjslob@linux.ibm.com>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
User-Agent: Mutt/1.10.1 (2018-07-13)


--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 03:54:22PM +0300, Mike Rapoport wrote:
> On Thu, Apr 22, 2021 at 01:40:23PM +0100, Mark Brown wrote:

> > The flip side of copying everyone on everything is that especially for
> > serieses which aren't just repetitive changes this gets really noisy
> > really quickly and things end up just not getting read.

> I think this is quite subjective and different people have different email
> flows.

Well, it also depends a lot on why the series is going to lots of people
- the MFD/new SoC case is very different to the adding and using a new
API case for example.

> For me the most annoying is to get several patches from the middle of a
> series. IMHO, sending at least cover letter to everyone is the bare minimum
> so that people at least can take a look at high level details and request a
> repost.

Yes, the cover letter should always go to everyone.

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCBeNoACgkQJNaLcl1U
h9A9UQf8Ch0AlsYxmBarB71WenBwOTYw8Iz7eGCXdFBjlUHBJr5+s8kwdvb7hCf3
91tvMbCdU6bfoSQ/igdoeeL2KOi0GEynaaVLl3nCysn1xBB9FWR1HZaIqAm3b2pm
dKuQzF1nSDud1MBkD88SCi3CvuTq8KlRq/bCRo5Tvsxu8ln3q1HlUICUiTRm05aD
ZHQCAGSnCSFbJXz0KLSHe4Vj6cW3Fw4A2Yv9JlsRacTm7POQO3tjTSwFbYat+Fuv
qFLOHIPKPEnxCmcoHjb4eRufb9HpZ5atoqtvo3EnXRF/zR4BXQ9CiD2/w3wMPCFg
92Zv58iHVUoT03zF21t6tlhAjNV1Gg==
=HiHV
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--

