Return-Path: <ksummit+bounces-2622-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358BC6B40E
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 5369328F90
	for <lists@lfdr.de>; Tue, 18 Nov 2025 18:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFF52D94AC;
	Tue, 18 Nov 2025 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YTY/pi1I"
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09A2C2349
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 18:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763491124; cv=none; b=nwmwjSK8o9iniTZ3xsHbhFszHmreozqDOeLJM8oa5HCf2trRPZVtYSG6CHXM05gYmde1ap7FWelWJSnp7yRnxygiBz4EkEVAoNX96Hab1/A2Qlodj+KUbtUBPGXKcYpBqH3MTyL634h5pWOQtzKzi0QPxsK/r/3Hbe/qZx5Iztw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763491124; c=relaxed/simple;
	bh=mBsjB9lSXpbh1T7s2lDMfXt53BQfLKF1/52TBEuDV4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRr/aUh7cxjUF1TYd9wwB5kvHztZHDh1CoiYeavg8XRAlCy9dKeGok2PUkMAGu3N+qumigB4Hlmdd+9+M6nnJUW0XIHJ8UVt7numi4gXvYY3U5ymrEr0dZCkhoRgL9WtCj4A3mMSAeFY5dRKPSgGgp16jfGDpejWEN6a28g8ugo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YTY/pi1I; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so10395887a12.3
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 10:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763491120; x=1764095920; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1O4YrVg9c9BgjLkxFwt60WMc5PVwxR8AjeqghbQNFmk=;
        b=YTY/pi1IweD3vtPzsLzsiRxEa58fRuAR4ALtEL8ku/0G/WentnTKScJ5Fn3L+E9hry
         48e/xzcG5E9ZckttFUnDtIBTAoopZijgGV/T/yvB7FZzlElqDvpqvX+ajzxk6tDbRtli
         8USkxiPNQNr1BWUaOAmT9kTlPvXURnnANiSpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763491120; x=1764095920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O4YrVg9c9BgjLkxFwt60WMc5PVwxR8AjeqghbQNFmk=;
        b=iQNVl8Nntt8enK6R1XJoyJFC5cS25mYRDCQURtnN/1r38iIjdgitl+QUinq5nCEh1D
         fsqRI7VVGalV219ehEi+m5rLES2Y6sJlY/WJUGszXL5Ro9jXUiq2SqCK7ltegBze+jE+
         NL7c7XwMSMBIHtLcqbqFXT1DMf+7BHrqwEoyb/QiTPob02ehC+Q44dDuvWoQe3rv+xaF
         MGM4lbmX+rv/EdkLQbHkEdzem3Kq3Vw6+HI2JjikEViFM/Fq/PCxUojbUDKdGWcBB7Rz
         mUB2+T1yi8Cepb3QpFFfYXMYvEEM7pblmZMg7Bfx4zq8ViNZKtPl2R3SA1bDAngs+jtS
         AOKw==
X-Forwarded-Encrypted: i=1; AJvYcCUmULH0aCI240uDIENwnJGPlok7a7OYiYtZJD301r1WwKEXRKrb5/YGfLhkPu+tovqqfu46aBCL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1Oamk6Jv0dSweAcZfc1b+6lpFJ1Kco6m+HqBW59OF0bYCSMER
	iQX1hzhnreBBrnmt3ppJVeMDDPcIOXuimvY4xoRl7BHhvPYmEazwIzbZKyS1/XBPl7Zsg048U4a
	3kFWuqio=
X-Gm-Gg: ASbGncsZWJX0ObhSfrZgoVHqakeTrGSqQLQ+51rFHDKPGOzv2v59en6pqYi2ySlk2rK
	iDjFuA9kHk7XzqH2B4tOmxriBsgE9PjwrdxE1BompTdkb6St7698cHeLK7Q1BiNFyWJqgW56TZr
	EOkiGJfhPeyEGW+tgGY64XT6w579YkDIp7+chETSAYPsD0Re3emOakguvz4AIWoc5o7eAjAL97a
	iXcanbjVS+6oQdUNk7lkPrvD6GcA1SnsWgaCRq4d451/HvOGlnN4ngKIA4x4jbKbWdLhEyFbAGq
	hRv7LXiGCYoeMkl+d48v1AxJp+c9okfl1d306KtXv4gY8RzTw0IJWIJjwCtVT7Q0xBFtgomI5E6
	2RXnzuT6yayTlIEe7gaPuYNt8kE5Ph1mfONbBOfJbz4OIdzQxh02FpjyquBx303RzrYLibp27VV
	V2d0/5B5VvUUQ5QTiKwQeKEnlJqBhl7wDnNaRraoKD29Bt3tX9N1cHyFmJ8r6PVxQw00TwVco=
X-Google-Smtp-Source: AGHT+IEvl1n/mRDGcC03HTZoFRbgwhtgqDIbcK3DDUiWuK3VGiGTRxt+kLjvwfDFs6ZpJU4TSMZUpg==
X-Received: by 2002:a05:6402:20c4:10b0:643:83f3:1b9f with SMTP id 4fb4d7f45d1cf-64383f31c9cmr7608046a12.31.1763491120313;
        Tue, 18 Nov 2025 10:38:40 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm13197584a12.34.2025.11.18.10.38.36
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:38:36 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso8606779a12.1
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 10:38:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmEp30I+QXJnAs4SBz0uv6W3FwM82coF3TIS6PdsfCeXw0X308uj23TA35v/OOFeKsoFXD4Bkr@lists.linux.dev
X-Received: by 2002:a17:907:d0d:b0:b73:43ee:a262 with SMTP id
 a640c23a62f3a-b736794c425mr1847212466b.51.1763491116307; Tue, 18 Nov 2025
 10:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
In-Reply-To: <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Nov 2025 10:38:20 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
X-Gm-Features: AWmQ_blmMF18lOw4-9gGJXpDkAmpIXxsCXL00l_YnDwFXHozChbsl9W8Fx3ihag
Message-ID: <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
Subject: Re: Clarifying confusion of our variable placement rules caused by cleanup.h
To: Bart Van Assche <bvanassche@acm.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 09:25, Bart Van Assche <bvanassche@acm.org> wrote:
>
> A related question is whether or not to allow declarations in the
> initialization expression of for-statements.

Absolutely. It's *such* an improvement to the C syntax to be able to do

        for (int i = 0; i < x; i++)

both from a syntax and a variable lifetime rule.

It is also very much a "beginning of scope" syntax, even if the scope
isn't limited by a "{ }" grouping.

We already have that syntax being fairly widespread, doing a quick
grep for it shows over 3k uses of this ("int" being the most common,
but we've got other iterator types being used too).

So this is not even a question of "whether". It is already widely used.

The whole "declare variables in the middle of code" should still be
mostly frowned upon.

But it's practically required for cleanup situations - you really do
want the initialization to pair with the cleanup or you end up with
crazy code that might need dummy initialization that makes no sense.

And I think that is basically the only valid reason for it. The old
"declare at the top of scope" rule still holds true for normal
variable declarations so that you don't have to look for the types.

*MOST* of the cleanup cases are hopefully then abstracted out behind
various guard macros etc, where the declaration not only goes together
with the cleanup information, it's actually also a part of the whole
scoping rules for cleanup.

But the whole "only declare at the top" really doesn't work well for
automatic cleanup. I do see some people still adhering to that rule,
but it really can result in odd looking code. You end up with things
like this:

        struct x509_parse_context *ctx __free(kfree) = NULL;
        ... other code ...
        ctx = kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);

where you have now split up the whole "this is allocated by kmalloc,
and free'd by kfree" into two different sections that are not next to
each other.

And while I still don't love the "declare variables in the middle of
random code" and I think we're better off with the old rule of
generally declaring things at the top of scope, I really do think that
it's better to keep the freeing-vs-allocation logic together.

Side note: there are other situations where we might just want to
admit that sometimes it's better to declare at the point where the
first variable assignment is done. In particular, when using automatic
types, the type obviously comes from the assignment. So you have a
similar situation wrt the whole declaration location: if you use an
auto type, you can't declare things separately from the assignment -
and the assignment might not work at the top of a scope.

So I do suspect that I'll just have to get used to assignments in the
middle of code in general, but I feel we want to limit it to the cases
where there is a real reason for why the declaration needs to be in a
particular place.

Example automatic type thing: something like this

    #define kmalloc_type(type,gpf) (type *)kmalloc(sizeof(type),gpf)

    __auto_type x = kmalloc_type(struct mystruct);

simply doesn't work if you don't allow the declaration in the middle
of code, because assignments invariably will sometimes be after other
code.

Now, we currently don't use __auto_type very much outside of macros
(and there we often use "typeof(x)" instead for historical compiler
reasons), but I suspect we probably should.  There's a patch floating
around that makes it more convenient with a

   #define auto __auto_type

because the historical C 'auto' keyword has been so completely and
utterly useless.

                  Linus

