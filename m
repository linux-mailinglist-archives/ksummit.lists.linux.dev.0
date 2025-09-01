Return-Path: <ksummit+bounces-2258-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2BBB3EE5F
	for <lists@lfdr.de>; Mon,  1 Sep 2025 21:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BA1F179046
	for <lists@lfdr.de>; Mon,  1 Sep 2025 19:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB502E6CDE;
	Mon,  1 Sep 2025 19:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTmO5pkc"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0019C560;
	Mon,  1 Sep 2025 19:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756754232; cv=none; b=a9uE9QX2LgcxkTfBL8rOv4YA6Z9ZjeB/S+bALmPNV0m7ULem9dvUWEXCzsMBQan2TNLkvCTHEdoGdw9H0IR8gRv6URRy5MWTLIzZXkQs/puNogQqrv2arGqbfHRtNRTh7ZvFboEygPQCX6g+9qMwHMfLwRVmuYNj5Vjk4LLbMMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756754232; c=relaxed/simple;
	bh=n4shjm/b3T4Xo/+5nzOOAjj0D3AfBcbazMEpdhPWtfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0IpCiXM75jwZuCMqbJTCdiPhTLzfrxczE0biZZXBK4tSUfCG6WD+11hFxdPO+mFf6Wgc6Ckt2Tvd2//d5cTsMya042rDY4kE/24syVCwUZajAir+1NSv/RvnX+8ncefKnT5Co4RN0TSriG3ooph3i1Shde17Zxn2CRYMZDYEug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTmO5pkc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3627C4CEF0;
	Mon,  1 Sep 2025 19:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756754232;
	bh=n4shjm/b3T4Xo/+5nzOOAjj0D3AfBcbazMEpdhPWtfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTmO5pkcuG6IC+gEtOrsqi2Fu6GZIDcJc4e1q7g0oLSLkiHfeIPxhAU3qWnFApec5
	 QSF+kylrQ6+70W7PCejPhTPV8kSF74ZKzl+pbcuBa0F5gaRXFDWKIOgV3DSBvMyVI/
	 vA/K4ho5y9+Wg7whD/3rxxHfnquqcca45sItBXxBp6JzPmsnNniWHRwAKw6VMK+hQP
	 T5eYfSLhQMriQfLM+aYVNH6fDUzS1co2ZRiA4wPk1CSi9mqSGDL3wYB8vBU+U6c+A/
	 0z7ADpFVmjV0wPbsQne/9WD2k2qzo+oJYOqryUtelccC1K4L0Zx74jFh3QYpzkkKE3
	 1QALMPvKenu5g==
Date: Mon, 1 Sep 2025 20:17:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <295b275b-5aac-466c-92c2-659b45441060@sirena.org.uk>
References: <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <20250901203750.33ee6689@foz.lan>
 <4f5b357c-5c99-4d7c-bb16-02556eec074a@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cs068SmNqBWQWiQ4"
Content-Disposition: inline
In-Reply-To: <4f5b357c-5c99-4d7c-bb16-02556eec074a@lunn.ch>
X-Cookie: Auction:


--Cs068SmNqBWQWiQ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2025 at 09:05:19PM +0200, Andrew Lunn wrote:

> Does the kernel docs have any concept of incremental builds? Adding
> one patch and rebuilding the kernel is generally fast, unless it
> changes an important header. So the cost is reasonably small for two
> builds. But if building the kernel documentation twice is going to
> cost 6 minutes, this does not scale.

FWIW I do the same and would face similar issues, though for docs I
could probably cope with selectively building only tips of branches
given how infrequently they're touched.

--Cs068SmNqBWQWiQ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi18TIACgkQJNaLcl1U
h9AZfwf/SyvMQLIc0jCbjuxIeJlsj7uesemROGywuOp+kmLKpqCNA1yE5gVRagi0
L1LTIDb5dxBkp6a8p6tCJtd/Fxlyo9CIcI2DGj3RpQ7VWknxr/7wD4uoSxJzS31Y
Nk9BM9FLAOCkYclGWJd8zrGsAER3NlXKBBP0GdnTyJy3GuUgLmsnOElp3cnHNKCx
+LLhx/820eSnQZQ1fO7AX2MGMgHddxR3AL4G4WAY40l0erJ5KKWYsfmZQpu8b9ZI
j+FWWdD8XPSaFOosN4OB/X9eNysZgkdZ0YN5nif3tIvJ4fXV56fF4YVuG0bsScgg
8KwaC3F0bJ6DXEk4FVQB3yZtZEPs2A==
=qlnL
-----END PGP SIGNATURE-----

--Cs068SmNqBWQWiQ4--

