Return-Path: <ksummit+bounces-77-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED93681EA
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id E882A1C588C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B262FA2;
	Thu, 22 Apr 2021 13:52:28 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1090A29CA
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:52:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5491608FE;
	Thu, 22 Apr 2021 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619099547;
	bh=1gap/QZ3TPUmRvwyz1sg/cLiOEKnj23CQ5/ns60Nt8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOwAjnvaJWYXteBprxnhThY4/ZBGoygIeFdyyfWqrZWRiE+DzetVt3dqoMF3qRcNx
	 cxACnBVE2MDdhKu2O0UrBWU6YASxUAEDYyyKJ7iQzbCWvb+Mx5yv6dW4Qq760X9q9P
	 QWqXjIaguNdUVZPADZ8tTBVbtR4pSHxJUU9WYddi9TlVldXzmTvnJHR83fh8zQ77Rl
	 6y/acAxk83zIq0fSzqANqohdqF35ozYXuV5+h/d8nOvoW9j0KDHxvl8E+ASPXDCMXC
	 XePw8pWxpfx8J/Tf/uMx4Fvte0G6Ir8eAXxxh1ksZCJjZS1cq/YH2Ue2tfLpVP5ywb
	 hfCWWAK6rhmGw==
Date: Thu, 22 Apr 2021 14:51:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422135159.GG4572@sirena.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <YIFfXTVMDmHwVmSR@unreal>
 <20210422132202.GE4572@sirena.org.uk>
 <YIF+jDPl8aoqHu2K@unreal>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Content-Disposition: inline
In-Reply-To: <YIF+jDPl8aoqHu2K@unreal>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
User-Agent: Mutt/1.10.1 (2018-07-13)


--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 04:47:56PM +0300, Leon Romanovsky wrote:
> On Thu, Apr 22, 2021 at 02:22:02PM +0100, Mark Brown wrote:

> > A very common case is for MFDs where you've got a core driver which is
> > either being newly added or as far as external interfaces go having some

> I don't know anything about MFD subsystem, but for the subsystems (netdev, RDMA, PCI and MM)
> which I'm following, is important to get whole series.

These are chips where there's one device which has drivers in multiple
subsystems which are basically separate IPs that happen to be in the
same package (PMICs are a common case) - the drivers are generally
unrelated to each other in any meaningful sense, they're grouped as a
result of physical packaging and manufacturing concerns.

--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCBf34ACgkQJNaLcl1U
h9DxNwf/S3SZ0/CLPsT2Yu/XwWEAsRM80eI3oIFT6vrNXMTQns56+XFm5ihgukc/
ra+QWj20sIbROT0QokFuRqLx6Kh9Yw6WcJea4Fo0q69wcfaOyWQ6y9p/6y0uQK8s
QCGcU1c96s+JYGk9JPT2Yz5JfPofnYQNnTV6HkpvwKjD9unHrOclBrezbeffYvPg
qNxd74mudT6suHdfBOkfzBmfGagV6bqPAYc8+1Qw4ZDpkbaYH7bCq8c5jsvRDL7I
Pm1QrWpB7juTJIVppLvpszCsPjQhdY+ysNHMr/VkUUCGqoYARZqlmDWSA2jx1oTf
OAAp8M0PamxUOo/p1XdfYnl/rYsMeg==
=RO1V
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--

