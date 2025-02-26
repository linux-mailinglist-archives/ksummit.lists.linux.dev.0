Return-Path: <ksummit+bounces-1914-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE1A46028
	for <lists@lfdr.de>; Wed, 26 Feb 2025 14:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFEFE17585A
	for <lists@lfdr.de>; Wed, 26 Feb 2025 13:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABF92206AF;
	Wed, 26 Feb 2025 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQ5KNdpu"
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA9219312
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575019; cv=none; b=AHvGWF9GOvSLcHPMNEb7J2DzA+HgSklqDvQETMivvP0Kf7/rVYW51qHtgE4lV17/EmdEdGozdpSxp71W1Yng9wNK8F2nvrcSlho2df63y74acM1jNOqew+XvUX74+yocEo/Y/dRTGQXjXIq5g/9alwBRH443qHV+XZ1X+X6tRZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575019; c=relaxed/simple;
	bh=eHXH2xcwHvpeP2rTbNNDIAknPYHbqmdnpV8ggdyjZ7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dA/k6JgdgROYaZ110IP16goG9nvh9+fdkAt0ARMu5W7kUNAptGn1XSEEfms5TI9Abw8CuOQ032+OmFa94XyFuyzwyabO6S4Btm6HkCumxN/1Zy/RzjHxXG5sbZ5FEwHf+mevmeA8HrHLMkjrMW3yGDqd1BzLTvnNoD0Q/84wBKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQ5KNdpu; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30a36eecb9dso70600821fa.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740575015; x=1741179815; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOaAyIgCFX8Depn/PozouTZSxlQDaDtgCKWZ+jCIr88=;
        b=mQ5KNdpu7nAZXd+bKcgROHgvEf+YAu0odFcANrSLLs/miWE8I1k243Xp9mN49S8Eb6
         dDwAfzCumUB67B3DHZW5kQ9Pskanm/k15t89GF7Wscp8ytsmjBuwB7ckfrfRNSWTZD6R
         EUfLxk4nBpj2bcGeQv8IIKvf+43wf35t+4NBj7cVH4PH1A5RRLhchbgZ6/x+CJY2ji/L
         nfs9oFnjlheQBmSdwpXkdY4I/mm3R173hPSTGHDZrKOM6ENvgDCaD7vu6OrGKHbQDjza
         jK6ZK1IFpDkd2AXnScbmJfLHDvHssmTznWLK1O+EM3UWBoyKPp5O2D3okQCCOV2hNZiH
         +ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575015; x=1741179815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOaAyIgCFX8Depn/PozouTZSxlQDaDtgCKWZ+jCIr88=;
        b=dtUVZLvNTdp4drpYoRiXMtWziyKFOzHaQjsMM/kM4gsyHKK/N1XuI4O2rurCpzYk4c
         bjc3h+rNslqfYNrfCmAzDtGOSh6H+QAhZlGtQo+IEdOIkcFrFZF37TK18rLyMEcrW1lz
         dCUzE99RKcps/3LJuzfIQxldbdLKk3YKyV8RJCzwxGQUerroNtf2oXBEtZ2lv8smmOyM
         9/LijCXURPwEYTdmZ6m/XC6JTz6jLgSDtsmZRgKBFEJQjEmUssBo024wcsD7UK8DmAi6
         VjPQHi2QaiLDklRWIBf9MDhLs8TjyGvOBdQOfvENH6HJYLYDkZYFdUSMFi7GgcgLWoJN
         n9Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXqw4DKzzFZkg4/zq2AKWujEvMcOak2IO9EJ02QORUuIgQzvHVPOEw3koNduLkIn3H5CGGltsej@lists.linux.dev
X-Gm-Message-State: AOJu0Yxuhp2vun/4WbgC9+bB4TfjIpXtdbLB2LnQiW+CRRJdg3aMLfm1
	yjNKyZjxcuPJ7qN9uk99FOXxSUNsJNblNetJngXzZ8+epYBt7pnVgT2e93IoYBtBRElNmSrzeZ6
	awli0WNF32yx5x0wdgoWLlJJehzE=
X-Gm-Gg: ASbGncveTrCw0L4lFq7d2CRMURGGcs2LOeRG4bmDAa467YHbRYnaT3SJrSaUBISTFxr
	HwhQRP5mweqSKd+AeiPGNQ6v82nmXl0iVLQVc85fG5zjIYch0xJ6HTSIe6951wFgGKWAiEOQ1rg
	Oeg27CB8ek
X-Google-Smtp-Source: AGHT+IF4/7i4cn3DiJ773zF8xOQe9L3YSlR5TCr/4/VVZsgTQa7dvgs28vk0rkrTCUmUnVPKqxiqJEINXiihbPUT3OY=
X-Received: by 2002:a05:6512:e99:b0:545:6fa:bf5f with SMTP id
 2adb3069b0e04-54838edd8b6mr9406658e87.2.1740575014818; Wed, 26 Feb 2025
 05:03:34 -0800 (PST)
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
 <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
 <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
 <5E3FEDC4-DBE3-45C7-A331-DAADD3E7EB42@zytor.com> <2rrp3fmznibxyg3ocvsfasfnpwfp2skhf4x7ihrnvm72lemykf@lwp2jkdbwqgm>
In-Reply-To: <2rrp3fmznibxyg3ocvsfasfnpwfp2skhf4x7ihrnvm72lemykf@lwp2jkdbwqgm>
From: Ventura Jack <venturajack85@gmail.com>
Date: Wed, 26 Feb 2025 06:03:20 -0700
X-Gm-Features: AQ5f1JoDaaLCqIcdIZhNNBP4aubytjJzFmRPFjw-ljPopqVIQo-B9DJXO1CskAM
Message-ID: <CAFJgqgS-SMMEE2FktuCUimdGkPWMV3HB2Eg38SiUDQK1U8=rNg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Alice Ryhl <aliceryhl@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 1:21=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Tue, Feb 25, 2025 at 10:16:17AM -0800, H. Peter Anvin wrote:
> >
> > I do have to say one thing about the standards process: it forces a
> > real specification to be written, as in a proper interface contract,
> > including the corner cases (which of course may be "undefined", but
> > the idea is that even what is out of scope is clear.)
>
> Did it, though?
>
> The C standard didn't really define undefined behaviour in a
> particularly useful way, and the compiler folks have always used it as a
> shield to hide behind - "look! the standard says we can!", even though
> that standard hasn't meaninfully changed it decades. It ossified things.
>
> Whereas the Rust process seems to me to be more defined by actual
> conversations with users and a focus on practicality and steady
> improvement towards meaningful goals - i.e. concrete specifications.
> There's been a lot of work towards those.
>
> You don't need a standards body to have specifications.

Some have claimed that a full specification for aliasing missing
makes unsafe Rust harder than it otherwise would be. Though
there is work on specifications as far as I understand it.

One worry I do have, is that the aliasing rules being officially
tied to LLVM instead of having its own separate specification,
may make it harder for other compilers like gccrs to implement
the same behavior for programs as rustc.

    https://doc.rust-lang.org/stable/reference/behavior-considered-undefine=
d.html
    http://llvm.org/docs/LangRef.html#pointer-aliasing-rules

Interestingly, some other features of Rust are defined through C++
or implemented similar to C++.

    https://doc.rust-lang.org/nomicon/atomics.html
        "Rust pretty blatantly just inherits the memory model for
        atomics from C++20. This is not due to this model being
        particularly excellent or easy to understand."

    https://rust-lang.github.io/rfcs/1236-stabilize-catch-panic.html
        "Panics in Rust are currently implemented essentially as
        a C++ exception under the hood. As a result, exception
        safety is something that needs to be handled in Rust code
        today."

Exception/unwind safety may be another subject that increases
the difficulty of writing unsafe Rust. At least the major or
aspiring Rust compilers, rustc and gccrs, are all sharing
code or infrastructure with C++ compilers, so C++ reuse in
the Rust language should not hinder making new major
compilers for Rust.

Best,  VJ.

