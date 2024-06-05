Return-Path: <ksummit+bounces-1222-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872548FCA7E
	for <lists@lfdr.de>; Wed,  5 Jun 2024 13:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36144283095
	for <lists@lfdr.de>; Wed,  5 Jun 2024 11:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7563114C592;
	Wed,  5 Jun 2024 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lz61LcGm"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F415A49626
	for <ksummit@lists.linux.dev>; Wed,  5 Jun 2024 11:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717587078; cv=none; b=HCkTFG/ZH8fSkhwTGclheLsLKHrdn7QsAmrFyL9prvWxqkUSW2VzkbIferDS2ptA6x6WyaFKWoL8uWSgim1rSZmpcvL+Lhadx5YmRl8YgbB/xXx9LkyHXY0JBlhZEtMgQXB4wwA0B4gd0+N76R+z5gY2c1RIaRPdaQ/K27qOcig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717587078; c=relaxed/simple;
	bh=pc8O5glIVzk4IW0EFTkJ/KG0nPLzn3ZGVlx8fLf1xrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTvef0e8FJtSc6P8UOv7qOjhixGqP5Q3iGVvEepEXqVLjGAtNNDCZhRH2BhuoCdkcTspQpzEC4Z5pcFLs1jkjKUyYBiJ0BVgjI58Z9VPP9T5rjDQeZ9eY6Fya/TF5JyZqlVN6Se7pnd0NBJx8AkBw5pZpmIStheHelspBD0PEiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lz61LcGm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A044AC3277B;
	Wed,  5 Jun 2024 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587077;
	bh=pc8O5glIVzk4IW0EFTkJ/KG0nPLzn3ZGVlx8fLf1xrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lz61LcGm34zeRF53WImThvn+liOhm680Cl4K66Zn9QvowmKjD9eTC1Ol1XdSZsry6
	 dZCGQZWU1aCAKblWHdItKg58fOkDZdi5EWQuYbBs0LPi9YN9xmfhA2wkreI181cUHd
	 F8C1KGctrM9lNw4dJTmbLK00K0uDIGvKF+jOJRvcfwmv69zxveHWpC8VXFcS2TZ7W7
	 OzVbq2bNJbRIW45zbBw6NZUZ4wnSXbsz7uSdYyj6XhXflEvJdOk3EOvBa6eqHuQaIa
	 071EkpYuJ29z0hyOWTltgw4EcbOi8LLh3MPxqFZP9IpU2uABNREV+0AgVwEMe0Gwo5
	 G43uVZbzf8RYg==
Date: Wed, 5 Jun 2024 12:31:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Merge tree too flat?
Message-ID: <356ad539-3b37-4ada-8344-45ed938c02c5@sirena.org.uk>
References: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm>
 <20240604182137.2cfdc0b2@gandalf.local.home>
 <nycvar.YFH.7.76.2406050028090.24940@cbobk.fhfr.pm>
 <20240604184506.007c4682@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5mrd9tvvrK91j5Yf"
Content-Disposition: inline
In-Reply-To: <20240604184506.007c4682@gandalf.local.home>
X-Cookie: Simulated picture.


--5mrd9tvvrK91j5Yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 06:45:06PM -0400, Steven Rostedt wrote:
> Jiri Kosina <jikos@kernel.org> wrote:

> > Right; that's exactly how it should be done in my view.

> > But if Daniel's tree has always fed into yours (no matter whether the '=
git=20
> > merge' way or 'apply patch' way), in doesn't really decrease the net=20
> > effort one level above.

> I disagree. I use to take his patches and pull them in. But having him do
> it, and also write the pull request, makes my job so much easier.

> Note, I review his work, but not some much as if I were to review his
> patches. I look at it at a different level when it's a pull request. I
> trust Daniel enough to not go through his work with a fine comb, but
> instead just look to make sure the general idea is sound.

I don't think the mechanics of how patches get moved about has a huge
impact on the effort involved - trust and delegation make much more of
a difference.  I've got several areas where other people are reviewing
large volumes of patches before I ever see them, those take me almost no
time compared to what comes to me directly because of the level of trust
I place in these reviewers.  These differences aren't really obvious in
the git history but they're very real.

--5mrd9tvvrK91j5Yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZgTIAACgkQJNaLcl1U
h9CdmQf/d1kORQjZfebrimsz9nQKjtuSkuysAI/x9wllP85x8QIXLY3nIkJDHbSN
fxMi+4MEirS20WgUl8g0A/c3aj5NRYTo60hcKJH2WVI7T2l4clPxfdRN12eMw4Nq
VgsLdeRG7pt0lOSv19otlPk1VO0+gkiEbENpU4Nno43X3TDa42Nj7oH9ztrXh5dk
rTDKnPFY9KME5THmUflD+7fel06fkEvmHplpbDLr+oSqJY+5F0naVTTRpGcPNsUA
zpdlavhYlZWh2BOw2wHV7ia6odBNaLlaKUeRuERF450nbKq36lML4ftpwv+v2fYS
2mEaWFQNeCpLU6KtS6lrYuDJLbQCOQ==
=bcun
-----END PGP SIGNATURE-----

--5mrd9tvvrK91j5Yf--

