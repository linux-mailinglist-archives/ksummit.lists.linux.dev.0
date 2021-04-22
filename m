Return-Path: <ksummit+bounces-98-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFE368372
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 1A1733E767B
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F004A2FA0;
	Thu, 22 Apr 2021 15:37:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A66D70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:37:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD90D613D8;
	Thu, 22 Apr 2021 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619105834;
	bh=9eLwVZ1czfSPNNmbN5qEBdKsPRU88Rv5gF2Ogm7NDds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gU5In1p0Hgb1egrqKE98vS46j3pukW+Wpgkf2E6Dx4huQCs+BuITfcdAfy9c26fNM
	 rFtPD6F/q1zz3KafW31pdi6umsye1uRS92tfmhR4CRoskeoPXgNHoPuN6VQ26YTvoq
	 E4ROLulz0VZeYkQrF62tC74xtgRO16JcQZTRimBBXP0LkV9DxqeZuFZKBxV7fdG5kN
	 w22iLLt15Ie6/mq1ZSvMgGRJ6cLlvWI95LZCDraPIaIPSz7YcC+z0WDAUCpwkFhpVz
	 WAd2Y1wuh/3RRRhgqCh4mHZ1tPmhYzfStqiZSBKaYJu5etwMRvjCKaxxJwrX6Zm3rt
	 A1WiCl6wpkoCQ==
Date: Thu, 22 Apr 2021 16:36:46 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422153646.GI4572@sirena.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <yq1o8e6shil.fsf@ca-mkp.ca.oracle.com>
 <99289ff4cf7b1e59f82c330728c80dc7e63319a7.camel@HansenPartnership.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UthUFkbMtH2ceUK2"
Content-Disposition: inline
In-Reply-To: <99289ff4cf7b1e59f82c330728c80dc7e63319a7.camel@HansenPartnership.com>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
User-Agent: Mutt/1.10.1 (2018-07-13)


--UthUFkbMtH2ceUK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 08:28:00AM -0700, James Bottomley wrote:
> On Thu, 2021-04-22 at 08:32 -0400, Martin K. Petersen wrote:
> > Another metric that may be worth capturing is how many Fixes: tags
> > refer to patches authored by this submitter.

> Or perhaps invert it: no bug fix without a Fixes: tag.  Some of the
> human handlers of robot based finders, like Dan's smatch, do go back
> and figure out where the bug came from, but if we encourage the rule
> that if you're fixing a bug you must identify the origin and explain
> the bug it may help weed out some bogus fixes.

Script that use git blame to generate a commit to put in the Fixes: tag
incoming...

--UthUFkbMtH2ceUK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCBmA0ACgkQJNaLcl1U
h9ACyAf7Bl9TaJg3ZFqps58sVpwTfgOYHSMjSDnVzsNx5KDs56f+mCT3bECOC7MZ
7WCYuw6tigOQOvhVaIkcyfWObHxM8hF2NScZESEugy73Sgyhq7mY6APUx+ncxOKf
0mtheHpj8RqiOhW7kAl7WfxxgZ8OR6R12nGeknTh9b7giuCIsftYTivlJ2SjQvix
gbdC1tCQSigAVpYDocEND34EmllTd0fTeIdbAWzX3l2NUM0gBKa3qExFj2ghtRK1
LCHgGNWmS4OhracutnqUmaPu3DZuwGA+PqFb0lkkyEOcPnYwO6oC0/1DXBHjqcet
izwjPR0W/fH7Hoq+ZYIaVgrNpqZLuQ==
=6/tS
-----END PGP SIGNATURE-----

--UthUFkbMtH2ceUK2--

