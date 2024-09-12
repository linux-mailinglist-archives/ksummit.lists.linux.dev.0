Return-Path: <ksummit+bounces-1566-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C49976F45
	for <lists@lfdr.de>; Thu, 12 Sep 2024 19:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63C0B281C46
	for <lists@lfdr.de>; Thu, 12 Sep 2024 17:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70881BF806;
	Thu, 12 Sep 2024 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvqYvDnV"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE31BDA91
	for <ksummit@lists.linux.dev>; Thu, 12 Sep 2024 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726160722; cv=none; b=UY/8qpTpMivDF0Bdkz0qfr+RgQu3bE+WSRVkZB4Mu6LXZQtqRZ73JX4Ug/MFTcoOAM+AdA7vYHX+dRkb5319IR3AmbMc/va8jJxU2jym9zRlJfSyz9xjz5C3Dw6Xbg3epRvrWNbjV2rNDdmA5zjwNTTQIvY23UoK7P9JfgdFvUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726160722; c=relaxed/simple;
	bh=d90voEUaaFdOjJJtYuegZXnSOraVNObrnty2OcwAqXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyrVE0CFRdHcGrVM3DMGQzBwWzKhFrHel3VTVpfGxdH/RVd+jSFVOcrxjFqmXMela2tTDbKGHh7/BphX8bW1UlY3YZhybCxZk9EnEGMhsS9Et1f4Nmu84LRpNxObxMOK+slUNuYpmQRVRClyMLjdI3Mo5VibuRsc6LCEht/9chw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvqYvDnV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A726C4CEC3;
	Thu, 12 Sep 2024 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726160722;
	bh=d90voEUaaFdOjJJtYuegZXnSOraVNObrnty2OcwAqXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvqYvDnVH/pj++tGZS1YW5kQ43xR02yqo9eCCHqi7ZoClXNFQYC36E879Nlg+fMrP
	 Uk447Y0ZmxWwwi3Co9Qn2lKDJAscYp68n4wyVFQFP/VVqalwrDIw7LjLf3EijuW2F9
	 AiloTMtcWdXAHXrTreOsCphPna0hX9E1JzBOWCB0IY6n5g+nldzTJVJUz0wsKtp4tn
	 g8K67s7BGFwEs1R7Bbl1e6fLlP67/7OjR0zzI7Ev6DA4olKPXskj56YrQ/I88WH56I
	 puxYxsOIu9tSRrohxDyO/PmjUywlpVV4IuBYKj1Z6VreI9giVTo8oqBc87sWOjUi9D
	 S6TgazdrNgh2g==
Date: Thu, 12 Sep 2024 18:05:18 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robherring2@gmail.com>, ksummit@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files,
 and invitation request
Message-ID: <20240912-marxism-doorway-eac24989e4b4@spud>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
 <20240910-specked-rigging-e255283d1f99@spud>
 <9d1af9dd-680a-4df8-a6c7-49a6f809d6f2@arinc9.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E/sMTRqAt+cd8q+R"
Content-Disposition: inline
In-Reply-To: <9d1af9dd-680a-4df8-a6c7-49a6f809d6f2@arinc9.com>


--E/sMTRqAt+cd8q+R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 04:01:20PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> On 11/09/2024 00:53, Conor Dooley wrote:
> > On Tue, Sep 10, 2024 at 10:46:03AM -0500, Rob Herring wrote:
> > > On Tue, Sep 10, 2024 at 5:53=E2=80=AFAM Ar=C4=B1n=C3=A7 =C3=9CNAL <ar=
inc.unal@arinc9.com> wrote:
> > > >=20
> > > > Hello.
> > > >=20
> > > > I maintain the MediaTek DSA subdriver and some devicetree bindings =
and
> > > > source files for MediaTek hardware.
> > > >=20
> > > > I am especially interested in the best practices of maintaining dt-=
bindings
> > > > and DT source files.
> > > >=20
> > > > There's this false impression with some maintainers that, as the
> > > > dt-bindings and the DT source files are being hosted on the Linux
> > > > repository, Linux drivers have influence over the design of binding=
s or
> >=20
> > > > fixing DT source files that did not comply with the bindings.
> >=20
> > What does "fixing DT source files that did not comply" have to do with
> > Linux, I'm afraid I do not understand what your point is there. The
> > bindings are the ABI, and fixing incorrect source files would happen
> > regardless of how the project is hosted?
>=20
> That's exactly what I think. I had a maintainer that argued otherwise is =
my
> point. Which is why I want to strengthen the Linux documentation.

On a bunch of older platforms it's pretty common that the bindings were
lacklustre or didn't match the devicetree and kernel source code, and in
those cases (which are almost always text bindings) two outweighs one.
Ordinarily though, if the kernel or dts don't match the binding they get
adjusted, and if there are maintainers resisting this, then point them
our way.

If things have been wrong for enough time for it to affect users,
usually the correct thing to do is fix the kernel to support the
incorrect as well as the correct. The same, however, goes for other
projects: if something long established is being fixed, the other users
need to be accounted for, particularly those that automatically import
=66rom the devicetree-rebasing repository.

--E/sMTRqAt+cd8q+R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuMfTgAKCRB4tDGHoIJi
0he9AQDLqjoEYYAGoV4XrN/QlmQhVypRqoJub36eEHVmO1CJBQEA37THo2yydP8a
fetG2hE3aX+LtC2E8ce1Mb5fi3UuxQ8=
=4sCg
-----END PGP SIGNATURE-----

--E/sMTRqAt+cd8q+R--

