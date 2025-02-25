Return-Path: <ksummit+bounces-1897-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9EFA44D6E
	for <lists@lfdr.de>; Tue, 25 Feb 2025 21:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE23189AA69
	for <lists@lfdr.de>; Tue, 25 Feb 2025 20:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081492192E6;
	Tue, 25 Feb 2025 20:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q8o8rGAl"
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF5E218AB2
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740515136; cv=none; b=LwKvjbw/gZFOeSGYfnSzDE1BKTBXfd8E+erMymjwgJrTefZb61/mAxQE3bKw/F99MEOgSCCzMUz1QDqpT4ySmMyGw52HumQ0QWSYiIXHv2kyxzyQh9C6hrC5qHDjDfcATo5xctPSgj6CIOJpGPYazSqaZbbp/QPkUFzqywSv1rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740515136; c=relaxed/simple;
	bh=tBOWs+8gBz/+ugcAnXzgbAqo5bkP1lDarIPnI+3UAZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3zHbWIh5OsJ+S2d3qT3kHzJYvnqoPJTlKHVbkpD4iw9QW/L0g+8bBBSHfHY61p7w0TTYgDYOp9f8nZe1VjuJFXsuv8rapOKlxRGeU1WDoIow5dvIFThnj+AtH6g+URQAlbq2fBTvMH7OqUzgRUp42nevNQ45w9A4qzicJVYwYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q8o8rGAl; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so11305894a12.1
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 12:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740515132; x=1741119932; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y61pcTR3GsuY043VMbi4v/Cd+bs9ipxDEF9XwQhZi9g=;
        b=Q8o8rGAluC7E4tE4yP3dl4zj0imhKypqWZgB9O3LLAC2RXKqpMhFWQhpKPIkPYmIjA
         yMq/kP4dcHeFHM5Ol/9NN1kSRQFUJ7+agl7OTW9shqhAIQxTvQChrfmabEb9nhOFV14n
         irfWcPxFVWtiNyZzSx+P4uxynutMY8iHw7BCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515132; x=1741119932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y61pcTR3GsuY043VMbi4v/Cd+bs9ipxDEF9XwQhZi9g=;
        b=IpisMUsxRaWklIFUGpmu5k0JJBxzcCBw3QCGWgLxiR9EsuwjkFzqeOwa3Ojb/TJU1W
         1zVGBbPr7nmT8K/lWDPHFT3x4ng452N4ZuWEVQHwQSESYlex5Xzj7k6uV55VOEX64Nhe
         58vIQYicPrAeHO+m8jg1aVzQ+FPNzYP5xqF0b8xJHSF4bsCuLxnx29iSMg3rKHsbEtsO
         fD2nShCCi0PJSsx00o3hBOmITsr0PV7WaWcdzN5BdR7WfR230R6Dk9XUEIrpeSNaviug
         Whyv9+OwcVWEs6dsHRjq5dDglasPQ8w82n/qk2Rz9+W9IdbMCQeYOjHeGA6pxeoakmTB
         qbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6AtD+Co2Wyl2VvQBB4AcRLB09S5yX0iTHtrJcfEn3Lcp/f1BaV467IX81VLmAAv+bZZ0Bi4Ug@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi7h0OiXJtGE5sGnoWeviRftAIQZ6DVKTGSnV8IpOZibi1QQRS
	UkyH0LFoL5Hiv8e8+jBvxE3fBCyWCcLNF2ivJCbrI2QNSfLDfDIL/6eIN6QXxFTtif3J2C7wxRy
	JS/s=
X-Gm-Gg: ASbGnctzA62iA5YyGTtLWzrdhKGRG6ibC269lYYQf2yETYS17Rq2Rl+S6fm3hPE563T
	dzUK3xKGfDyWzL6IphFfeFeiBGoh47H6VcXHkfDQWSDs5nDF2BvH3ZEbO7dxWLC4Mcp5v/lpaLs
	XJBQYfSUyZ4OdAFJUd6eRhGFuUR77Lfz32WKVda13oYYRS0T7xBy9pgOxschxOFCLJDY1YKZqh9
	RLxWTZ1jEYUIuZZKLXEQFiJ+ILiyuIUXwsiHh47LOYcLrAjKEeL02/2GZrt/d9DNnQTPFCDmskO
	1JOG8Lvyw4LYV1Cu6TWsX9+Q33GTYGZW/LloT8o6nPdUcsnu9m6mAQ3PKH1EbnaIwmQ20eLqTgI
	4
X-Google-Smtp-Source: AGHT+IHmPPXVU2325zg/ApLR+/7r1Wk3eup7aep0if2tSGxoQjdnPVxRxZhjDg20l9cHH5LhzlCScA==
X-Received: by 2002:a17:907:9985:b0:aba:de82:e35d with SMTP id a640c23a62f3a-abed0d22dbdmr453274766b.22.1740515132077;
        Tue, 25 Feb 2025 12:25:32 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2013348sm193886766b.89.2025.02.25.12.25.30
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 12:25:31 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abbac134a19so927737766b.0
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 12:25:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXc/QQ4qhgmclpsRVPbTmojULPHlTTIIV4Kj9DaiaeGt2/NZA6AlKut42DywXJn34cn9jNxUnXA@lists.linux.dev
X-Received: by 2002:a17:907:72d6:b0:ab6:dace:e763 with SMTP id
 a640c23a62f3a-abed100fee4mr509174466b.38.1740515130517; Tue, 25 Feb 2025
 12:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com> <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6>
In-Reply-To: <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Feb 2025 12:25:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=whGY2uYcXog8kmuAAAPJy4R84Jy9rEfXfoHBe-evmuYDQ@mail.gmail.com>
X-Gm-Features: AWEUYZlOXj6mDCIezjuum6eAqCm_wlo9l5dfNahDjnlsJi-NDtjLkzkbOckahpM
Message-ID: <CAHk-=whGY2uYcXog8kmuAAAPJy4R84Jy9rEfXfoHBe-evmuYDQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, Ventura Jack <venturajack85@gmail.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2025 at 11:48, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> Well, the whole point of unsafe is for the parts where the compiler
> can't in general check for UB, so there's no avoiding that.

No, that's most definitely NOT the whole point of unsafe.

The point of unsafe is to bypass some rules, and write *SOURCE CODE*
that does intentionally questionable things.

The point of unsafe is *not* for the compiler to take source code that
questionable things, and then "optimize" it to do SOMETHING COMPLETELY
DIFFERENT.

Really. Anybody who thinks those two things are the same thing is
completely out to lunch. Kent, your argument is *garbage*.

Let me make a very clear example.

In unsafe rust code, you very much want to bypass limit checking,
because you might be implementing a memory allocator.

So if you are implementing the equivalent of malloc/free in unsafe
rust, you want to be able to do things like arbitrary pointer
arithmetic, because you are going to do very special things with the
heap layout, like hiding your allocation metadata based on the
allocation pointer, and then you want to do all the very crazy random
arithmetic on pointers that very much do *not* make sense in safe
code.

So unsafe rust is supposed to let the source code bypass those normal
"this is what you can do to a pointer" rules, and create random new
pointers that you then access.

But when you then access those pointers, unsafe Rust should *NOT* say
"oh, I'm now going to change the order of your accesses, because I
have decided - based on rules that have nothing to do with your source
code, and because you told me to go unsafe - that your unsafe pointer
A cannot alias with your unsafe pointer B".

See the difference between those two cases? In one case, the
*programmer* is doing something unsafe. And in the other, the
*compiler* is doing something unsafe.

One is intentional - and if the programmer screwed up, it's on the
programmer that did something wrong when he or she told the compiler
to not double-check him.

The other is a mistake. The same way the shit C aliasing rules (I
refuse to call them "strict", they are anything but) are a mistake.

So please: if a compiler cannot *prove* that things don't alias, don't
make up ad-hoc rules for "I'm going to assume these don't alias".

Just don't.

And no, "but it's unsafe" is *NOT* an excuse. Quite the opposite. When
you are in *safe* mode, you can assume that your language rules are
being followed, because safe code gets enforced.

In unsafe mode, the compiler should always just basically assume "I
don't understand what is going on, so I'm not going to _think_ I
understand what is going on".

Because *THAT* is the point of unsafe. The point of unsafe mode is
literally "the compiler doesn't understand what is going on".

The point is absolutely not for the compiler to then go all Spinal Tap
on the programmer, and turn up the unsafeness to 11.

           Linus

