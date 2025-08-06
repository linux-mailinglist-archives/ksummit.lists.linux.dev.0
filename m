Return-Path: <ksummit+bounces-2097-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 621D3B1C47E
	for <lists@lfdr.de>; Wed,  6 Aug 2025 12:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4432A18A537B
	for <lists@lfdr.de>; Wed,  6 Aug 2025 10:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0728528A3EC;
	Wed,  6 Aug 2025 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0BxpdOW"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268028A1D3
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754476928; cv=none; b=kD4ojkb4StGTEqN7DG/klHPSmWq5LtmzRKUZEK1nN64yRpFs+mZvZ3zm1Y6TKn1gZH3YwoaI7HeQ2ea/6xmcIYuiT6/4hW191i91mfCL+oSBLUaSc9s8apZJkZqVu/U/zQtSs/e46/NWF+zsH9dhOMqmvgrmfWCWnMKj1yOwk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754476928; c=relaxed/simple;
	bh=XBfQXiDFwPP/13Mm4vy846k0ox0QPQQcr0djJdyU8PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRml3Rk5tNiPBddZyoxrj+hhPm4juDAtc6AZYvQCWc5DmlW2cVSPKqYqVAgCyEA/F+0rZ1YlYmuJulb1+Jvet4IImhPkNqm4n6P1WXWPp60f32DyXnaUcYRbQKlZ4Q4/EL/q2oblqBz4lP4lfDIaVfZZwcWZZTeKA2RH3TxdQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0BxpdOW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33769C4CEE7;
	Wed,  6 Aug 2025 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754476928;
	bh=XBfQXiDFwPP/13Mm4vy846k0ox0QPQQcr0djJdyU8PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0BxpdOWNLPSnes9cDFmODQxSrM6SEYv8mFy+c3fCDJq1IAVY0ozepttwR60sDOMK
	 F15nEtkxI/9fA7Vzs1o230cds9qg6/66PvRt0Nwfc7dRJsXWgE1LI8x3KZwciBR/rU
	 DzaRaFQNltj/sz8iwx+vHxlqA6PtxbhnK/CE0+2JfQNfsCM3OjniGqqt83FgbP0Pvc
	 RLBtX469dsFQYNGsOugCXsbmWFwaa3ftpoGV9hvUNkUK05whaIYNligs46XrgQrP7h
	 GxmisNXagRwJdI1VC9qmCcSxb2PyUH9xGtDkH7ckAd/pg+sdCAPegEnGZOEjfbsPzm
	 S9rrVEGxrt4bQ==
Date: Wed, 6 Aug 2025 11:42:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <63d3abec-1c1e-4828-a05a-1348d840ffaf@sirena.org.uk>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
 <20250805122828.68312a8d@gandalf.local.home>
 <09a8f276-916f-45e9-bd63-ffddecf1be9a@sirena.org.uk>
 <CAMuHMdWapDrTn6Tv=YA+s1kcT8A3TrXu2F35sPcv8RHSJyYWXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rotngyeMSkzzRFmB"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWapDrTn6Tv=YA+s1kcT8A3TrXu2F35sPcv8RHSJyYWXQ@mail.gmail.com>
X-Cookie: New customers only.


--rotngyeMSkzzRFmB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 06, 2025 at 10:04:11AM +0200, Geert Uytterhoeven wrote:
> On Tue, 5 Aug 2025 at 18:41, Mark Brown <broonie@kernel.org> wrote:
> > On Tue, Aug 05, 2025 at 12:28:28PM -0400, Steven Rostedt wrote:

> > > > One thing I'd really like to see there would be to avoid sending each
> > > > patch separately for every stable version, that just blows up the mail
> > > > volume hugely especially for those of us with subsystems that carry a
> > > > lot of quirks.  I'm sure the range of versions something is being pulled
> > > > back to could be expressed in a single mail instead, it's always some
> > > > range of versions being processed en masse rather than just a single
> > > > version.  The per version cover letter is more useful for replying with
> > > > test results but that doesn't need the whole series.

> > > Yes, I agree that a digest of all the autoselects would be good.

> Commits are not always backported to all stable trees.  Sometimes I
> receive an email about a backport, and wonder "has that still not
> been backported?", only to discover it was backported, but not to
> a very old stable tree.

TBH I think a summary would help there - currently you're looking at six
threads for all the different stables and have to check every patch in
each, if we were instead getting a summary that says that patch A has
been backported to stables X-Y then it'd highlight more clearly if
something wasn't pulled far enough back.

--rotngyeMSkzzRFmB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiTMXoACgkQJNaLcl1U
h9B8HAf/c/JVaVG2Y8hCLnSPE/99kdK8t7paQgA+e51kb1r9ZjmiVR18lUxz+cs8
H04Au0m05NoQ2LqeNybPrIt5bltOoROWuObj67vDdlH0flhvx8HDQvXRk5qt/COf
oYbpotRiGLPGAexOxIAunH3ZcDbjRwO5JA7nr8OaEz//8uYHx9+7IdF3N1wWfid5
kUFVfGCnpGNbcv2i4cdAyilqaCkhUryR99P7pVkEAvzntDW9fmbOktXT4/mKDbjE
r3apCvnfRZiEkeOG6p4kRggV9m+3ArtmgU7N2uemo4LewOt9EwkhDczirO+iyY8b
Yv1CYuw+GcwjsEbhAQURHlFY69KKXg==
=cJdP
-----END PGP SIGNATURE-----

--rotngyeMSkzzRFmB--

