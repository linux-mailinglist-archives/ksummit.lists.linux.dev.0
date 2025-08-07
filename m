Return-Path: <ksummit+bounces-2107-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62061B1D7D2
	for <lists@lfdr.de>; Thu,  7 Aug 2025 14:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88FD1583CFB
	for <lists@lfdr.de>; Thu,  7 Aug 2025 12:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424D624293B;
	Thu,  7 Aug 2025 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gB+A9DtI"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE6D2356D9
	for <ksummit@lists.linux.dev>; Thu,  7 Aug 2025 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754569527; cv=none; b=q0uiUilcp6/mEmUlwZc95X0+T+jsWlU6apgAFmVOXqPUZyO4TZH6Xjkik70CMRJr12dQYnfKWW95uY33rg93yBpzE7662ZMZ7lChufBsaQOS/Abl244quJ3WLC1i0dQkljtv8ik1hlKOuki5Zmrs9At1p+SmG687aONLODrsPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754569527; c=relaxed/simple;
	bh=fjkrSgbtTXsCZLG2dCD3Db5gg9w8PeYQmbolr85bci4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBJNL01jg9FMdsbwZ+BEWRUQW7yke3FYzShdabEEkPb0qPr43UN5fOXJfVnTiCfiWpr9mTFBw0otPWepxol+LD3n19eMiUtAN5NFg3jcwQSqsSxv1pY7bWp+eJexR5ScVOKihLsUHpmZahyDCJrQ+Ykitvwvpv4vKJ/8UlcJ0ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gB+A9DtI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43029C4CEEB;
	Thu,  7 Aug 2025 12:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754569527;
	bh=fjkrSgbtTXsCZLG2dCD3Db5gg9w8PeYQmbolr85bci4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gB+A9DtIKEoxTkW2wznHf9oDX4nYkExs1YYrNwXoO4cY3XTtKhc59MwTZc1YWJgf8
	 qgNDU5wLUviwWbhMHlW9+3EsqvLa0tHgZdaww6UDMDm8m8FPc5XjFSrVCTp7ylvk9e
	 90imP3L5jOHQAin17DWCujLIaaW10Q4vd4zGUdP94NbiH6LMFft1u9qTp2W3+6RAJf
	 nf9XkK8C5MloGjGwirEk3XXJ4Mop5+aIe7TM0mBUCkudCwb826fQtrP3R3q7HVDPZc
	 lXQHnuxWFToVz9wV5v1Fjnya4D0y46Wti5fbZGMMGxyGuLS454LwUhK+zZMeAIEXLv
	 ZCWz/wef1qSHw==
Date: Thu, 7 Aug 2025 13:25:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <8b7daa48-0f79-4948-b0de-a09a7b456513@sirena.org.uk>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
 <aJJP2BM658FYJdJv@lappy>
 <1ced158f-b433-46ef-a70f-d035ec413a12@lucifer.local>
 <72ee0f61379054e327d502bbe77aae3d76966d17.camel@HansenPartnership.com>
 <a1bcdee4-344b-4717-bde0-fe80bea46d67@lucifer.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sz+9J4fJmLHs2zXN"
Content-Disposition: inline
In-Reply-To: <a1bcdee4-344b-4717-bde0-fe80bea46d67@lucifer.local>
X-Cookie: Real Users hate Real Programmers.


--Sz+9J4fJmLHs2zXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 06, 2025 at 08:26:41PM +0100, Lorenzo Stoakes wrote:

> - Was the commit message of this patch generated in large part by an LLM
>   (excluding non-native speakers using an LLM to simply assist writing it
>   in english)?

Easiest way to say that is probably to say "written by" and "translated
by".  I think for all these things we should just talk about tooling
rather than specifically LLMs, as well as avoiding any rules lawyering
about how precisely a given tool is implemented it's probably useful to
know about tools whatever the technology.

--Sz+9J4fJmLHs2zXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiUmzIACgkQJNaLcl1U
h9DXOQf/TBHqWBWBftqMi8oMQJXonq1pypgknvCuv2qNydNLBlGOTF58rgc8GVso
4kKnPiWPlnYiJhjSrW4EVpt/JVqgqeF/AztgysXsT/rMvVXb306S9d4AW5bGzq8A
L62E1m0JaEslDWxlGsmy4ElYXiodOGq83oLdQSQtMnFM16hEFFDLb/zfI144Z9Dv
/nw8Egr70bVwLhTrjIot478Wk4K8hQCAo7VBQcjkFaBNoGZsK8G6Idd/KUGlBG3w
HWKL4j1W3kjEeOQw+/rd2IZRjbTS+Of6l0jxo/9lVwOWQb9O263binkKISf/ItNI
rgJDgrs94eyJ0ImnqTLwhzgKQeHsUw==
=2yWq
-----END PGP SIGNATURE-----

--Sz+9J4fJmLHs2zXN--

