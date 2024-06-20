Return-Path: <ksummit+bounces-1338-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E26219107D0
	for <lists@lfdr.de>; Thu, 20 Jun 2024 16:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9950A28135B
	for <lists@lfdr.de>; Thu, 20 Jun 2024 14:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF071AD408;
	Thu, 20 Jun 2024 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tg0tzoqR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB4117554A
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718892989; cv=none; b=nNkdBwoLak9P5BslCkfUw7tlpMLxQ9lJzKlYIK7BgRNFZs1FW/mub0qrZbYjGX/svH4kaMAKgLgYDFLSF0FTJe71n0/TshSBleY/bC9bUkFKo0/s8/ebmQVsYjmGUh1nv97vo3LmMZf/kz5StS/kHicGcVfwXcZT1hCc/Lwo0So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718892989; c=relaxed/simple;
	bh=o6IO/GUlX0YQhVJbqf8qVyAuDg7PDMjmlG7sr3O6BrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VA/njgBky35AJdsu+r+N98D07j+5PgCkJKbHS48tuQgVTMsKNklaTcHFPW4uUGoa20KYK6NY3+cmDMP/iZWSEsRBirs1pCV23GXELATDWpEGP0H01iKDpGoMIFIzvCrJU14ZLE/01i/fyCdtJu6/eYAZYDTDqMV7xM6edoEdAI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tg0tzoqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9268C2BD10;
	Thu, 20 Jun 2024 14:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718892988;
	bh=o6IO/GUlX0YQhVJbqf8qVyAuDg7PDMjmlG7sr3O6BrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tg0tzoqRxfNomsOGI1rO9BsT6td43IwcgQjHar1tMaszg5h3k//4c1x5c6hVW3+d4
	 lhBRfgI5os+W68OMpTVwis7/cyPXZcq44tL3/gLx4nD4QlNmhocHNSBeLFRzW6BCy3
	 PTIMCWUWWFznoebzuTp0X4cJ0nbVf7pHk4Z5QoqA2lxbBHCeettN+rjDqv3GjWIIOk
	 oOfbO63ITd82VrPIwdRMyiltLPxrV3gjKELFvqACT86ESGx4y5PGAvjQPHrsQE+uBn
	 rh2TJJA4oaxnyIAcRTjjNu+zCmRc6AYksAy6jb6o6Dj2DeMlNZeCFAr67E0mB9ezOm
	 g/96aeri5sCFQ==
Date: Thu, 20 Jun 2024 15:16:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [3/4] Elevate handling of regressions that
 made it to releases deemed for end users
Message-ID: <ec16d469-6cd5-4ba9-a20c-e3fc9035e7fe@sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info>
 <20240613113455.GH6019@pendragon.ideasonboard.com>
 <a1c7cf66-07ec-476a-a2aa-f09cae929c0a@leemhuis.info>
 <87jzijeony.fsf@intel.com>
 <9e417917-91b9-4506-9fbe-d6436ed48b9e@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="owTDBlz77fOl4Hax"
Content-Disposition: inline
In-Reply-To: <9e417917-91b9-4506-9fbe-d6436ed48b9e@leemhuis.info>
X-Cookie: You're already carrying the sphere!


--owTDBlz77fOl4Hax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 20, 2024 at 03:35:05PM +0200, Thorsten Leemhuis wrote:
> On 20.06.24 15:20, Jani Nikula wrote:
> > On Tue, 18 Jun 2024, Thorsten Leemhuis <linux@leemhuis.info> wrote:

> >> What wording can avoid this? "By the end of the (current/next) week"
> >> maybe? In business context that afaik usually mean Fridays, but I'm not
> >> a native speaker, so might be wrong there.

> > Perhaps try wording it in terms of -rc/release instead of calendar?

> Not totally against that, but the thing is: in a earlier local draft it
> used to be like that. And then I noticed that this will add another week
> when it comes to the merge window.

I don't think rules lawyering the specific wording is going to make an
enormous difference here, people are going to try to do something
sensible anyway and the merge window is just different to the normal
flow.  You need something that's a suitable combination of
comprehensible and not looking like unreasonable micromanagement.

--owTDBlz77fOl4Hax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ0ObgACgkQJNaLcl1U
h9AKaQgAgtTV8lfzRMpAw8MqzGchsxQW7uAS1AxNMoEwPZpTh4BBG2WJg2uvl+bO
3nl9cySVIJ2dA7yHCnSIuXgZsnho3jS8E5rX7ffdJxQGvdHR+lWu1XsAgBfzuGTV
VxOQoweW/WY1D6+VEVSDio9mL1Gng9O4Ico4vCBaWe6naBlzUWkLqnseXssGD+69
UsGj1Wp7MN3K1A5g3sinZlPcmLmhbV1Xr61rYcZoueOpBr/yKzF33qk/kmFTV3/L
ukEsn9oLwFVgzGI91pqkwlY4a7kM4IsWarzUJzB4wcEZVYGqmwDzhm4fXmAXQ3jj
3HjXbVhm7/ViJj+utjewnj93VuG7UQ==
=Q6qR
-----END PGP SIGNATURE-----

--owTDBlz77fOl4Hax--

