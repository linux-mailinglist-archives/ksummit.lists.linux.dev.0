Return-Path: <ksummit+bounces-1337-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E379991075E
	for <lists@lfdr.de>; Thu, 20 Jun 2024 16:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69DC6B26F2F
	for <lists@lfdr.de>; Thu, 20 Jun 2024 14:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82D01AE85C;
	Thu, 20 Jun 2024 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="QN5mwjWf";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="QN5mwjWf"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48D11AD9C1
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718892124; cv=none; b=T9ZG4ZfALMR50mGkr6tPW8SSOgVnwe17MlCY/yy0Z+gdUJkCLHLmxhnixThfZs28PcyML19SsGJJ11Kc6tws7C5eZAIeLaudUg9m7eP4l6eWLLG6nyfa90pzyY+n2gAqk1eeLN64nQGZIFnsxhKs+YE/vFceW0xmzXLy3haI+eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718892124; c=relaxed/simple;
	bh=jyEN1gKMhkIX0Eiuuf9YPvss7RDXWcT/CrI6l/2i7sA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lgq0YlYFolctBjV+ZGtINdz84OleM0g8jsp3SC3pEbGvb8AGfbsWtp0v7Xd6EkeeihgRtSRdeoP/I7h2qNhWMKYoO3Dp1AUAXc0jgsL3/xZS4jlsQL8dPP7utfR0zOAvIhTniz74QAVOjOWph6nTY/2S1dzIVA3X63rr7M45j9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=QN5mwjWf; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=QN5mwjWf; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718892121;
	bh=jyEN1gKMhkIX0Eiuuf9YPvss7RDXWcT/CrI6l/2i7sA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=QN5mwjWfqYQmxR2OTFpwwvO9D6WdtkvU/uIVEIK9/b09+RT+3VDLX6N+DfE42yfGg
	 qRk3F5qz1pS0p9o9RsnemCi+j9Uz+JnzYhzQq+h7xoNgtcdfOcB4p82vE2IQGJBZzT
	 HRzbt+7KnC2soMoqAHKD8YhPPYsCOIoKyT0Z/H1Y=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id D686F12862E7;
	Thu, 20 Jun 2024 10:02:01 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id pjyQFu5DUwEe; Thu, 20 Jun 2024 10:02:01 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718892121;
	bh=jyEN1gKMhkIX0Eiuuf9YPvss7RDXWcT/CrI6l/2i7sA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=QN5mwjWfqYQmxR2OTFpwwvO9D6WdtkvU/uIVEIK9/b09+RT+3VDLX6N+DfE42yfGg
	 qRk3F5qz1pS0p9o9RsnemCi+j9Uz+JnzYhzQq+h7xoNgtcdfOcB4p82vE2IQGJBZzT
	 HRzbt+7KnC2soMoqAHKD8YhPPYsCOIoKyT0Z/H1Y=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 32BE01280EBD;
	Thu, 20 Jun 2024 10:02:01 -0400 (EDT)
Message-ID: <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
	 <ksummit@lists.linux.dev>
Date: Thu, 20 Jun 2024 10:01:57 -0400
In-Reply-To: <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
	 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
	 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
	 <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/UMWe2oYpZrkbqGzD/q7"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-/UMWe2oYpZrkbqGzD/q7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-06-20 at 14:55 +0100, Mark Brown wrote:
> On Thu, Jun 20, 2024 at 08:57:29AM -0400, James Bottomley wrote:
>=20
> > Actually, if we got more people to try mainline we could perhaps
> > find more bugs.=C2=A0 Testing -next is problematic because its
> > instability makes things like bisection and update to next release
> > difficult.
>=20
> -next is problematic to actually *use* but it's not particularly bad
> for testing, mostly it's fine but you have to be able to cope with
> things going bad in you in potentially very bad ways.=C2=A0 For testing
> the stability is generally perfectly fine, and given that the whole
> goal is to find problems it's hard to see much of an issue.=C2=A0
> Bisection also works about as well as for mainline - you need to
> bisect from whatever commit in Linus' tree things were based off (or
> pending-fixes if you know that was fine) rather than a prior -next
> tag but otherwise I can't say I notice much difference to mainline.
>=20
> If your tests take more than a day to run then it gets more tricky,
> but that's just generally harder no matter which tree you're testing.

The difficulty is usually that by the time you get a signal something
is wrong, the next tree is different.  I agree you can freeze on the
next tree you have and hope that the identified commit (by the time you
find it) is still in the current version of -next, but there is a non-
zero chance it would get rebased which makes testing next a bit more of
a chore than testing main, which is why it's tested less often than
main

Regardless, I don't think -next is a useful tree for the wider pool who
usually test stable to try because of all the difficulties.  I do think
it's not impossible to get some of them to move up to main (after all
it's the .0 of stable).

James


--=-/UMWe2oYpZrkbqGzD/q7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCZnQ2VQAKCRDnQslM7pis
hS2RAQDC9b4iR1bOx6NG6LXl1nMdXUjLoKm3coBaLnPJJ53MsgD7BCEQVJ+irqrH
wfMaFvbBMacylkAE1Z5Xz7SuOxqtr0w=
=902F
-----END PGP SIGNATURE-----

--=-/UMWe2oYpZrkbqGzD/q7--

