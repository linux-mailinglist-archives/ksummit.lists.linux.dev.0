Return-Path: <ksummit+bounces-244-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FC73BD926
	for <lists@lfdr.de>; Tue,  6 Jul 2021 16:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A19D81C0EC7
	for <lists@lfdr.de>; Tue,  6 Jul 2021 14:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F552F80;
	Tue,  6 Jul 2021 14:56:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983D0168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 14:56:08 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id u7so23197153ion.3
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SpBZsyZTrhZS/FQ+d0iF7gRQqxorFw/R1xGMVIsn5WM=;
        b=N08vQ63gttAaPAgVp/GLrfqSvbZjSlcfHkempPXkIOAhxQH63Y6shiJYTe43q6i042
         QPPE4zS3NC6pyhAKqdwGgu1Fy1WgfTjH/GToneSh2jk+39OxjQZ7wQMvAAHAnI84SXES
         v1fQTKggZKTU8Z71OoEifwhrdtN9bM5cGAVo4K7Tkytk1JzcfEj2kPCcexO+ZBzV75Fv
         raTSzHYZ0yLXyzak1mCeotoy0Btz4KFM+LPN3kJ5V2FvGp1ZO3i0+6afepiMuKoUyJBl
         QeTcLLX3eaVzxNmr4YzVyhSsatPQXbqih6KYa6gGciFpKPQR2YWx+qVv4uDQNwbBHrgV
         IWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SpBZsyZTrhZS/FQ+d0iF7gRQqxorFw/R1xGMVIsn5WM=;
        b=qWLWZrV3VPnrGuA1cm/KUkoTLHPjrdfw8bdixP/vLc+wTnfQw/fC1ODwf1+A5KYBrM
         arijNptdSnZ35qRdnPVfejjABPCW+HlORUev0A4hyIe2/L/bk7db/Juq+80w5vbI81XB
         79t3PTBo/CsRjtmhavy4RuqAqkhIE8P3z9bcbx/7h8KR8XJp7F/3bb8xz2uYqSGD8IGz
         bKa2DOXG60kdYPau3V+pSlDB6qLYIILMlVNcx+QM7IsdEWzcpkk7ZBJvNsBhwqFHl3ao
         iA7+5N2Oyi/YATdqHmViKmADIITN/cfVMES5NfgueTx82AHa8NG/jVqJC2O/01lXPtGr
         tZmQ==
X-Gm-Message-State: AOAM533UayAismu+/cb52ylRID2zxP+MFaWB0ppExRwJCoWyFiFGHxmB
	Pw/xyQu30Y8hE6bz6ZnY5vxYNaPe5Ev0A49E254=
X-Google-Smtp-Source: ABdhPJyixrbAYLeX1cyHCHi4UNzKMqWc+RvVIQHZtTwRwFCgUATZduFe4DsUqDyAl8+ZXGDwqAVmYTcJxQ6tXS02dpo=
X-Received: by 2002:a05:6602:2c85:: with SMTP id i5mr1139496iow.91.1625583367822;
 Tue, 06 Jul 2021 07:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <19e0f737a3e58ed32758fb4758393c197437e8de.camel@HansenPartnership.com>
In-Reply-To: <19e0f737a3e58ed32758fb4758393c197437e8de.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 16:55:56 +0200
Message-ID: <CANiq72mPMa9CwprrkL7QsEChQPMNtC61kJgaM4Rx0EyuQmvs2g@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Leon Romanovsky <leon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 12:20 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> The main advantage is supposed to be "memory safety":
>
> https://en.wikipedia.org/wiki/Memory_safety

Yes, although please note it covers other things, like data races.

In general, Rust prevents the kind of thing that is UB in C, which
means it also covers you from the usual surprises that optimizers may
give you.

> But that's tempered by the fact that all non-rust code is deemed unsafe
> and it's hard to write drivers without calling into the core, so
> there's a lot of unsafe stuff going on even if you write your driver in
> rust.

Yes, but bugs on the C side are still bugs, and they need to be fixed
regardless of Rust.

That is to say: the fact that the C side has bugs does not mean Rust
is pointless in the kernel. The value is to write drivers with a
safe-as-possible API. By doing that, we avoid extra bugs (but, of
course, bugs on the unsafe Rust code or in the C side remain can still
happen).

> The other thing that makes comparison with C hard is the fact that
> compilers and fuzzers are pretty good at detecting memory problems in
> the existing code, so it's unclear what memory safety ab initio
> actually buys for the kernel.

Compilers definitely do not detect all memory safety issues -- not
even close. They cannot anyway, in the general case. Not even in C++
with `std::unique_ptr`, `std::vector`, etc. Rust can do so because it
places extra restrictions in the modeling capabilities (in the safe
subset only).

Runtime detection of UB in C is, of course, possible, but the idea is
to have static guarantees vs. runtime-checked ones. There is also
runtime detection of UB in Rust for unsafe code with tooling like
Miri. plus all the language-independent tooling, of course.

> 3. Less review: The lack of kernel programmers understanding rust
> hampers reviewing.  Since most of our CVE type problems are usually
> programming mistakes nowadays, the lack of review could contribute to
> an increase in programming fault type bugs which aren't forbidden by
> the safer memory model.

Yes, this is a fair point. Initially, our plan is to work with
subsystem maintainers that do want to start providing a Rust API for
their subsystem. Then they can maintain drivers using such API.

We definitely do not want to have drivers written for a particular
subsystem if nobody is able to review (or even write) the Rust
abstractions for that particular subsystem.

Cheers,
Miguel

