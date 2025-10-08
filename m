Return-Path: <ksummit+bounces-2447-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF518BC69C8
	for <lists@lfdr.de>; Wed, 08 Oct 2025 22:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57FA54E9E1B
	for <lists@lfdr.de>; Wed,  8 Oct 2025 20:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66522566E2;
	Wed,  8 Oct 2025 20:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jj6uYgni"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5F1EB36
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759956787; cv=none; b=ArSPpEoTNJzZZJSRvwe79CZnid0nrlsPQTcBTTA75Zp4eTcCC2M1HU0ZXWmoHBSl4h1kVove35ZXSLhxeuoqx6TgXOnO01ctZxTyUB9LoxVOCy7rfzPC2ciKJuXXBv2u4Jf40G5FAPHgRa71A32YgnSuoRN1za+/tggT+qpODjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759956787; c=relaxed/simple;
	bh=lUx5yXmuBhEcITptFpKEr2xjLvBf7VIKUEdu2pD83bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQC8ErxB2xDszisVopdaeBDmyVQl2xbpY26WkiLPiWOQNIlY18Nd98cyxo1OariFewZTubS65miUgvcZr1Nq6DfEbUOey6H9f1aIBIKGj9AVgtTSY5hUr/BFTpf5NuCcgSq6XC+DjeRauYPozA+L7P9P/NOwMAtUmy/EI30cfyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jj6uYgni; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3451FC4CEE7;
	Wed,  8 Oct 2025 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759956784;
	bh=lUx5yXmuBhEcITptFpKEr2xjLvBf7VIKUEdu2pD83bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jj6uYgniPPKG4GdrYXUBzkh+UaW1qB9lwnOIVv/x5ztk2VXrl/PTh2EcNGG1b/ely
	 vs3B6DorTkr6LbA8e43CM6gjU8YwGDw8shWKAPuFSjHJu+Sho6LpakOR/k5IwlSMv/
	 c/AsHTEA0hS53296oRa2D5O1DABypyHwOXKmH1gyg09ljmIDXt7ByZFTN6o1WSluBI
	 jLv8FCScPE1Po0ILYXD+HspvRvXk5qZmygGO+Na0nGT5n/uP0zsKHPjDOtHFymZ745
	 TrX/s8mRdOGI2LhshIY7sXMJElYysFrmYGEaROyrrKK959+StDg5v4x1ysU8BuC7pB
	 UZbvNAKlc8K+w==
Date: Wed, 8 Oct 2025 21:53:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chris Mason <clm@meta.com>, ksummit@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <693be05a-2b23-461e-904e-f016f33c208e@sirena.org.uk>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <aOa7Tn0QbXwL-Ydo@x1>
 <20251008193349.GI16422@pendragon.ideasonboard.com>
 <aOa95ZFLXgaEh5PJ@x1>
 <64f6eab8-1f0a-42e2-835f-a548d2fd6df5@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MMG9FvMgaEkvE3mi"
Content-Disposition: inline
In-Reply-To: <64f6eab8-1f0a-42e2-835f-a548d2fd6df5@lunn.ch>
X-Cookie: 10.0 times 0.1 is hardly ever 1.0.


--MMG9FvMgaEkvE3mi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 08, 2025 at 10:29:11PM +0200, Andrew Lunn wrote:

> But this also requires these tests are reproducible, and that is one
> question i have. checkpatch, sparse, kdoc, Coccinelle are all
> reproducible. They give the same answer every time. If it passes for
> the developer, it should also pass for the Maintainer. But is this
> true of AI tools? Are they reproducible?

Even for the more stable tools there's issues with people running
different versions of the tools, or for something like DT validation
running with a different schema version.

--MMG9FvMgaEkvE3mi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjmzysACgkQJNaLcl1U
h9D+ywf7BXmsjBKAG6a3qzJdHPdiYByxqBRJl0M+f18ng/cDGfTmJQOBua8/ZO1S
NaArbebPdr+YDCMBZsUbwhSxijsHoOlc7O4QLXpzwzXOEhacpBNqZe+vzYaKNlJG
O1/d4pE/XoDc6Zg9KwO6ZUz/H0InCWkaEVr81xooyYOtknEEyd8vtLcX1vC4i5II
0U4meHA4trQpzqX4YBwqz6XOI34VhsdoXbfhvFt+La3RkANzY3KQ/wdV+OfgjHBp
ZbtySF/jE9SNPoQzNMxEIK3tP2sCTUWJ8Lf6zRdH6BrwuRO30LjTMIuHMnXUI7/E
PBsI60+j4lYSyErS8Bjmer9DwjQj+Q==
=FKw0
-----END PGP SIGNATURE-----

--MMG9FvMgaEkvE3mi--

