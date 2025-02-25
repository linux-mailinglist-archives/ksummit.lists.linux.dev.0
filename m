Return-Path: <ksummit+bounces-1894-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BAFA44AF9
	for <lists@lfdr.de>; Tue, 25 Feb 2025 19:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69E2E3A6A58
	for <lists@lfdr.de>; Tue, 25 Feb 2025 18:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1601A38F9;
	Tue, 25 Feb 2025 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NYTyetRk"
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFC519B5B1
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 18:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740509708; cv=none; b=aQfYPQf7+WIpo9TpSGNMETna0SUmiDjbWSCBsE07nCmxTHx2L+36zxu1+oUrEUmlDRixwUjq/7qXPdRxdpKMWbE3OlhM42DTJrm8bDBlMdWHZWenKle7Dpg1OPBbd+TRLOlKLmIUyQzqhOTlM6Rq1B+G4ym2W58YNisNoAm/2GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740509708; c=relaxed/simple;
	bh=PYHSgLO7lQsS8Kx+B9mtZoE1y7zDRkButLc9RwemdLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REBE6RHYw05zKbp5dYlQbLW0tsiWQlqKt4y1fkT+cn222oVACpG9iqTNC1kTlPzFp59L9XjMkJnRpS8radWJz/xjEZuGwQOWVuJeoBmozPI5Q0YrWGOwvXwZ5/+iPv1KgEh5jIfhsJerklXJGqnpQoF7JDhsy/hyA3om2PWfJWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NYTyetRk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abbda4349e9so871925166b.0
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 10:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740509704; x=1741114504; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i+rWhtD5x8D6XUhYZf1P7I+awMTvGfoNgd9n4DqDTvI=;
        b=NYTyetRkEKtE70SQgHf60Ilno3HLXMRGCrsTRCajafZun34gTv4ul43x4ckWxqrrt+
         C+vbsze/uHr2+0aVcIMH14pm+MaKzi9nqNSCZstWZDFnLN6TWXRzZfeRnkGsp3VDQvWa
         6zYF8US1QTHfVWq0A6HHVsrfl7Y5d4rsyZKNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509704; x=1741114504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+rWhtD5x8D6XUhYZf1P7I+awMTvGfoNgd9n4DqDTvI=;
        b=WBOUutPfvNtgbzYUFl+XNU/E7XC7uEk9QUxrkZ1Jf+R4dVihDpl/KOFcNNNbhILPBg
         DCRSjGOmnxZvJ7HwftjZ9DgkH+LRreMMGaetJ/WrjhLV52M5xfXAtoHJQnNGTJ4DhjyT
         3FlRU8jZu6HUVMQuY/AUXYT4qy4kaId+LzsNrr4sEyErYM9tmhdxCYkO74cqG0OJNt6r
         /mga5Wlw1NfE/4HoVnW9W6OeMorCN4Vw6J+6LW8TFaXL++7iHGpHc3UiHuPxh44hDYD5
         oYRcQPLnJ8ZTYSeYamFLBYhJk3unJNUHFxWHZo/lxHouKbh2ccK6l92vGTbcNY7Dyh8B
         u4zw==
X-Forwarded-Encrypted: i=1; AJvYcCVaA1UHZKamaRm4GU0jJe331H9LybjfuPC3ZLDy6/lJEWetOh9W3qM8FcVg8LEuUfkYRzunQXD+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/bmWOWs7EDCpONIzrx5WdZXWESjSSC9+VYrGLcWVoWiWQeKGO
	iPcW/h9O6s/Ncx/k4kNL5A1ls582B9h3yn1ggtwjeJF7X87k6NrVijtW53jR6ZjnWQTFqs1DsDv
	+F0o=
X-Gm-Gg: ASbGncuzpYasAuGrOWSFOOIXR5pLLQWTYoinjf0/Fe/PxjOYBDnqPZS1o5Dd63uZoL2
	9CTdi7Ge0hptRwd3wLOG6wYaiDVYE5CoPYfIYsxb0446LujsqcQatEZwu38b/4YgpJmNc7UwR6/
	mxftU4eamMS9sjmIN3mFnMsO+VlrHoLccFnxtouxmj3IobIRTK8UXkbZOmqzel3VAbXr8xfyLbE
	WF+w3n0fMHJYgPP2nW9UPl3iaZ2futGvI0VuWFTdeCE8a1H971MDHO+ODuWz84tE6zh9KhhNcTl
	Zkph72fvCEb2YAuuwCfScpS8IxTNUc+YWZV/BFRuIjhvUA/2CUZ6FEi3g2Rl9Np+nPnW8aJ2uzG
	3
X-Google-Smtp-Source: AGHT+IHPsosfgc0PpWRasPMW9u51OndQnKqgZAzDgtgMuovvE1O9RK0V2f4RqaTWiFJQESTOmT57ZA==
X-Received: by 2002:a17:907:7754:b0:ab7:e811:de86 with SMTP id a640c23a62f3a-abc0d9ca365mr1494074766b.13.1740509704229;
        Tue, 25 Feb 2025 10:55:04 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2013586sm187716666b.108.2025.02.25.10.55.03
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 10:55:03 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so9538297a12.3
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 10:55:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURzfUDSH9tw6FECtiQsEMJZVg3fLdBvASg04swfdz6v9H1Mmt+RpZq7Aa9XdwctUOJVm3KWnud@lists.linux.dev
X-Received: by 2002:a05:6402:2b86:b0:5d9:a54:f8b4 with SMTP id
 4fb4d7f45d1cf-5e0b70dc05emr16845178a12.11.1740509703150; Tue, 25 Feb 2025
 10:55:03 -0800 (PST)
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
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com> <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
In-Reply-To: <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Feb 2025 10:54:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
X-Gm-Features: AWEUYZk0cXay_isXRx72KKy4FfsgUiBHKihS09o_3cl8pFnpf_e0Ez6oe_KpUXU
Message-ID: <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Alice Ryhl <aliceryhl@google.com>
Cc: Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2025 at 08:12, Alice Ryhl <aliceryhl@google.com> wrote:
>
> I think all of this worrying about Rust not having defined its
> aliasing model is way overblown. Ultimately, the status quo is that
> each unsafe operation that has to do with aliasing falls into one of
> three categories:
>
> * This is definitely allowed.
> * This is definitely UB.
> * We don't know whether we want to allow this yet.

Side note: can I please ask that the Rust people avoid the "UD" model
as much as humanly possible?

In particular, if there is something that is undefined behavior - even
if it's in some "unsafe" mode, please please please make the rule be
that

 (a) either the compiler ends up being constrained to doing things in
some "naive" code generation

or it's a clear UB situation, and

 (b) the compiler will warn about it

IOW, *please* avoid the C model of "Oh, I'll generate code that
silently takes advantage of the fact that if I'm wrong, this case is
undefined".

And BTW, I think this is _particularly_ true for unsafe rust. Yes,
it's "unsafe", but at the same time, the unsafe parts are the fragile
parts and hopefully not _so_ hugely performance-critical that you need
to do wild optimizations.

So the cases I'm talking about is literally re-ordering accesses past
each other ("Hey, I don't know if these alias or not, but based on
some paper standard - rather than the source code - I will assume they
do not"), and things like integer overflow behavior ("Oh, maybe this
overflows and gives a different answer than the naive case that the
source code implies, but overflow is undefined so I can screw it up").

I'd just like to point to one case where the C standards body seems to
have actually at least consider improving on undefined behavior (so
credit where credit is due, since I often complain about the C
standards body):

   https://www9.open-std.org/JTC1/SC22/WG14/www/docs/n3203.htm

where the original "this is undefined" came from the fact that
compilers were simple and restricting things like evaluation order
caused lots of problems. These days, a weak ordering definition causes
*many* more problems, and compilers are much smarter, and just saying
that the code has to act as if there was a strict ordering of
operations still allows almost all the normal optimizations in
practice.

This is just a general "please avoid the idiocies of the past". The
potential code generation improvements are not worth the pain.

              Linus

