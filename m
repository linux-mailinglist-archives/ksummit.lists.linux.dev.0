Return-Path: <ksummit+bounces-1266-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F9908D04
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D66A288A92
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DB18BE7;
	Fri, 14 Jun 2024 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0VywziN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2ED6FB1
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718374210; cv=none; b=M+rIU9McytOJiejrfo22455XFlrStkk8yIy8YZgIk5qbzLwyZbmy6KQ2O/57EtkW4M5Ar6a7LX4H3bd6sGXoClBT04+37quLfpsNN5oI9zYizPI47pMCb9zxMDtWI2WdyWpFPpzlgTDNlA74n4Uf9WCt8iANgjSioj8iAoqfcwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718374210; c=relaxed/simple;
	bh=iSIRHjTTpujIyCGhny0y5yGm/gEFgnqa6ebje4r2o8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqxdBcp8N7s+QOtk6/AUhvwuo/FmHv4JdaM5WuKIl9UNFFsd+6iS0q+X9PqO+N7AryjspV2IcYjewY31/tX2127dW9163nY91OQ+UauYFSkUmlgW6CG3Pxzkg1XD3vYNQETbcLXNgP9xxVfyR+y6AEXAIU2NFI3eV2RcesXVVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0VywziN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0B2C2BD10;
	Fri, 14 Jun 2024 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718374209;
	bh=iSIRHjTTpujIyCGhny0y5yGm/gEFgnqa6ebje4r2o8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0VywziNerGl9HRdny5tZ9JmbcOTjKieHReWyfzLVRxnfuwtbAkVzsPLP9wN/bNHK
	 Wx8nyy+jSnXioLLw1ywJ/jZUW2y5NjWWfh9QhCfqgn5k1T0tY1KdEWtVXfTx6sHtsU
	 UzYDOahRiQsIlsD0A9A9vfq5SzTcnz/ky9zKfBK6/uhFerGji999ghLBs2KgMQgNJ1
	 uNarGc9q9jqYjvkWGl+inQvKglMYrnYdbi3MMopSGVRwZNKxpygOpNLiCmZzjrCrpf
	 mK2aK2LlUgbABntklqsScERWqLjtrof5z2xjnZtZkg78+MApuXeXwWBUQvY8PhlqyH
	 CMaMMuCn9Jfkw==
Date: Fri, 14 Jun 2024 15:10:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [3/4] Elevate handling of regressions that
 made it to releases deemed for end users
Message-ID: <ZmxPPH2PSxoryu11@finisterre.sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info>
 <20240613113455.GH6019@pendragon.ideasonboard.com>
 <nycvar.YFH.7.76.2406131336450.24940@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PNx8biINJBTqbxwX"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2406131336450.24940@cbobk.fhfr.pm>
X-Cookie: Your love life will be... interesting.


--PNx8biINJBTqbxwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 01:39:00PM +0200, Jiri Kosina wrote:
> On Thu, 13 Jun 2024, Laurent Pinchart wrote:

> > I don't think piling pressure will help. What could help is to reduce
> > pressure on already overloaded maintainers, to give them more time to
> > handle regressions. There have been multiple discussions about
> > co-maintainance models over the past few years, and some subsystems are
> > (slowly) moving forward. I would be more interested in participating in
> > that effort.=20

> Fully agreed. That's exactly why a few days ago I proposed the topic abou=
t=20
> exploring the options of making the merge tree more deep (by delegating=
=20
> more and making the co-maintainership model more prominent), as that in m=
y=20
> view is the only available solution to the current maintainer pressure=20
> problem.

In my experience deeper maintainer trees are often a factor in slowing
down patches, passing things between maintainers often just inherently
adds delays even if nobody goes on holiday or whatever.  Group
maintainership mitigates things like holidays but not things like
stabalisation periods.

--PNx8biINJBTqbxwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsTzwACgkQJNaLcl1U
h9B03wgAg4rwAdHb77NWFUOmGiS6GlPohZp0R2BONelLSZGdg1jAReyEag0HiAK6
v90RsKVeVRYploD5YYDnTm/Euo92+dA7JtLGCBwkKOtnWvLfQlYW8zyFyaJm+xcp
PBovjXyWk48WnR96vjaTBlnFvV1Rz7/eVE3SJoJ03SSzhzOOaDhGlF9e7be/grE2
bblLWqGvpArm87qCaohXDSBsa98np7p3oX92okefk7cx5n28nifznuLn83j8OSMe
Txxyasslteucxl5daL3J25YAucnQhR3l4RqqQ2qiL0mKyGW+6vTJUD2P3SgfU3TI
LcoMijWyqyH1/SmTnLD6SttVaN5iyg==
=x4lC
-----END PGP SIGNATURE-----

--PNx8biINJBTqbxwX--

