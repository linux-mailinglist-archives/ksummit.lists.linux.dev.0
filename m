Return-Path: <ksummit+bounces-2961-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NmS0Mw3zT2oIrAIAu9opvQ
	(envelope-from <ksummit+bounces-2961-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 21:14:21 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D8B734D3F
	for <lists@lfdr.de>; Thu, 09 Jul 2026 21:14:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=google header.b=PZ+x7xmw;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2961-lists=lfdr.de@lists.linux.dev" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2961-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43F313047027
	for <lists@lfdr.de>; Thu,  9 Jul 2026 19:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EEF4499AE;
	Thu,  9 Jul 2026 19:13:52 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED4137F725
	for <ksummit@lists.linux.dev>; Thu,  9 Jul 2026 19:13:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624431; cv=none; b=CuUmHnYNGKX4yqAOEokvWLM8k5AYamBXXTZJ64ZwGe3DRqOLd8j/G/oMzrExmP2xMXhYZEVlJEw18q8YbDpIbMZZ+fAcr8aNV+JAtDMNIvmVqLluxZyaoq7wifCVnAh3ptVIRgtV/tWholcMDL4MSB/p5Ki12q0FjArBqH8V8pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624431; c=relaxed/simple;
	bh=Mt92Y1sz7LO0NikzQEX2cj8c61cuneqHlnzuin4a7LQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uB+Ggen2VpbWr5DEtyLULStR/bZqEq8B4zXiXbBy/B5QZbO5IyJ8eG9oKN96Quqj7HvdpU6eNgMs3hLtWJvGes0MSqoVjw87w5gx9f+s6aSDFjc3MjNA0+tS8X1LoO5FYqIGO5CKOA2pxZlaM6UFwpy80t1dARY0UjAW8bBf5rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PZ+x7xmw; arc=none smtp.client-ip=209.85.218.46
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15cd3fd760so24683466b.2
        for <ksummit@lists.linux.dev>; Thu, 09 Jul 2026 12:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1783624427; x=1784229227; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9eA1kthDewj3d2UjvfvACcvST+FoySKPn9lteGXRxY=;
        b=PZ+x7xmwrI6xLeAY/S1UygCaKmsmqkxvaCyhY3PiVhK114nDSbvQjv2FtGjyE/eEBm
         El40elV9CnfxRgBM5xH80NAOcCuhMoP2jMrsEOe/nTKaxr6iqwKLBrLpbeoRfASRf/En
         cwOAuWG+LuRoK2RuGpbVB6oxWEjfxCkUTR/DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624427; x=1784229227;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H9eA1kthDewj3d2UjvfvACcvST+FoySKPn9lteGXRxY=;
        b=fOgLe0UzTJ8Y5U5VADjUGDedXtTTebFrcuitjHIBPt+oWnATY8KPSH83q2Y1VB4Aue
         HQ5xdKoEWDJv2QFXrKNEu1U53PbacOjDEy1fk9hLSk/55tujM5DZdaH0WzpLURRaZpPe
         jc1t2tLPXTY1LC5Y4Bum9vX3LlvjxyI2Lo4GTfHdMbIllwBkjZGxAj9/3Z3GJVRU8fNY
         JRG2oiFcq+ADKPv/nXbc+9Ra393cofXsbPec03WwgRWf95B/x8MEiP221Xdyj3/2bvaR
         KsLpVaZIWJsjBh4gsm46F4+5vr70z8SYGujCzDSO+ehjLfxsVNpku2/hoV6vxcuK8PuA
         cukg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0RmV5V0si43bKYO/F+NEdYiUG8HNkf3t9QNut64ampDia/PhCbT11ZVhykOR1o+856hmezByZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm21DjvnIlxlYIOEt0K3HL4m5/m6P3n5MbcE1PnWlnohPZ0+LK
	ziWLi/g+O5ItXjlk1y+sam6DuPbGaxutZGdg7Ovc2erkLUIcDqx6U26iMxE3DZFETogIRUONLkD
	jhykWEvw=
X-Gm-Gg: AfdE7clOpoSy/Ir9LY29DTz3q3gw0i+A0x7Dayz16f/91kjB8u3lupNbIvzXbFfIGGJ
	prOXuA586f/LwiFhUS8Fq3twi76vzg0/NXythfXIlXEWhx2bMMUua6golqwrP3Wr2fXIIjISoEa
	UYY+/P6S9WNJK4CBjqDMO0Ajx6+OYk8AtXkBqY48NzPjt8fXovOrCmJA8Q/2Mx5zZcubuQ8uEoH
	ccdqNKQ83dbaLwEvRGG7QYmbCq1Cx1LGlLVSil0HyyZg7uShifslvnizdVS1guPYBFZRqzHobLv
	9APTnVsLXAsiPdJwmAMSR/QAiM9J4d0WxpC6+2QyqpS4kUtmUYQwFznaO8F31ffiHOJjHQr+ylb
	dP/+G73NL9VxcduGWApi+GjUnh3zJcM5wURFJh3oUUpxuCrc9Er7rxq+6flWnhR3w0IzTUpkckf
	rZzxYyBNmE47oxEShVmN030S4SYgUicsgngXIoQr8pC5dO9NYnUaBy1cbXcHPaBw==
X-Received: by 2002:a17:907:e153:b0:c15:bfe9:60e5 with SMTP id a640c23a62f3a-c15ce122bd1mr238095766b.52.1783624427320;
        Thu, 09 Jul 2026 12:13:47 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15eb1dbdc9sm136224566b.10.2026.07.09.12.13.46
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 12:13:46 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15cd3fd760so24682566b.2
        for <ksummit@lists.linux.dev>; Thu, 09 Jul 2026 12:13:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrBnL+FBp3259ArKOFQd6cI6fyaVZ30MsPiQflSQ7sHk9j1/LB6ivVPQI5iPj81UOY874QQODnA@lists.linux.dev
X-Received: by 2002:a17:907:a286:b0:c12:2acc:fce2 with SMTP id
 a640c23a62f3a-c15ce128c8dmr409925566b.53.1783624426652; Thu, 09 Jul 2026
 12:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org> <ak_rr7I4wVPieWYT@stanley.mountain> <ak_sQvh0IfBbjLPO@casper.infradead.org>
In-Reply-To: <ak_sQvh0IfBbjLPO@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Jul 2026 12:13:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiSmgwwLKCqJwGS-dVHnSLU8W+7q1UQq-G9=TBGGZbuhQ@mail.gmail.com>
X-Gm-Features: AUfX_mwg3cIHor2Mt_HrwRb1YBfPfHtOKpaMSjgDibThi0e2037PTlny-R3ND38
Message-ID: <CAHk-=wiSmgwwLKCqJwGS-dVHnSLU8W+7q1UQq-G9=TBGGZbuhQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Implementing malloc
To: Matthew Wilcox <willy@infradead.org>
Cc: Dan Carpenter <error27@gmail.com>, Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2961-lists=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,ksummit@lists.linux.dev];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38D8B734D3F

On Thu, 9 Jul 2026 at 11:59, Matthew Wilcox <willy@infradead.org> wrote:
>
> They are, they just don't know that they are.  Honestly, I think that's
> almost worse.  Imagine if you could call kzmalloc_obj() from any context.
> I think the instinct was right, but the implementation needs to be
> done right.

No, what you consider "right" really really isn't.

If you do allocations from interrupt context or from within a
spinlock, you DAMN WELL BETTER KNOW THAT.

Adding some magical "malloc()" that hides that from you, and knows
that "oh, I'm inside a spinlock, so I have to use GFP_ATOMIC" is
WRONG.

Yes, it might be "easier to use". But that's the wrong kind of easy.

If you do kernel development, you need to know that being inside a
lock is a thing, and it has consequences. You can't do vmalloc() from
inside a spinlock, and even with plain old kmalloc() you have to use
GFP_ATOMIC.

There are absolutely zero upsides to try to make allocations act as if
the kernel was user land. The kernel is not user land, and memory
allocations inside the kernel are special and we should never even
pretend anything else.

The "use kzmalloc_obj()" is just a safer and simpler interface, and
you don't have to write out that GFP_KERNEL that just happens to be
the most common case.

But it's a type-safe _convenience_, it's not a "you don't need to know
about kernel memory allocation rules".

              Linus

