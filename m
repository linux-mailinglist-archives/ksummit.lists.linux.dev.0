Return-Path: <ksummit+bounces-1861-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D10A40F72
	for <lists@lfdr.de>; Sun, 23 Feb 2025 16:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8BF53B4108
	for <lists@lfdr.de>; Sun, 23 Feb 2025 15:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9F820AF82;
	Sun, 23 Feb 2025 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEcnq7kv"
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FFF22612
	for <ksummit@lists.linux.dev>; Sun, 23 Feb 2025 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740324622; cv=none; b=ah/V8NThj1SatOg7fLbz4QlzGzXlDLQsSax72yF8upWKZE1o3sZN3Fo+cLKftD1H3T2vmyo3YZyVa658GRCmaLgilKvpi7JfA2gRyA9yiSEQIbVjq+TM7Q8wB6TOQcrzHimC6KS0rbj+9/Vi2XcP5tf6iH6+wQ2ckj4jg1m+m5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740324622; c=relaxed/simple;
	bh=W/+HdFCp0Wm3kBZ3uJhoiiNndHLg5cZr3jbvblrGjIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ha8fx0lS0N2k2WTf3UkS6czsKiglr88GkYu3BgIZ93B88MTvKs5gRHFKsy0PFYXiLqPWe4MNrdgItl0Gecg3IYsXbt9cMane5LizQVDQWQIOIhSHyUS+P7QmJ6Tc1BJV5KbIutXlzXoOYdM7jK4KXHW6cMISBZ5yCcswNYXWE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEcnq7kv; arc=none smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-471f257f763so37266331cf.0
        for <ksummit@lists.linux.dev>; Sun, 23 Feb 2025 07:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740324619; x=1740929419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktXdwipRa22g1NOcTaL8DjwNU8y90d7l1/3pSHmXnxc=;
        b=YEcnq7kvR1YPNhNFGvkUXstt9Y/ILKXedDyfD1wdCpFV+bwjgeyh0W9spGM9ZqEmM5
         FbSx8ZS8m+lQTOBsBAJPjPFvh8FAatp5usWnCMLxPDmmYh2k+xTjl/OG88udPhhK80pv
         NAthjvqjFO3UEfEYA0Mkhp0/wnoXH3JkVt3uXqcPj/DN9GuQ6ILy8tVAuUHfSKTdcPzR
         wl0B2i0e6++VC5UwBH2gSDn6amUdCh6iyoCEUx2b3LfYhcXQMXZUQlDodiIusBqO1894
         BPTXnPrMNoTvS0FuDydnive8QinD9BP6NnV6383BQ69SA4IssnCwKxZAXgjaX8XKbXaD
         M3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740324619; x=1740929419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktXdwipRa22g1NOcTaL8DjwNU8y90d7l1/3pSHmXnxc=;
        b=LvK8Gl0hb1o6haQs8Cam6ZVwOnCIvB7rpV7eYuPJnTSdnBje7hv7lZ7o5nyk5zcl9G
         Q1MBO5EXG0ZhHjDpYiLrkT4Fww5p6ToAD/wa44rlKGPDMAdR0L/kF7SnVQTSDrb8/eOR
         kJnI3opBRUWXHVYi4gW6tqUiUhp/hys+JZTgEnND7fE+oNOPQobdctXqs0UBl90hx8Qw
         BJQ6a6KH+vjQEuG+IMoa4CY/JHz/N4gnNgOQmT6PVN5UCsV5Qd06oAlD+cJwYu0ht7pL
         5+FEdurb7Ri/DBPJeGVw37M2b14gNG80fTKi8Y4mMKZ62yNkHKcxaVF+4g6PwRFvkIXU
         ZQzw==
X-Forwarded-Encrypted: i=1; AJvYcCUVdduPS0606p5YRFcCcPSh9b8ZNnq82/T+I1SQ5CQWSmd67eyljhwPaNp+l4FX647CD4HvjJGq@lists.linux.dev
X-Gm-Message-State: AOJu0YyN7F+GfDR/tQJPXNyJFqrR8BHtErKbbmUxVGlzhhHXelltR5WM
	fUV7sLAVKmftIQArtf4kHjHbGHokIUgrZtOZLGNSB4l0hM1NOfDFePV7YvxfVdjSvK6M41FKcdR
	M0gss0ydHahgjDirH5S1lFvlhB9M=
X-Gm-Gg: ASbGncsY8zqxlsddfZZxEERqFnK1H5KfMRcmwoa7mmoqWU0l4RUH+CCfxT4A7dZmJ7p
	X88BxKtbt+24kO4QbSnHWM00ctd5M8eEO3u2pzStrqVBE23rC1nz1ayxC34JNn3cY7EBTjIfuVU
	MRU4Yd8T/I
X-Google-Smtp-Source: AGHT+IF1n3fN2ASWrPZBSwUEo4qIfv66oYZFTGse8TtW5hVVr/95CU6EXUQvIe2Mei+F4OXKAABNRBxXAucgxYx8zS8=
X-Received: by 2002:a05:622a:1388:b0:471:c042:7757 with SMTP id
 d75a77b69052e-472228e124cmr158323171cf.31.1740324619451; Sun, 23 Feb 2025
 07:30:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c> <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
In-Reply-To: <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Sun, 23 Feb 2025 08:30:06 -0700
X-Gm-Features: AWEUYZlx0t9TgnsWN0eRB0PYZAyBItH9gFhBdJZwmRJt-uVzfXRYzRyM6k94nIk
Message-ID: <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just to be clear and avoid confusion, I would
like to clarify some aspects of aliasing.
In case that you do not already know about this,
I suspect that you may find it very valuable.

I am not an expert at Rust, so for any Rust experts
out there, please feel free to point out any errors
or mistakes that I make in the following.

The Rustonomicon is (as I gather) the semi-official
documentation site for unsafe Rust.

Aliasing in C and Rust:

C "strict aliasing":
- Is not a keyword.
- Based on "type compatibility".
- Is turned off by default in the kernel by using
    a compiler flag.

C "restrict":
- Is a keyword, applied to pointers.
- Is opt-in to a kind of aliasing.
- Is seldom used in practice, since many find
    it difficult to use correctly and avoid
    undefined behavior.

Rust aliasing:
- Is not a keyword.
- Applies to certain pointer kinds in Rust, namely
    Rust "references".
    Rust pointer kinds:
    https://doc.rust-lang.org/reference/types/pointer.html
- Aliasing in Rust is not opt-in or opt-out,
    it is always on.
    https://doc.rust-lang.org/nomicon/aliasing.html
- Rust has not defined its aliasing model.
    https://doc.rust-lang.org/nomicon/references.html
        "Unfortunately, Rust hasn't actually
        defined its aliasing model.
        While we wait for the Rust devs to specify
        the semantics of their language, let's use
        the next section to discuss what aliasing is
        in general, and why it matters."
    There is active experimental research on
    defining the aliasing model, including tree borrows
    and stacked borrows.
- The aliasing model not being defined makes
    it harder to reason about and work with
    unsafe Rust, and therefore harder to avoid
    undefined behavior/memory safety bugs.
- Rust "references" are common and widespread.
- If the aliasing rules are broken, undefined
    behavior and lack of memory safety can
    happen.
- In safe Rust, if aliasing rules are broken,
    depending on which types and functions
    are used, a compile-time error or UB-safe runtime
    error occurs. For instance, RefCell.borrow_mut()
    can panic if used incorrectly. If all the unsafe Rust
    code and any safe Rust code the unsafe Rust
    code relies on is implemented correctly, there is
    no risk of undefined behavior/memory safety bugs
    when working in safe Rust.

    With a few caveats that I ignore here, like type
    system holes allowing UB in safe Rust, and no
    stack overflow protection if #![no_std] is used.
    Rust for Linux uses #![no_std].
- The correctness of unsafe Rust code can rely on
    safe Rust code being correct.
    https://doc.rust-lang.org/nomicon/working-with-unsafe.html
        "Because it relies on invariants of a struct field,
        this unsafe code does more than pollute a whole
        function: it pollutes a whole module. Generally,
        the only bullet-proof way to limit the scope of
        unsafe code is at the module boundary with privacy."
- In unsafe Rust, it is the programmer's responsibility
    to obey the aliasing rules, though the type system
    can offer limited help.
- The aliasing rules in Rust are possibly as hard or
    harder than for C "restrict", and it is not possible to
    opt out of aliasing in Rust, which is cited by some
    as one of the reasons for unsafe Rust being
    harder than C.
- It is necessary to have some understanding of the
    aliasing rules for Rust in order to work with
    unsafe Rust in general.
- Many find unsafe Rust harder than C:
    https://chadaustin.me/2024/10/intrusive-linked-list-in-rust/
    https://lucumr.pocoo.org/2022/1/30/unsafe-rust/
    https://youtube.com/watch?v=3DDG-VLezRkYQ
    Unsafe Rust being harder than C and C++ is a common
    sentiment in the Rust community, possibly the large
    majority view.
- Some Rust developers, instead of trying to understand
    the aliasing rules, may try to rely on MIRI. MIRI is
    similar to a sanitizer for C, with similar advantages and
    disadvantages. MIRI uses both the stacked borrow
    and the tree borrow experimental research models.
    MIRI, like sanitizers, does not catch everything, though
    MIRI has been used to find undefined behavior/memory
    safety bugs in for instance the Rust standard library.

So if you do not wish to deal with aliasing rules, you
may need to avoid the pieces of code that contains unsafe
Rust.

Best, VJ.

On Sat, Feb 22, 2025 at 12:18=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 22 Feb 2025 at 10:54, Kent Overstreet <kent.overstreet@linux.dev>=
 wrote:
> >
> > If that work is successful it could lead to significant improvements in
> > code generation, since aliasing causes a lot of unnecessary spills and
> > reloads - VLIW could finally become practical.
>
> No.
>
> Compiler people think aliasing matters. It very seldom does. And VLIW
> will never become practical for entirely unrelated reasons (read: OoO
> is fundamentally superior to VLIW in general purpose computing).
>
> Aliasing is one of those bug-bears where compiler people can make
> trivial code optimizations that look really impressive. So compiler
> people *love* having simplistic aliasing rules that don't require real
> analysis, because the real analysis is hard (not just expensive, but
> basically unsolvable).
>
> And they matter mainly on bad CPUs and HPC-style loads, or on trivial
> example code. And for vectorization.
>
> And the sane model for those was to just have the HPC people say what
> the aliasing rules were (ie the C "restrict" keyword), but because it
> turns out that nobody wants to use that, and because one of the main
> targets was HPC where there was a very clear type distinction between
> integer indexes and floating point arrays, some "clever" person
> thought "why don't we use that obvious distinction to say that things
> don't alias". Because then you didn't have to add "restrict" modifiers
> to your compiler benchmarks, you could just use the existing syntax
> ("double *").
>
> And so they made everything worse for everybody else, because it made
> C HPC code run as fast as the old Fortran code, and the people who
> cared about DGEMM and BLAS were happy. And since that was how you
> defined supercomputer speeds (before AI), that largely pointless
> benchmark was a BigDeal(tm).
>
> End result: if you actually care about HPC and vectorization, just use
> 'restrict'. If you want to make it better (because 'restrict'
> certainly isn't perfect either), extend on the concept. Don't make
> things worse for everybody else by introducing stupid language rules
> that are fundamentally based on "the compiler can generate code better
> by relying on undefined behavior".
>
> The C standards body has been much too eager to embrace "undefined behavi=
or".
>
> In original C, it was almost entirely about either hardware
> implementation issues or about "you got your pointer arithetic wrong,
> and the source code is undefined, so the result is undefined".
> Together with some (very unfortunate) order of operations and sequence
> point issues.
>
> But instead of trying to tighten that up (which *has* happened: the
> sequence point rules _have_ actually become better!) and turning the
> language into a more reliable one by making for _fewer_ undefined or
> platform-defined things, many C language features have been about
> extending on the list of undefined behaviors.
>
> The kernel basically turns all that off, as much as possible. Overflow
> isn't undefined in the kernel. Aliasing isn't undefined in the kernel.
> Things like that.
>
> And making the rules stricter makes almost no difference for code
> generation in practice. Really. The arguments for the garbage that is
> integer overflow or 'strict aliasing' in C were always just wrong.
>
> When 'integer overflow' means that you can _sometimes_ remove one
> single ALU operation in *some* loops, but the cost of it is that you
> potentially introduced some seriously subtle security bugs, I think we
> know it was the wrong thing to do.
>
>              Linus

