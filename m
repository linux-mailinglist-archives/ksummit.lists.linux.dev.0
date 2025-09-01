Return-Path: <ksummit+bounces-2248-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4FBB3ED8B
	for <lists@lfdr.de>; Mon,  1 Sep 2025 19:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F8B92074EE
	for <lists@lfdr.de>; Mon,  1 Sep 2025 17:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C34E320A20;
	Mon,  1 Sep 2025 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D87cRFL6"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F6320A03;
	Mon,  1 Sep 2025 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756749156; cv=none; b=WyGKAOFTYL3lBdbGHOBEjp/WVR/rR4sZW9mOtIHUj06j9mZ7efWCd6pp84LNCieyiqZ5DbKWxiPNNxXDcB1odYDLdtfbApkWzg3131M63Sv6jruuINFlhikxdh6LIj+NYWw16acxoPGsMDx3uwhQsQp98louKgyDF/Ed1suUd5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756749156; c=relaxed/simple;
	bh=L6VKbaY1DzWiuLljzrAsNLjmpcn6sobUvSQPnWlYwbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlTxJcm67ku4lCFfHbttzjggUDpEvkq/gpt9cvte/Q0DjmkL/Ubo4BoQ9HUDO7sXp6jvT31lvH9UPxwAlbrc2HC5NvLoezvP5Z6sl1u37BPKH5GukyUgh/MI7LB58OWictSV4CTW8X81YGacMj3aWcqXp+ah/bb9nObgucUSJHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D87cRFL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20593C4CEF0;
	Mon,  1 Sep 2025 17:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756749155;
	bh=L6VKbaY1DzWiuLljzrAsNLjmpcn6sobUvSQPnWlYwbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D87cRFL6W6V8bIxQyHqS83VjZbWu5jEp5roGXL1etx17Uw1XmINj2JuRdcX4jI0Sq
	 KGFBe41GHIRa6gog5i1eu2vr8qTsiuFUH6pc5d4ETK037pBPQyV5sAbga2k8ytWV+o
	 LZ4VTLzIrWNwwEk2NzwB7WhpUAFyzXESGaVPsrpZG/i3ZAS3cbRDeVzjbkq5Wi3hfw
	 CpY9m5aDvMEdyedfab3sjHHIKkJLQMTCVnTgpQ+sQP/OR2ggG06wUM4qreUvGe7d7K
	 mATU+wwCfogNbSK/dfH73yHxPULzQDfQAY66j+T8HEHaIFKTcPwUsyPJ29OSNlXOh+
	 UqyB9PVvUCcHg==
Date: Mon, 1 Sep 2025 18:52:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wN77WJeNOGkqnEFH"
Content-Disposition: inline
In-Reply-To: <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
X-Cookie: Auction:


--wN77WJeNOGkqnEFH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2025 at 09:51:01AM -0700, Randy Dunlap wrote:

> Willy had a suggestion that we just make checking kernel-doc during
> all .c builds a permanent feature instead of a W=1 option.
> This helps, but still doesn't force 'make htmldocs' to be run.

make htmldocs is rather slow:

  $ time make -j56 htmldocs
  ...
  make -j56 htmldocs  2355.99s user 141.33s system 158% cpu 26:14.86 total

and produces a bunch of warnings with current mainline it seems.  That
compares unfavourably with allmodconfig on this system:

  $ time make -j56 allmodconfig
  ...
  make -j56 allmodconfig  5.31s user 1.93s system 146% cpu 4.931 total
  $ time make -j56
  ...
  make -j56  53468.11s user 4387.30s system 5084% cpu 18:57.77 total

and seems rather more likely to flag something for me.

--wN77WJeNOGkqnEFH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi13V0ACgkQJNaLcl1U
h9C6MQf/cPwUMQhQ2Qq1kznZ4C6xvoGGvBPLm+eVIhK59LlR345tClgOeKvKqWqu
uCzHCv8knUEDxtO4WDP0t7NMZlUtaVpcCOPo4c5UiJQ35L20qt+bfuU+TSAZFtJm
IOvdLbPOaP961tZpbgGLC95YQeH96D/1OgL0SfgZp4CH1RK57k95Uc1b4mtg++br
//UqeV8sy6HflIj/6aG00Ivz9di6lIIrLerNJo0gthkMk/SujAtglA/IVH4bfZfs
Hp3rdwktNooB7GZ1/HqkEn4pODsAwaIIxp7Al9x+xtzhpaXxrftkaKj7FTjQZ0V+
CL/OqCaxJY5/ZBZXXeGcNkcz3l/etQ==
=tDy8
-----END PGP SIGNATURE-----

--wN77WJeNOGkqnEFH--

