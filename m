Return-Path: <ksummit+bounces-67-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E00368164
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 9EC023E5A10
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09D42FA1;
	Thu, 22 Apr 2021 13:22:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70E62F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:22:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65C3761445;
	Thu, 22 Apr 2021 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619097750;
	bh=BVOSVNXz3rAZ1oFubhO6/+dJu4slIXBF+pKiuUWXqn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWGMKsKiRZHiTYQAoORaoXFrsfYw1TlTdqdE60iyTAGZGWgBiv8aMbZsvcCCywQZj
	 FHdwYDQzeYW2XEro5aFdOipRR7wznBakeZhV55ZrWm6FP+0CHVcZ+0ua+sQB1GDQS/
	 9q9S7lp6Lph2IozQLJ4DDVDDdPn+IKmH7TrewgHW4VoTF07PrG+h+PcjkbQCNoWSaa
	 fEGBKzd/8/CkmU/UdDWWYY5XwLvozDk2bHPpyrdLytUnIaq5GA2qF92TeRf2aNArHJ
	 e8Ka0L23M5dkvkkWKv3cM/zesJ/BSmx29lndjpTd4CGmXR6H2m05Zi1H8eIMZh+hCJ
	 20ZMlffsO+GBw==
Date: Thu, 22 Apr 2021 14:22:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422132202.GE4572@sirena.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <YIFfXTVMDmHwVmSR@unreal>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline
In-Reply-To: <YIFfXTVMDmHwVmSR@unreal>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
User-Agent: Mutt/1.10.1 (2018-07-13)


--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 02:34:53PM +0300, Leon Romanovsky wrote:

> Like Christoph said, if it is unrelated send the patches as separated
> series.

A very common case is for MFDs where you've got a core driver which is
either being newly added or as far as external interfaces go having some
defines added to it and then a bunch of basically unrelated driver
patches.  There is often a build time dependency (not so much with the
newly added stuff) so there is an actual dependency but no meaningful
overlap with reviews.  You get a similar thing with people bringing up
new SoCs where they send a minimal set of drivers in the initial series
so people can usefully test.

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCBeHkACgkQJNaLcl1U
h9Cdvwf9EyQZ1Cg3KgBVhX70+x39cK9y5okJNSN/Pg1/RV90aYzwkZNs7jjn5Td7
3T+CEFnDT/MACyJ0Cbfd3+/Bh7Hhme2zaVxctQnX6sfVLbAJodplkTiNrxk92nMM
nZmaddDSf7QDgdcAQdFy5m1kpgdw5ImILcnAbP0L5PBKS7ptfAoqbwrTfU5tATSu
PhMcGl5OvjhlnkLcsS2yU4LSp78NUkyW5/0aOWbiNLr11Dz7DYpU/+M2GVKSMOSl
WZV5SlDCcHB1dPiKcuRmI9ceoF0YXbAQ9b0bRjrndrUMP/e+fC5zbGXnbfCbZ4uG
iVN/nFcPebLlr5kAf4M0azi0m8aS3g==
=oWw3
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--

