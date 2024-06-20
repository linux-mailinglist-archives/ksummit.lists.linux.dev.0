Return-Path: <ksummit+bounces-1340-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA4910AF4
	for <lists@lfdr.de>; Thu, 20 Jun 2024 18:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4964F1F234B7
	for <lists@lfdr.de>; Thu, 20 Jun 2024 16:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B93D1B14E0;
	Thu, 20 Jun 2024 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="H3rCn9ZO";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="YKiP9iWb"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DB1B29CD
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 16:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899348; cv=none; b=slJigYTVTBTE3d4+H+B25GRPp9tJY23V4MYeGYq0CBpPs1aCJU6kMLxsyx0dRGE/MuZClvMdqsZjrQAg3ao3c7aGUz06b6AsBjTLYhc38vcLx6it67ubWL17W32hmHYwJirZZFbOp1/a1ys12TaULlsyTjUKvQiKE+hEY9PXajE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899348; c=relaxed/simple;
	bh=lJqo6SIAKGV92EquVmUPMT5V/Kkta0vrv3UYIwLyb7A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o0RFUywt0TcAcDcHe8sOr4fAz75ZxK9t+9HJxpKE8Ct/cFk+EhWKLM3+xQZqAo28/xNx6R8R6cm5kmHd+dhu0+zvzH6ULqr+izXo8imL+7vpoXVvN/m4C9gfPuV69mpdJOx5/vFJkY1Y/2y6oW13JQoPXm5sCpOE4Hr0TqobD2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=H3rCn9ZO; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=YKiP9iWb; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718899345;
	bh=lJqo6SIAKGV92EquVmUPMT5V/Kkta0vrv3UYIwLyb7A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=H3rCn9ZOr+/g59MtVsq154+q87neShA0qYIsghn48PgMWg4HkZeRJ9tATknPzfPZf
	 IY9UylLtVhql9yL5VKntFZ+LqTb2ArEWv9Ilg7piCLHTPQsWKYVfWnrvggdIz85Gj1
	 74z0yDvsgnzuq5AYJ0BeZcihV42k7u8/AS3yrRHg=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2BB80128748C;
	Thu, 20 Jun 2024 12:02:25 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id MAbLWmc2d8RU; Thu, 20 Jun 2024 12:02:25 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718899344;
	bh=lJqo6SIAKGV92EquVmUPMT5V/Kkta0vrv3UYIwLyb7A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=YKiP9iWbqKXqNMj+UpdSB5TgbKpgxFWsEu56QC2TUiEWufF6TbYvPt0IYVYjQWDKq
	 wBx53etHupBoXdqMX6YwzaVwerjuLalfCMhix/ph7RjylBcXeG4xHVUWHSaqMyXEUw
	 EmJ38SdAUI6ETnsZFsWLdjyFy4h/Vt3hc/RJuppU=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 50F1D1286DF8;
	Thu, 20 Jun 2024 12:02:24 -0400 (EDT)
Message-ID: <32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
	 <ksummit@lists.linux.dev>
Date: Thu, 20 Jun 2024 12:02:21 -0400
In-Reply-To: <710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
	 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
	 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
	 <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
	 <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
	 <710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-udjEMSf8H0/M9lRiXasi"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-udjEMSf8H0/M9lRiXasi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-06-20 at 15:42 +0100, Mark Brown wrote:
> On Thu, Jun 20, 2024 at 10:01:57AM -0400, James Bottomley wrote:
> > On Thu, 2024-06-20 at 14:55 +0100, Mark Brown wrote:
>=20
> > > If your tests take more than a day to run then it gets more
> > > tricky, but that's just generally harder no matter which tree
> > > you're testing.
>=20
> > The difficulty is usually that by the time you get a signal
> > something is wrong, the next tree is different.=C2=A0 I agree you can
> > freeze on the
>=20
> That'd be the tests taking more than a day bit.

Depends ... we might be using different terms.  I think of testing as
simply finding the bug.  After that there's usually a whole load of
work to pinpoint the commit that caused it, so even if a test only
takes say 30 minutes to run, the bisection can take over a day.

> > next tree you have and hope that the identified commit (by the time
> > you find it) is still in the current version of -next, but there is
> > a non-zero chance it would get rebased which makes testing next a
> > bit more of a chore than testing main, which is why it's tested
> > less often than main
>=20
> Obviously some trees do rebase, but not constantly and a lot of trees
> simply don't rebase - carrying things forward to the next day tends
> to be more of a mild annoyance IME, especially if you remember all
> the good and bad commits and don't need to restart from scratch.

I agree that -next is mostly an unstable tree built from reasonably
stable branches, yes.

> > Regardless, I don't think -next is a useful tree for the wider pool
> > who usually test stable to try because of all the difficulties.=C2=A0 I
> > do think it's not impossible to get some of them to move up to main
> > (after all it's the .0 of stable).
>=20
> AFAICT we have a far wider pool of people testing -next than we do
> testing the stable -rcs at the minute, there's more people trying to
> *use* stables and finding issues but that's not quite the same thing
> and I suspect much of the plain testing is going to be qualification
> for release so it'd be hard to get people to substitute mainline.

Right, but the point I'm making is that even that wider pool doesn't
have the app use or hardware breadth of the pool who try out stable.  I
also agree the stable users would rather not be testers but given that
they are, it's not impossible we could sell them on the idea of testing
out .0 to find bugs they would otherwise be finding in .n.

After all, given that stable is now delaying backports in the merge
window, there should be at least a 2 week period where .0 is it
(although it's also the two week period where we're not paying
attention ...)

James



--=-udjEMSf8H0/M9lRiXasi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCZnRSjQAKCRDnQslM7pis
hTuHAP40/5UqaTCdiFWcX8qhxPVKXtvMpX4tjt5avtdtpboOBQEAqolB3IqfXk7t
DyoJNiCBiTQH/NyrGH9RqwSeol8Ax1o=
=n0SG
-----END PGP SIGNATURE-----

--=-udjEMSf8H0/M9lRiXasi--

