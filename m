Return-Path: <ksummit+bounces-761-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1322358EE71
	for <lists@lfdr.de>; Wed, 10 Aug 2022 16:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C17A1280A7B
	for <lists@lfdr.de>; Wed, 10 Aug 2022 14:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269DE29A5;
	Wed, 10 Aug 2022 14:36:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312D28F1
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 14:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC7CC433D6;
	Wed, 10 Aug 2022 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660142161;
	bh=aHULziIsoPLKIJSaZkK7YM5n8+QRHXJgUSazGlDfNl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5G20Ym1xFo79+lB9fBy0VzAI4lMCnL7jq5L6GnIU4KpNXNHfpC9Mk+HP815zwn4d
	 s50YvH0P4Md9+RK/N0NQaujMHOkCfcjlBlSWiR1Q2oBwcXG/M6zhhtAqIsIcBuWM/4
	 3xMfbSZpwhX6EKcbHvyDwvwanEJjpCQbG259G8eYBhL9KcumxjSGYwXwSYtfnZmQ0Q
	 uAX+SogKrnKI2wtihWVyqCDGlK6emNjYG+psSvIwG3Mj72KLiC7fzRYw5AWeuK9Sq/
	 2jU+yr5Bqdl/wvy2xvdjEHxu7gzwsHQcFDIuq9VtlJPzUuD++A3hIXXp+4aiZ9WjNH
	 wxq3K6+7lt/Mw==
Date: Wed, 10 Aug 2022 15:35:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
	Lee Jones <lee.jones@linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	ksummit@lists.linux.dev
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <YvPCTMruRsG0vkSe@sirena.org.uk>
References: <CAL_JsqJf4Foih7Z8xXjfdeONwH5wCMRYSU8Fzta_F49q+Bp4MA@mail.gmail.com>
 <YvO6LY3kE02/uvXe@sirena.org.uk>
 <CAL_JsqJH41LZQvtiJMn_70FQLzjq=8aNOX3qymjPf6+0rwxodQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hhIjmU/sTEsZubsT"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJH41LZQvtiJMn_70FQLzjq=8aNOX3qymjPf6+0rwxodQ@mail.gmail.com>
X-Cookie: First pull up, then pull down.


--hhIjmU/sTEsZubsT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 08:20:32AM -0600, Rob Herring wrote:
> On Wed, Aug 10, 2022 at 8:01 AM Mark Brown <broonie@kernel.org> wrote:
> > On Wed, Aug 10, 2022 at 07:54:59AM -0600, Rob Herring wrote:

> > > You've got to filter out what you want on your end. And lei is great
> > > for that.

> > lei is too new for Debian stable :/

> Meaning it's not packaged or needs newer dependencies?

IIRC it (well, public-inbox) is packaged but is an old version without
the lei functionality, and/or there were some dependency issues.  It was
a while ago that I looked.

> > Will that do the right thing in cases like recently added files?

> Yes, because I'm sure checkpatch.pl was run on the patch adding the
> files and it tells you 'added file, need a MAINTAINERS entry?'.

Right, if people run and pay attention to checkpatch.

> Really, I would (and do) turn off gitfallback completely by default.
> If someone wants to be CCed and there's not a MAINTAINERS entry, then
> that's on them.

Yes.

--hhIjmU/sTEsZubsT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzwksACgkQJNaLcl1U
h9DXagf/XSBC6fsELJMiFJPa6iGBVu6gUaKlxdNrnCFnkSdA7n9uytKKj+5SD59a
+yt+u5Ek8Wja0tx4PEbsMOAF5qVjzj9VPvQeM1hVRAazaDm+I6i9e2J0K2V4AdGi
c8Ang08HxEC3XVObLM9WSqRapKYNPnT80pLYrmoMfXWb/Bek51Fo/MEARdglRn3f
eCm9RaHvSmAsOZ3D/lktFm48EnKXrzGob531vJuqFQJajnzVD6kqnKDdWrD9EpQO
aHWuHr14VD7kEdEVnLyusQedFJB0xS5kUL1O3s3NUfoV0g+1HGg5ACFA4dAbc0Kt
Xr7ltuBISQmdmtBu+mmqhx6O4tNOZA==
=kFeY
-----END PGP SIGNATURE-----

--hhIjmU/sTEsZubsT--

