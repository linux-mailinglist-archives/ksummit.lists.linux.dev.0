Return-Path: <ksummit+bounces-1336-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B69106DA
	for <lists@lfdr.de>; Thu, 20 Jun 2024 15:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E78B82822EB
	for <lists@lfdr.de>; Thu, 20 Jun 2024 13:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEEF1ACE8B;
	Thu, 20 Jun 2024 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmUkhkyo"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED53B1AC782
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 13:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718891708; cv=none; b=isn17ojL3zEur61OYfNhz9vzG9JEZAukpNAWCyG8sDXUlIhtAni23wYs6f1aH2REeziyt0gVzt+ajoNLqQ5mDRBKbWbXfQJm5Lm/crgTs9+KsTcZ/YguXGPGaQ8blYCanzh2nQF/a4B+++qARvToZHgebV0Nt/cmBcObhVx4gTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718891708; c=relaxed/simple;
	bh=ZzazNlQXrGw/4pyJE97n2RREqJ1g+pZFfQXxqfNNvPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbj2tfsWXrxIcrXyY6N4uMZ4Y/nlCNgE/7O4x5eKR0RU7YIlJzzj4C6ZkXyI/mxhUsmTVW3sh2q1z07av0PHzd9iKx7/SKHHMWBeH5wQc2Dxq5Fq+wi8raisDUv3v09N3hSg6/2tViXy0aA1QV0JmK1KrzspAVQ3ccHOeefFEEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmUkhkyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98880C2BD10;
	Thu, 20 Jun 2024 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718891707;
	bh=ZzazNlQXrGw/4pyJE97n2RREqJ1g+pZFfQXxqfNNvPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmUkhkyoj4CvXsphc2c/aKK8r1UMoAzkCOgeyL4D83fgm2t5a3DioZFFaIyIzQaq6
	 g4Uwelkezgq9b+gKriDpjFooUHqWaqDmaogmVHhW9Vwjl3gPg4O8maGX/bY9eWZ/xU
	 opMD3IBv7G7qhU8+4BBd0wiLGnPJqxttO8Cpt0KtZYUvt2jyi+PmRuB3769hCC6StX
	 qx/ivB85DJtS7VRg5yyW4+YjOKJDeZpwjh7IJls9TCLiihmDNBoJCFw29l5VqOKaHV
	 H1/5I5M2d3CnJUkoRO94IquzU3ZessowBhyT4Zb5GU3k6uFdZC6EphgwdCM8Oai0JC
	 vombBc8AyQf5g==
Date: Thu, 20 Jun 2024 14:55:03 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Message-ID: <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wADSMI8u95dLldpp"
Content-Disposition: inline
In-Reply-To: <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
X-Cookie: You're already carrying the sphere!


--wADSMI8u95dLldpp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 20, 2024 at 08:57:29AM -0400, James Bottomley wrote:

> Actually, if we got more people to try mainline we could perhaps find
> more bugs.  Testing -next is problematic because its instability makes
> things like bisection and update to next release difficult.

-next is problematic to actually *use* but it's not particularly bad for
testing, mostly it's fine but you have to be able to cope with things
going bad in you in potentially very bad ways.  For testing the
stability is generally perfectly fine, and given that the whole goal is
to find problems it's hard to see much of an issue.  Bisection also
works about as well as for mainline - you need to bisect from whatever
commit in Linus' tree things were based off (or pending-fixes if you
know that was fine) rather than a prior -next tag but otherwise I can't
say I notice much difference to mainline.

If your tests take more than a day to run then it gets more tricky, but
that's just generally harder no matter which tree you're testing.

--wADSMI8u95dLldpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ0NLYACgkQJNaLcl1U
h9B5Bwf8DZOplVfrMsYSNwLTmvQsGl8xL2HDh4Vm4+PCMApbALJTzJQyT59bcbTp
t4Hn+q7+TlMhBJiWbZ8L9dvVR/fiGpl/brQUQ97U4PYWR7oIpaZLs3geDcqBFcvW
RXP7qH8GpWrO9ylb7ilnbyEhkevJqHYn1uvtNqpp+qFeATCia8iMSRO0Y7U+EgdA
MAx5Zwb0slhSxS4E5zdb8QK/ld369N7DtzPEELLqm6pbLjlcOThdAMyovIVoypBr
G3c5zJPev4Vq5Kj+WsI470n5V6hhYyPFKfaTHwm5I+kX+Dt+w5SLGboK4ygZWVW8
12MAq8oFFvUQ6S/vj9JQBYNXWXKOfQ==
=CUqW
-----END PGP SIGNATURE-----

--wADSMI8u95dLldpp--

