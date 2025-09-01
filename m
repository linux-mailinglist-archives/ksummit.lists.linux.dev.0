Return-Path: <ksummit+bounces-2256-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10859B3EE1C
	for <lists@lfdr.de>; Mon,  1 Sep 2025 20:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA27207389
	for <lists@lfdr.de>; Mon,  1 Sep 2025 18:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CCB21859A;
	Mon,  1 Sep 2025 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAHLPQXk"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91103E555;
	Mon,  1 Sep 2025 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756752727; cv=none; b=kiM2QUxnYCldJyeNwXHGYjvHljP2CUpx8bsrb0y8j/hNRsEn1PbhXymYwBJ8VLU7Gm1C6nZ70oGh3ko1hy4umnW8CD4Hjw9dcSmtkFZ3fwt55n1viLPNXQ+R/3eioEKAOOaIde1cUFla4qHpP1xSrS+c2c5NqpfO369SvZMiNEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756752727; c=relaxed/simple;
	bh=/TX7qLZE4PDZ6TjeVa5US7jTUDiSEJHgxEnOVOCMJAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVLZbn59dNJxMLw5wIi+4hUZoCbSUXF6b+n0QRGyZEdlUR8wOK/FU0oulBNGBPxDZXmm2J0dik5W43EIJ0bT0L7mSdBLBnFSu7irJb+n4CFkJ5GdijGjEJhmXVpI6xtj9uuliZuZlYi1Z1y5We7h8DmT/pEDSRkbjgq5RNVvUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAHLPQXk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90A9C4CEF0;
	Mon,  1 Sep 2025 18:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756752727;
	bh=/TX7qLZE4PDZ6TjeVa5US7jTUDiSEJHgxEnOVOCMJAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rAHLPQXk1asGRzmVoEjpDrt4GiY+0E774DJQlIur0JpwgVUDvNwerzplhPWX953Vm
	 kVaLjcLM0IEtgqXfKGRsYRtus+k6IOqJI3RLp5ux+yy3G/6UhRXy4os5rzL1B6ivqw
	 vdXHIhDWKPCLO68eH3i9bEdkTvWGD7JmUxv8m1DYJkdBmmIyUanNPFIIW0eiKrzVBS
	 xxdy47t6F50nKV78gV30ljy8N9PheUsBM6ppkoroo60sFUGMeceEOzmc7FDh8NZnCi
	 B8gr4dzQyAvOuzYR7lmb+eeInRfC+sPd0BiX3ywlLMZ7zVFHiCCocdVZAObmW44v6I
	 B2j/9n7izMiMA==
Date: Mon, 1 Sep 2025 19:52:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
References: <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <20250901204635.51b81ffd@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kTfD6BBN1IhOe0Ep"
Content-Disposition: inline
In-Reply-To: <20250901204635.51b81ffd@foz.lan>
X-Cookie: Auction:


--kTfD6BBN1IhOe0Ep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2025 at 08:46:35PM +0200, Mauro Carvalho Chehab wrote:

> It should be noticed that kernel-doc doesn't run in parallel. Python
> still suffers for a global big lock (called GIL). My attempts to run in
> parallel actually made kernel-doc slower, but this is changing: the
> next Python version is planning to get rid of GIL. So, maybe within
> a year we can re-add the patches to run it in parallel.

It'll take a lot longer for that to filter out to people's machines, for
example I'm running Debian stable on my desktop and I know a lot of
people have Ubuntu LTS.

> > That
> > compares unfavourably with allmodconfig on this system:
> >=20
> >   $ time make -j56 allmodconfig
> >   ...
> >   make -j56 allmodconfig  5.31s user 1.93s system 146% cpu 4.931 total
> >   $ time make -j56
> >   ...
> >   make -j56  53468.11s user 4387.30s system 5084% cpu 18:57.77 total
> >=20
> > and seems rather more likely to flag something for me.

> 32 seconds more, on the top of 53468.11s doesn't sound that much.

Yeah, if it was of that sort of order, ran clean with mainline and could
be checked automatically it'd be a lot more viable.

--kTfD6BBN1IhOe0Ep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi161EACgkQJNaLcl1U
h9Bwsgf/YbAHWiEofK9RaVBDk7z+ObkZv1LKQxt6I8SJv+HoBhTDvjWx/FPncdpc
IbyidHQP4GaURRXNQ0bN62ETqD8fCskMBUSTqyboDgI0LBS02dNCycJP1TPJl1rQ
Bc+VdmAL8PdsctCrkB7RL9dJyzB4dFyUoXdj4FS1CxQ0xdr8kbC7BwvhrKEm2q/C
FXoz9BojTD+8pBnEL7PWumWy6Lje2n/fMCO5PUxnhT+cCGVPv6dxfAD9g6zLnJxh
T82sjN5WwBsn/JgY/HDlZ/IWSR0JcGPrhM/wRxTLvtICMLeQZsRRRNA+YLA2oMoU
3KfqMPiNCtQSa11KnHtjSSOyMpjukA==
=AEj9
-----END PGP SIGNATURE-----

--kTfD6BBN1IhOe0Ep--

