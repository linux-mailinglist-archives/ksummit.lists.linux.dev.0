Return-Path: <ksummit+bounces-2254-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAEFB3EDFB
	for <lists@lfdr.de>; Mon,  1 Sep 2025 20:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38DA7189FA48
	for <lists@lfdr.de>; Mon,  1 Sep 2025 18:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03230324B2A;
	Mon,  1 Sep 2025 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1hYNbMi"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CA221B195;
	Mon,  1 Sep 2025 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756752028; cv=none; b=MlaxBtllKSR4uaXVJ3s0PbPNQ82k/f0QWayekWQLSZzFfaDNj/CRelfblcqXakRfwIXT3qvvvdtpgPphCA88PuIoR55TtDqjYAcmo96F+7Jek/AHxibrGi+gLoNJvAFV3tc/u2dMPIvk/Jt6nXchz2LjRikuhBTiJmhdsYC2sBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756752028; c=relaxed/simple;
	bh=Tk+8kKQQpOe2TGLvX0faJ9iFvpoZcp0VeQLDPbZYNgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRxZO3hoSVFXj2v1rIW3cpeyY6IMSUGGh0Qmo0rvQkPQnRg8oARUjp3KYqXgNs55AfeqDt5dYrdTjJEHYsVtGv8mNUEdxEnPo8JHwBMc4gIBWWCz+a6r1beskjz22Z0F/2wEAJB/2iIda2SE5YELuQybzRcyLk52YtuP9OM8tik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1hYNbMi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DBFC4CEF0;
	Mon,  1 Sep 2025 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756752026;
	bh=Tk+8kKQQpOe2TGLvX0faJ9iFvpoZcp0VeQLDPbZYNgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1hYNbMieSv6Aand3Pk7u9Wh46NItgZmr2vAv+4H9vCa+332dgXjSylTAwQUtuxLn
	 AkeTVxVof720qYyP6UbhnUHZUj+PH3UFIYIQco0EkiDgrBrgxtXo0B+BhAEs2F0SpA
	 Vp6R31mGAhWor/Yr4aVWMQF6OH87xKJNGIjlxGr+rviaD+6FxgQVkvEYeQxCMj8kUe
	 VoYgoetsVY4cRBn+KDmptbScQs+KXGeKcIxR4H62PWUzCylANeDG9QManin8I0TWxi
	 Eq8wanpHXB7iUp6byaP6Mx/rI38i2l2uMoE0bQuMumcgKWnu9QDxVoblQMFPmSe487
	 gh4vUREWXVgfg==
Date: Mon, 1 Sep 2025 19:40:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <7f507a0e-3493-4b9f-a6b9-912efe49e5ba@sirena.org.uk>
References: <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <873496yqqt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dDWaKf6n1jBiuCXm"
Content-Disposition: inline
In-Reply-To: <873496yqqt.fsf@trenco.lwn.net>
X-Cookie: Auction:


--dDWaKf6n1jBiuCXm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2025 at 12:25:30PM -0600, Jonathan Corbet wrote:
> Mark Brown <broonie@kernel.org> writes:

> >   make -j56 htmldocs  2355.99s user 141.33s system 158% cpu 26:14.86 total

> That ... is weird... it takes me a little under 3 minutes to do an
> htmldocs build, using a capable but not stellar desktop machine.

> Which version of Sphinx are you using?  If you're not on Sphinx 8, you
> really want to be; they finally fixed some really nasty performance
> problems with that release.

I appear to be on version 5.3 which is what's in my distro.  I will get
8.1.3 when I upgrade, I don't really have any intention of manually
installing an unpackaged copy.  Three minutes would be more reasonable,
though without a clean build (and I guess something that errors on
warnings so I don't actually need to look at the output myself) I'm not
sure I'd notice any issues.

--dDWaKf6n1jBiuCXm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi16JUACgkQJNaLcl1U
h9CUrggAhUxWhMOVs9C50ArYzsdDXtoUec/L08+PUvaGcFyaNU+yathpMv4IXJnX
uT77BsFnwbtBzmD3LUusDmt7u5RwieQlpQ5b+wt4BgXMu+z71+bgYKzxgTXGSEZC
lQ5DR2x705lAGhTPHOvwz4WUEIyz2/GFyGC7VcdjnjAtZ/ko81rCkjswG8/jaZyB
fdLj7vZHZwPgBDP+/bOEQ5orxghuHFIq6jgSX91TLj+aV/upgNh6m0WWW6c1lsvK
XzH22jjpaBM7tX93OD3xuLw8AgxtJMMAzL/kY77w8DokF7qm//Ku14ID92g3CIJJ
2OObkIMmSTxKfPrA+TNuUosZOHBk1Q==
=6dFf
-----END PGP SIGNATURE-----

--dDWaKf6n1jBiuCXm--

