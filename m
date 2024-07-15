Return-Path: <ksummit+bounces-1425-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7831D9319FC
	for <lists@lfdr.de>; Mon, 15 Jul 2024 20:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF5F71C21B7F
	for <lists@lfdr.de>; Mon, 15 Jul 2024 18:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3050153364;
	Mon, 15 Jul 2024 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvuUNYyj"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0FA4C62A
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721066835; cv=none; b=D/Fh0K42PA2EcPFizbF+c3HR7JFq1hH1wk/wV6owYBZv9uWnfXnEs05agYmXvWpBlQeyzVFEJ9n0DzWzOdyXvPNI8r7s0mHGKIlLIEQuKwUOWJqEZezVso8hDtKgiPYNLEQFd5jBZJk1n4oEtAe48tGQsYWjill2JgIRm5uHlLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721066835; c=relaxed/simple;
	bh=Su0CYDyT+gZwd/xZtONja0Q/4fOifYWBwe6ALW7rCXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioi9QeGVOo6mW5+ZzSozKd4fn+6KfAwX4HFAUb1l2SEMQKB+/Hsm5yM4KvzL0I8qAfVFMOIvbJM4HWkx41NpdvH8TsH4Iu1jn9v/LGjM+FdWJbAIXIgNcR+/X6LG2ym72IxWs3mZHjAvzcNcxf/nkzceRhARZmTKu8DEzfffYlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvuUNYyj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD40C32782;
	Mon, 15 Jul 2024 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721066835;
	bh=Su0CYDyT+gZwd/xZtONja0Q/4fOifYWBwe6ALW7rCXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvuUNYyjQ9PvIrJgc+dhI+wnw61oKt2OLOKqIF0McpYRB/dhhzvYPn7QOtWaXt8Pd
	 wKhkYgvjQuF6/VnxmNL4RVkLo4OkB8fyIYDW5qQjmi3M+mDyBQS1Wbwu+2axDIHfyJ
	 ax13HY2Hz5KdoOMEExBMeHBVC4BQh6FdQoDNKCkDj7hEsT4/43YwmXgZMbTcz4TmjR
	 dDSZwQWUVdLzbrIexh1CrXTd7LCvOnIHgyKajoEUw9wqllEnkHFm6CcKS6SCTHH3GJ
	 0lPhaPP3QyDHE3ytaF9tC6wR4w8wdgWQn7njFw8akbMuujtQuYM/1eZyBk+C7nafL3
	 aXgPvbHsJl7Tg==
Date: Mon, 15 Jul 2024 19:07:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Sasha Levin <sashal@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <9f81247e-dfd4-4f47-a0fb-c8c1ccca3768@sirena.org.uk>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <ZpQyeLFJY1gJvRRA@sashalap>
 <20240715180000.GC70013@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QD2Xc8f9s7Wm99ZT"
Content-Disposition: inline
In-Reply-To: <20240715180000.GC70013@mit.edu>
X-Cookie: You'll be sorry...


--QD2Xc8f9s7Wm99ZT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 15, 2024 at 02:00:00PM -0400, Theodore Ts'o wrote:

> That being said, maybe one path forward is that the stable team
> *should* be asking the subsystem maintainers about.  "Hey, the
> following commits appear to be backported, but you didn't add a cc:
> stable.  We plan to backport them unless you complain."  This has the
> benefit of giving feedback to the subsystem maintainers that they they
> missed tagging some number of commits, which might remind them to do
> better, or make them decide that they want to do something more
> explicit, such as have their own stable backports initiative ala XFS.

That's pretty much exactly what AUTOSEL already does.

--QD2Xc8f9s7Wm99ZT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaVZU4ACgkQJNaLcl1U
h9APJwf/U73xHlUUuCCmUeRm+X/byzvL6BbcEGpU6WcHR0kno4U7Uci4SfcnkDTf
EBDb7EK2HnjDYh+4RFuaSpLJIVow07OS9V1yJ9y1gphTAJZ/n28A2/dJ1qqSQreN
l0595QG1+1qt6ZYn1n+fnxwkMf4Y88CMQ9NevtA1ngDPieQSH7iAQ7Z1fuEt2qXm
9WYWCW9cw8H0Vda7yYd/XtOFstu1UdSgCFEMOfqGn1eTNvaAfaVglJ9+G/LeNgnP
xQPCrxneftY8DWL117AxUYwblZBFib0vD4BzmMrgGaVRx69Q6RjLhuD2093YeqEX
vfbnhQaBEmSIcueWEVaCcIwg2+6n4Q==
=IXBH
-----END PGP SIGNATURE-----

--QD2Xc8f9s7Wm99ZT--

