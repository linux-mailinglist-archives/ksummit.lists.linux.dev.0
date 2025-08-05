Return-Path: <ksummit+bounces-2043-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5252B1B8A8
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A61344E11A4
	for <lists@lfdr.de>; Tue,  5 Aug 2025 16:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B4A291C2E;
	Tue,  5 Aug 2025 16:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZRTJ7Vs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A0E2571D4
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754412104; cv=none; b=b+o5w97d1iaU+4uTTmJ6iw2HkM6F98jK1uc7dLjrYoiMi1wYzEOrVuUMBcUpKJXpCSeYjAx9lNHwKIWKTp8A3fzFELKJNnGT5kux5s+fIksRIFrdrt1YbK7WS3MHuCgtzEXpGWKyYLkXu3kqTaL59meqOcf/YgqrAzGHYh7ZuYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754412104; c=relaxed/simple;
	bh=cLRFcVv3uAe88pIZyLgobekrdyKy8/XDPuxgl2b0QOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQAsZeXHLEVNQY+h88dklBIxoAHXX8vis+oIYiv/7wShdGwbK6n314l88aoeAZqhNcWDyfSnHhLHO+TmITbRRaFTwJWK/v0aEInHqrnKXXyIhWHVUUIuP5ceC75aahqvoEGH/sSq5fdLa+4ynxvsFpDdsxJK0hLNfh67uxKhQ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZRTJ7Vs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67644C4CEF0;
	Tue,  5 Aug 2025 16:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754412104;
	bh=cLRFcVv3uAe88pIZyLgobekrdyKy8/XDPuxgl2b0QOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZRTJ7Vs8p6lm5bbRdMzPizr4Ymbp28eF3fIikgv25emkO/mMEIXtjLm+M8KAaPy6
	 5rxyAgkAT7QRzx0BrhMm7N/AdvWQmS5kDctVu2vsoLaDn3pPxoT4IKr2s0HEYJpUQe
	 6Qeeyev2xrBTtTCRnRTN2N0OSMsGC7AoJn3l+eGTe4MCYlHSOieNvSRPY/vuCD9WZZ
	 HPnnuPvw0cMY+bngXxVIt/+zPdNkPeFeNlPMdHYmv6Z1/8Nx6NoG9rd/txff1Io1ML
	 GDC4jCOUK6L6vJxDJv5iVfOBAeEpHBzVMrtZplq+4w4PSuUcpF3DTix+CRbuOYBJr9
	 02gOi6Bw8QErw==
Date: Tue, 5 Aug 2025 17:41:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <09a8f276-916f-45e9-bd63-ffddecf1be9a@sirena.org.uk>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
 <20250805122828.68312a8d@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r6N9O0XwNWW3Ofe1"
Content-Disposition: inline
In-Reply-To: <20250805122828.68312a8d@gandalf.local.home>
X-Cookie: Trap full -- please empty.


--r6N9O0XwNWW3Ofe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 05, 2025 at 12:28:28PM -0400, Steven Rostedt wrote:

> I do care about the patches that are marked but fail to apply. I like
> getting those emails. Although I still don't have the time to fix them :-p

Indeed, and those are infrequent enough that they're noticable.

> Mark Brown <broonie@kernel.org> wrote:

> > One thing I'd really like to see there would be to avoid sending each
> > patch separately for every stable version, that just blows up the mail
> > volume hugely especially for those of us with subsystems that carry a
> > lot of quirks.  I'm sure the range of versions something is being pulled
> > back to could be expressed in a single mail instead, it's always some
> > range of versions being processed en masse rather than just a single
> > version.  The per version cover letter is more useful for replying with
> > test results but that doesn't need the whole series.

> Yes, I agree that a digest of all the autoselects would be good.

> Possibly even a link to the stable git tree of the commit each was added to
> would work.

It's not just the autoselects, you get one batch of mails for AUTOSEL if
the patches were picked up that way, then another batch of mails when
the patches are added to a queue then yet another when the stable -rc
goes out for testing.  Possibly more that I'm forgetting, and each of
those is per version.  Now you mention it there's some redundancy there
too...

--r6N9O0XwNWW3Ofe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiSNEMACgkQJNaLcl1U
h9BK4wf/XLuB2CM4kb4TAJvWykfPIQmOcPN+uAUkpKLZXwqQZ5Elm+QDxOUHJV4S
4UJP8rU1z74zpY8CNB7/8ZnsRPwbbt4Be08c3CJjRz3/8DiycE8Sfl8dsXYVBzj1
+BFE6B5oV2EHKT63xvWVQiJU7RHBsdrNll2bHWinEaYt7lcL0kcIbi35pyzl4kOa
iAVF7uK3CsFu3TUK1ECPiCI6s1gPMIj55WNnxalQixc+yzrBkWn41EfxhEvSzfeE
Yhh8jaZn9Xt0yZLIpaToh4781Kw75bb364hCRamtsLoyRL4Igij3aww3HTXXdiR9
toEnxSg9ufkc9SAkW3k4jFDdMASWLw==
=Qdd2
-----END PGP SIGNATURE-----

--r6N9O0XwNWW3Ofe1--

