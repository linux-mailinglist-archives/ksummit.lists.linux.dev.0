Return-Path: <ksummit+bounces-1339-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6FC9108A9
	for <lists@lfdr.de>; Thu, 20 Jun 2024 16:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249271C214C5
	for <lists@lfdr.de>; Thu, 20 Jun 2024 14:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A741AD9EB;
	Thu, 20 Jun 2024 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuCP/+LH"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E311F19B3E1
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894542; cv=none; b=g0Gb9k7QmNArZsohRx8ufMB1kszvpUA+HBUFq9x6g+jfvEyrW4203Jo93qiqSmOZJ4BhSVzBL6gr9WVQAxoc3tN4ipwh73b6kKEUnRWULNkqI6ysxjKW7S253dwAqcCQ7RmsNV2m7x51rMQ1yKnVpnGvbns2mZCNCf5PziIEmdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894542; c=relaxed/simple;
	bh=VxAgSZtLjXElsTfcTukk1G5FRZUbIGfq6HeDTi2eCyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLJWSzbdgDIeWIYriIb8Yp2zG88TA1Qfri16HpPfYx7hqYIn1JzOxzeSyWQkX4HkgOLeS99HsCG3I1dKpWXB7UZGjEdn5sCmjb2/YZwtGv9OUapY08ZY9Im8sHkPS/wYdUVlwuZZf45MkfjarP/pmX6aI13irJ5p8DOfsaTA0/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuCP/+LH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C2CC2BD10;
	Thu, 20 Jun 2024 14:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718894541;
	bh=VxAgSZtLjXElsTfcTukk1G5FRZUbIGfq6HeDTi2eCyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OuCP/+LH1MwII0DIfaLusiCRguaJ+EICfEbXU6vDkRiy/6hMMw3slDl2t/+uCMnAB
	 y0+wDNqV1Qt0kSja+DkEi93ziaodH6fq6tEv2ByMoykSES97UJaeKV5vH0WfkSXb7e
	 IMnirOH++QnvBVPyfGvk27+i1TFXY5vWXqKFioas9fjSvOH2aam0hOVcnbbmVYlUZ2
	 abUVL9igtt118jjmbwuk19OwMM+qXLk8vEPcLz1LwxqDtFmWNOoTzU7i+qLRENSG4K
	 Ignqlb9N7+v1JOb71Jvf9q2b7hA64K1idUg4fsnCCcIVfbRxwG30Bj+AaM+ti17B8G
	 AoR6SlJN6L7+w==
Date: Thu, 20 Jun 2024 15:42:16 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Message-ID: <710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
 <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
 <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vX7k9uSYvsG5RQ71"
Content-Disposition: inline
In-Reply-To: <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
X-Cookie: You're already carrying the sphere!


--vX7k9uSYvsG5RQ71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 20, 2024 at 10:01:57AM -0400, James Bottomley wrote:
> On Thu, 2024-06-20 at 14:55 +0100, Mark Brown wrote:

> > If your tests take more than a day to run then it gets more tricky,
> > but that's just generally harder no matter which tree you're testing.

> The difficulty is usually that by the time you get a signal something
> is wrong, the next tree is different.  I agree you can freeze on the

That'd be the tests taking more than a day bit.

> next tree you have and hope that the identified commit (by the time you
> find it) is still in the current version of -next, but there is a non-
> zero chance it would get rebased which makes testing next a bit more of
> a chore than testing main, which is why it's tested less often than
> main

Obviously some trees do rebase, but not constantly and a lot of trees
simply don't rebase - carrying things forward to the next day tends to
be more of a mild annoyance IME, especially if you remember all the good
and bad commits and don't need to restart from scratch.

> Regardless, I don't think -next is a useful tree for the wider pool who
> usually test stable to try because of all the difficulties.  I do think
> it's not impossible to get some of them to move up to main (after all
> it's the .0 of stable).

AFAICT we have a far wider pool of people testing -next than we do
testing the stable -rcs at the minute, there's more people trying to
*use* stables and finding issues but that's not quite the same thing and
I suspect much of the plain testing is going to be qualification for
release so it'd be hard to get people to substitute mainline.

--vX7k9uSYvsG5RQ71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ0P8cACgkQJNaLcl1U
h9Boagf/cngV0gEMswycSNPrpeqcuWfnV0At9XYkCCWFFOPoH5FNdKyZ9tF9B2zk
b1dF5zCEn+0LZZQSLWgwZB/vL4yOBS9EoMyCe71+u9ml4oe2udwGQMS9K4L6gh0b
sK7ZfZBUVUHV2k0K8DpQqLLfWQSNDWUyXzsg4qap0+5NDqryJC6MfZbqmhzf1gIn
fZ5qoL3VJmC97Bn698zxcp7rFTrxtT8UEdXNlLlb/Yzg9Jr5TU21DxbAusqH8Pb5
HRoMeFqvIey9+x1trHz2Nt5rbRGIkp9my9Cx8XWxf7Vko/8n4ZLMyaXybXMMLQ0U
3ZDoyMaG3FSV1/Pxp41EjVMdzOiHXA==
=/Xgt
-----END PGP SIGNATURE-----

--vX7k9uSYvsG5RQ71--

