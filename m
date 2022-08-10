Return-Path: <ksummit+bounces-755-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F91A58EC43
	for <lists@lfdr.de>; Wed, 10 Aug 2022 14:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE9A280AA2
	for <lists@lfdr.de>; Wed, 10 Aug 2022 12:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9812717F6;
	Wed, 10 Aug 2022 12:50:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187F17EC
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 12:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C852C433C1;
	Wed, 10 Aug 2022 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660135812;
	bh=3krMXK6M5MuXM3MT42nM2JrcT1DxlaX/WNkIhgArp/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjMNLzVrRhyV4NYWjMfPIRHaWtxmdTRfCamKv4Kqu9gQUufxJzkIp32S/8cdvYGyu
	 dYKKdxYafwDW88OcDioXso2Y3f5YZSOZuxsrtij0g1nDL8n4TM34CBgQCdxLOZAbd7
	 wVfeF4hK1DrBSW+5lARPZ6RnVG6kH+TJHXU3LjmuE4xyU7TS9nGEG4kH6403m+eYNd
	 ERbXqGi+6PizXQO7hTxJWii/nazw9xOjgVkGkQ9ezstoPhyLlqporiEsgLhvoak20G
	 qQQ7maapYrMTfoiNEQlqqtEivvWWxHvrfwe4dNQtZSqT/MsFdQoGkefuLFJcgXCC++
	 EZZADEL6aKCIg==
Date: Wed, 10 Aug 2022 13:50:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee.jones@linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	ksummit@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <YvOpfQAUFqjeMGWH@sirena.org.uk>
References: <20220809171316.1d6ce319@hermes.local>
 <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com>
 <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
 <YvObmmmLiX6z8eA3@google.com>
 <20220810120450.GT3460@kadam>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qEt1NXSsdCko/++f"
Content-Disposition: inline
In-Reply-To: <20220810120450.GT3460@kadam>
X-Cookie: First pull up, then pull down.


--qEt1NXSsdCko/++f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 03:04:50PM +0300, Dan Carpenter wrote:
> On Wed, Aug 10, 2022 at 12:50:50PM +0100, Lee Jones wrote:

> > I am presently plagued with reviews for lots of files that I've
> > touched over the years.  Even if the changes were trivial.

> > Or is this just an education point?

> Education is not the answer.

> We've got thousands of devs and no one can keep track of everyone and
> their motives.

I think the issue there is more that if someone sent a drive by patch to
some driver they'll start showing up in the git history and often get
CCed on future changes going forwards, which can then result in getting
copied into further postings done by copying from prior postings.  That
does feel somewhat tractable to education, at least in the early stages.

--qEt1NXSsdCko/++f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzqXwACgkQJNaLcl1U
h9AzhAgAhkpvSmeYQXn1DM5NtHpHqi0BQzvk0wdH9MgFNgtLNI4NpkTkzyz6H+re
sstjTRUhU9UYa8bKW4ux3E0fukL1s8+807xDUJpOImxutFdjtFzRZn4AW2z3NZg3
hzzs+rHXfuXSfKIqk49ZNH0r72pKFkxO7iPrZDNsKW7c8wdFMYWZQDonIzI4az8a
Fxup34FwIgdPCDwId9a3bZLG7udMAWzTwy3CIDys1us/bcTTOMQXV/P60cKBvPVD
D3oxHMPaqC52ojlMH4piYN1osPajzJUvcIfJScMKLYos/G5n502Zbp27lbWPrRtz
9pDfFdTYjNiKEenx38CFWyM/Y2sS8Q==
=PSWW
-----END PGP SIGNATURE-----

--qEt1NXSsdCko/++f--

