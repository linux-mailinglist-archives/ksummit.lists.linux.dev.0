Return-Path: <ksummit+bounces-2831-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DBRKsbchGkV6AMAu9opvQ
	(envelope-from <ksummit+bounces-2831-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 05 Feb 2026 19:09:10 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D45BBF6550
	for <lists@lfdr.de>; Thu, 05 Feb 2026 19:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1F6F303FDD2
	for <lists@lfdr.de>; Thu,  5 Feb 2026 18:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3428F306B11;
	Thu,  5 Feb 2026 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrDcVqjc"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776C30595B
	for <ksummit@lists.linux.dev>; Thu,  5 Feb 2026 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770314853; cv=none; b=H1WLvrRL/m61YSju59Mcesf2v9uEcnZy4vpFSyoilJwXLruuG+tKCeD7YbvIsExd6JgnTWz9L7Ri4vOL0irjv22wkX/Ut9oSvy3dNvqGQDyFyeq6J53UFrBzkcIT1qHe37nSCY87x5jp2CJQ7+GI98qKjpk8vxFhH4kR3CYv6lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770314853; c=relaxed/simple;
	bh=xQg3Bxv8duiCCJvDMUdTrANfjTrKNfDqNv64Vo83tnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tmj3vs2TBNRn7slIvLp0tFxggkqWhj/hYufSIW9M+7gT0YuHT667uj4eWuZS+nnPJwsdyMcnAJiMuVNJWu9c+uTvWR2PS9y4550+eZXRM3cGYzNGyZgZexygNJkxSxg0+Zl/j0dHxe1pilwRqMdleJQZH2fkYIIaZy6ZXyVX6Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrDcVqjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77C2C4CEF7;
	Thu,  5 Feb 2026 18:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770314853;
	bh=xQg3Bxv8duiCCJvDMUdTrANfjTrKNfDqNv64Vo83tnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrDcVqjcodcm+4nKMsxDAIwIJNZiVu5KEeGieXQAFxCR9mV65+APdNSCYCwbAHmgI
	 ZSo+uAR4wwtTcRr+pn7XuV12jFRlhjfclO7kS+FIGlyFJHv4JtV3wDrZOZtFntbsgq
	 GW0qMHgkbm+S1Z64/7QNB85vu4ZYrgw4R1lF5VBEhtxPC+BDWgb98V44XiKFM2zxU/
	 v/WSlk29QU8rIgfr5Pf60CvQRMJqqnpkTDbrPNaQeJjNzFOn02J6lDGqBVTVnf/72M
	 mbjO+zB781xi6E6tP0BgOUXcDDHPMdspaP94c5kkBTByThsKpKCPZrzIiFMlf5CS89
	 MRKMkP5nIIPxA==
Date: Thu, 5 Feb 2026 19:07:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Konstantin Ryabitsev <mricon@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, users@kernel.org, 
	ksummit@lists.linux.dev, "Neal H. Walfield" <neal@walfield.org>
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <2biipobzkforfbvidexqhz5zoqduyl4wkqx6sg4ubrhqdatrgp@dx3gxqgiy5bx>
References: <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
 <20260123-provocative-tungsten-curassow-cc2aac@lemur>
 <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
 <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
 <x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
 <2ef60fa3afe287cec92020b8b77a37c0b70cefaa.camel@HansenPartnership.com>
 <4ilnblmm3srkyzq7o5ehlr2gnlrrnmr67dpoqxiy5vbrrqlqd5@my3rxybcpu5t>
 <CAHk-=whoJY_pORG8M_K5kSA-x0+MwRa5wHwkHY4sbYbPFegc_g@mail.gmail.com>
 <2nvtfc5plg2i77hbv7jpco7q5kyym53dwume67vd3c6yvcmsyc@uaybcsxhnqjw>
 <7289c75f84bf43ad939b1899d2b251977c30359e.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sph7egmvzphst7id"
Content-Disposition: inline
In-Reply-To: <7289c75f84bf43ad939b1899d2b251977c30359e.camel@HansenPartnership.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2831-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D45BBF6550
X-Rspamd-Action: no action


--sph7egmvzphst7id
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
MIME-Version: 1.0

Hello James,

On Thu, Feb 05, 2026 at 10:14:06AM +0000, James Bottomley wrote:
> On Wed, 2026-02-04 at 11:49 +0100, Uwe Kleine-K=F6nig wrote:
> > On Tue, Jan 27, 2026 at 01:08:12PM -0800, Linus Torvalds wrote
> > > I have never ever seen any good reason for automatic expiration,
> > > and it causes actual real problems because *NOBODY* ever renews
> > > those expiration in time and makes sure that they actually
> > > percolate out.
> >=20
> > A good reason is that it forces the users of your certificate to
> > participate in the percolation of your cert. This is relevant to make
> > updates to the key (new or revoked UIDs and subkeys) known. For that
> > an expiry time of 2 years is even quite long.
>=20
> That's not a good reason: we already have a set of key distribution
> mechanisms now and have no need of additional percolation ...
> particularly as our key uses are mostly limited to tag signing for one
> person.

OK, if you're just using your key for signing tags and you don't care
about the reasons I gave in my previous mail, I probably cannot convince
you.

But let me note that it's not you who maintains the kernel.org
infrastructure and thus you don't have a strong interest to disable
accounts of people who are MIA. It is also not me, but if I were in
Konstantin's position I'd push for a policy to only accept keys with an
expiry date just that everyone has that dead man's switch that is easy
to push for them and easy to check for me.

> > > So no. No expiration dates. They are stupid and do not work in
> > > practice. End of story.
> >=20
> > This is a poor argument. Such a failure doesn't necessarily mean that
> > the concept of expiry dates is wrong.
>=20
> OK, so come up with a good argument how short expiry would work for the
> way kernel developers use keys.

You're changing the topic here. My point is that Linus's reasoning is
wrong and expiration dates have a justification. For that a smooth
workflow is somewhat orthogonal. Anyhow:

If you consider the reasons I gave in my previous mail as relevant for
you, the only burden is that you create a calendar reminder, and when it
triggers run:

	gpg --quick-set-expire $yourkeyid 2y

and then publish the result e.g. using

	gpg --keyserver hkps://keys.openpgp.org/ --send-key $yourkeyid

or whatever is needed to get your certificate into WKD or DNS or
the kernel keyring once every two years. Nothing more is needed and it
even works when you missed the expiry date.

And with https://gitlab.com/sequoia-pgp/sequoia-sq/-/issues/622 fixed
(for GnuPG) you don't even need the calendar reminder.

> You're the one asking for us to adopt a currently non-standard
> practice, so the burden is on you to argue for it. (and the
> percolation argument above isn't good enough because it's irrelevant
> to our workflow).

In my bubble using no expiry date on key material is non-standard. (See
also TLS certificates and DANE signatures. Also more real-life stuff
like government issued ID cards and credit cards have a validity.)

Looking at your cert (which btw I was unable to retrieve from
keys.opengpg.org and WKD which I consider the two most usual ways to get
PGP certificates; and keyserver.ubuntu.com only has an old copy that
will expire in March 2026) until recently you used 5 year intervals to
extend your expiry and only the last update uses 10 years. So it seems I
don't have to convince you to use my "non-standard" practice in general,
only maybe that you use shorter intervals ;-)
=20
> > Here is another weakness of how GnuPG handles things. In Sequoia,
> > import and trusting are two separate steps whereas when using a
> > curated keyring (which is what you seem to do with GnuPG), importing
> > and trusting are a single step. This means that users have to be very
> > careful to not inadvertently import a certificate they don't trust.
> > The Sequoia model allows you to import an untrusted key and only use
> > a broken signature as indicator for something being wrong but without
> > having much trust in a good signature.
>=20
> That's just propaganda: gpg can absolutely manipulate the trust
> database independently from the signatures on import.  I think I
> explained this on the users list only the other day (how we could use
> trustdb to compensate for all our 2011 issued sha1 key signatures in
> the kernel keyring).  However, trustdb manipulations are hard for
> casual users to understand and get right.

I agree to everything you said in this paragraph apart from "That's just
propaganda". So yes, GnuPG can handle the trust stuff, and it is hard to
get right and thus most people (including obviously Linus) don't use it.
That's exactly my point when I say this is a weakness of how GnuPG
handles things.

BTW, having to extend the validity of your key material regularly also
creates a good opportunity to check if everything is still on par with
reality. And there is something to do for many keys in the kernel
pgpkeys repo: If the currently 637 certificates in that repo are passed
to the Sequoia certificate linter (`sq cert lint`) it diagnoses:

	Examined 637 certificates.
	...
	  274 have at least one User ID protected by SHA-1. (BAD)
	  261 have at least one non-revoked, live subkey with a binding signature =
that uses SHA-1. (BAD)
	...
	  9 certificates have at least one non-revoked, live, signing-capable subk=
ey with a strong binding signature, but a backsig that uses SHA-1. (BAD)

Now if all these keys were in need of an update regularly and GnuPG
fixed these issues en passant during such an update (which technically
it could do easily and IMHO should do but doesn't) we would already have
got rid of the SHA-1 binding issue.

(If you want to check if your key is affected, see
https://lore.kernel.org/all/fxotnlhsyl2frp54xtguy7ryrucuwselanazixeax3motyy=
oo3@7vf7ip6gxyvx/
for instructions or
https://www.kleine-koenig.org/~uwe/resign-sha1/?certid=3D79BE3E4300411886
for diagnosis also covering 3rd party signatures.
(Replace 79BE3E4300411886 by your own key ID in the 2nd link if you're
not Linus.))

Best regards
Uwe

--sph7egmvzphst7id
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmE3F8ACgkQj4D7WH0S
/k5p1Af+LqTqIRey7ffi9syH2B5AwyslFYe+/H+GLcupa6kXewBuhbQCQj2951IY
u108+QFdxzZPWhKic5m11ko0PPmMxgipiF6r13DQLFhuDqfV3w6x8x8pfnPAr8Ua
5rxpeg+IYFCsRnmNzhUpsZuoO+l/1nG97H1NFhyL79A2ExgsDQDJWm+EYQQOP572
36I9bVJO/LmnLWKfGMlkqe91T5oToS5jkYL1Fd5P6i1bXCga/6rKZBQVYTD/uBKT
PuKo0v3em9pDUQze+ghUmCbo0mps3wXJS4RhqaYtp+h7FklLY8XmEIz/ouMxsVnM
YQYsG48EGh0cu6xMKUSYySgwiZYWWQ==
=kIpt
-----END PGP SIGNATURE-----

--sph7egmvzphst7id--

