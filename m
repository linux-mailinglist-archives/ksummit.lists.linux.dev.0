Return-Path: <ksummit+bounces-62-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FEA3680B8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 0B0C51C4DF6
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95B12FA1;
	Thu, 22 Apr 2021 12:40:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21522F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:40:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86EE6613F6;
	Thu, 22 Apr 2021 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619095252;
	bh=lJRSxiLNkyRDmrY1vBkAqNHhFU4NKAVwGBC0fk19PJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/oE9ss65xuMj8zVnCSxCjmpoia4vWczRbo9NoNPvGlz5rdZsiKknBuyJ7UcOflIe
	 rl2tGoxWnWXTgjl5TM7tmTuE7MRPJZHvKKjSZVMhRgyFqM8W4nixOgcT5dqlbVWP0l
	 sRscH8hWXmYJpg5jrGp5r1XD9xZP77NYPCfMRp8Y1zj3kPfKfP8mAKd520Y1jpFfCP
	 ueCcFDCVu9Igs7/ORVcj9mUFcB5RtJIKUGHSckQHnf6AsIb5PXslAwQzBFHNpy4CK1
	 t12YgKjyOCK1/JSUaHfiTO54BifwEiH2syV0PmS9S8IFGgqKZAvSXtZksbs6cqAIYl
	 aKyEw8fwZhIxQ==
Date: Thu, 22 Apr 2021 13:40:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422124023.GD4572@sirena.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline
In-Reply-To: <YID5xhy2vv45fnOv@unreal>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
User-Agent: Mutt/1.10.1 (2018-07-13)


--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:

> While we are talking about policies, I would like to raise another bad
> practice that is done by even seasoned developers - sending patches with
> carefully crafted and filtered TO and CC.

> This practice causes to get out of context patches without ability to
> see whole picture and the worse part that it divides feedback to
> "islands" without ability to agree or disagree with the feedback.

The flip side of copying everyone on everything is that especially for
serieses which aren't just repetitive changes this gets really noisy
really quickly and things end up just not getting read.

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCBbrYACgkQJNaLcl1U
h9AWZgf/coAyxWwIXXeAYX3vyPOnuyYj688Eau3S5neUcMxruYrmtXMqtrqP78hz
w2B2Aq+eJdygj831HXUmPuL6o1ItOZrAa7i3zELHFIN8nMVcjoXcQq6m9h2Uw0oC
jX8C6mRd1bsmxNhvRP03h8/JcVs3Bi2Lp3u8uxSOB5XE5U2a70cB1etEQylSSF0f
bG2K6Y8gasfLHVUXR7pQDnbAtz/OiuL7MwTk0rwPe6XBTefO62+XleutcMN+m8Xw
VXa0PLqXvtjC/P3Ob8sZbUAZm8irUM/JnGcpFkPxjmlhzDedQ5kxU4X4AKnxehne
WHw5SI8kcXwjalJNFnFAq2ZoKEprgw==
=mb4X
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--

