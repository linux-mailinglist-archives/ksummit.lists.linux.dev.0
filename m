Return-Path: <ksummit+bounces-2348-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907DB532B0
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 136EE3A8EC6
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDD132143B;
	Thu, 11 Sep 2025 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imTdargG"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECB15746E
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594920; cv=none; b=GKGoPbGjROCxTb2kJ3/moRtgIJwyG3VfM3Etl9vLE4A+pGYEleUbtvl/GBPy2WhSN/Z6c8/Z1tS5lBKMW9ZoCeTpwwArv9DnuLqWEvk3aIVJZGoTpv5kfROFsNh28MesOwAv8dF7cwBgbtybLVZwGK20y4QFkSKO16ZM4YPdh6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594920; c=relaxed/simple;
	bh=ubO8rsQCMB0ES5TedvqhsAC7/MOsZhDvIN8aaCl+aBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCmT7rUPJO8gQUiLZP5fgWGlsBeHyKXwyHQIOKzcrYlTcTAyjJtWMJIGUJ/UKzqtGlin07PjaN04B2dqaIRzWFXdoYhOwvOuT1Wxoj4KcyY7Svhcsexi9of5F5wEf6IzlNnxeeyUYZsoOcyPd9pr2F1I3EV5STX1fX7D5gloiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imTdargG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACC3C4CEF0;
	Thu, 11 Sep 2025 12:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757594920;
	bh=ubO8rsQCMB0ES5TedvqhsAC7/MOsZhDvIN8aaCl+aBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imTdargGVB5PywUctMy3lysDmubaueIWBplnjJ2aneNZ3nvZZ5gcl7WYFuVbGKvFl
	 fJZbHFtaczRRNRZBRB0isGd+jMWAt4tqh1ereQmITO7MUjsCTuLyNBxH82cBbzgKAl
	 Jj+aCQ2qS/JzUcm0NK4tk+s7zs4eSBCEDTQrhyh6rVr0VpZf7o2yvdz9sYknMkRemz
	 2Y+wTJ7EIJmokYzdU85COUSp0NbGNafeP3wgnKCYqq2nxsmmV3zeGhBhcCC8lXVR+i
	 E5y2fTjdHGSl2Q23v2SSUg29SOYramTIzONybk2E9YQKDuE+LqXt1YuJRz+xH/zb0o
	 iduKMWmDWCdsA==
Date: Thu, 11 Sep 2025 13:48:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <e9b89f35-ddfb-4d3b-bcc9-a9c15b903335@sirena.org.uk>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
 <8e0590dcae46d8f8c3b8c29427b4c8ced227ea92.camel@sipsolutions.net>
 <20250911123624.GE13915@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="anoNyE/Bm5lhWGwh"
Content-Disposition: inline
In-Reply-To: <20250911123624.GE13915@pendragon.ideasonboard.com>
X-Cookie: Your domestic life may be harmonious.


--anoNyE/Bm5lhWGwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 03:36:24PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 11, 2025 at 02:35:38PM +0200, Johannes Berg wrote:

> > If they end up in both trees with different commit IDs it'll get flagged
> > (and you'll get an email about it), but presumably you'll drop them from
> > your trees pretty much as soon as that happens, so it should be fine
> > afaict.

> If it happens as an accident, sure, but I don't think it's a very nice
> mode of operation as a standard process.

Yeah, those emails currently involve a manual step in sending so either
that gets automated (possibly by flagging the tree as "this is supposed
to happen", dunno might be too much work?) or the person doing the
sending might get fed up.  I'll try to take a look at the scripting
during Stephen's upcoming holiday but no guarantees.

--anoNyE/Bm5lhWGwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjCxSIACgkQJNaLcl1U
h9ATMgf/ZS4Su5DDdscRx39wpO3ikVCawD5cPO0DZzkmB3LR3LZoAsp6WK02cdp0
DwiIw+5klPjegKbO+YUuE3V65JH8DgAnBjpVf+VJ/Mi5NO3mp1XYReibaXjEHWA5
TFmlu4EnQP0cx/XdDeb010m/ZJbjrZ8X/c5wQe+7lHKAEK3pI+t/i/qiTmCmIX2S
VVW9GX9ticN7YSw+Z7A1yUi+P3DeHmUrUGsqeUxGvwd2sGJGQ7jX4MkNRa5oj7vl
pccT8eYhGSXjZrw+B4JnexsD2bpuL9s/nbvVEdjNCIdkYB31s64OEzv90G0KjnzI
SjuWTTMZ69s64Jclf21A+zfdxI1d8Q==
=g6wJ
-----END PGP SIGNATURE-----

--anoNyE/Bm5lhWGwh--

