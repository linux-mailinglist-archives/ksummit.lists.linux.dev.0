Return-Path: <ksummit+bounces-371-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C73C273F
	for <lists@lfdr.de>; Fri,  9 Jul 2021 18:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 9CF873E10D5
	for <lists@lfdr.de>; Fri,  9 Jul 2021 16:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55042F80;
	Fri,  9 Jul 2021 16:02:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6240168
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 16:02:52 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id g3so10840582ilj.7
        for <ksummit@lists.linux.dev>; Fri, 09 Jul 2021 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sej+T/bePMdoiBqNeQkF4QPgZxgyOdE8cD4ihrSSbfI=;
        b=qgCxE7WwyvZytoJlXsAY5bBBpYItZp90AEBkhxuSs33FpgAyimh3HbH8LJskkyVTKH
         F6N5MA3gEc8KegVs3Qewi0aXgVwHUyZ4fPfQJdDNShozPPlB5T/Y7u5czlSkEJqmDbNL
         YKXb9cDQFTXs2PHfcgfqcm0nn1+sMqtwiRx1cRWmxzqEemA7tArMyI83cta/LmzmjJQG
         KttSvA+SX6m0ZSIq7DjlwVqZuVz9mixK0sGtk9ZbKABB5TL7RYCue6XjPU7KBJ+KVm3r
         VrZiFVQzxGTkl2LmIKNinptE5JwfgIfzsmhHOymT8XxfayTaJ0aQ+ViYvAVzaMNRR+tv
         kG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sej+T/bePMdoiBqNeQkF4QPgZxgyOdE8cD4ihrSSbfI=;
        b=bA3dDiTsKvLZL5XP0drsPCZnnBQV0d56BS9O/ikDdv5TTlmR1puWT+DZkZ4FttxK31
         clyOGD+EtHkzSkaXsVXAeKIQdrMaCVSSzQkC22oXJ2lXxzVvMr6BXYqFvKgQt/AcdUv/
         BS52CSDMTHKGQdCgQ33hwseT1N7V9oIqlmaAtfn3P4M3FA3GPX/dw2fGOQgabUxitgsp
         CuI70ok/QeE0XCw/nptHOc6MVwhso71rxYr78E51BEfph3x/yWnGjt3PLW1bpd+XRLrK
         X3VYUZ2EJkJ7l9Su8Ta9P7tQY85/zkMFi4TnYiJdq6TrCpGta5PyJnjxa+NRkcIeKyBG
         cvng==
X-Gm-Message-State: AOAM530qs3tXSIVtbkYsVjVHQZUh7dQ4rFYdba8TReUHfshHSJNfJS/h
	5Xn3fsXkmisE+DqMHxGvtr6r4H6xcyNyExYe7t4=
X-Google-Smtp-Source: ABdhPJwibvdrh9O1bbHdASJ40CoPB4/vsE9e/JLYAGsZJatgzdR603+P/fyHkS/RflB8mqWgdw+KNkqGyKvESWziVt8=
X-Received: by 2002:a05:6e02:1d04:: with SMTP id i4mr27150441ila.149.1625846571843;
 Fri, 09 Jul 2021 09:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <19e0f737a3e58ed32758fb4758393c197437e8de.camel@HansenPartnership.com>
 <CANiq72mPMa9CwprrkL7QsEChQPMNtC61kJgaM4Rx0EyuQmvs2g@mail.gmail.com> <YOgesjNqpsZNK5Gf@elver.google.com>
In-Reply-To: <YOgesjNqpsZNK5Gf@elver.google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 Jul 2021 18:02:40 +0200
Message-ID: <CANiq72n8fJ8S5R4YKZBDuNFMCN3cDOUmk+6Rtp-ikNVwceX-Ng@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Marco Elver <elver@google.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Leon Romanovsky <leon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev, 
	kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 12:02 PM Marco Elver <elver@google.com> wrote:
>
> I think the main point was about the combination of sanitizers paired
> with fuzzers like syzkaller.

Yes, and my reply was that compile-time detection of bugs is way, way
better than runtime detection + relying on being lucky enough to hit
the bug via testing and/or fuzzing.

> I sincerely hope that not too much trust will be put into Rust-only
> dynamic analysis via something like Miri (for the unsafe parts). For the
> (...)

I never claimed that we should blindly trust unsafe code written in
Rust, nor that we should only perform Rust-only dynamic analysis.
Quite the opposite: I mentioned there is already tooling around it
precisely because we need as much of it as possible.

Put another way: the topic is "what Rust buys us", not "what unsafe
Rust buys us". That is, the goal is writing abstractions in a way that
we maximize the amount of safe Rust code for modules etc. But,
obviously, the Rust abstractions that deal with unsafe code (e.g.
calling C) need to be as carefully reviewed and analyzed as C code is
-- nobody claimed otherwise.

> It is very likely that if the Rust portion is analyzed alone, be it
> statically or dynamically, that there will remain undiscovered bugs due
> to improper abstractions between C and Rust. While I fully see that

Definitely, but there are some things that are amenable to be analyzed
on their own. For instance, for data structures written in pure Rust,
Miri is a powerful tool we should be using right away.

> Rust's static guarantees are strong for safe code, I'm pragmatic and

Note that even within the unsafe subset there are some benefits over
C, such as the borrow checker (it is still enabled in unsafe code),
pattern matching and type system in general (e.g. like the
`Option`/`Result` example a few emails above about being unable to
mistakenly use its contents if there are none; that you can create
types that enforce invariants, that it is stronger overall than
C's...), etc.

It also has some downsides, though: the rules one needs to abide by in
unsafe code are different than C's (e.g. due to new concepts like
references), and thus one should be careful about conflating
assumptions.

Side-note: our coding guidelines enforce that every `unsafe` block
must be documented with a proof of why such block is sound. Same for
invariants that a type holds. Moreover, we require all public APIs to
be documented, etc. This is a way of saying that, even for unsafe
code, we are trying to be stricter than the C side.

> just do not believe those building the safe abstractions from unsafe
> code will not make mistakes nor will those abstractions shield from
> changed behaviour on the C side that directly affects safety of the Rust
> abstraction.

Again, please note we never claimed anything like that.

It is the opposite: we want to use Rust precisely because we want to
be able to statically enforce as much as we can -- that is, maximizing
the amount of safe code.

> Not only will Rust integration with K*SANs be required to catch early
> bugs in the abstractions, but also be necessary to catch e.g.
> use-after-frees in Rust code where C code freed the memory erroneously,
> or data races between Rust and C code.

It might be possible to eliminate some classes of bugs if we avoid
mixing C and Rust too much.

For instance, if we have a model where we allow the Rust side to
manage ownership of some objects (instead of being forced to always go
through the C APIs), then we may be able to statically guarantee more
things and further maximize the amount of safe code, in particular in
modules -- which is why I raised the question earlier.

Cheers,
Miguel

