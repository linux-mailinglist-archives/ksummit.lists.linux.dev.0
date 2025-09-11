Return-Path: <ksummit+bounces-2354-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39043B53447
	for <lists@lfdr.de>; Thu, 11 Sep 2025 15:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDAC91611B1
	for <lists@lfdr.de>; Thu, 11 Sep 2025 13:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B58324B33;
	Thu, 11 Sep 2025 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDzpciWy"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F451F03C5
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598564; cv=none; b=RkuGoRHoJn5Ipu2D6++osyrmhXQtj60doxMFxzzVx9GzpIoJXOoBeiugkZKw5kJ8G8L1RCeXRn8xRLYksdiPpwD0idS+XoxANNVCyG1jIRvnQu0D38JLjigfRgEra/NwsYYXF/DNafezIpgIFbyP89T/w/U0ChQz0RXnVrEnDUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598564; c=relaxed/simple;
	bh=WrD09WvtQYL81Zy4ArR2RoFH3R8L01uiwotqbNkB9hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuotK7oD8XZvUj1ZyM0qgEMEpRzjL4SdlxdV3HPApjV2v5tpYHzcPnCK3Ytppuf96qO+SB/9jOXiybwFEmGJ3TbQzblDH57sU6THvIf1YaqOr0j3SUEYEmAfHJmOm/n6YdRgdt79gTp777RfyBljbH4zEWc3XbDQCO/JzDAwPfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDzpciWy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D18C4CEF1;
	Thu, 11 Sep 2025 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757598563;
	bh=WrD09WvtQYL81Zy4ArR2RoFH3R8L01uiwotqbNkB9hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NDzpciWyC0aU+Ax+hc5NJnUyuPfX4sWTrgzLwd8zJ4tgIOGtJwVYdN6sGVCw2Soc9
	 ejR1l/Of2PWVytKLidtXih6ilkgAHru0OzBof1X1Y1Jjes8OvlZ3J3KPtlcDpRo+6z
	 94X5lTMsc5DWA0CYQ1T/a4VzIGAHcGayO1O0iDstr1AjY+BXNGjsC6vwxOFCEeJ0cg
	 UuKHHrVdj4JYa3rEZ+n7Ui+5c1HIQQVs1Z5qxUyqaVDWZS0cYOu+NHRNThCdDvD3OH
	 eX+dZDNlwPP9qec0kJYJ7DMgg84phFKY99ystilWmlpWeCaz1sMWLh6DtlsC28VZXa
	 O0bLDsy2FMD7g==
Date: Thu, 11 Sep 2025 14:49:19 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jiri Kosina <jikos@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <6cf04d69-d4a2-47ef-b5b0-b9880068eca4@sirena.org.uk>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <81n4979o-0969-q3o1-6n66-979668n0on47@xreary.bet>
 <ecfb75f4375d8bd97034b3f8e65198de32b25c82.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wWhN2e4ROVlxzhIB"
Content-Disposition: inline
In-Reply-To: <ecfb75f4375d8bd97034b3f8e65198de32b25c82.camel@HansenPartnership.com>
X-Cookie: Your domestic life may be harmonious.


--wWhN2e4ROVlxzhIB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 09:18:05AM -0400, James Bottomley wrote:
> On Thu, 2025-09-11 at 14:06 +0200, Jiri Kosina wrote:
> > On Thu, 11 Sep 2025, Krzysztof Kozlowski wrote:

> > > There are two cases here for patches committed by sub-maintainers,
> > > but never fed to next:
> > > 1. The upstream maintainer took them via pull request.

> > Hm, why would that imply that they never make to linux-next though?

...

> > I don't see how the fact that (part of) topic branch came in via pull
> > request would make any difference ... ?

> Yes, this is what I see too ...

> The requirement from Linus for merge is usually incubation in -next, so
> there are very few pull requests that haven't been at least a few days
> in -next.  So what is your complaint?  That the incubation period is
> too short or that every patch should be in -next as soon as it hits any
> maintainer tree rather that submaintainers relying on the overall
> maintainer to do the incubation for them?

One pattern you see with trees that do this is that some bug is found in
-next, the bug is fixed and the patch applied but if the patch is
applied to a tree that isn't in -next you still see the bug in -next
until the pull request to the upstream tree goes through.  Any
incubation that the subtree does before sending their pull request, or
delay in taking the pull request from the subtree, shows up in
additional time that the bug is visible in -next.

--wWhN2e4ROVlxzhIB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjC014ACgkQJNaLcl1U
h9DWDQf+OKqUrqaFf8Qoj6p3m5rbl7CDQDfWVbP0jomiUiSaz73YMJ+kTUc5rHQu
m8Kqxi6VjRIQFIWdY+GQm+TRXz0pZm7woPQHMOa9hKLziKlyd8FGI0pSDDNi8MPw
DsG5XxyOe0pDhn+abJ8kELKkveTcCwb0GxDIa9W/NYUjrWl7d4n+Fqk3jPR8TWxH
6/nVQ1TRARR48H9m7Ui0mUtAFDZZDCMnLQAGalRzmalWlkybMUTVFPZHx+QmfTW9
b8yCGKFiZ3MNpUKwNJvX0shWiac5ICK7EAt0iaMCZMM5KwAxACjNai5/l7JAObPZ
KC52rM3u8ClG8BXtr2alI73n/SxSlA==
=X/ah
-----END PGP SIGNATURE-----

--wWhN2e4ROVlxzhIB--

