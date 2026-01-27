Return-Path: <ksummit+bounces-2828-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNbCL2ApeWkIvwEAu9opvQ
	(envelope-from <ksummit+bounces-2828-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 27 Jan 2026 22:08:48 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE119A9B8
	for <lists@lfdr.de>; Tue, 27 Jan 2026 22:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B63F2302B501
	for <lists@lfdr.de>; Tue, 27 Jan 2026 21:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948CC29B77E;
	Tue, 27 Jan 2026 21:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B84hURDV"
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9C27603A
	for <ksummit@lists.linux.dev>; Tue, 27 Jan 2026 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769548115; cv=none; b=hHQBRlXPFhaRqCDqKRRj2+nTR0MeS9hNeISMa3yl0qvplaJzSkKHTqvOmV8KZFa1Vhi/eY9ZQDdvCtKdPUHcwxB7ht4vWKwQqmejaEzC4e/NOKY80/8oKAjXCHbd4PPDk17BeNVLb+UO33lhUmMVI1p+o8Bc/E+EBmSzclZZy7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769548115; c=relaxed/simple;
	bh=+3k7sZf/TMRlz81oZTQiZlLOQ7Ppg10mqmguvwcARx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/23UtPW8rDnCLAM+yll4t5dHxb9H/mNgPXYghJppOVXc4/ygtExlBjrvGgA5kDKCwipHL+pM7zkLOd8tdD06PK4szRa0vcJnKL1EJLmgOoK0KXurlMpk2i1Zgmh4hJVK4DgjnPbm4LFUpGefGiTtoxC++NKpfY05aCA/StT4Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B84hURDV; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-655af782859so12162012a12.2
        for <ksummit@lists.linux.dev>; Tue, 27 Jan 2026 13:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1769548111; x=1770152911; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RU05PX/e2+W4FrwYCK/yOpnptC6YcN7dpb9eoFCEtMo=;
        b=B84hURDVHF91gIOA4s8R2daoog2gJZ1d15z9ttrOPtTnz40+JEbfaa8pRt57PO57g2
         UIs8XFtvfT0eZsWJODbA0zK1Ej89YicvkstytS6VpjdhZrE87VI5pi6hj3eOnau6c7HY
         nrc2CTrAfNR8+Vfduu+pp5hizRbsStnY7v5zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769548111; x=1770152911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RU05PX/e2+W4FrwYCK/yOpnptC6YcN7dpb9eoFCEtMo=;
        b=wtZYBu/ZGpghSFuFHtoCoRfSnKofQ7KZWdJ3NW7X5hKLIN4gnWPjHcDQ9TEmEF2x9n
         a4NboD5W+ndsUk75zj+Mx9x2fL6WpOmU1LKmJn3bOqf/3TMhS1Dv7Ssle974c7OP/7Tg
         RJHaBsqZepMWPeMTO+kX1ERMibh+pfESTnsZSuUVxk6MNGpXeBmLwsSLdllLSP2qWEGz
         J5nZHMAtFCj+3ojXN6LBkxft7wLEFaswqwIuU9huVj9n1pGMvACcjWJdaApcFsnKSR4c
         lm6ejpWwOa0701Duu1voW6c1q+Ke9WgF2OtqPAeVVpVTvrTTXmqXiwqwWN0ZeV9xbAG6
         fGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtO3X2BvM9Kdr3P1fc4EUlojTUwzkiGVIKvWhDvWKep05I6MMWO3MnkEjIiWdXTsTQJ9sfSQJg@lists.linux.dev
X-Gm-Message-State: AOJu0YyB+zhXicfghbfKnPDlr9Wnnj9KqroAsfaBmuTmZ2wXeUhWKE1q
	aIJWz0VDjmmfUyPx1FhkkYMSMhsdhPSL73dLDAAic7Bg+booRt5rceD+JAA79RJSF7giujhz3Pc
	RgsRGHfqAXQ==
X-Gm-Gg: AZuq6aJscaP/ad8L5i1/dq98/nRVUHiIsk4KuOXBB0TOPFglY7kwf4VQbI6xJHJRfkP
	yK7N77D7aFJBh8D9x87d0aGOaxT5+bO9l+RsdvAaTeFyUsdVSY//enWo76yjuiMxp7VNfyl8pQu
	UsXFYQ6OnZ7u/+aynYY6nvR22TV3GNSjjOa82NZoLdnWplKsBFDCloeHQkJwrZ7K9gxonBlCKmA
	4A40Suxoi+ddftFCH99jY+c3X2dXQAfQrulSMgCShM7ss0ipEhG5cN/Pf7KvNGcHGGGDDBB5GAT
	w5cbWb0cbjK4BY8DARCsO8660hyTm37NmU+DB2Xk6NSfcKFzp6lx1lLWmb0TRUtFdXlOgTxVtMn
	DalGf8i6EP7o1I1ohaeFYNp3n0oZmJ2r5+MX2EMIxN9Z5bfT/XnUaKaxEaugLXdMBeHcU4G4OOB
	kkX4i9N/XNklMjdbibWpOFU/7goZ8I/aegQ5fb4rQPs80DZryOs+Fw+ePZEK5D
X-Received: by 2002:a05:6402:51cb:b0:64b:3225:b771 with SMTP id 4fb4d7f45d1cf-658a6018e43mr2128685a12.6.1769548110831;
        Tue, 27 Jan 2026 13:08:30 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e4a9sm365311a12.27.2026.01.27.13.08.28
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 13:08:29 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-655af782859so12161922a12.2
        for <ksummit@lists.linux.dev>; Tue, 27 Jan 2026 13:08:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwCh+35v6l98jRZXxszEiosHtJhQG3C1HiYXs2PnhZGntt/CVDCcLv6RgNkTYZebz6eMCRrh+U@lists.linux.dev
X-Received: by 2002:a17:907:1c96:b0:b87:10fd:b590 with SMTP id
 a640c23a62f3a-b8dab48e1e3mr198031866b.60.1769548108672; Tue, 27 Jan 2026
 13:08:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh> <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
 <2026012340-wildlife-scratch-1efd@gregkh> <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
 <20260123-provocative-tungsten-curassow-cc2aac@lemur> <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
 <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur> <x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
 <2ef60fa3afe287cec92020b8b77a37c0b70cefaa.camel@HansenPartnership.com> <4ilnblmm3srkyzq7o5ehlr2gnlrrnmr67dpoqxiy5vbrrqlqd5@my3rxybcpu5t>
In-Reply-To: <4ilnblmm3srkyzq7o5ehlr2gnlrrnmr67dpoqxiy5vbrrqlqd5@my3rxybcpu5t>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 Jan 2026 13:08:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=whoJY_pORG8M_K5kSA-x0+MwRa5wHwkHY4sbYbPFegc_g@mail.gmail.com>
X-Gm-Features: AZwV_QjnAbnBO44uA4OdXidDpR1n9A_Q7EVlzyNA1Q4HlVe_rmYa-cozXXQK2Xc
Message-ID: <CAHk-=whoJY_pORG8M_K5kSA-x0+MwRa5wHwkHY4sbYbPFegc_g@mail.gmail.com>
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Konstantin Ryabitsev <mricon@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, users@kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2828-lists=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2EE119A9B8
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 at 00:39, Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> w=
rote:
>
> Thanks for the link. I was aware that Linus isn't a big fan of PGP and
> GnuPG. Still I think that having an expiration for your PGP certificates
> is a very sensible thing.

I have never ever seen any good reason for automatic expiration, and
it causes actual real problems because *NOBODY* ever renews those
expiration in time and makes sure that they actually percolate out.

We literally had that happen just last week, and that was with a
person that is supposed to be an *expert* in those things, and that
uses fancy DNS key distribution etc.

So no. No expiration dates. They are stupid and do not work in
practice. End of story.

They are ALSO stupid because they make old signatures *look*
untrusted. Just go and do

    git log --show-signature @{15.years.ago}

and look for 'expired'. It's all just sad and pointless, . What
matters was whether that key was trusted AT THAT POINT IN TIME, not
whether it's trusted now. But that's not how things work.

And here is why they are completely pointless: a key that is no longer
trusted should be *REVOKED*.

And no, I'm not talking about the (bad) support that PGP itself has,
which requires a revocation key that nobody ever actually has.

Sure, if you have a revocation key, by all means use it, but I doubt
it has ever been used in any form in reality except for testing.

So when I say "revoke it", I'm talking about just letting people know
that a key is no longer trustworthy, and then they should remove it
from their keychain.

(And no, you shouldn't randomly and automatically add keys from people
just because of some "I can reach it with a web of trust", so your
keychain shouldn't be in a situation where some old untrusted key
randomly then gets added back)

Because once the key is no longer trustworthy, some "it will expire in
two years" is COMPLETE AND UTTER GARBAGE.

WTF? You'd have to be completely insane to think that is an acceptable
or sensible in *ANY* form. It's too stupid for words, I don't
understand how anybody can even entertain that kind of complete
bullshit.

So stop with the idiotic key expiration garbage. It's completely
unacceptable because it doesn't work in practice, and IT IS INCREDIBLY
STUPID TO BEGIN WITH.

In practice, the only thing it results in is that when people lose
their private keys, they eventually expire, but why should anybody
care about that? If the key is lost, it's become *more* secure, for
chrissake.

Any web of trust that actively encourages idiocy is not a web of trust
I want to have anything to do with.

Yes, this is a pet peeve of mine. PGP is UX a disaster to begin with,
the key distribution sucks, and expiry dates just make everything
worse.

             Linus

