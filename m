Return-Path: <ksummit+bounces-284-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4B3BE734
	for <lists@lfdr.de>; Wed,  7 Jul 2021 13:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CA2293E0F9F
	for <lists@lfdr.de>; Wed,  7 Jul 2021 11:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90FB2FAD;
	Wed,  7 Jul 2021 11:34:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B272
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 11:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id EEBBF1280AFA;
	Wed,  7 Jul 2021 04:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625657680;
	bh=SPaN8BKzYDPfA5AP6HbWayhr2DmSULojt+zA8QfbjRQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=rEYaxcoRX1T9SavWFj1FYqlE9+Gx4lJBIhKqnDqPAFz3No1srHfJ6Fv6y5N/KYmtg
	 jKnBzTFtFPPwSruEUGsC/wddYDUlcEfEAPBGGUqm47+2kgoVi4fOAFEYUnX+Xbq6xj
	 rcrS8EaaP1PfFLRjO0R2LBGZ6vfdfoRxpMQYDhdc=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vblUg5yk8RiR; Wed,  7 Jul 2021 04:34:40 -0700 (PDT)
Received: from [192.168.0.73] (cpc1-seac25-2-0-cust181.7-2.cable.virginm.net [82.8.18.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 427251280AC1;
	Wed,  7 Jul 2021 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625657680;
	bh=SPaN8BKzYDPfA5AP6HbWayhr2DmSULojt+zA8QfbjRQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=rEYaxcoRX1T9SavWFj1FYqlE9+Gx4lJBIhKqnDqPAFz3No1srHfJ6Fv6y5N/KYmtg
	 jKnBzTFtFPPwSruEUGsC/wddYDUlcEfEAPBGGUqm47+2kgoVi4fOAFEYUnX+Xbq6xj
	 rcrS8EaaP1PfFLRjO0R2LBGZ6vfdfoRxpMQYDhdc=
Message-ID: <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Rust for Linux
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Roland Dreier <roland@kernel.org>, Miguel Ojeda
	 <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Date: Wed, 07 Jul 2021 12:34:31 +0100
In-Reply-To: <20210707105000.GA4394@sirena.org.uk>
References: 
	<CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
	 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
	 <20210707105000.GA4394@sirena.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-HXMc+cC5BL8WFHYlg3AI"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-HXMc+cC5BL8WFHYlg3AI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-07-07 at 11:50 +0100, Mark Brown wrote:
> On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier <roland@kernel.org>
> > wrote:
> > > "devres" / devm_xxx was an attempt to deal with this in C, but it
> > > only solves some cases of this and has not received a lot of
> > > adoption (we can argue about the reasons).
> > =20
> > Really? From my point of view that is adopted all over the map.
> > I add new users all the time and use it as much as I can when
> > writing new drivers.
>=20
> Yes, it's *super* widely used in most of the kernel.  Perhaps there's
> some subsystems that reject it for some reason.
>=20
> > I think it's a formidable success, people just need to learn to do
> > it more.
>=20
> There *are* issues with people adopting it too enthusiastically - as
> well as the memory lifetime issues that Laurent mentioned it's easy
> for it to cause problems with interrupt handlers that are left live
> longer than they should be and try to use things that were already
> deallocated.

Fixing this should not be beyond the wit of humankind, though.  If we
delayed deallocation to module release, that would fix the interrupt
issue, wouldn't it?  Perhaps all devres memory for devices should live
until then anyway and thus be automatically deallocated instead of
needing an explicit free ... the problem with that being compiled in
devices currently optimize away the module refcounting, but that should
be fixable.

James


--=-HXMc+cC5BL8WFHYlg3AI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCYOWRRwAKCRDnQslM7pis
hTWgAQD0l3nfBU3wiSpXHjH8RHn5Eso3NWRYwul+Z6VzO6Vs6QEA/pr8vKX0yy5L
MEgW+olDzlBufYbt8P+G4+ioy1IziJ8=
=xQo5
-----END PGP SIGNATURE-----

--=-HXMc+cC5BL8WFHYlg3AI--


