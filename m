Return-Path: <ksummit+bounces-2821-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAfNLz2ld2k9jwEAu9opvQ
	(envelope-from <ksummit+bounces-2821-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 26 Jan 2026 18:32:45 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 266018B838
	for <lists@lfdr.de>; Mon, 26 Jan 2026 18:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C8D3032F48
	for <lists@lfdr.de>; Mon, 26 Jan 2026 17:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AE834D3B6;
	Mon, 26 Jan 2026 17:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/xMkA0U"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D5D34107C
	for <ksummit@lists.linux.dev>; Mon, 26 Jan 2026 17:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448745; cv=none; b=DVGASrSJl5REo5VxCUJWxC1VmoKpP4OVl5SF9fDXZFqO3D6ZRB3d2n5wV7Y8aYKqoJFq9KbAvQfZrO/mOnWRPPq5vw+xOqLhH/zAXc7t1Y7ZHpx4KnsoWmi9OIyHX+sUnf8l1NK66ETzyXNVEg5LGFZ4TwD6VkJhVPLrOmn4jRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448745; c=relaxed/simple;
	bh=4m8Bs5J6cOzpLw43W+mGRiomfnSUucaIGczwuYx01kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4Wefio3BHhBhcg/Ake88cA9qb7RZhq6JdjFr6/Urdf8T+x42iufoY1lZZDR+OHKz3YNlxZEcpEuyXFDsRZ9+51lSfI97KF36lOy1iqPUtDMQ18TT+haZGRjgtR8j0c1NSDOYDUxb56VNvu5XfEZtdFBbsfDQxSZLxf50LUg3l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/xMkA0U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D37DC116C6;
	Mon, 26 Jan 2026 17:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769448744;
	bh=4m8Bs5J6cOzpLw43W+mGRiomfnSUucaIGczwuYx01kM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/xMkA0U3lbijBPEuwwJF9Ja4BMNi3kjkQz4zSkJkJ/jZYOGKpbCDAHR6ZPq7wZQ8
	 xhzTTI5MedJo3SGtMty8TL+do2leBeNlBmpbT6wq18qhNJeKpsD2/Ky6kc2EM9J7ef
	 zKGohBGcTmg4w2TaQ4ebgg9IfWoxDpIxaxBASdKqTfD2nE3y5Aq+xiG61wooigQmwf
	 fFK01DsfizjcH9p6tV+PluqUtiAabDqnEu9M0hkxvEjPnjfFvJEHKvUvaLJey6QLIc
	 4m4VsQhT096g75c8ykknOEOpxYYJkF/CgNIuE6UjeK8R2oOpgAWe3SdUrxX5lya+J5
	 xBIvLscg2PljA==
Date: Mon, 26 Jan 2026 18:32:22 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, users@kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
 <2026012340-wildlife-scratch-1efd@gregkh>
 <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
 <20260123-provocative-tungsten-curassow-cc2aac@lemur>
 <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
 <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q6ayt2ogur2w5pta"
Content-Disposition: inline
In-Reply-To: <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2821-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 266018B838
X-Rspamd-Action: no action


--q6ayt2ogur2w5pta
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
MIME-Version: 1.0

Hello Konstantin,

On Mon, Jan 26, 2026 at 11:23:43AM -0500, Konstantin Ryabitsev wrote:
> On Fri, Jan 23, 2026 at 10:12:39PM +0100, Uwe Kleine-K=F6nig wrote:
> > >   - I am the bottleneck in the process, because all updates have to g=
o through
> > >     me; even if we add more people to have access, this would still b=
e a
> > >     bottleneck, because the more keys there are in the web of trust, =
the more
> > >     finagling the whole process requires to deal with expirations, key
> > >     updates, identity updates, etc. We can rely on modern keyservers =
for some
> > >     of it, but not for third-party signatures, which are key for our
> > >     distributed trust.
> >=20
> > Just to ensure we're talking about the same thing: This is about calling
> > a script once a week or so, check the resulting diff, commit and push,
> > right?
>=20
> This is for updates, yes, and this is mostly hands-off except final revie=
w.
> Adding new keys is usually a lot more involved, because there's frequentl=
y a
> back-and-forth required (they sent a key without any signatures, there is=
 not
> enough signatures, the signatures are too far removed from Linus, etc). We
> currently have about 600 keys in the keyring we maintain, and we clearly =
can
> do a much better job like being more proactive when someone's expiry date=
 is
> approaching. I'm worried that if we tried to maintain a keyring for sever=
al
> thousand people as opposed to several hundred, this would snowball into an
> unmaintainable mess.

Actually I'd like to see you/us add still more burden and asking
developers to only hand in keys with an expiry date <=3D (say) 3 years.
Something similar to what
https://www.gentoo.org/glep/glep-0063.html#bare-minimum-requirements
requests.

I suspect that among the 600 keys we have now, a considerable amount is
actually unused and it would be good for security to drop these. With an
expiry date detecting such keys would be much simpler.

I wonder why you expect the number of keys to rise considerably?!

> > Having said that, I'd like to support you in the maintenance of the
> > pgpkeyring if this is considered helpful.
>=20
> I do appreciate your work!

Areas that I see where I could be helpful are:

 - moderating the keys ML
 - giving feedback to patches
   (currently I mostly see the patches when they are already handled
   because you seem to do moderation and patch handling in batches.)

Best regards
Uwe

--q6ayt2ogur2w5pta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAml3pSMACgkQj4D7WH0S
/k4J4Af/c3z/Bj5FPXu3AyW+36zYNJ82PDJ/tdmKSVfOWWDkKfl1df7NfDbk2TYp
72x7Km6PITw8++bo8yLC5o4xXikc3J7Tep8rdjQ3ts5BRgu6sUhTLU7Nfd21Qc8E
lnDCxE8HoTK21klszcMn18Q3KiGgkuIxZWYdlVsPBIw6PQVkDV24GQWNUum8TXUK
RYe3s1/i3BbfmhWpr29ea2SorqhM0PjvBGlGBiStU6VoPWYQ+JnLo6I3TpCpVo5x
OZqy+106B687dARei6x49imi7x6658aZ5jUQEx3F+KQ4b/d8kwNomoDJyRzXx6AU
6x/jESg8X+u6TdBXkMYaLQn4bH1Lyg==
=pDGQ
-----END PGP SIGNATURE-----

--q6ayt2ogur2w5pta--

