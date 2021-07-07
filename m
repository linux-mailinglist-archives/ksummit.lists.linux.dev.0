Return-Path: <ksummit+bounces-293-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEBC3BEA7E
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A4D073E1078
	for <lists@lfdr.de>; Wed,  7 Jul 2021 15:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D352E2F80;
	Wed,  7 Jul 2021 15:15:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079C168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 15:15:13 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id b18so3131077ilf.8
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=01/B7JoDyHB17dvcj1Ui1DR2xrrRWPUM15JDbksqujU=;
        b=S/PnEWMk4krO7SNgoxkJuHpDCUz9kk1IamScOVwyR6wX4sz7D4BOtSsi4fh1+RtvMq
         BGZFGp5d63rM2yNouPG3UYa0XBLVMP76zReMva7Q9AgS7u0pKozC55QymBqqpwHsE+I4
         FQXioruSQS/bwAGYgc0jrqnox00cII8NbdXyZ7nhsxW76FEOaZ9c0O6+7mmlvUBWwhm5
         dzKuUC1WD1zdB0SAHdvnSluMYgTqAI++YpGUjip4GESJV/cU1j/3zPzNaDOKoJJQ1Oko
         Ww8WJizfTBzwWfrc1uYIu1BNsU0Jv2YPFy8JF/Jx1Rg3oSwJgH5soeDzefuyekn2q6HK
         TcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01/B7JoDyHB17dvcj1Ui1DR2xrrRWPUM15JDbksqujU=;
        b=Gr6PvOKBqSefTrvyatCJUVFYeLRnV34n0/jwb88vK8eLNuka5HYz+99rb7DsmbEy/4
         7/JWS6zsRMqtv6QhAfCa6ilTZP3efpfABAoyOk3tN/AozSsgBERXkDPI0A/dLyE4Ax76
         BgqUmIonSG4tW20SR9Pe3Bz703PUHsiGVhbFg40NAMSKUZ0ej031qbkUjRt4yGWA0KmL
         4R2VaMty0XzeNgvtXjvS7JW9DwctanUiB/JlaoyKeWPbTQxA6Wr4rgxmDeEHr2Kufq3I
         rpPN+W+CYqZTqnidllSYzoCSiZPbAlk6kjxTe7cR1ELMLQjZJvRGgaF7sHB7Uh9r/1Jw
         0Tlg==
X-Gm-Message-State: AOAM533DeN05PoWLM53fOPy7r5X2KeB7zteQjvnPzL8GgKj0HWJmeZW3
	thi4egW2xNqE2GbnB/Hnd412GFEyHQV2plY4ios=
X-Google-Smtp-Source: ABdhPJyXaInLqGUDRA/apWPNvtVAds2cfELjSAYiaZqMU5Lcit8ClqYgGFjgjWi2wIsD88x8K4sCxAYZnI/EFgAacjE=
X-Received: by 2002:a05:6e02:b46:: with SMTP id f6mr19433084ilu.94.1625670912854;
 Wed, 07 Jul 2021 08:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com> <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com> <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com> <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
In-Reply-To: <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jul 2021 17:15:01 +0200
Message-ID: <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <greg@kroah.com>, Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 4:08 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> UB is Undefined Behaviour, right?  C plus the memory model should mean
> we don't have that in the kernel, although that's enforced by
> inspection and checking rather than the compiler.

Yes, it is Undefined Behavior. I am sure you know, but just in case:
it covers things like the usual out-of-bounds accesses, using objects
after their lifetime has ended, data races, etc., plus quite a few
other things.

There are 200+ instances of UB listed in the Annex J.2 list of the C
standard [1]. SEI CERT also has a nice list [2].

On its own, UB is not bad. Nowadays, some instances of UB are used by
optimizers to give us the performance we all love.

However, the problem comes when we, as humans, mistakenly introduce
UB. Even someone that is very knowledgeable about C introduces UB from
time to time. We all do. The reason is simple: reasoning about UB is
typically non-local, e.g. we may be doing a change in some function
that changes a pointer, and that change on its own may be fine, but we
did not account for some invariant in another function that uses the
pointer.

Other times UB appears because the optimizer had different assumptions
than the person writing the code / project / environment, e.g. the
`-fno-delete-null-pointer-checks` issue we had in the kernel a decade
ago, where the optimizer removes a branch because you already accessed
a pointer.

In summary, relying on inspection to avoid UB is a losing battle. That
is why many tools appeared throughout the decades to attack different
parts: Valgrind (Memcheck, Helgrind, DRD...), ASAN, UBSAN, Miri, etc.

Rust, like C, has UB. The difference is that Rust has a safe subset
where UB is statically guaranteed to not occur (as long as the unsafe
code is sound). This is key: you "only" need to make sure the unsafe
parts are not breaking the rules, and if that is true, Rust guarantees
the safe code does not break them either.

This means the work of inspection / checking / running UBSAN and
friends, etc. can be focused on the unsafe bits.

[1] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2596.pdf
[2] https://wiki.sei.cmu.edu/confluence/display/c/CC.+Undefined+Behavior.

> I'm not sure I get the point here: all the kernel refcount models are
> explicitly multi-threaded, because we usually expect multiple CPU
> threads to be using objects simultaneously ... it's why the base
> implementation, kref, uses atomics.  That's not to say we don't have
> single threaded use cases ... it's just that's not what's commonly
> used.

Yes, `Rc` is a type meant for single-threaded reference-counting
scenarios. For multi-threaded scenarios, Rust provides `Arc` instead.
It still guarantees no UB and no data races.

This is actually a good example of another benefit. `Rc` is there
because there is a performance advantage when you do not need to share
it among threads (you do not need to use atomics) -- and Rust checks
you do not do so. In C, you can still have an `Rc`, but you would not
have a compile-time guarantee that it is not shared. So in C you may
decide to avoid your single-threaded `Rc` and use `Arc` "just in case"
-- and, in fact, this is the only one C++ has (`std::shared_ptr`), and
even then, it does not statically prevent UB.

> That does beg another question which I couldn't find the answer to in
> the base docs: the Rust Rc<T> is saturation protected, isn't it? or
> would the rust implementation inherit that from the kernel?

We can do both: we can introduce new types with the precise semantics
we need in pure Rust, but we can also "abstract" C facilities.

For instance, we have a `Ref` type that is similar to `Arc` but reuses
the `refcount_t` from C and introduces saturation instead of aborting
[3]

Another example are the red-black trees that abstract the C implementation [4].

[3] https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/sync/arc.rs
[4] https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/rbtree.rs

Cheers,
Miguel

