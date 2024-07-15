Return-Path: <ksummit+bounces-1424-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB06D9319F8
	for <lists@lfdr.de>; Mon, 15 Jul 2024 20:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8F41C21E57
	for <lists@lfdr.de>; Mon, 15 Jul 2024 18:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8905FBB7;
	Mon, 15 Jul 2024 18:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zc5J8MEz"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2F74643B
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 18:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721066679; cv=none; b=HoRQmxo6H53VwbLxrgQOBWC84gAaGfoO4WhouwYN6clM52BnXJowOcRC+DdZG1GwYnOA/vP8zfNvspFSNPsdcGI0WyDPdpPgXBO9Bj2TR1tGB0mF2nqLfmeLD0BpaJhT+X+RI3HM/wL0ilD6jb/OmRVVSXBc+Cj+ShgJPqaS/C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721066679; c=relaxed/simple;
	bh=yyFFvDTBKcPC10v/7HxgfTmp619RY4YW/D3gdevVbyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hACsL3yK9aHkyE0yxsaFFe1FGSOU36aL4Fn79K4j7rLMv3p+EdH9mapaTpVXyqhPWbj7IYKAob2MALdEcBxJVq4rBA9cv4HmMRX4I0IBCdqX/E+kGixJFUX/HCpCtFctYVEPxNRFmjZt9MQCRd58ze9iA97A6zlfP2HgwTWwKRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zc5J8MEz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F68C32782;
	Mon, 15 Jul 2024 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721066679;
	bh=yyFFvDTBKcPC10v/7HxgfTmp619RY4YW/D3gdevVbyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zc5J8MEzA9ZdS2TkD03iNBkOjVsyJbMRCS2SbxC07H9aMxeVik8+jPNGZeuk9JRPh
	 HmPEWoQy8z9s9NsehtPxml+zNSo+vjK/9WNIwLha2wh/ClhDjJzw43bG8rjbt3CMW/
	 7ALejxjrcXcY6CZv3+LV/M6PvPxZgWSFvnj4MMPP37brMx5zu/9w0LF5xFZaQnf9LE
	 gwg2ZFty/1rfG+OPLNvIweDpE7XNZHxTkxNsXrJdvOsjBI/AKAfkCIS56f/dk8CBk8
	 lMPms+zYVjFnzk1KoFKmIGGLITmSGZH937UgcMbyBwzHwl9WN7n7gygbShB7XU+/NZ
	 DRJUV9jpy63qg==
Date: Mon, 15 Jul 2024 19:04:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <8a0d05e1-71be-445e-afcf-4764149ea60a@sirena.org.uk>
References: <ZpQdJpKhIzmf3veU@sashalap>
 <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
 <ZpQ0soWV6zIpgigf@sashalap>
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
 <2024071528-cahoots-reacquire-9eab@gregkh>
 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
 <202407151434198c3715e9@mail.local>
 <2024071515-zestfully-womankind-1901@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nltta/5Aeic/rvIF"
Content-Disposition: inline
In-Reply-To: <2024071515-zestfully-womankind-1901@gregkh>
X-Cookie: You'll be sorry...


--Nltta/5Aeic/rvIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 15, 2024 at 04:40:01PM +0200, Greg KH wrote:
> On Mon, Jul 15, 2024 at 04:34:19PM +0200, Alexandre Belloni wrote:

> > I'm very surprised that it didn't cross anyone's mind yet that
> > contributors and maintainers don't bother using Cc: stable because they
> > don't care about stable for various reasons. So the behaviour is nether
> > good nor bad and doesn't have to be penalized.

> Totally true.  The first rule of the stable tree is "it will not put
> additional burden on any developer or maintainer that doesn't want to
> participate in it."  So if you don't want to deal with it, wonderful,
> don't take anything and just don't worry about it.

FWIW as we've discussed before I stopped adding explicit CCs for the
most part since AUTOSEL is picking up far more than I ever would so it
doesn't seem worth the effort to filter which is a variation on what
Alexandre mentioned.

--Nltta/5Aeic/rvIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaVZLEACgkQJNaLcl1U
h9DtxQf/dlZzW20im7xmPZCwDJZM712/bz1/JJTwQt/VCiw4Q4OEPO3Ih4ChZmzz
uosaPjJp6B894v3rGAgAEgyQe+DY8slS7tIeqXvYoKhJ2J4QYCnHgfc10V8TVVVL
AP72xV9vYfzssoUTjdhsE8AMMp6ymQEQM90ndxsniOnUqqNF/fWx907H+a+McXd5
xsCYH40/CIp6SiVzsCACqmUpd+Dxxjo8soaNhTroygKsPMvLfmEbeRdAQAeJHk9D
NSDaIBuY8VJ3qprk/DJE0lzUezIYMG1XH95tLpP1FLqtU1RsL2GLQg451UVmLsG4
k8+Ko5ns+f9566oROqD+NfkGh0/ZRg==
=GGik
-----END PGP SIGNATURE-----

--Nltta/5Aeic/rvIF--

