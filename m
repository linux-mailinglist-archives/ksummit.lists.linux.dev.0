Return-Path: <ksummit+bounces-2493-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F14BCF38F
	for <lists@lfdr.de>; Sat, 11 Oct 2025 12:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DA4E4E48BE
	for <lists@lfdr.de>; Sat, 11 Oct 2025 10:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCAE257835;
	Sat, 11 Oct 2025 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDVuvYMp"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FD2258EFB
	for <ksummit@lists.linux.dev>; Sat, 11 Oct 2025 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178525; cv=none; b=jR42ws4fzera3ov6sbOLfqs3vFueW98pqXw8qsic2wXTLgA34t1gSfLClSbFzGBCk4bso40fpwAfTIMjjz0iMIUxSkAXG5rn/kLotpfRew5gysqyOPBht02JBN53vlMRAwzDvSFQj1buctxKQ2cAnyBF/7YhuOxOEjA+92aDoS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178525; c=relaxed/simple;
	bh=EZfo5tC3WB6uIX1dVYBoXeoZOJJhaQkuFhfPO315fMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pl3GUvmzv8nq4JyStxsRJ+JHbswbBUdjxk0Qt8ffRU05NG2e8wviTEQaoQjbh9m/3Bs9Z+XSCtvOpG12kmizxGcO+YI/AK0znFviM3YqMwKFqTG+XZNbPsjMUyJkKc7lBuIvjycwhrejRkqTUkaNA6XWOzzm5pf8f83pXVqswV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDVuvYMp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DE0C4CEF4;
	Sat, 11 Oct 2025 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760178525;
	bh=EZfo5tC3WB6uIX1dVYBoXeoZOJJhaQkuFhfPO315fMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDVuvYMpX0r86HcSj8FALN61vpN4Mj10KcenHbNXRsh5Pd2Qk8gyrMUSs3iHYp+2i
	 zhREtTdft2CH1+w15GKpJrDrxiMmH42WKVKQ6aCUXB+pp6B2Nlx9J7HwenIdossHwQ
	 jYM9JxatKzfyFQrJxprqWvRyGBuge7/Xn+h4Mz9ukV/aOcEPg9U+u6zMSKOgCfyvN2
	 ZpD8aFQVrwgYZgQZ3yShjwfF465TyVmcgy2faCRO8R/S8v1Ha4FMAesG+ILRMZNWhx
	 VQYHFz2U/GTRJhwkS6DjwEcNIiZExTZ/tCYDCASMBNdSlVwDnlugGxN3lotJpfkSsX
	 CcGQ76MtbYKxw==
Date: Sat, 11 Oct 2025 11:28:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Joe Perches <joe@perches.com>, "Bird, Tim" <Tim.Bird@sony.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Chris Mason <clm@meta.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOoxWiE2Lb6xcYbr@finisterre.sirena.org.uk>
References: <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <20251009103019.632db002@gandalf.local.home>
 <d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch>
 <20251010075909.GE29493@pendragon.ideasonboard.com>
 <MW5PR13MB5632C7D79221CF57565DEEF2FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
 <739c7a03558c3c8642fc6a51de4d679ecd389365.camel@perches.com>
 <20251010121127.05381ba8@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vEzHiguwpvC3T+pK"
Content-Disposition: inline
In-Reply-To: <20251010121127.05381ba8@gandalf.local.home>
X-Cookie: If in doubt, mumble.


--vEzHiguwpvC3T+pK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 10, 2025 at 12:11:27PM -0400, Steven Rostedt wrote:

> Note, checkpatch.pl fails on pretty much anything in include/trace, as
> those files contain complex macros that are basically their own language.
> Anything that tries to make them follow kernel conventions simply makes
> the output uglier and harder to read.

Some of the arch code is prone to those issues too, IIRC as well as the
macros inline assembly is also prone to upsetting things.

--vEzHiguwpvC3T+pK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjqMVYACgkQJNaLcl1U
h9BSfAf/cNwOWFaihCOUWR3kQcp/BxR8ApRLNzRYgW6ma+9CaKCOZRtUDMyylrLv
DBVqn19VObafvAWZaLPWyDnQIrAMjlbN/t2BC9+NgkMP2jgsUbIJQUbtoGUmbekp
6NhcS5CbBGjavo+Dg97gN4ZyFK2HBUqIKQ5qk2gqDUWUEEim26jzMoeR+EKWQEFA
gVjKj7KYTuoVwv8Q4mMyO2bTJeopAvjVdcqe5VWtCZWurxEHjjpo9W5PSSPnjvqj
6tWm9hvVNymp3tciayfrHsPUeCUF7Ryq9GuEpcgCa+ZGD5Sw1Zp2FAYX/YWPSlzD
ns9Z2kv7I5QETjAJrVFFweas7QfYRg==
=e5J1
-----END PGP SIGNATURE-----

--vEzHiguwpvC3T+pK--

