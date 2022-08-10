Return-Path: <ksummit+bounces-758-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C340C58EDC4
	for <lists@lfdr.de>; Wed, 10 Aug 2022 16:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC27280A7B
	for <lists@lfdr.de>; Wed, 10 Aug 2022 14:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5E9290C;
	Wed, 10 Aug 2022 14:01:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEB917FF
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 14:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A366C433D7;
	Wed, 10 Aug 2022 14:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660140083;
	bh=vYTylRv7mnS6y48imXn0357k7RK+LQUaQPKU7anF9qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYsFIe6X/722DaRHI3dYDDgZv8QWSxncj4PpGUBoBHlp6jYWDSqDuU9y5QNDdQEvR
	 lbwq0NtaiaEiXJ+srPQFmFSfsK1WGNO1wivRHUbeD+4GefT9VUfX3vAH4b+vXaYyNj
	 3Wd6dFXaUFMovBQCHrnwHkDsXLDEkNVvAq7BWkOPK18XN6gt7v/Angmoaw+jxJKjjr
	 p+R9ZNmqNcI7zy11J/ophIBPfF5L6r5gmkDrtG4Yux422V6gLSAUsdl3qz9eTNzbdS
	 Pv+5v5xdvS9mCZF9fgxbm7+Ubl/EQIuTcUTTN3si6rmbuBWB0CThkiAFSZ0ANRFDLT
	 3vRzojHtxelkg==
Date: Wed, 10 Aug 2022 15:01:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
	Lee Jones <lee.jones@linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	ksummit@lists.linux.dev
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <YvO6LY3kE02/uvXe@sirena.org.uk>
References: <CAL_JsqJf4Foih7Z8xXjfdeONwH5wCMRYSU8Fzta_F49q+Bp4MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dO8zQN7H1OSRjdwD"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJf4Foih7Z8xXjfdeONwH5wCMRYSU8Fzta_F49q+Bp4MA@mail.gmail.com>
X-Cookie: First pull up, then pull down.


--dO8zQN7H1OSRjdwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 07:54:59AM -0600, Rob Herring wrote:
> On Wed, Aug 10, 2022 at 7:25 AM Lee Jones <lee@kernel.org> wrote:
> > On Wed, 10 Aug 2022, Mark Brown wrote:

> > > > Education is not the answer.

> Yes. I'm convinced there is no way to solve these problems on the
> sender side. I see plenty of cases of not running get_maintainers.pl.

We can't solve problems, but we can make things a bit better.

> You've got to filter out what you want on your end. And lei is great
> for that.

lei is too new for Debian stable :/

> >   --git-min-percent => minimum percentage of commits required (default: 5)

> > 5 is not a lot of percent for seldomly touched source files.

> Send a patch. I would also bump --git-min-signatures from 1.

Will that do the right thing in cases like recently added files?

--dO8zQN7H1OSRjdwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzui0ACgkQJNaLcl1U
h9AUpwf7BbRYqyUF21GIgMVKioCLdOkdombkZ4Qcl0k5Y1STa+AdgHR4/R6KOcaQ
WlYuH0pvRyV1Nntla82DT84L3cnj8Cym0wHgcuLp88iVaW1Y9+W/rAa+K2m7kjKz
xEI7WypvpWNJzxvn+bKSkya+Z2nRnftq+it2GWG/cG0UFH9AJ1MQolheTw5neOhg
kry2dm4t0FjpiurkPR+PlkTjW8IkvDwbYw9/EPea8kmlZo5Wgl4z/rM8qdRASMLZ
+aXKKyOCrUqsOTerPksvdRr5lBhPbkmwU16/Jic5YYtQr7rGsEmxptnBQuQplk2T
axKFVZQpZtqRm7Qv7sTyUUPK9M4/zg==
=wdL8
-----END PGP SIGNATURE-----

--dO8zQN7H1OSRjdwD--

