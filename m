Return-Path: <ksummit+bounces-2826-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOSGJON5eGnBqAEAu9opvQ
	(envelope-from <ksummit+bounces-2826-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 27 Jan 2026 09:40:03 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E45DB912D1
	for <lists@lfdr.de>; Tue, 27 Jan 2026 09:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0391930480F5
	for <lists@lfdr.de>; Tue, 27 Jan 2026 08:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C422BFC73;
	Tue, 27 Jan 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qp//wSom"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3BB231A23
	for <ksummit@lists.linux.dev>; Tue, 27 Jan 2026 08:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503160; cv=none; b=udkb0T0nDE50adgbrLUHZ51jXHGUf6RGupDA1Zob8Wuc7HnbXAhvsLd0IuDQKtIkE/K0I8N9ZKhE2ni29ORy52y0VZNifxIOfLcUbqTqQ+SwyK/4IL1fES9HiC6PkYgZa/AY+rNMpkVNcjrkEXgID4rBodOzOAgpHRiK+HS9roE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503160; c=relaxed/simple;
	bh=4kxdl181a+IcTXKfCjuRUEy3xKhtNq2NYFzf7g3iea8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/emcRDF/Ms0JL2mY3RgcfVM+ozBxdP+5YGIB7YoNcBSTviLBK7oQ1ZFIbPj3ahVZTvoHs1ajlTXoQi4BDcgqzUHFVaStGdqEOeMB5sNBJONqZxdKjC09NerqbslkZnvFQ5ozaV3hefZC5YHVnA9Qm6dopIxHzJqGXsQ4s+OVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qp//wSom; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7BAC16AAE;
	Tue, 27 Jan 2026 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769503160;
	bh=4kxdl181a+IcTXKfCjuRUEy3xKhtNq2NYFzf7g3iea8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qp//wSomrTVDeCk0ZioPEQ5ymKQ16d2Hb5j73GLL1iyf5PBlg7rQzf+y6LiAEQJV2
	 A79SC2MXsFbazNqGx+KpgjC1AJ0RWJsyzbiBVHjJu7lFzNhW6lyzZJV3tVIPK+qHQa
	 tdZ0g5yeDqP74J8QKW+UJILFpL6VIzA5mFsUVd2e/wVtFiGzGJKR2NSAR3HP7GC4IS
	 rjQPrIBGeuNnmDelVwluoUOsxPeqa7Q4Yd2Cirhhech7RclpCyz6nW/iSMus5lVDYJ
	 eAX8auH4EFkdJHpzs2HmhsHb87BnFI0fq5yUlXxvE8D4/x1jrtgzj6A2DBIAPLKwri
	 3PTAEY6f1RwXQ==
Date: Tue, 27 Jan 2026 09:39:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Konstantin Ryabitsev <mricon@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, users@kernel.org, ksummit@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <4ilnblmm3srkyzq7o5ehlr2gnlrrnmr67dpoqxiy5vbrrqlqd5@my3rxybcpu5t>
References: <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
 <2026012340-wildlife-scratch-1efd@gregkh>
 <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
 <20260123-provocative-tungsten-curassow-cc2aac@lemur>
 <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
 <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
 <x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
 <2ef60fa3afe287cec92020b8b77a37c0b70cefaa.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yturcq4tyh2cvked"
Content-Disposition: inline
In-Reply-To: <2ef60fa3afe287cec92020b8b77a37c0b70cefaa.camel@HansenPartnership.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2826-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riseup.net:url]
X-Rspamd-Queue-Id: E45DB912D1
X-Rspamd-Action: no action


--yturcq4tyh2cvked
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
MIME-Version: 1.0

Hello James,

On Mon, Jan 26, 2026 at 06:23:08PM -0500, James Bottomley wrote:
> On Mon, 2026-01-26 at 18:32 +0100, Uwe Kleine-K=F6nig wrote:
> > Actually I'd like to see you/us add still more burden and asking
> > developers to only hand in keys with an expiry date <=3D (say) 3 years.
> > Something similar to what
> > https://www.gentoo.org/glep/glep-0063.html#bare-minimum-requirements
> > requests.
>=20
> You have seen Linus' views on gpg key expiry, right?
>=20
> https://lore.kernel.org/linux-scsi/CAHk-=3Dwi03SZ4Yn9FRRsxnMv1ED5Qw25Bk9-=
+ofZVMYEDarHtHQ@mail.gmail.com/

Thanks for the link. I was aware that Linus isn't a big fan of PGP and
GnuPG. Still I think that having an expiration for your PGP certificates
is a very sensible thing. All at least halfway sensible howtos about PGP
handling that I saw in the past strongly recommend to set an expiry
date. (e.g.

	https://riseup.net/en/security/message-security/openpgp/gpg-best-practices=
#use-an-expiration-date-less-than-two-years

which isn't up to date in every corner any more, but the section about
expiry is still accurate.
According to https://book.sequoia-pgp.org/sq_key_generation.html, the
certificates generated using sq default to a 3 year expiry.)

Yes, I agree it's inconvenient, but updating is a usual necessity for
secure systems. SSL certificates have an expiry; letsencrypt will soon
limit expiries to 45 days. We regularly preach that people should update
their kernel and roll our eyes about hardware running Linux 5.15.153
(that's my DOCSIS router) or 2.6.26.8 (that's my wifi radio).

Security is a moving target; and if you don't move with it, your
security level drops over time.

Looking at the thread you referenced above, I think Linus would have
been happy if he had your updated key in time. So I only see this as a
challenge to improve the keyring maintenance.

> As a result of that I've taken to using much longer expiry periods.

:-(

Best regards
Uwe

--yturcq4tyh2cvked
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAml4eaoACgkQj4D7WH0S
/k7PdAf/aUiewZkYtYN6tbvVhbRyN328Rke+Jkzevgk4W7uQHYR0CEPYAblbjtUE
ignUAHEyyAK0n6VsFDAzjmr7+JaCf/Pw2Z39wju+OQMRpbLOfOm/cDc5tD75c3KZ
E8i0UmqG/Q/2kXF2HsZrTUm+mIZQYBnmbRL5Cg2myXfJ782FE1yAFKyqKy60+RUs
ZHvY7eHIBYhEjLBYMNTNXAfSh8WJiRivcKFPDWGLzmYsSAEIIiDRuboG9f0WwqqP
Vn5YjiH3yA0WzSSwBAaNFuYXHNH77Z6oavSdjBgWGirIko5g7QMRyji6V0o1BqOK
HD2oEdb99+Pl/HO11b8O3Us0WxsVLA==
=8OWA
-----END PGP SIGNATURE-----

--yturcq4tyh2cvked--

