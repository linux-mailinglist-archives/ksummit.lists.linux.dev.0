Return-Path: <ksummit+bounces-2096-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A2CB1C412
	for <lists@lfdr.de>; Wed,  6 Aug 2025 12:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A0D6239A0
	for <lists@lfdr.de>; Wed,  6 Aug 2025 10:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418B1289377;
	Wed,  6 Aug 2025 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xrti+rS9"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEA9632
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754475212; cv=none; b=c/m2O0gP3EHow/cICTJPfhxi0PeZjm4lr5j1Cc4oFHApb5hvgeoY+a62OkGDidUCXCzS3BXsg6RJL9Cbgr7/5/VGMArttXCAqTNORGkEyUp4wHTHLjA4SdHoHNAPMd3fFq8+O9T9uf6n8FcWKmVapuIClSC+bcRtP9srwZBQdV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754475212; c=relaxed/simple;
	bh=Hm1XBOm8Kaco4QpdzIro5iBHqj7Ay9SyR4QVm8nxRbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqoDXr7ci8MeiD1iXxhdk3Svn3+PbZo0kkBFoj6ZNqtME4t2kxGh6Yshw67oJZR+b6MA1dnt9r858G+GqCxggB8TKWGYHqZrobgDGw1AxHmSzQ17wSQ78WW5+h7vQnbrXCEUVssVdcezEvym3z73J9xhvLPgVhLJdlUDMYDVHIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xrti+rS9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FC3C4CEE7;
	Wed,  6 Aug 2025 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754475212;
	bh=Hm1XBOm8Kaco4QpdzIro5iBHqj7Ay9SyR4QVm8nxRbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xrti+rS96Mr024in1JmponBLfCZMoDKGG87OQ7wN6OYqYbIrl9Z3W02w3SG7PApta
	 I4trSZnac2uNiWUsZXKa224tOxrcEsB2gtHzoYGbCCBx5QqrVtU3/fZr99xS2S7YOk
	 hbdlZxKISdKzoGw47+9CNCknvo60Pu35doLssIw1DVdC7obfd/nyG414VKvCOyBm3i
	 ROMwBsIcsDAUJlXpzdDD9EYeTIvUP5L6Gw3uVtyZTbwR5WZadU15QGaGa3ADLJXUpX
	 Vu1kG8CfcWV/ZQXD/bMfq/jJsRcUunf9nAvP2I4H++CsM8laN1P9BJA9OxH/XATcHA
	 NSguS5NKKT2Jg==
Date: Wed, 6 Aug 2025 11:13:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <d7ddd076-3cf8-4604-82f3-7e18709484c3@sirena.org.uk>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <e03f2583-c149-4fcf-aadb-81fe40afee46@suswa.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ujcuVqBQ9Z8a8HA"
Content-Disposition: inline
In-Reply-To: <e03f2583-c149-4fcf-aadb-81fe40afee46@suswa.mountain>
X-Cookie: New customers only.


--6ujcuVqBQ9Z8a8HA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 06, 2025 at 11:17:23AM +0300, Dan Carpenter wrote:

> Just a "Patch generated with AI" under the --- cut off line would be
> fine.

> We had a patch in staging from AI which "copy and pasted" from a spec
> that it had hallucinated.  The language in the commit message is so
> smooth and confident that it took a re-read to see that it's totally
> nonsense.  A lot of the patches in staging are from newbies and
> sometimes kids and I believe the person who sent the  AI assisted
> patch did it with good intentions.  But, ugh, I don't want to deal
> with that.

I think the suggestion from an earlier thread that people should say
what the AI they were using (as they tend to for static checkers and
so on) was good - that's useful for both noticing tools that work well
and tracking things down if we notice a pattern of errors with some
tool.

--6ujcuVqBQ9Z8a8HA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiTKscACgkQJNaLcl1U
h9Dy9Af+LXnBWJGV6uUGrwsybjY46826MMXI9k/CK1EeUvuAwU4fLsbK3lkiZUmu
3LXXJmj+1V3pXlCDuYMDpUc0xo4FnrnQYu1w0XMrZEjHsY4DdXfxU0m7sdosQi53
XrVxEU+ogfp5DTobi4wG0aa7iJkVgnKhUtVm34sMwfE7xoaLNnCo3xuDbF+zHq0E
h+m2nHYfgCx/XSd7AulTQ5QEWFb9CfehBSZMvkU3jb7CYqz5OyqIwjgVaWcl6hH9
KRWRJUTxypkEJX18NYLnMStv2QUJHqFIWVcdkStlhqYZ5yX0a69Qs1tSjXsdPiv0
OgUCfF9j4xj7zr6QahIn5Uixp1ZQaw==
=YlGz
-----END PGP SIGNATURE-----

--6ujcuVqBQ9Z8a8HA--

