Return-Path: <ksummit+bounces-2472-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D93BCA70E
	for <lists@lfdr.de>; Thu, 09 Oct 2025 19:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3DD273506C4
	for <lists@lfdr.de>; Thu,  9 Oct 2025 17:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7321824729C;
	Thu,  9 Oct 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kv8L+n3O"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB67C1E0DD8
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760032708; cv=none; b=AyQHq74CWvf+atiNI0FmuyJGUKKBj/veQo2RpVka1qNjskU1xMAECjvf847597kqVAWICvt0smQ/smGojPpqza0YXs+zl82K0+BPh6XtMqla8XVs4nDYEyf/dpOGBYdHLZ1XxboIvFi550r/a24noIbVVvoa8GeobSGfwaF/cCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760032708; c=relaxed/simple;
	bh=JPe8Tug4Pun3kR7WCbyM11sKLSU0ASOqDB0k3mZwoN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvNKqRm7++NExGC7VIJs8hrCNLLSM2YbBZYyKoo303b4/zybVTj2NKM8lAqzblgaA7Kyc8WAJrbuBaT/plu4oDgZTR1Air/o6FlAAdbz4YuplsoJjBo/qqy3lXeexa72jkOCIL8HBgPX/xdZFbPQ7CnW/WVi60CJY1uCEqiMxtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kv8L+n3O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1B1C4CEE7;
	Thu,  9 Oct 2025 17:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760032706;
	bh=JPe8Tug4Pun3kR7WCbyM11sKLSU0ASOqDB0k3mZwoN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kv8L+n3OmF3j8yKNPqRPbqlqx/w215Eahhi5PZ6L7g8NRCwZ0D0/pk3IpDKTJxbPI
	 b80e3IQsX+th0YZ3fGyM7IVyQdlyLUdmKiNE7OF5VZ24SP0LksrcBIdPCPCd+zcBNa
	 0/o4eER1Zy9UKPhJRa5Oq0i3omQnvTe5Av/W6eXIAsFH+/8p3gBeZPN0VfnZTcxScU
	 PCy/ozm1afT11p9wQP8z6eK6SaOmNNv+lNQN7+t0NuP02dXOY/Ap+lAE4ebEODL1RT
	 4DomTScIgcfQNyNQJemLwjuaGazeM1rY4/h7rjsPr7y3fdrH/VJV4oUn/1dvVsp2Rv
	 JLxkwDmTsjg1w==
Date: Thu, 9 Oct 2025 18:58:21 +0100
From: Mark Brown <broonie@kernel.org>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andrew Lunn <andrew@lunn.ch>, Chris Mason <clm@meta.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <71e5fa11-2cda-4c89-8781-4246df526f05@sirena.org.uk>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <MW5PR13MB56323B06E265F10136A1A2B2FDEEA@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t1kSsAkmntv8TptT"
Content-Disposition: inline
In-Reply-To: <MW5PR13MB56323B06E265F10136A1A2B2FDEEA@MW5PR13MB5632.namprd13.prod.outlook.com>
X-Cookie: Today is what happened to yesterday.


--t1kSsAkmntv8TptT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 09, 2025 at 02:47:52PM +0000, Bird, Tim wrote:

> I agree.
> We don't even have the resolve to get contributors to run checkpatch.pl
> (a freely available and imminently accessible tool).
> I think it would be illustrative to figure out what the barriers are to that, or what a proper
> incentive structure would be (and why we're missing it), before tackling the AI review issue.

I think anyone who cares already does get contributors to run whatever
tools by virtue of pushing back when that doesn't happen, if people
aren't running checkpatch it's because the maintainers they're sending
things to don't care.  For example I don't really care if people run
checkpatch but I do get a bit grumpy at people for missing some of the
audio specific tests, and the flow people are describing with the
networking CI is similar.

> There are open-source, locally runnable models out there.  They currently don't yield
> results that are as good as the large proprietary models, but they'll get better over time.

I think you mean open weights rather than open source there.

--t1kSsAkmntv8TptT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjn970ACgkQJNaLcl1U
h9DjJQf/UotdKB8Ga2/H2VS5zVGf9ogydT7pC/aIEut45mXTjXwcXjcIQ4iFhrYk
OX55aXU0mJraNItfjz5WUimZ/Ime54c+QRQ/atqRUsUCOQ+gcvuKRdrsAP9YGA5J
O8hXpGRgpf3IDUH6gha4d9Xg8PA48MzYG/UP07pdY8fSIZYTgZS2w/S6YKVsVap6
BuwfKP957ofrk2cIYJauoA47YjX4y1j7noIVBvWE1H6ExUx+eu25EKFbr5p0NJn6
sDH3gfRj+KK8Ko4GPdBIWMuO2QlUJSusEtJYddpnEC5bLcye4Kt80yCZVfLa/ll3
Q4hq7WPGJlAcnU4BUIRGfYdcml5/hA==
=FZS8
-----END PGP SIGNATURE-----

--t1kSsAkmntv8TptT--

