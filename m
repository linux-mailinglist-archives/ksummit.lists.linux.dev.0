Return-Path: <ksummit+bounces-2360-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5FB539A0
	for <lists@lfdr.de>; Thu, 11 Sep 2025 18:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC880588272
	for <lists@lfdr.de>; Thu, 11 Sep 2025 16:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FE135AAB9;
	Thu, 11 Sep 2025 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJI6/f4f"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D0C35AAB2
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757609426; cv=none; b=Is1Uv5r13vh9rJ3C4GapGQaNfVAMErrVpUPUT/N/GB19YKlQIPfmzzTdcqiWn0Xep3EkqYNTGavBVUuoWM1ivH9N78YlwlIKwmGaXFSmMlYY0A84P4M8ImicHJ9U5jNN0JP69hBfMF/JLZogdNlj8vYA8sQAHSBTFBqSWa3Q75M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757609426; c=relaxed/simple;
	bh=c9Zvktz6iMGepN1XR0vGXy+vGS9YfVEm136/L/4Cxys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWgeS5ZyU+UJrFABS8JVCKWv7imnwN2Whyhb2sKdLXZAba0WBzjWM9tFfMRc1uVkay/bw8/845nlQQuPLjOt2YbKvGcsGo/LSxdNDA8MRCjQo+vgngAA0pUFGKNJEpI1BkW3BqVlLYPIpcJv+TX3sze1SieImPprts3Gr5Xk/70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJI6/f4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8753C4CEF0;
	Thu, 11 Sep 2025 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757609425;
	bh=c9Zvktz6iMGepN1XR0vGXy+vGS9YfVEm136/L/4Cxys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJI6/f4fkY5M+2h1wR+g2hpk5L0PcbcnnXQUAIT2AlCnjYwbhu+mzwGBZ3HDAX00B
	 LXIygDJASpLE7zhrpogO5riEZcbwEBGAIAN7PQw49PwKlfw56YPlSX1e24qi1Gk5FP
	 lfb7r8YuG+N+PyEM6LVsYX646T3Kd3rkQvD6mk8mrVXyQWL7fiafZnQz5sQfheEebD
	 PW1/qExWvVMYqqwQ3dNXRJCTq2Q9nJnoLGQhgXha+T8H5scE7/aCoauxfwkD0Vy+Cj
	 qAiAM25Y25YjDYtL/a9KyEosPCPv0hcdSsEi6A8EXT8dlHCNIcVHKP+sidOLhqgBGJ
	 7+maJdRewApNw==
Date: Thu, 11 Sep 2025 17:50:22 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jiri Kosina <jikos@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <0015283c-ef41-447f-ac9f-c00f9e318c74@sirena.org.uk>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <81n4979o-0969-q3o1-6n66-979668n0on47@xreary.bet>
 <ecfb75f4375d8bd97034b3f8e65198de32b25c82.camel@HansenPartnership.com>
 <6cf04d69-d4a2-47ef-b5b0-b9880068eca4@sirena.org.uk>
 <0ab33a4c5bac6cd3a052c62b76e759203a7e285a.camel@HansenPartnership.com>
 <9c77a331-40d4-41e5-96f1-5ce175fdcd1f@sirena.org.uk>
 <0beeb099f17541489a190fb300d1f19fe0fa06e9.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T91tKeitaCib3pPt"
Content-Disposition: inline
In-Reply-To: <0beeb099f17541489a190fb300d1f19fe0fa06e9.camel@HansenPartnership.com>
X-Cookie: Your domestic life may be harmonious.


--T91tKeitaCib3pPt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 12:11:46PM -0400, James Bottomley wrote:
> On Thu, 2025-09-11 at 17:02 +0100, Mark Brown wrote:

> > Partly, yes, but the bug isn't always directly in the tree where the
> > fix is going so it can be a bit less clear and sometimes the delay is
> > on the pull side (eg, due to holidays or whatever).=A0 It's a lot
> > simpler to just put the tree in -next.

> There is a downside to putting the upper and lower trees in -next,
> particularly if they're out of sync like you describe above in that it
> will likely cause a conflict.  Now Stephen usually resolves these but
> it's going to cause him way more problems if we adopt this approach.

It's not a particularly new approach, it's pretty standard at this
point - the situations where it doesn't happen are more the outliers.
I'm not sure conflicts are a particularly big issue, the stuff I was
thinking about above was more latent bugs being exposed like race
conditions.

--T91tKeitaCib3pPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjC/c0ACgkQJNaLcl1U
h9Bi1gf6AwWzWiTIhsHjzEkEAka3ZKX7Z8f1xs5EgpfXi0LbSWbGptxj+IsAB4cE
cJbLsVE0cymORmO5syFDr2fxGOCgjgiPO2l5H/h2Fc2d8BDwslq8awyfp2VBgZCn
C5Si+TfQYPKzQo8LrnNi+v+TPzhyYwwSVUkOJkxdFeKLScjm1/HjVaBAa+2NeDmV
fyx8c5iWhQXbAuaZuvFfn7iadvjE8nZw6jpYcsIjiMsNUmsFBJ8vUP0jnB+Hy/is
Ow4C8P4Ll/DG4Ms0yZ4kFCPcLe9hypY3oYuYeLhUK462qPn+e46G5Hk+f1SpstwB
PHJ6U0OwVhHy8Fp6pVzLFibNA+c2Tg==
=djp5
-----END PGP SIGNATURE-----

--T91tKeitaCib3pPt--

