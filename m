Return-Path: <ksummit+bounces-2807-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j6yQA2Dkc2myzQAAu9opvQ
	(envelope-from <ksummit+bounces-2807-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 22:13:04 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 712097AD6E
	for <lists@lfdr.de>; Fri, 23 Jan 2026 22:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFE5B3017398
	for <lists@lfdr.de>; Fri, 23 Jan 2026 21:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA072F363F;
	Fri, 23 Jan 2026 21:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMFlESsY"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5B4239086
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 21:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769202778; cv=none; b=UH945b5/3w3rmZHa46Eyt5LqsR1xfweoYDk17Gp5AU8PDzUZaVucsRQhVbF4TQTsrITxMbwAaZKSZgGgrUkuqWznK5zi4jrHrAp4KCvE4QgTpdHxpbnKqOrHzfWNrLaNpLqU2V5Y3xgwnYFmWizIRxh/1J0fu15C/gw6nGhGQnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769202778; c=relaxed/simple;
	bh=heQVHAEHYMb94aXplxS4d8J7//1ymtcvsPGuS61RzIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQ8fvq7VI5mx1DVB8+ZWf/YKtpMMwJrqaRiMLCqJ0IG51yO9JaG3hGtEuGEGkKwLJV+ce0O8uwk95H4uEqd0MH6RQeHlHHfKL3v4PmlUbRXYVSABSGZTHd3Jl0JLw9mN/jy1V/RrQp+fcAusd90+VDZXhW/dND/Zz0LyxBGPUwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMFlESsY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B15C4CEF1;
	Fri, 23 Jan 2026 21:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769202778;
	bh=heQVHAEHYMb94aXplxS4d8J7//1ymtcvsPGuS61RzIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AMFlESsYEXEC14/S5c53jxy+FHcz8z2OITl0wxrkz5IFj84hWcveDJJA2fi3oSdzn
	 9gg3AHyc2l1qZqM83fslU2N+W/l+6XnMTHPwpSh735LfJfA6EhmeJZrM6CLwyS6MSg
	 6EJ/exl1uwBspzfDEquZXiPz1Ya22FmmYJQwNFVMsfjUr1DNnA5aVnOV+WCaQ3HOG5
	 bzYOW/CFGhwnRHKXCDVsPKkxHh0QwF50HvwRuUcARFtrQfNF8i/2kTY6PMmqClmvK4
	 T50xMMHcRcQsnSEiUt13OsMkDvyYrtc2hLSZxGHQ6ErO4w3h4BHyxJjnmoK/Eut5Iw
	 VFiRKPCVFCx7Q==
Message-ID: <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
Date: Fri, 23 Jan 2026 22:12:39 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
 <2026012340-wildlife-scratch-1efd@gregkh>
 <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
 <20260123-provocative-tungsten-curassow-cc2aac@lemur>
Content-Language: en-US, de-DE
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
In-Reply-To: <20260123-provocative-tungsten-curassow-cc2aac@lemur>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------D0Do3CdeWCQWc8WsmRiE0y29"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2807-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,ksummit@lists.linux.dev];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 712097AD6E
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------D0Do3CdeWCQWc8WsmRiE0y29
Content-Type: multipart/mixed; boundary="------------8t3KtBILKWnqfxiMO67w76u0";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
Message-ID: <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
 <2026012340-wildlife-scratch-1efd@gregkh>
 <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
 <20260123-provocative-tungsten-curassow-cc2aac@lemur>
In-Reply-To: <20260123-provocative-tungsten-curassow-cc2aac@lemur>

--------------8t3KtBILKWnqfxiMO67w76u0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Konstantin,

On 1/23/26 19:23, Konstantin Ryabitsev wrote:
> They are primarily working with me, and just so it's clear -- this is n=
ot
> any kind of assured thing. Here's where things stand:
>=20
> - they asked us how we currently do our trust framework and I described=
 the
>   process and its drawbacks, which are real:
>=20
>   - I am the bottleneck in the process, because all updates have to go =
through
>     me; even if we add more people to have access, this would still be =
a
>     bottleneck, because the more keys there are in the web of trust, th=
e more
>     finagling the whole process requires to deal with expirations, key
>     updates, identity updates, etc. We can rely on modern keyservers fo=
r some
>     of it, but not for third-party signatures, which are key for our
>     distributed trust.

Just to ensure we're talking about the same thing: This is about calling
a script once a week or so, check the resulting diff, commit and push,
right?

>   - We can't reasonably expand this to all kernel developers (not just
>     maintainers), because of constant churn of people coming, going, ta=
king
>     breaks, etc. Maintaining the web of trust consisting of thousands o=
f keys,
>     as opposed to hundreds, would become a full-time job if we stick to=
 how
>     it's currently done (via the git repo and manual verification on my=
 part
>     for all key additions).
>   - We're limited to PGP only, but it would be nice to also support som=
ething
>     like fido2 ssh key signatures.

I personally am happy with PGP and I don't see the benefit of using ssh
keys instead. But I'm open to look at the approach that we will see in
February.

> - they said they could come up with something that would use self-sover=
eign
>   did's that would allow scaling the trust framework to all kernel deve=
lopers
>   and be self-sustaining and verifiable via cross-signatures.

123456789012345678901234567890123456789012345678901234567890123456789012

(Maybe apart from self-sustaining) this sounds like PGP. I consider it
self-sovereign as it's only me who has control over my certificate and
cross-signatures work fine, too. I agree that using GnuPG isn't nice for
newcomers and people only using it occasionally. But it is able to do
all the things we need from it, it has integration in git and mail (and
also ssh if you want) and I'd hesitate to throw that all over board for
something shiny new. I wonder if a new tool that covers all the needed
use-cases can be considerably simpler than PGP. And if that new tool
allows to let me continue using my PGP certificate, the complexity
cannot be less than PGP alone.

Having said that, I'd like to support you in the maintenance of the
pgpkeyring if this is considered helpful.

Best regards
Uwe

--------------8t3KtBILKWnqfxiMO67w76u0--

--------------D0Do3CdeWCQWc8WsmRiE0y29
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlz5EgACgkQj4D7WH0S
/k7PIgf5AcmumwAXWpJ8KMgxj3F6HlZBZ54TqwpzyhxYi76M2JVJBDKjTUEQoYEe
RbeC5bzsNyQ97VVJwLfe8iL23wFdPtQS/V0IXg/57iDD5QNcsFWwZ9AmLlOZQoCq
0G0uzr1j74AdThFob8xa1bJFR7TPy4BakUMd+rH3UvwIK6ldOo5Ji5ypExumz7iz
9qDft4jXb8YpN0aheUX7yRG7LjNQ5IznPfxTG9o6zTOdaJk9ef6vs7K3wz87C9cn
ooIJ+Pz9WbvYt3vO3vEV/B9MdsFxJxM/mjpAGbB+A35tlkdkaHF1aZWgrkg6nyUV
ilW/6CNhaN6IcYTiylC2G2/ID65QhQ==
=bJuq
-----END PGP SIGNATURE-----

--------------D0Do3CdeWCQWc8WsmRiE0y29--

