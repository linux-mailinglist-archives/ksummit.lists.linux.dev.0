Return-Path: <ksummit+bounces-2850-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM0RInROo2nW/AQAu9opvQ
	(envelope-from <ksummit+bounces-2850-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 28 Feb 2026 21:22:12 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B56571C8479
	for <lists@lfdr.de>; Sat, 28 Feb 2026 21:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3EF03191233
	for <lists@lfdr.de>; Sat, 28 Feb 2026 18:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1453DBD0E;
	Sat, 28 Feb 2026 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="abX/L5N8"
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1216E3DB4D6
	for <ksummit@lists.linux.dev>; Sat, 28 Feb 2026 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772300448; cv=none; b=B5C+iWHC9tCXS6vi7fm7Vdc7Qlf9FRonc07YynlyZfhDlFTs9kVITL0qyDQ+6V/rNBj6+IMHiNnzanROutx5pbN29BHKjShW+MUXRzZse8r9ocwwoDnfz8vs5Tc+IYqNbxVf4BnrWUjoeZXis4zUH6PTsnDIJMb997uxWzCpKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772300448; c=relaxed/simple;
	bh=Iugi4cQeDmodpFH6bo4qxfhgqBqmPYgSgyiy9V9zyaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqoiibFava1w0gR11ll0NrYwcc7fi8aImbL2mgytf4dqgen9BJZhEoNjFMhAXpzMJn2ryjV1NDxmDtmtqXvuLc/4dmvCvn2VV+YmQvjWGkhB1cVDky9dnOrY6ZQ8tytYZxOgMipK1GD/4gy81o9XEDlPRRwvL+JekBFlr33TMpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=abX/L5N8; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8fbb24a9a9so690408266b.0
        for <ksummit@lists.linux.dev>; Sat, 28 Feb 2026 09:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772300445; x=1772905245; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKqkAELIeUb/qymyj417uQHN2RRxHXwkGQW9mGeEwvg=;
        b=abX/L5N8UVwHDY2tzq5T3A1+2tSmhVwQ1nZuUqtqPWglIn4e9gc/6jmFxXEv8I9gPn
         ZKW7F9RjGC1eIEoT8tucTvcemi3gb7gVRv73oE+IZlTjHLa78aL2wdwHvuVplsAghQQV
         YVbO4aEgoHHgR8a3ltytvmJgbFr6wGEQEUpbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772300445; x=1772905245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKqkAELIeUb/qymyj417uQHN2RRxHXwkGQW9mGeEwvg=;
        b=tfq6dOVsCUp/lazHCz/iQhnE/jq/5pxIyS4CjrldX20Qu3RnxZz1RREzhLl3c9lHSK
         5mEgrGosqHIe9g9WmaEt7s3XB6X6DMFnGeESQXb8KEIR4Tg1GZeUryOcNM/bUXl0szc0
         Dra13iBaLIB3tVk13Pdj1HkJj5OQYHJhLEk3Uf9WhMLvA/Gj/tf88b1HvjOBGaf2kSNN
         WTYJJJWQOMDdfZ7xhf4D3DmGvQd9JdnEix7pMVq5ickOrnsnpG8LoaqjEnP3ST/qY7uz
         74hrS4eeJg5pyBL7ldnPqPQbjRe0/WKNVTk8xVudQ2ZEwLAfQs3gtFcKJ4NYkyBSk0z0
         dtsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEVoIrmwkYn0X+A2AEd0wBeNPACu98IP6S4n4f9X5vyUz+lfxS7cnuASBR+aL8IMVLW4wmBdiD@lists.linux.dev
X-Gm-Message-State: AOJu0Yy92/Fua1MfVyJjRv/4+XanQAN44teZw+srNPc6BPgU3HpneL2p
	k5I8mYhOf6vL+VHxTR0zgIZ3D/wLWV1FqHbGfb+VFqNpoWBRweJOSphJYTags1E4WYRLcqswqBD
	DsjlxONM=
X-Gm-Gg: ATEYQzzVWNv07M4kru0kT5UL7u8axh9pRYTNm9w+vnWfDk9RIyLCV6LBdPDTPTSDmuR
	PmkrOy4gH6AGPFKMf0SbxLrXJJ5GfD8408AeINj9Uz41C1TSeCmU38iu6xiR7KYr9eJoJKLWfyr
	McDlo6k/1HG5UF+h2NCSZIkv0QS9+OtiDx2SqzxeR5ndN3A55W0rKC2SsArgEn0PKGD0Tbz6WzL
	FyfHKr1iXfFgVsQYfVEJSzcX1n7/4hecE8Y8a8OnfIQezdY1b9cRikSJwOXD5c9maT5o43Pomse
	L3FllQStfy7ItcWrWAR8DG2dX3rkCqzQa2mMkzyvU0sx8JeURmvqEfp+SwaeO87zfcrRg7FUNiW
	MG1HFPJm6hqhvvyQYd0JRvoDY4YkhJ0M3QrmpDU0y3ecRd3sZFyj4SbspqD2pugwyqOoAjhL2tF
	d1sF9zCUyNX5+Kiq25eSbdcHLO3He5tlWAJHoADLZEfikx5iBiIDUQNuZ2nLUD4sC0bFy/8xw=
X-Received: by 2002:a17:907:25cd:b0:b88:3877:d922 with SMTP id a640c23a62f3a-b937583efb3mr457422666b.10.1772300445224;
        Sat, 28 Feb 2026 09:40:45 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec43f3sm262676166b.55.2026.02.28.09.40.44
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 09:40:44 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8f8d80faebso684742366b.1
        for <ksummit@lists.linux.dev>; Sat, 28 Feb 2026 09:40:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6GQKi4dy6YYsW3iTfcKCNETxfOkoJH9aP7U2gjm2lDeU1wxd3jJZtEzeOZhFZb+348EhXATHi@lists.linux.dev
X-Received: by 2002:a17:907:9811:b0:b88:5894:6ba1 with SMTP id
 a640c23a62f3a-b9375a92dcdmr479479366b.28.1772300444218; Sat, 28 Feb 2026
 09:40:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info> <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org>
 <20260227101631.67756268@gandalf.local.home> <677258882.1999.1772206555300.JavaMail.zimbra@nod.at>
 <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
 <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at> <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
In-Reply-To: <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Sat, 28 Feb 2026 09:40:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
X-Gm-Features: AaiRm51E7-fFhIa_8ZtEy0DOwVdDFnUJjBYxUZEJP0cGxX3d0fzi0hZ8FCmSOgY
Message-ID: <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
Subject: Re: slowly decommission bugzilla?
To: Richard Weinberger <richard@nod.at>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users <users@kernel.org>, 
	ksummit <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_FROM(0.00)[bounces-2850-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linuxfoundation.org,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nod.at:email]
X-Rspamd-Queue-Id: B56571C8479
X-Rspamd-Action: no action

On Sat, 28 Feb 2026 at 07:17, Richard Weinberger <richard@nod.at> wrote:
>
> What we need is a mapping between symbol names and source files.
> That's also doable. e.g. by running "nm" on all *.ko files of a allmodconfig build.

For stack traces, what you actually want is

 (a) a debug-info build

 (b) run scripts/decode_stacktrace.sh

on the stacktrace.

That gives you not just source files and module names, but line
numbers and inlining information too, which is really realy convenient
for more complicated stack traces.

Apparently not enough people know about this.

For a recent example of this script output, see

   https://lore.kernel.org/all/a8baf6415463d2ad20cf556c8148432e17b211e6@linux.dev/

and notice how it not only disassembles the code line, but it changes
a trace like

  uart_write+0x1ec/0x240
  handle_tx+0x9a/0x1a0
  caif_xmit+0x61/0x70
  dev_hard_start_xmit+0xa6/0x1e0

into

  uart_write (drivers/tty/serial/serial_core.c:72
drivers/tty/serial/serial_core.c:598)
  handle_tx (drivers/net/caif/caif_serial.c:237)
  caif_xmit (drivers/net/caif/caif_serial.c:284)
  dev_hard_start_xmit (./include/linux/netdevice.h:4833
./include/linux/netdevice.h:4847 net/core/dev.c:3601
net/core/dev.c:3617)

which is really a lot easier for people to figure out where things happened.

               Linus

