Return-Path: <ksummit+bounces-2520-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CAEBD8EFA
	for <lists@lfdr.de>; Tue, 14 Oct 2025 13:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 373FC4E7D54
	for <lists@lfdr.de>; Tue, 14 Oct 2025 11:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D499F2F1FE8;
	Tue, 14 Oct 2025 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCuIJJkh"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8914D283
	for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760440185; cv=none; b=npbaeIjDXsRhPZAhGFOtvTyzLzeljLwDVkFT6gC4B6ub+o67PQOXUrCsvFVnNQ1ZkqnsfmHRlv1POSKxQbVuOk1Ja9yn/JyarkRhsLX+9N3npO8i0AHb3hXZGHNVbsWLHRBVMMAF6zedXbJzvHb9JRazpFYz/ygXkDjqw4eI7pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760440185; c=relaxed/simple;
	bh=KiCiGjyW6jnRm4w/zDSslb9IMoTQ+UOhSYH0q6C7S+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haQg0vf10kHi3Otn3GeroKjxwNv/3Auv2buiKoJ/RITL9N9u45CDS/2YFKni+XHFPcmZ78XEk1cTtX9HnaD1oVt4/tzZDzALWszu5XQy4n75MVVOOPgbuGK9wsywC8eapUph4RbTwYCUODsAFzLwqd9omnaKg96ElROHLz6J7qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCuIJJkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1CEC4CEE7;
	Tue, 14 Oct 2025 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760440184;
	bh=KiCiGjyW6jnRm4w/zDSslb9IMoTQ+UOhSYH0q6C7S+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCuIJJkht8SmMxL9OIlCtJTc9S4cSmtpOkafNlqmCZuacFiyIHk4oB+8ggYMgWuMc
	 1IwvMeWcac3ety4Z/Ieqa84jxZf4rbYDbqk2bvZYHlBDBBTT0N0a7Yqj7cEFboBiqD
	 tLfAO/L1+runiqSk3t30XU4FMEKsRp76xycfepPLvBdy0QVWVIaf0X6ExjKczsJT3O
	 s/UKu4+FWmXCui4Qc7YsaC5PwI0Fds7IxMESIAaZShA9O6Fs+v55S5drG8ZdsqUeq4
	 4Eb4l10ebQWiDVZZyIlnV8w30Fb2AlVvvkqQNTLBipphzz9TqWsOqmZt34WQ3tTAM9
	 H1P1R7uRe9FeQ==
Date: Tue, 14 Oct 2025 12:09:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <973213cc-b442-4cd2-b129-333f168bb9b1@sirena.org.uk>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home>
 <20251013175031.GJ354523@mit.edu>
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
 <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
 <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FGwgOXupoVvQ1V8B"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
X-Cookie: Go 'way!  You're bothering me!


--FGwgOXupoVvQ1V8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 01:34:05PM -0700, Doug Anderson wrote:
> On Mon, Oct 13, 2025 at 12:20=E2=80=AFPM Linus Torvalds

> > All the other arguments seem just disingenuous in that they literally
> > give less useful information than "b4 dig" does.

> Wow, I hadn't heard of "b4 dig" and it doesn't appear to have landed
> yet. ...but I searched and it was easy to find a reference. I'll check
> it out. Oh, it's using AI. I guess my suggestion that we should use AI
> to solve this problem was more on point than I realized. ;-) ;-) ;-)

> OK, I found Sasha's RFC [1].

Konstantin has an initial implementation in b4 tip which is not
currently using AI but rather falling through a stack of heuristics to
try to figure something out.  It's a commitish to lore link lookup tool.

--FGwgOXupoVvQ1V8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjuL3MACgkQJNaLcl1U
h9Cg3gf+O6pLl5AZk0d4KrYQ0Om6OPo6JUqrBFEioGGqO6dB7MBlvEC+3R4kGa8c
gJKtfg+NdrTP0AVO7KPcmvVZmFgGBOjiyFwqFFZn2zyEUIQvAv5yxtNP+n8dMX23
aEzUgTUsajV2K0trzxdSM5wPuSHN+cO06Tf7hPvw2txID1iyLJ86Ts0Suy+LjPxk
JT4UPC+gc6xD2H+1GG6dFp9WUPQmzytTt3QRtBuyxG3asRlv9U19k05DZj+8cQRM
vtG3pgoXiV+jXy3xbrGpNZDqKsqjMCx0r8ZkEExLcp1ISmVOH5C/9YJlbaJpuqVR
LTjJ1dmYsNVcNkXjEFpekUUbKAubnA==
=5iPi
-----END PGP SIGNATURE-----

--FGwgOXupoVvQ1V8B--

