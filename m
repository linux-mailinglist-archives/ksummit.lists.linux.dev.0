Return-Path: <ksummit+bounces-1280-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB764908F5C
	for <lists@lfdr.de>; Fri, 14 Jun 2024 17:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C5E8B2FBBF
	for <lists@lfdr.de>; Fri, 14 Jun 2024 15:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A7919AD6E;
	Fri, 14 Jun 2024 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddabVID0"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BA016C855
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 15:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379730; cv=none; b=FPIxUd2+RI+NAmO40WaC2o3LbVsMhom2Ii96rpE4gHPRLcu0te/vcuHIkSWELfMo4v5LMJS3Zw1tovGhnFbO6AB6Mj1t3qixsTIhnbmVZ+3ii0IvLqdlqo+NeI/dZNBfLDcPp/+OGuXlu1p4XehuNfg/nfFNChRgf2KUp9pe0Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379730; c=relaxed/simple;
	bh=b+WAcbQTMi+OEPzu8hYYyJtQtlr9oT2ffVfqnuwd/II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnuWiiGAu6JYY8ykBHkGBBokkEmm0kB76oW9A+NSIsQALeForvMnQbbScBmPOMGIFIuTfPjhjSlhP4/J9Z3bxSoW3VTtDl9OYXbj39WHqOanMt+E2pWHDC71qWHZlQ1BIUVZA203RfutKhRWPdJNJJacD53M0RGacGwe+t/Xqy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddabVID0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36F4C2BD10;
	Fri, 14 Jun 2024 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718379729;
	bh=b+WAcbQTMi+OEPzu8hYYyJtQtlr9oT2ffVfqnuwd/II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddabVID0K/Z1oi2BdH4AJXvmQ+8Ap0UAm9sCPDbGI/GzBafKvPnlgwHSXnrk72VT1
	 Y1WVjE1B+xFiFXIAbDQlwgVOoNXbdoJMVz0h9wFul1IAhsO9/kjopc2gDbcD9gPP3D
	 TDF7lOcRAmOSKEqZBY+1L4TFUK+q/+1T1/D+WOo2d2QPyxVK376W/6q6yAuzW/PDdZ
	 GJHpgKqU8WbsIaej8t/C3UIUjQz511B23ziIoww2fbkuN2twmCuFWC/KtvPd72prqp
	 AmGcqqityjoSm+8+ZasLj4/umY4G2zlsfnbzL2vb7+OsbSDaXud1FKHXVfXmMEUFU6
	 ZKZq2l/7HquPg==
Date: Fri, 14 Jun 2024 16:42:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Jan Kara <jack@suse.cz>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <Zmxkx1od8a_5SDew@finisterre.sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <ZmxXBi1-QeN5ivAe@finisterre.sirena.org.uk>
 <20240614-piquant-chachalaca-of-chivalry-a5db6d@meerkat>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iXbYqg8XKaomY+f7"
Content-Disposition: inline
In-Reply-To: <20240614-piquant-chachalaca-of-chivalry-a5db6d@meerkat>
X-Cookie: Your love life will be... interesting.


--iXbYqg8XKaomY+f7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2024 at 10:51:53AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Jun 14, 2024 at 03:43:18PM GMT, Mark Brown wrote:

> > Actually now that you mention it some terminals (GNOME I think?) have a
> > feature where they'll identify strings with an @ in them as e-mail
> > addresses and if you click on one they'll try to fire up some GUI mail
> > client with a new e-mail addressed to that.  This interacts poorly with
> > using message IDs a lot.

> Yeah, but same would happen if you accidentally click on anyone's email
> address in the trailers, so I'm not sure how this has any different impact?

The suggested workflow was to go cut'n'pasting message IDs when using
them, it's a lot more likely that you'll click on something you're
actively trying to cut'n'paste individually than a random part of the
trailers.

--iXbYqg8XKaomY+f7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsZMwACgkQJNaLcl1U
h9D1+wf8CaTwctNfPJGc4OZq54zsTk8nNt8ccWqkCy+ij7Ohl6IQIBdahus558jn
1OnZAIfC8OZh6wwlO6aOaKIjUlErAkdapMY77hKHqPJ/MbAmqqkdeDw97lgeY+hI
JOnz3fSqMBUex5IrYGa+Iq9vWJYuKfry1o1lTOO1+SLtY6LztsdjHdfyK8Xz0rCq
jAslsAHXzNHSztKLc6tgq8NukX4xVQXC8JJPfEvNEYXPUNpbCHVxOiE/QEdK567f
tYvTwd1tGV5UgLdxoAHT4ZdLr8SOmllrhNF5ITXCco3Ruvb8J0rZr7vtmYZ1Fui1
VaRJvUsx4Mc3BGuxxTxBLFuZylq2Vg==
=kosy
-----END PGP SIGNATURE-----

--iXbYqg8XKaomY+f7--

