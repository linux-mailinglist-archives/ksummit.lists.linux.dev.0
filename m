Return-Path: <ksummit+bounces-56-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FFD36800F
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id AD9603E5293
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352592FA1;
	Thu, 22 Apr 2021 12:08:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160F2F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:08:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69F8961164;
	Thu, 22 Apr 2021 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619093283;
	bh=NaZMGisERVpMnLDJzMXvOMmdE5G5DEGTBCbuFyuI1bA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVjCCbaFVxlgwHZZF4VhZ0QlY/WvpC3mg1YzhOUVUkjeNryQVmsJef1/JsMq+x3eT
	 1zleAu6CswVVUQQr7kSRHvGowDgvxeBuXoxAIXOA34NERKNbNhUubdJ90MCeuaqPhS
	 Dwx1Z9VmhidtDAfWUwt8u7hE7c/Tvpcqf/IEw5Cb2LVMa36R/9kLdfjnueAPPEJBAd
	 ymG4WaBKosKKZuget9/hjpcDthL2jtVYpRDPNkdZ2gQ8d5QtABeaDrYUpsx8lacSwJ
	 Tse3xKXRkAAcslSRCWRaeN/PDa/Je0ZHEFyXnyKk4mEMpwC1FBMMixZgsrfdsoXPxv
	 NM5ZE8iOdGOXA==
Date: Thu, 22 Apr 2021 13:07:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422120735.GB4572@sirena.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <yq1y2dbtbrm.fsf@ca-mkp.ca.oracle.com>
 <b8827b4267648f35c31628e73be42efee52f5cf5.camel@perches.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline
In-Reply-To: <b8827b4267648f35c31628e73be42efee52f5cf5.camel@perches.com>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
User-Agent: Mutt/1.10.1 (2018-07-13)


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 21, 2021 at 08:04:17PM -0700, Joe Perches wrote:

> True, but perhaps most of the pickiness can be mitigated by moving
> various warnings to W=2 or W=3.

There are already people like Arnd actively working on managing what
warnings are at what levels for various compiler versions, but this
isn't just a case of wanting to shut up new warnings - a lot of the
new warnings that get introduced are legitimate and we both want to
fix the existing issues they identify and be able to enable them more
widely to benefit from them.

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCBZwYACgkQJNaLcl1U
h9CWwwf/ScaGlApYNmW7vgD4Py99sqN0mGrsK2LxSWemkhs7moT38ofa8TJYXPxQ
xt2iabxyf8K5gSKl0E2J7+jpBzs6ZgIkOu85fD7IzyORUnZbrt5tSrpC7AQjikxO
VSq9FjIsFPOC23HlHq90MvTAJh5fs8T3ie9h09uUrqaRD6ORHoxxO5dPnklBc6YQ
EOzgCtzDpALNb86+f5LoSDG4tHmwnVurBG3xhAyNChw8r9CweavZ8l+UN0knsYo7
wT1DSQFs59KM/DHgaCgmv9Tu8cpf20690vtOgY/vX9WFBcO2fptRa7oMVrnwjAOy
FaKooKuS3+Aqdc3rVSf+JbIOrFAyoQ==
=xp+a
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--

