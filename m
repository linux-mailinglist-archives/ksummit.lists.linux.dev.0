Return-Path: <ksummit+bounces-2064-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E7B1B9E4
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E9016202CF
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C9420B1E8;
	Tue,  5 Aug 2025 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5UHqKWW"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA186348
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754417803; cv=none; b=NTYkn0OwcbJZpPKX4+/tN8xW12VZECRnGsWN9XArRsJl2Twyjh8L/oGsCg86yUnhc97h6YD98av1DZi7dwq2ZSf0XsrEuzWrdTrhLXOaqEivzrf/SolUpRfHtW4WwAlYpjMWMlHieR0RQHzFr14HTiagPKIVpGQ9no7OQRgDJCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754417803; c=relaxed/simple;
	bh=kzmWJ32wkjntDv5k3yHdRcT0vC/BiT4Xn1k0XHXLcm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQuP7dclZD95KQrcdG83lo/WAM1tWq41drGOZmTo+xqCixT2QhYAsmhb0bwQ24qXMtNT4jTd3XotBNXaFtt1OKaiECN24Yh6mZobt0zBK3JlWs3hdSgAxe+ikyNjQ4zMhR7fsXvzqHVNLN5Q1CGzqONy5lSG5g2tf2wDigjFXJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5UHqKWW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7088C4CEF0;
	Tue,  5 Aug 2025 18:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754417802;
	bh=kzmWJ32wkjntDv5k3yHdRcT0vC/BiT4Xn1k0XHXLcm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5UHqKWWqQBWvbomDhr+a4LlO6hVWwUdWcDtqf+x7tCwduOpVqtJ3Uk//I6LWvhT9
	 ib/u/T8Gsj753i250CjH7rDVIowmtI2kCP1Ef6DDGj8AV0chTMwfnEva3grvODpQbb
	 SvblHx87Q7zS+zQQaq1ZQHZv+j8k7yq3usTvtOigfWpwVv7pbIj6qLDNoi0QYUAiLZ
	 y4fhzNVXSUxPlUUj9PJaBATBaZNR/l0uFk2KeiZY3noqRl6EQC7r6nQT6N/ymbHBZj
	 l9h55fwyQMQDjW7jJiNBRJaalgk/Cmwwh3GoLE8Br74sHXTT+P2haFI+VrxxCbCI8f
	 uD4MeDyhcuyIg==
Date: Tue, 5 Aug 2025 19:16:38 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <d6fa733f-b1a2-478e-901d-cc4b18e2e07e@sirena.org.uk>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <ad8ea0a6-ca53-47f8-92ec-17e970184019@sirena.org.uk>
 <e9902e53cd5c8ad444d6c62942e790b7ba5d756a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5BMHSF03o/C/24Hb"
Content-Disposition: inline
In-Reply-To: <e9902e53cd5c8ad444d6c62942e790b7ba5d756a.camel@HansenPartnership.com>
X-Cookie: Trap full -- please empty.


--5BMHSF03o/C/24Hb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2025 at 01:23:18PM -0400, James Bottomley wrote:
> On Tue, 2025-08-05 at 18:11 +0100, Mark Brown wrote:

> > Patch backporting sounds pretty scary to me, it's the sort of thing
> > where extra context that needs to be accounted for is very likely to
> > come up (eg, assumptions you can make about existing state or
> > santisation).

> If you think about it, the git history contains the exact patch path
> between where the patch was applied and where you want to apply it.=20
> That's a finite data set which LLMs can be trained to work nicely with.

> > =A0 That trips up humans often enough and doesn't seem like it's
> > playing to the strengths advertised for LLMs.

> Humans don't look at the patch path (or use something broad like a
> range scan).  The AI can be patient enough to actually go over it all.

The things humans are usually doing in a situation like that is
remembering that someone changed something and why, and of course the
new dependencies that came in.  I see what you're saying, but I'm rather
nervous as to what people would actually do and how effective the
results would be especially where things get complicated and there's
landmines.

> > TBH I'm not thrilled about the general test code is trivial
> > assumption either,

> I don't think anyone who trains AI thinks testing is trivial.  It does
> take special training for AI to be good at test writing.

I think a lot of the people saying "oh, we can just churn that out with
AI" kind of things do have that sort of attitude.  This thread is far
=66rom the first time I've seen people saying tests are a great
application, and it's more usually as a contrast to the complicated
stuff in the kernel rather than with a consideration of the reasons the
specific benefits these tools might offer in this applciation.

> >  unstable test code or test code that doesn't cover what people think
> > it covers are both problems.

> Test coverage and constructing tests for coverage is another place AI
> can help.  Especially given coverage is a measurable quantity which
> makes training easier.

There's definitely some opportunity for specialist stuff there,
especially if you're just looking at measurable metrics like you're
mentioning.  Other tools in this area are also available of course!

> > =A0 The issues when things go wrong are less severe than the kernel
> > itself but things still need to be maintained and we already have
> > issues with people being dismissive of the selftests.

> Well our selftests, having just spent ages figuring out how to run a
> subset of the bpf tests, are very eccentric ... in that each test set
> runs in a completely different way from any of the others and knowledge
> from one selftest area doesn't apply to a different one.

They should all run from the selftests harness so the simple running
them bit should at least should be standard?  We do have some suites
that were thrown into the kernel with marginal integration with the
frameworks but they're generally fairly obvious as soon as you go in via
the standard interfaces.  I'm not saying the overall picture is amazing,
but I see a big part of it being a social problem with getting people to
take what we've got seriously.

--5BMHSF03o/C/24Hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiSSoYACgkQJNaLcl1U
h9D9Awf+OwBVWj/Yd30KtKh1TQ5zUjG7uwlErj27Z9nOpJS3p0CgCnXzo/H4e1kn
myvo3RuyAiLKwH2mT6K7jDTPXbaTXhWR+H+pvEyamR0hXBRg3E7Q4YgQn2BIKBEg
SZZOLfk5jtC9btMWoLlFIsnuKjVVEELKucejQBEAt0MMxH26LrCx3VX2JA3mhef6
txsiqwJW18opstvNsqp/Asld5tK860/s17znvdvS7INCpOR4g/bRAeMbFVPNubnW
mx67cjVVlyCuchzoagitlW3fMC+e86hVl11ctpgynzz1QUcqh8T7ZKpysEZrav3R
zPtO/iJ9PlcZkulJFWH2WtijRASyuw==
=6cIA
-----END PGP SIGNATURE-----

--5BMHSF03o/C/24Hb--

