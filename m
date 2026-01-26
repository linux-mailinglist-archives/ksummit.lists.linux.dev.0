Return-Path: <ksummit+bounces-2825-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A5rKdH5d2nGmwEAu9opvQ
	(envelope-from <ksummit+bounces-2825-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 27 Jan 2026 00:33:37 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF68E361
	for <lists@lfdr.de>; Tue, 27 Jan 2026 00:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C9D4301980C
	for <lists@lfdr.de>; Mon, 26 Jan 2026 23:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFB030FC36;
	Mon, 26 Jan 2026 23:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6uo2rnw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6630FC10
	for <ksummit@lists.linux.dev>; Mon, 26 Jan 2026 23:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470411; cv=none; b=Q2yshHVx1tjYn5LFtymj28CTtJ5oSjKgZviIPZ4pzUArIcXo7J27H7ckTSf/pxfpFpN0jKjnzPJZa8+TCJ6XsGFa2k4dAXQJwjhTWoKuE+4vWkYkT0GV4oopyWNOnpqeES3EsbVuyQzivcNKGicKAUiTDTc2NJJECJ84RuFPakM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470411; c=relaxed/simple;
	bh=SCKHCq60cIrne++xUwxjtXoH07OeD8QqoVITKT8mTaM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7feANzRnR7zxFExqvJeMbl/sBikeb4xVU3NdC4AczsOK/ed2c+pHNrVKOncwTK/14627RnUCwzDi1X2IF4vl/dh5POnwoByYWqJYikzOB3Z425AsZ9CuGlT/iYgeUhC6sia0n6bM22SLMcAO4Ud/mPCb+/35HMunsTYNfn/40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6uo2rnw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97098C116C6;
	Mon, 26 Jan 2026 23:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769470410;
	bh=SCKHCq60cIrne++xUwxjtXoH07OeD8QqoVITKT8mTaM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i6uo2rnwjo4E1KWvxCasSpl1+1E5mWAlFw2izDeigMamCGekMdFnX091eTqke6JUm
	 HFCCG6ZOhw7ROUUu3t4PTvXnqh/UQu75vZHXuFIKQTJir7M0eMj7oCyEtnynOEsErg
	 dNR8IgETLaPnz6COdmlaHyeL3i7txgebDdtnv1DuUROWo2lRUa6P49UoMf66vTNB0U
	 YlIrU8jtnAsgSACs6QAJmLtBUhUzmVq3Yb+77GhUncMbTxWugz8IRnU1QuRm2v4Z5K
	 RXLDz7+4g4uphIqSr0r/jnRj9B82UIdbP3tijifiSrpRZpHVD9VISAAc7rhjakX/nB
	 16B3Ensc4R9IQ==
Date: Tue, 27 Jan 2026 00:33:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Konstantin Ryabitsev <mricon@kernel.org>, Greg KH
 <gregkh@linuxfoundation.org>, users@kernel.org, ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260127003326.1862e801@foz.lan>
In-Reply-To: <x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
	<2026012340-cannot-spud-5d46@gregkh>
	<806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
	<2026012340-wildlife-scratch-1efd@gregkh>
	<8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
	<20260123-provocative-tungsten-curassow-cc2aac@lemur>
	<c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
	<20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
	<x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,ksummit@lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-2825-lists=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 0CAF68E361
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 18:32:22 +0100
Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> wrote:

> > > Just to ensure we're talking about the same thing: This is about call=
ing
> > > a script once a week or so, check the resulting diff, commit and push,
> > > right? =20
> >=20
> > This is for updates, yes, and this is mostly hands-off except final rev=
iew.
> > Adding new keys is usually a lot more involved, because there's frequen=
tly a
> > back-and-forth required (they sent a key without any signatures, there =
is not
> > enough signatures, the signatures are too far removed from Linus, etc).=
 We
> > currently have about 600 keys in the keyring we maintain, and we clearl=
y can
> > do a much better job like being more proactive when someone's expiry da=
te is
> > approaching. I'm worried that if we tried to maintain a keyring for sev=
eral
> > thousand people as opposed to several hundred, this would snowball into=
 an
> > unmaintainable mess. =20
>=20
> Actually I'd like to see you/us add still more burden and asking
> developers to only hand in keys with an expiry date <=3D (say) 3 years.
> Something similar to what

I would love to replace my main PGP key with a new one using a strong
post-quantum algorithm[1], and then using revocable sub-keys with a
small expiry periods (3 to 5 years), but there are some technical and
logistical issues [2]:

- gpg 2.4 doesn't seem to support to support it;
- "updating to 2.5 would result in new users generating incompatible=20
  LibrePGP keys" (from LWN.net post at [2]);
- a change like that would require to restore the web of trust,
  asking people to resign your certs. Not hard to do on a
  conference, but doing it remotely, the right way, is not trivial.

So, I guess we need to wait for a couple of extra gpg versions
(or alternatives) to do it at the best moment - while keeping
our old keychain in place as a fallback.

[1] Replacing with traditional crypto algorithms is probably not
    worth, as, quantum computers are becoming a reality soon.

[2] https://lwn.net/Articles/1055053/

Thanks,
Mauro

