Return-Path: <ksummit+bounces-1560-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 083DD974519
	for <lists@lfdr.de>; Tue, 10 Sep 2024 23:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B149A286F48
	for <lists@lfdr.de>; Tue, 10 Sep 2024 21:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A6D1AB522;
	Tue, 10 Sep 2024 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDyscO6r"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ABA1F951
	for <ksummit@lists.linux.dev>; Tue, 10 Sep 2024 21:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726005235; cv=none; b=tJ+uawZASdFcOF0lGsuLWcnJNnfs+4sNHlCvoUh3dRAAD3x1fooeiCQyix3qWSt/8CDDJF6/A5xDNcGIiH6U1ms0AD0vVJ27lmDl1cCqxVggsDe/ckjnopd2Sv87kR/QWTYsZH2cLBf2T9JWxn9xX9iu82fxCPiKHP2rfyaer6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726005235; c=relaxed/simple;
	bh=e/8L8NQruxbI1E+wX+g5hGsMxRFcR4beC4I4AbpjNeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hpq8j+3w8OAdD+CKXcklX6fnaK1vcpTrkRUv7s99RpXqURNfKaQrDw0rH4Xwmy7GJd+ydh+lSLiVfTQPuAtTV9IEk1ga+WoT744e2pdmfdJKq6PFEDKMVC+JpWfXxil/jhZItAJY/FBNWDfQ56ZvvEJr47SCwvLyhL7/1xe6cxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDyscO6r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937B6C4CEC3;
	Tue, 10 Sep 2024 21:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726005234;
	bh=e/8L8NQruxbI1E+wX+g5hGsMxRFcR4beC4I4AbpjNeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDyscO6rrbqWMVG5rzDHPOrkv6CsidzfodCsotatqydEUkzWa34lT6RUXggqlPtnt
	 yu0jJsMC6soAU07ns/plEJI7ba+rrUTqVxOfUs763Z36AzkjB6x/mTPgG45Y6KH1o9
	 vCxPh4hjNKOPwIDMWGwlZ8V3Lu4wdr+kkqPvAb64BgMt0NXYUHi9fKXzTTQCYsro7z
	 349Nyz0VtyLtPcVlln+KF80P+0CBBX96dQ1s3LqmFa4m5uDyP8jW1hzad+L6qmydqE
	 khCL2gGm31YlkARSqXLCSfaIhGZ0Wp9cpCfYWCnG61rm6oVUeZttTJxmhkl59OWUA9
	 bLKrsTd8jJ3ew==
Date: Tue, 10 Sep 2024 22:53:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	ksummit@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files,
 and invitation request
Message-ID: <20240910-specked-rigging-e255283d1f99@spud>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C/4EnvtszOPPL5fj"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>


--C/4EnvtszOPPL5fj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 10:46:03AM -0500, Rob Herring wrote:
> On Tue, Sep 10, 2024 at 5:53=E2=80=AFAM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.=
unal@arinc9.com> wrote:
> >
> > Hello.
> >
> > I maintain the MediaTek DSA subdriver and some devicetree bindings and
> > source files for MediaTek hardware.
> >
> > I am especially interested in the best practices of maintaining dt-bind=
ings
> > and DT source files.
> >
> > There's this false impression with some maintainers that, as the
> > dt-bindings and the DT source files are being hosted on the Linux
> > repository, Linux drivers have influence over the design of bindings or

> > fixing DT source files that did not comply with the bindings.

What does "fixing DT source files that did not comply" have to do with
Linux, I'm afraid I do not understand what your point is there. The
bindings are the ABI, and fixing incorrect source files would happen
regardless of how the project is hosted?

> > I'd be very interested to be involved in or kick start the efforts to t=
ake
> > dt-bindings and DT source files out of the Linux repository into its ow=
n,
> > separate repository. I believe, this would be a great step in addressing
> > all the project-dependent bindings of Linux, U-Boot, OpenWrt, and all o=
ther
> > projects, to have a single, unified repository to describe all the hard=
ware
> > that exists in the world.
>=20
> This! This is precisely why we don't move things out of the kernel.
> The kernel is the location that has the most hardware support in the
> world by far. It is not even close. Really, the only h/w missing are
> things too small to run Linux. And with all that h/w support, comes
> the people who understand the various classes of h/w. Those people are
> not going to come along to a separate project. It would be more work
> and there aren't any maintainers looking for extra work.
>=20
> We already have a separate repository[1]. U-boot has recently
> incorporated it and is happily (AFAIK) using it. It happens to be
> generated from the kernel tree, but what doesn't work for you there?
> I'm happy to discuss what it needs to work better.
>=20
> > I am already working towards this goal by
> > improving the dt-bindings and DT source files on the Linux repository
> > whenever I can.
>=20
> That's great, still plenty of work to do there no matter what
> repository is hosting it.
>=20
> > I must be quite late to make a topic suggestion but I'd be very happy t=
o be
> > able to attend to the maintainers summit. I've already registered for t=
he
> > Linux Plumbers Conference 2024.
>=20
> This is probably not a maintainers summit topic. There's a DT BoF
> scheduled already that Krzysztof is running and supporting other
> projects is on the agenda already. I won't be there in person nor will
> I be awake at the scheduled time.

FWIW, I will be there.

>=20
> Rob
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree=
-rebasing.git/

--C/4EnvtszOPPL5fj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuC/7wAKCRB4tDGHoIJi
0qItAP91kjtDVyM1azx5K267TenxaBwTV2ZYaZcLTzxo+yau6gD/SryAhB+GVttB
gKGrRunQH/TMfSuhMgxADPEoBebg4w0=
=QEsJ
-----END PGP SIGNATURE-----

--C/4EnvtszOPPL5fj--

