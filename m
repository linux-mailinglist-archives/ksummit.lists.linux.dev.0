Return-Path: <ksummit+bounces-2823-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK85FZHzd2npmgEAu9opvQ
	(envelope-from <ksummit+bounces-2823-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 27 Jan 2026 00:06:57 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5B88E25C
	for <lists@lfdr.de>; Tue, 27 Jan 2026 00:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33ECA3036066
	for <lists@lfdr.de>; Mon, 26 Jan 2026 23:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108A130C36E;
	Mon, 26 Jan 2026 23:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiY84qPT"
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDF30C353
	for <ksummit@lists.linux.dev>; Mon, 26 Jan 2026 23:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769468789; cv=none; b=ODs81wlIM2FE89o2wiK0WOhIRHgiHG5GPz/2htNDe5RU1KHhKkcGpe1Lub6zzI9S9Q0r2d1CKOLI2/HQ36zjPhyBu92JrqlpTj/QSdnExjf6yAy6yoH8IaNoKjBlQ3Jvfoc+7pxqxJ0zXZpo2fwtKkoCC562PxJ1ImZ8aNmQ+Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769468789; c=relaxed/simple;
	bh=QJkjd/gJTRdjMgyovQj/JwLUaclB4twTqgDxIVuGqpo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BcZXIdVizAPIp+xkjsqHKCTLCT5cLdJomAPflaWTiAv4e/J74OgGSo6tvOY2Wd87ruihyat8xlrPEyMaQ63HpD3pPCMSUzHcGJZb5wdY4k6IuLZyvXWFxt0fHbVIOGZdk67lY9+yLMOqCYFwcLWjpwOvvBEPRpoKrGr97A26NRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiY84qPT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so57001715e9.2
        for <ksummit@lists.linux.dev>; Mon, 26 Jan 2026 15:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769468786; x=1770073586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOZ1ZFivJamEOHgzehoLqsnmdkwkHNZ0PwJ9bU8ee5M=;
        b=TiY84qPTZ4F0xrilEoVJlmJSwb2pplRAijiVW4uJMPc0iwiifZWEWhEqXbH4wSDkf5
         oUTqxYmfdeafku6zper2pmnD1tSUNPufrhr9b/3vOsl3r0sUd2WeEdCdEA6Enc8g/rhl
         CQoRD5b2+zc9M5ye+zXR4XcFY0aSiW/yZtPcpA+I3DE+/FNC/gvOU4Bt6EaTXDHPclXo
         m8teV7yx4esvrF4GOyA2DXW5Rg3ADG8CdTfo5ksqag0oAMWj+0+q+wYUIa550nFCwSux
         1zm0eS7grk4Gh51Ky/s93M4NeUcbql49rLiIodv+UyeFiW63aV2V0xBNAZjkiB7EO8AI
         2x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769468786; x=1770073586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nOZ1ZFivJamEOHgzehoLqsnmdkwkHNZ0PwJ9bU8ee5M=;
        b=Q3ElP50X9IqJVbth+Py/fTxDj820+/oOKiG5Wk5D/awLClCEG8PTrzUkcFYJ/Q9frP
         bNYhwYDMPPXsYIRK/e30wNP1SOF/kWz602EuL71ZvfSFokSY1xO4wGBtLGJXS1yzDXWz
         0XczP4IVum8a4hOut9iJJtTHKuU9IEE2r1vXiL0FXtXuQJARrGv1qxvhBGdkXNeU5KkW
         o1rWmfr+PHfU9K4PVK1nBkaWYJ/Hsvk8D58HfqnmMmPqEb8li4IQUS3vUdpBkFzTXeDY
         AJU4jihp8LpxD4O9NP4vHiQUOTa+3pYdDMRy+OKIbZ23yOTZwOSGKgEaovFPitqtDu0y
         DPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Tsd3kxCiiE/Ph6E/Eifdg0mwCTAItVN6i5bHuPn7jTuNVy22wDrkDfFM7fPLxajTg7XUey6N@lists.linux.dev
X-Gm-Message-State: AOJu0YzMOFjPhn9OFFLblZwb8ZtvRjr1GyJcvBuuvhycD7hkP5czG12s
	8z3AgvzjyC1FB7/+B6JDoHAlNeWWnkHgdR1uQmFpYGfqfo8+yRcaX30oIX7AMQ==
X-Gm-Gg: AZuq6aKdR4yatzeEVFYUxxy+TjE0LZ3rqOjF8mEXPpLsfzLt5RG1eqWPQRKWc5SyGGu
	xG3Ib4tFLQt0Hi4+yM1RBEYh9CH8Wbh4ZvQ8tu5N7JZTbAGjcPKmH0DoNaBJwE1u596IOpfF5x1
	v0sYCD/Z01/z2D5+9afo31mxg8XHfhq7U021NGG7wzglKRpqaXf9HdfxhyNPsNpIEHI76Xz6bHT
	3Rx+KCtAwqes1mQueaUCNUPDcfc5CdczcKI7TOxwGSh0GUDp0lVpIUcApdWZkAp+Mg67sbGp7Hh
	O20tITuVaTfS+AeVs9ecmgx7iLkowVMgGYeq0m/MJ1Ioqer08Zy9zppLBzbphV4xRrcIZ+y9/ug
	mN1HoWQ5pTs0wQ6LqV5+nVtdjII/JSMRDM/Fee62qek5X5R9fJqGCViyTSc6S3eP3brvK2KJeA7
	WKEE09zA==
X-Received: by 2002:a05:600c:35c2:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4805cf66771mr100880545e9.23.1769468786128;
        Mon, 26 Jan 2026 15:06:26 -0800 (PST)
Received: from foz.lan ([95.90.158.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee30dsm16882875e9.6.2026.01.26.15.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 15:06:25 -0800 (PST)
Date: Tue, 27 Jan 2026 00:06:24 +0100
From: Mauro Carvalho Chehab <maurochehab@gmail.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Greg KH
 <gregkh@linuxfoundation.org>, users@kernel.org, ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260127000624.48c1af49@foz.lan>
In-Reply-To: <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
	<2026012340-cannot-spud-5d46@gregkh>
	<806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
	<2026012340-wildlife-scratch-1efd@gregkh>
	<8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
	<20260123-provocative-tungsten-curassow-cc2aac@lemur>
	<c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
	<20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-2823-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maurochehab@gmail.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid]
X-Rspamd-Queue-Id: AF5B88E25C
X-Rspamd-Action: no action

Hi Konstantin,

On Mon, 26 Jan 2026 11:23:43 -0500
Konstantin Ryabitsev <mricon@kernel.org> wrote:

> On Fri, Jan 23, 2026 at 10:12:39PM +0100, Uwe Kleine-K=C3=B6nig wrote:
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
> > >     distributed trust. =20
> >=20
> > Just to ensure we're talking about the same thing: This is about calling
> > a script once a week or so, check the resulting diff, commit and push,
> > right? =20
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
>=20
> > I personally am happy with PGP and I don't see the benefit of using ssh
> > keys instead. But I'm open to look at the approach that we will see in
> > February. =20
>=20
> Supporting ssh keys (along with minisign keys) is a Frequently Requested
> Feature (TM) -- not so much among kernel users, but among several other
> projects that use non-forge workflows.

Replacing PGP with ssh keys to push stuff at kernel.org is
welcomed, together with any mechanism to ensure the web of trust
for ssh keys, but see, the Web of Trust PGP keys are also used when we
sign git tags before asking Linus to merge:

	https://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git/ta=
g/?h=3Dmedia/v6.19-3

And also when we sign tags at the userspace tools we maintain. Any
alternative Web of Trust mechanism shall keep us allowing to sign
git tags with the same trust level.

At least up to git version 2.52.0, PGP is the only allowed
mechanism to sign tags.

Regards,
Mauro

