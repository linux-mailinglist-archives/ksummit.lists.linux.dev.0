Return-Path: <ksummit+bounces-1900-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F3A44EBF
	for <lists@lfdr.de>; Tue, 25 Feb 2025 22:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D89AC3A3880
	for <lists@lfdr.de>; Tue, 25 Feb 2025 21:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318FA20C476;
	Tue, 25 Feb 2025 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XzCTxgeY"
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF6A1A9B46
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518704; cv=none; b=oLDVPLyz5BVMgDc+Vj4w8XnL+GH9PzNQOi0P5SDw7DaZFgkoa/T6EXStcyPkMZC29HoEg9G6GE9ysT+vuI1UYmkw6/tE9hmcGkNcPF0FgcWuhMoWBHbu95Q/ABGCBOCeHrdFK6b8bemRcr1hyqyDhKceYJNONw7i4Aa2MQRLKCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518704; c=relaxed/simple;
	bh=TT313L3NHuTIEIP3Ta9oDB6MUWAlR8LnnBX8lq4WH7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZBDNS4xpyrvnyWcW15ZLqFSzSspfPqC0+zMmMHUdMUf9DaAVGO+IflyUZDFKYy4MOcPJKWJfJkRM9Lrhftz7avc8SyW9y1JgTwGVRLwMP3yl/RWXXU7aWWnrhQ5rX6DYsqmUTtizfF53C08NYOxsOjbXdgN4gpJXj8xZ3Nipdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XzCTxgeY; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso9639391a12.2
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 13:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740518700; x=1741123500; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVCy8UyD4kIHBFsMDFYHTvvtj3ZtXS1BkBR61VGCyI4=;
        b=XzCTxgeY654rlDFYTrpWBs1x5xNxDgbMr1719sDtC1msV9AlpOFQFY6vtznNHXRaZ0
         QxNuGnuN0zZQP8ORAo5hZ0EiT0rvstn4hRT8XyKWtakhUmjXoeyFo+78NRjM3E4SJfxj
         VyS3Y2t2Y7qfQAnJ+cr17WGPs4jC30jDbqXNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518700; x=1741123500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVCy8UyD4kIHBFsMDFYHTvvtj3ZtXS1BkBR61VGCyI4=;
        b=HtYtL4n04SwrLhpo5PKa3sYqSqTxlY+kqrfikScNe7D6TbDM5kWs8o1aEKwvyJN3cm
         Ht5r2hNYyClGJM3h/6hWSHfRZiY7ca9ZTUH3v0cNOKBXgxlGa3vw4pmjHfgDJMlVLNQA
         Esz8TR42/iCzJvRRRwvswUgpMhp4ws7Pw7+iYgoAHlOkCzM6610kaqStGp6YMY0ADpqD
         UXp5FsKPUC4Cm55Y/uO2aS2EN4ZSHZ1CvI/nZh4PVDtx5eB5RE4KeKYmk2B0u1JOf53v
         iLXBfv93Q4D8JnDl6l6Fc6J5SUWOBX/A2q0uEzOO1Hwa0rJkLCcvfIljoMzQEQhO+IH3
         auTA==
X-Forwarded-Encrypted: i=1; AJvYcCVxtIXTOn8aqCw6xKS2rWZRMUHsmfiXnverlcyrmDZXk4TQHesr8lTychksuNVU5jovXht/CRu6@lists.linux.dev
X-Gm-Message-State: AOJu0YxXxg5/6rvUOJKzPmmem1+2ZogsjDMnd8cjRwPCG/B+IQelxBqX
	1A30S6nlOQTcnGMIaC0WhArfsvybvPpc0M1p/bme6Sz2pOIcOlgHDVK9rfK7+fpa3c0gpzDs+8q
	gVPs=
X-Gm-Gg: ASbGncu0R8a4wCtf9oRsOsUXXOqnWdyChZ3z6IZhju5M6UEhSmRRoKouXFO3epz/Qro
	Q4a0mD2f0eCaXZGsV5lfcnGGj8RyjzVYs2Me4sEBjsSE9Dp/glCfp3ywGmz+J+lTFf4j0w2Ajow
	PRFkQ071Oname9D5apVbwr11VihDAY+N9dxxVLLqfmIb0QH7AeGeiKRE10ir13OIByMtunIU9w6
	XcnznPzmj41QtclCXbsh8S9TOE5fjpQuROCg62vAQ+UZ8YGiQ292iLYfCOvuOKBXIOPmz6qLZqr
	1MCk3K2eMTQno2IaEFHbCxgBaTKnoXreLg3Dln96djZCQpdlSiNX8VEELcYt2mremBos7paJeBR
	h
X-Google-Smtp-Source: AGHT+IGq+AGtHTaYoevgI5lmO39I2NZ7l2zi3X3i/ImM1ZZAtawjRiR2+JhC/bb5Orp140706bezWA==
X-Received: by 2002:a17:907:7d8c:b0:ab7:d87f:665a with SMTP id a640c23a62f3a-abeeef36285mr53154366b.46.1740518699881;
        Tue, 25 Feb 2025 13:24:59 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdc52esm207982266b.13.2025.02.25.13.24.59
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 13:24:59 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab78e6edb99so864408966b.2
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 13:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKCXY7+XQ3ncJ4KAIM08HlWzBEh/IPRmBMOCXhz9aceM4Y1OvfnwerjraUF0ny1/SqWeP+oQHE@lists.linux.dev
X-Received: by 2002:a17:907:86a5:b0:abe:ea8d:a8a2 with SMTP id
 a640c23a62f3a-abeeee40ec6mr75902266b.33.1740518698732; Tue, 25 Feb 2025
 13:24:58 -0800 (PST)
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
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6>
 <CAHk-=whGY2uYcXog8kmuAAAPJy4R84Jy9rEfXfoHBe-evmuYDQ@mail.gmail.com> <4l6xl5vnpulcvssfestsgrzoazoveopzupb32z5bv6mk23gazo@qn63k7rgsckv>
In-Reply-To: <4l6xl5vnpulcvssfestsgrzoazoveopzupb32z5bv6mk23gazo@qn63k7rgsckv>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Feb 2025 13:24:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgMnSOnaddFzfAFwjT-dGO9yeSkv6Lt21LgWmCKYCM7cg@mail.gmail.com>
X-Gm-Features: AWEUYZmB_Wr6TV7gwJy_39meCdZ0vPmT0Ykzda91InpP6j1aByc6OUNdAIm7q8c
Message-ID: <CAHk-=wgMnSOnaddFzfAFwjT-dGO9yeSkv6Lt21LgWmCKYCM7cg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, Ventura Jack <venturajack85@gmail.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Feb 2025 at 12:55, Kent Overstreet <kent.overstreet@linux.dev> w=
rote:
>
> The problem isn't that "pointer aliasing is fundamentally unsafe and
> dangerous and therefore the compiler just has to stay away from it
> completely" - the problem has just been the lack of a workable model.

It's not entirely clear that a workable aliasing model exists outside
of "don't assume lack of aliasing".

Because THAT is the only truly workable model I know of. It's the one
we use in the kernel, and it works just fine.

For anything else, we only have clear indications that _unworkable_
models exist.

We know type aliasing is garbage.

We know "restrict" doesn't work very well: part of that is that it's
fairly cumbersome to use, but a large part of that is that a pointer
will be restricted in one context and not another, and it's just
confusing and hard to get right.

That, btw, tends to just generally indicate that any model where you
expect the programmer to tell you the aliasing rule is likely to be
unworkable. Not because it might not be workable from a *compiler*
standpoint (restrict certainly works on that level), but because it's
simply not a realistic model for most programmers.

What we do know works is hard rules based on provenance. All compilers
will happily do sane alias analysis based on "this is a variable that
I created, I know it cannot alias with anything else, because I didn't
expose the address to anything else".

I argued a few years ago that while "restrict" doesn't work in C, what
would have often worked is to instead try to attribute things with
their provenance. People already mark allocator functions, so that
compilers can see "oh, that's a new allocation, I haven't exposed the
result to anything yet, so I know it can't be aliasing anything else
in this context". That was a very natural extension from what C
compilers already do with local on-stack allocations etc.

So *provenance*-based aliasing works, but it only works in contexts
where you can see the provenance. Having some way to express
provenance across functions (and not *just* at allocation time) might
be a good model.

But in the absence of knowledge, and in the absence of
compiler-imposed rules (and "unsafe" is by *definition* that absence),
I think the only rule that works is "don't assume they don't alias".

Some things are simply undecidable. People should accept that. It's
obviously true in a theoretical setting (CS calls it "halting
problem", the rest of the academic world calls it "G=C3=B6del's
incompleteness theorem").

But it is even *MORE* true in practice, and I think your "the problem
has just been the lack of a workable model" is naive. It implies there
must be a solution to aliasing issues. And I claim that there is no
"must" there.

Just accept that things alias, and that you might sometimes get
slightly worse code generation. Nobody cares. Have you *looked* at the
kind of code that gets productized?

              Linus

