Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 944147E5BA5
	for <lists@lfdr.de>; Wed,  8 Nov 2023 17:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C58D41C20BC8
	for <lists@lfdr.de>; Wed,  8 Nov 2023 16:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF5918C3A;
	Wed,  8 Nov 2023 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inmjsEEe"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD267171C1;
	Wed,  8 Nov 2023 16:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4235C433C7;
	Wed,  8 Nov 2023 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699461879;
	bh=Buh1sdI2TaVPziIOmW/iRpyCELW7hoT3fa+2aTVivAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=inmjsEEe8LzTFdqa6tbxS75pShQeliqD22OLKFzMcIv0HHfiTNa1UKyfcMORVcNrL
	 8ZDRZtux2WxQeyxEDHJ2CSxLYJnDStxKVaw3P/gPribldc/auhiHMMoQQCLbSOvUl8
	 tlf0zKZjuvRIFjqUHQEoPpUcA4XQvEwvEiEVacF/0L0FNAL8PhedNRA+ov3ZH4NYpl
	 KQIZZbJT18+trBn0mYsUMhDMQqJSUzunTFztHMoNGESIooDIzfkyFXY4MqQhXet1Gg
	 CCPdxty7w/rwpWpFMoVLMmqLbnSOlRkgJySWkj5t0e6X/NLw1TGIdReHwdmORjyqAP
	 CLPJFTOBegFTw==
Date: Wed, 8 Nov 2023 16:44:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <20231106110547.6956a430@gandalf.local.home>
 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="08f+9Jp+ElFn4txf"
Content-Disposition: inline
In-Reply-To: <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
X-Cookie: Slow day.  Practice crawling.


--08f+9Jp+ElFn4txf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 08:19:46AM -0800, Joe Perches wrote:
> On Mon, 2023-11-06 at 11:05 -0500, Steven Rostedt wrote:
> > Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> > > For this reason, I propose switching the "F: *" entry in MAINTAINERS=
=20
> > > ("THE REST") to patches@lists.linux.dev instead. This list differs fr=
om LKML
> > > in the following important aspects:

> > As long as it doesn't affect those that have L: linux-kernel@vger.kerne=
l.org

> > All core kernel changes should still go there.

> >  (Scheduler, timing, tracing, interrupts, etc)

> If this is done, perhaps half or more of the lkml
> mailing list entries in MAINTAINERS should be removed.

> This grep shows all the section entries with
> 	L:	linux-kernel@vger.kernel.org
> most of which seem not "core".

The suggestion wasn't to use LKML exclusively for core changs but rather
to not have LKML added for everything that has a more specific list.

--08f+9Jp+ElFn4txf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVLuvIACgkQJNaLcl1U
h9DxsAf+OmLGzjZyd86DiRtdmwthBelEZUpluseWRj+aVuuKW/TqN/QokUx4Gq5t
6X1ZHWedICDtEBI0fjvyMnm4moupFHrrCkulMuaRSUl8RUcV25E6Qt4nDV6o3Ge9
clVKhbiqwigRN/9s6AVCq/rf5tDCZ5PeD7Lz07XvHY9ebk5TiFtsWgAaR4Q6Wy1N
fLDscLIQqodLDkBWV8Cf+8GxRoUNWQFIZWfE6Ey5HKS4J23es60yhvgMC+ceGM7r
8CtxvPYBE/C8yvav+OPU7R3QN7WbV2dmSrC+tFZlMfzg8xJuLEOuykbiLNXUOuut
AtNOmyxTcPZtn4mJnHP28r0UqVVJmA==
=DByH
-----END PGP SIGNATURE-----

--08f+9Jp+ElFn4txf--

