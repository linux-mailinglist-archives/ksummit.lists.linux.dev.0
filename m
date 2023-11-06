Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BF7E302D
	for <lists@lfdr.de>; Mon,  6 Nov 2023 23:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD5C4280E07
	for <lists@lfdr.de>; Mon,  6 Nov 2023 22:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131631CF95;
	Mon,  6 Nov 2023 22:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="MuvOrFn1"
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8752D057
	for <ksummit@lists.linux.dev>; Mon,  6 Nov 2023 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id D9EB41C0070; Mon,  6 Nov 2023 23:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1699311162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p3xRYin5AFzKjkUb7KScxOlgxl2YXSXBMohOhXc8190=;
	b=MuvOrFn1RjbdISpMFQVAdHzOCd9lpVR1oi/WHiT3a5kxftskwQMiY0VEy+FsJtMhoz1k0q
	57XobudCvCoPHnYO4API3OHgp+ORAXVHBnk1YEwFheGX7oYUfbQJOpqCeekar1aVUPnYrZ
	0Qx2nEsGtdNV/gLwBJvKKZVA7v9dVyE=
Date: Mon, 6 Nov 2023 23:52:42 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <ZUluOoDjp/awmXtF@duo.ucw.cz>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zg8p8u0V1AGyxVXL"
Content-Disposition: inline
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>


--zg8p8u0V1AGyxVXL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
>=20
> About 70% of all vger traffic is linux-kernel@vger.kernel.org ("LKML"), w=
hich
> is explained by the following 2 facts:
>=20
> 1. There are ~2900 subscribers to that list
> 2. It is added to all patches because it has "F: *" in MAINTAINERS
>=20
> In the past month alone that list received 33,000 posts, which translates=
 to
> about 3.1 million messages delivered daily. This has pretty critical
> downsides:
>=20
> - due to the sheer volume of messages, LKML is generally seen as useless =
for
>   holding any actual discussions
> - people tend to subscribe gmail accounts to it and then filter out what =
they
>   don't want
> - due to gmail's quota policies, this generally results in anywhere from =
50K to
>   200K messages stuck in the queue all trying to deliver to gmail and bei=
ng
>   deferred with "this account is receiving too much mail"
>=20
> For this reason, I propose switching the "F: *" entry in MAINTAINERS=20
> ("THE REST") to patches@lists.linux.dev instead. This list differs from L=
KML
> in the following important aspects:

How many patches are in "the rest" area? I don't think it is that
many, and I believe those should be broadcasted, as it is not clear
who should handle them. And lkml seems to be reasonable place for them
at the moment.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--zg8p8u0V1AGyxVXL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZUluOgAKCRAw5/Bqldv6
8uX9AJ4/75TopttvuWGzD+pIR+ZywPKywwCggPoshksvlcyx5UHWMOB3ZIyzj/Y=
=fkNi
-----END PGP SIGNATURE-----

--zg8p8u0V1AGyxVXL--

