Return-Path: <ksummit+bounces-2099-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D873AB1C5CD
	for <lists@lfdr.de>; Wed,  6 Aug 2025 14:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9276189A32D
	for <lists@lfdr.de>; Wed,  6 Aug 2025 12:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C3C28A1D3;
	Wed,  6 Aug 2025 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgOZv5CY"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE31726E17D
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754483091; cv=none; b=hjxS8XhXszUsc3bKDiCEs1AxfPi651QKY/gOj10IAlmalYCaxgBIHcBh/tandw12SqRlniRKgvUq/ibZFCwkI1QIaen8qer9HODYdH4Rl703P6nHXdG9YlXwhWS0ifVWHVXatnW3ArtgE5ALEoFsNPOWYNQQaVWMWXC0NBORoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754483091; c=relaxed/simple;
	bh=n5cQmGkVI4pb2kbN6FunUxoYCTnLK/QjDc/sIs5y+uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhzmk6AUgNkF4Bj8qnrKBzKpRVeem683P2vauc40xM/LSVV+CSLcuqP4xm5/i01ZefEyw5OGILS2cy0ZyK/qK15mMx2hjdvXIjD7Os8XeY7CzGwweVbhgSKe6deD17tqLsCqDZQVFeT1kuQCGkWPlClcmRPJSvJt/daM3cDc4N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgOZv5CY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF5EC4CEEB;
	Wed,  6 Aug 2025 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754483091;
	bh=n5cQmGkVI4pb2kbN6FunUxoYCTnLK/QjDc/sIs5y+uU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgOZv5CYTEixqQTRfxN7ZzvOf1XCWPhgeNze++vuPZ108x1vtjgDGrxGKGZ2lEWDa
	 jDLSwlfXvxHhh1y9yeXqO++4AWdErN0ZHgwQRATGo9iMFjp4oTRJQqQ+7LvYvx+5P/
	 fLWrqeU4K5QzOO6K0l3Hw/GfDgzV8XUDGAQZTwYX253EbVEfaqlMg6FK2yzoOkMI7K
	 iHEyFUU9dVOCviJt+k87tLF+s+IgdsqQprLHrs+VVOSpXLJnj5Lm/rE4o8/Chracv3
	 wbAuRXqi3oAWC82iANyASiQrKtSigNYDbEHZS3Y0rb0aoVFjQBRbS1JTwZjuDx9i60
	 V9I4hc0wMR0tQ==
Date: Wed, 6 Aug 2025 13:24:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <ddf35e41-05ff-4a3f-a949-1fd55e1b6a79@sirena.org.uk>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
 <20250805122828.68312a8d@gandalf.local.home>
 <09a8f276-916f-45e9-bd63-ffddecf1be9a@sirena.org.uk>
 <CAMuHMdWapDrTn6Tv=YA+s1kcT8A3TrXu2F35sPcv8RHSJyYWXQ@mail.gmail.com>
 <63d3abec-1c1e-4828-a05a-1348d840ffaf@sirena.org.uk>
 <aJNIckP-3MBG4FFR@lappy>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aUGy9qFkZCyEhSpx"
Content-Disposition: inline
In-Reply-To: <aJNIckP-3MBG4FFR@lappy>
X-Cookie: New customers only.


--aUGy9qFkZCyEhSpx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 06, 2025 at 08:20:02AM -0400, Sasha Levin wrote:
> On Wed, Aug 06, 2025 at 11:42:03AM +0100, Mark Brown wrote:

> > TBH I think a summary would help there - currently you're looking at six
> > threads for all the different stables and have to check every patch in
> > each, if we were instead getting a summary that says that patch A has
> > been backported to stables X-Y then it'd highlight more clearly if
> > something wasn't pulled far enough back.

> Something along the lines of
> https://lore.kernel.org/all/20250805130945.471732-1-sashal@kernel.org/ ?

Yes.  Possibly also putting the range in the body in case people find
that more visible when reading the thread?

--aUGy9qFkZCyEhSpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiTSY4ACgkQJNaLcl1U
h9AtYwgAgWi26UBxniEiOQNG/S7biJd5OmluE/2p0IsO5lvvv9ksh+lFkvxTF6a2
4V9/dHC+062eT5i3apjr+jnZqSOdWG5FF1bLhKMngE4gTEcrpI7mq1eDbtriklre
OHTWQmwFyHPQVBXkfySEGeANg6S18b+9882q45kCTZWL8OT06z70nlwp8myO55sK
3ygqxaIxRVHNccvGOO6FlkFCO8gVm+OwQZ+ZMuInMb3Wcxgi4GyAAIgu7lSwCxdP
MQG6Ewl+xB5YQMPIjUW98DlvXXLWPyEOMhMSYjyH8qw3/+Pf642++EtR16UvN470
WecDopgYWJWr8WhKctT65at+rBsFDQ==
=ia1N
-----END PGP SIGNATURE-----

--aUGy9qFkZCyEhSpx--

