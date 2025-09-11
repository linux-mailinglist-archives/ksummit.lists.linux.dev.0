Return-Path: <ksummit+bounces-2358-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1C8B53893
	for <lists@lfdr.de>; Thu, 11 Sep 2025 18:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA469AC0579
	for <lists@lfdr.de>; Thu, 11 Sep 2025 16:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15720352098;
	Thu, 11 Sep 2025 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbDKMUnk"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8542733EB0D
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606553; cv=none; b=iIHoSKT1+U9K7FwfS/Q22PnneMPOeNAyN38f9cH4ctxRQ3JS0qBSLxfHMNabB8aTEDrq5zNmMkgCX/Na3VeKEfr52WYMg3LZWMcPqt74WvZwZleUBeLrX71ay9InGRUwifnmC0cJbJI7n3IZVDoJ2uM3Mq1Y7lliPhdzGt45Gh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606553; c=relaxed/simple;
	bh=0ghPo9OMP2qbFZpKK1zX+G8g+LTdT93GxbFrFFdRwZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2kLR7CEJyP1yuq2YIyZvNB4uKWoIsJ8Yqbzw6/UprfLt1S5UT8FIGkn+OSoIaLvJIIkjSHYVN0yWDAXh5PxRR3ZuqNKM9eYNkvL2sRyrSUmlf4LxraVn80DljuRBX+yZ9G80q1FcW3+gVRz6FogQGIu4AYpBhClAAiTXDUwQBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbDKMUnk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE76EC4CEF0;
	Thu, 11 Sep 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757606553;
	bh=0ghPo9OMP2qbFZpKK1zX+G8g+LTdT93GxbFrFFdRwZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QbDKMUnkXAeQlhNuhkZciyX40Djl06Y6iPThqii8XUdfXUb9MLqVJTUdS28KPsNiz
	 NFNoOSbsBaI0JpJ4sEsrGyCOsPw1X1wy1FlZG5LtJyAoUabZ7P5p/BhJ0xkIbiH2eD
	 fq7Z1mqKp/y1elnI35tBxoiHB8eqFof0zKQC2b1DfQyBbpWjqiudm/nNbfmGCGxu/r
	 4AOUtW+r3bLxViB3Tat+iXTGUT0UlkCjgHGBW6o95tq0xPop2bNvjAA0LVi1/f4fuZ
	 /Gga9ke7yjchO5+IL7VwQMSIE5tmq6pvWXZB0nnAPxSt3BurIUAlkiLXXsjPsh8xR4
	 2g+p5m0xAtAbg==
Date: Thu, 11 Sep 2025 17:02:28 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jiri Kosina <jikos@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <9c77a331-40d4-41e5-96f1-5ce175fdcd1f@sirena.org.uk>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <81n4979o-0969-q3o1-6n66-979668n0on47@xreary.bet>
 <ecfb75f4375d8bd97034b3f8e65198de32b25c82.camel@HansenPartnership.com>
 <6cf04d69-d4a2-47ef-b5b0-b9880068eca4@sirena.org.uk>
 <0ab33a4c5bac6cd3a052c62b76e759203a7e285a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9iuYXMN57s1eCrBw"
Content-Disposition: inline
In-Reply-To: <0ab33a4c5bac6cd3a052c62b76e759203a7e285a.camel@HansenPartnership.com>
X-Cookie: Your domestic life may be harmonious.


--9iuYXMN57s1eCrBw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 11:32:10AM -0400, James Bottomley wrote:
> On Thu, 2025-09-11 at 14:49 +0100, Mark Brown wrote:
> > On Thu, Sep 11, 2025 at 09:18:05AM -0400, James Bottomley wrote:

> > One pattern you see with trees that do this is that some bug is found
> > in -next, the bug is fixed and the patch applied but if the patch is
> > applied to a tree that isn't in -next you still see the bug in -next
> > until the pull request to the upstream tree goes through.=A0 Any
> > incubation that the subtree does before sending their pull request,
> > or delay in taking the pull request from the subtree, shows up in
> > additional time that the bug is visible in -next.

> In theory a fix to a pulled commit, whether separate or rebased, should
> be treated like a bug fix and go up with speed, so is this simply a
> missing rule (or encouragement) for a tree not in -next?

Partly, yes, but the bug isn't always directly in the tree where the fix
is going so it can be a bit less clear and sometimes the delay is on the
pull side (eg, due to holidays or whatever).  It's a lot simpler to just
put the tree in -next.

--9iuYXMN57s1eCrBw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjC8pMACgkQJNaLcl1U
h9CY9Af/QvYkUQIxii7K1v8Rx3yHNjNex4a6GQiEawDJDg8YLIo9YePRX1qMxOiQ
+kdSGlFi530AUsVkD0qOxxkgPXm/GkXqlfREO/cjy080Hr9lPcbnbY7SRFH5eo3J
OjFRyWTgbTE3EDt4Jx1xU4oa8zBxMblSQH7nVB36t4ghs6Erwv8kd9+j7kOUkmWC
GrZG16ZAcYWbrYAgqehslpJ2HEVGeTOaKlL8t7eFlg++9CDrxmDRniT8KGOSa6Yi
zdNaqDqRvKExhP9tHJRw5DWa19XBNxJtjqDdDo13y7TvWbyIph3w3XnYjydzGJkk
3xS7FCxYO7I4pZ3G/6WtHOVHEWMF1Q==
=8vkK
-----END PGP SIGNATURE-----

--9iuYXMN57s1eCrBw--

