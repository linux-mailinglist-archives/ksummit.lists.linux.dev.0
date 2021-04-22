Return-Path: <ksummit+bounces-59-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C093D368069
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DB5AF1C490F
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12032FA0;
	Thu, 22 Apr 2021 12:26:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84DF2F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:26:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B204061164;
	Thu, 22 Apr 2021 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619094392;
	bh=iPpa0tuydaOc/D91m68w6XYbIBWUmZO4JLUn7y6ZB9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VtP2K/tObBvI0aIv+TbniplK5PcDzvnMu2CZonDi+cY23pfbpgWI1Milo3fFkA3nI
	 uCH3b7cZ9avNqHF8zl580ggUZ5zl65btWj2lX6Aq0lmssGRVwt3xv9wzjIn6aBG5Aq
	 WyccZqWe/CFow/oK+a96SM/8MJ3hW+yCTTWj8ALHpk4Sf0+N2Zz62frJ9UOF5qhUU1
	 UnkP7UT9fPsv41Evxe1ipoaF3YBRqMiDGr3nnpGsjccdQUfCisIULmv/LNIHCcpRI5
	 kH6kLq/5TAXh1V9A6Jfl2aR8XKm1YElVRIL22JE49bHnUascoNmpJh6RmLvuhb+ugu
	 kufu/7VAAVI6A==
Date: Thu, 22 Apr 2021 13:26:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Morris <jmorris@namei.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Roland Dreier <roland@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422122604.GC4572@sirena.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local>
 <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
 <d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
 <CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
 <20210422115511.60d1f735@coco.lan>
 <YIFlo6TSE1n6tD6K@unreal>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline
In-Reply-To: <YIFlo6TSE1n6tD6K@unreal>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
User-Agent: Mutt/1.10.1 (2018-07-13)


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 03:01:39PM +0300, Leon Romanovsky wrote:
> On Thu, Apr 22, 2021 at 11:55:11AM +0200, Mauro Carvalho Chehab wrote:

> > The reverted ones for media (29 patches) didn't contain any malicious code.
> > One was useless (because the media core already fixes the pointed issue),
> > but the other ones were valid patches.

> And didn't you ask yourself after seeing same 29 patches that the
> correct fix should be in another place? pm_runtime_get_sync?

The runtime PM APIs are for legitimate reasons really fiddly to get
right - there's a bunch of different ways to do things and disabling
runtime PM in Kconfig can cause surprises.  It's been identified as an
issue for years but it's really not trivial to address it at the API
level.

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCBa1sACgkQJNaLcl1U
h9AOZQf9EhpnaxYyBdhIHvgkB+U9cBSNx9f9cSc7aDYsTPQExxHJ6HI9YLbhRFf4
PjLOxmIqg12P0Ch5sP4rO4lIN0yt31S8GJtU+s0FGHbDKG9AscgvWbYEnaRfXDjR
lhNCvBGM15YEVTSo3x6M4zz0+F4XRIpLF4VE8ZMd2PGd1fhSHNEydO5eI6nloCVI
U2dHVdhaxE36K9JmljsgNwYVcNe5+27yGuNVn8QXoi3azHRBECluPSs+z9FrYIYL
m4+9mJ1s0XS6+W7qEpM0CibyrOwcjF/TjVoCJQtzSe5s99RoO8BAs1uhwk50YHj4
Y405tmeesvCUvxnHlkI1d9kT8lsSmA==
=f0To
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--

