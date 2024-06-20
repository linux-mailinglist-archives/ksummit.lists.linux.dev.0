Return-Path: <ksummit+bounces-1342-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC03910E36
	for <lists@lfdr.de>; Thu, 20 Jun 2024 19:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E4381C24580
	for <lists@lfdr.de>; Thu, 20 Jun 2024 17:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E077C1B3754;
	Thu, 20 Jun 2024 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWSYZxFb"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822C1AC24B
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718903711; cv=none; b=sjFcXnSm14Mb5jobEPZyqzLrMj/jZ07WWzlW5IDS77a1h/ki69P3ehgaDSzFSncT0qm5ifpi3uR+892DYKXg3RIUfXlU6nBysawAws9Hxfq8O2liRA8peEjK/9fMTOoDL7Yh2upnZIrdP5dpLiUqlIArx2/nCJtdFVW16E6pI5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718903711; c=relaxed/simple;
	bh=XK3tgjpDIRDDAnaq5IhT7fwe1JuU++l7m2w/dK2aec4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZebKr+hdYwpSp3/G747CNYkdT5nYbyrKWxox5w6lXHOH9W+YoJx1apbmDhoZA2U66+pK/vlDhsDMOXdvN2WY+GKD+jQfiCzuB85I0wT8YWJy17utXVyCuKofGKqeNCod3igG5NmZR1WLxqq9a5Vzwm5UwJiZJJAyq8CKwuNmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWSYZxFb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7979C2BD10;
	Thu, 20 Jun 2024 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718903711;
	bh=XK3tgjpDIRDDAnaq5IhT7fwe1JuU++l7m2w/dK2aec4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWSYZxFbAsV6RMRxE1n1S1dTkNpFeazS44jFOj1EQouKRvzm736RmMFFIBtLeWjvr
	 YJW5XL/nTdylMtWL8VgGK2Vcv6hIL9kmOqcjoJWPxhbrWwD1H6CaUFuDrCcHmtIhRD
	 y75VdN8FIfArZjMl7LMBlxarBbjSO57NaQCzDAVrD9FVSXPL+iP0FDHvqJ/wcC1P2x
	 /dsYQOS+/tCn3lWFMrACCSvrXYZQmGGEy172iI0sHxDSJ1XoI46Enc2wIXT5ygxSu4
	 q2EDnKD+oRT3+q3xVpBI6c4iNf/xu46G7EcVf/FmfOllCC5IsvgmulQ3z4T2T3A9A8
	 0hvcWE2dhvA3A==
Date: Thu, 20 Jun 2024 18:15:05 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Message-ID: <81cbb17d-7a68-41b9-b808-5560afd036d4@sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
 <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
 <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
 <710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
 <32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7G+7GoIBuGwaOoW2"
Content-Disposition: inline
In-Reply-To: <32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>
X-Cookie: You're already carrying the sphere!


--7G+7GoIBuGwaOoW2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 12:02:21PM -0400, James Bottomley wrote:
> On Thu, 2024-06-20 at 15:42 +0100, Mark Brown wrote:
> > On Thu, Jun 20, 2024 at 10:01:57AM -0400, James Bottomley wrote:
> > > On Thu, 2024-06-20 at 14:55 +0100, Mark Brown wrote:

> > > > If your tests take more than a day to run then it gets more
> > > > tricky, but that's just generally harder no matter which tree
> > > > you're testing.

> > > The difficulty is usually that by the time you get a signal
> > > something is wrong, the next tree is different.=A0 I agree you can
> > > freeze on the

> > That'd be the tests taking more than a day bit.

> Depends ... we might be using different terms.  I think of testing as
> simply finding the bug.  After that there's usually a whole load of
> work to pinpoint the commit that caused it, so even if a test only
> takes say 30 minutes to run, the bisection can take over a day.

Sure, but unless the tree with the issue rebases constantly so long as
you can bisect into the tree and then some within a day that's not going
to stop progress (and a lot of the time just finishing the bisect and
then validating on today's -next is fine).  IME the effort with -next is
worth it for the turnaround time, it's a lot easier to get attention on
recently merged patches.

> > > Regardless, I don't think -next is a useful tree for the wider pool
> > > who usually test stable to try because of all the difficulties.=A0 I
> > > do think it's not impossible to get some of them to move up to main
> > > (after all it's the .0 of stable).

> > AFAICT we have a far wider pool of people testing -next than we do
> > testing the stable -rcs at the minute, there's more people trying to
> > *use* stables and finding issues but that's not quite the same thing
> > and I suspect much of the plain testing is going to be qualification
> > for release so it'd be hard to get people to substitute mainline.

> Right, but the point I'm making is that even that wider pool doesn't
> have the app use or hardware breadth of the pool who try out stable.  I
> also agree the stable users would rather not be testers but given that
> they are, it's not impossible we could sell them on the idea of testing
> out .0 to find bugs they would otherwise be finding in .n.

I suspect you'll find that a lot of the people who have the capacity and
engagement to do that are already doing so.

> After all, given that stable is now delaying backports in the merge
> window, there should be at least a 2 week period where .0 is it
> (although it's also the two week period where we're not paying
> attention ...)

Yeah, and it also depends on people being able to easily run mainline
which if for example people are carrying out of tree patches might be a
bit of an issue.

--7G+7GoIBuGwaOoW2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ0Y5gACgkQJNaLcl1U
h9CbVAf/SF+b1IPHCiCJUtLqsdJDrt8I5iYJL82n5SccGgapE9pVaoYgoZw5oAIA
O81jbo0kKRyUDCNzkr/5wVKWqBLclAv85JD041h7ofjGG0ATslw/sWtnDHv7MAy0
gMPyMa6ova1ZGwDlL879MyVvMPLn7zVIKR1CaM/wSxX4pf8FSeiwWDvtdleW0Joi
whPNe8qO7aXVLWrNVQUV5eFA0mog4L7Igba/N+t1vbIWooKkXAsLp4vW0/dwFiTK
YURj4qoXiTOX5ljYU+xNHkSb+/+AIKcQmyb8PHmBVFBqvMtClHhHTxtUWHLjq8jY
FhxVixRGWsc9IuyE8YIEX86hY87Fwg==
=1mB9
-----END PGP SIGNATURE-----

--7G+7GoIBuGwaOoW2--

