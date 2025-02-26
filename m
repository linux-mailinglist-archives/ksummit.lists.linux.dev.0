Return-Path: <ksummit+bounces-1944-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971DEA468C3
	for <lists@lfdr.de>; Wed, 26 Feb 2025 19:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 526FF7A5114
	for <lists@lfdr.de>; Wed, 26 Feb 2025 17:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A2122B5AC;
	Wed, 26 Feb 2025 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ctty3G6C"
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E92A8C1
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592804; cv=none; b=NlVU1Si/QKmNBIdVjsUUeOdxu9Eld1hDsm7Iuqi9nc74L0vFPp0chDNTpvXG1G38ZSJKz0J2bgiI0mN2/f5xRaXwsdPvlL5FoCMz7oQcgi5VbpO7/YslKdq3yp//TFOwF/rnInNrnIH8aDZku6vLOP0gEx4GKk1x4jkhVa1blcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592804; c=relaxed/simple;
	bh=OcHOvGQB/t3qwwXBib/RirE/KtrFLYIGCcrfx/cQcj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xe3rQ5u6n5LOZZYpeyRgeR3ydqiKBEWVcG7Vt6oQKWOsyNswLJPW102JxVhj8EzK938tWEGYCBpec84XWulCXB15h7vu3xf/5Pv8xqeYnfe+0yDbSEOF74r/1GWuET/Xxc/RqnBHgK29HpHTxTkc6w8YmNLtM4TLlT/6tZzgwHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ctty3G6C; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaecf50578eso1414763766b.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 10:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740592800; x=1741197600; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K2pF5VtPLvizqkjhJdWgYLaGhWqd4Ef/Qdw8QfNuuuk=;
        b=ctty3G6CxsSq/5DbstN9VK6WhAz55UhnnNejBAPbpYYgVQq3YWwA+IeIAy5E6HNJSi
         goMl0HFz0YWuETIDUQOJ9svLS62N7PFsJLz269wcT24nDnHSLCgAuCdWWLrVRQpQd7Ek
         WN/7CwCXVpw9/Six01No3du6tJM4n2dpyurkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592800; x=1741197600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2pF5VtPLvizqkjhJdWgYLaGhWqd4Ef/Qdw8QfNuuuk=;
        b=vbXqbxXwC+UeJwkMq6Sb7DbJ9BMFwNUe+IYMvBI6iCCfzw6mB4kwDE0b9OPy7QUyWm
         XOpBYRkcmLNeamnewScEaJIwhiKFB9r3E4CY9AukWlE2lN9EWDy38qZNGI9h0q3DRp9a
         aFgmoshqjhselGHUuYJrYgedRTmpj8CqsrA0Ohgzqcsw85W/FWgqUmvM4je9WnHR52v+
         K5HM6c0bN0wG5QI4oO6HDSF61bZd0Sb0O1okP/6AGv/QKvUKxmbG+QYuUa9HoETwsMKK
         IQ/IP1JcK1jFTKYxd93hQ7Ohz51krGA/14auOxEdgsm/ITGxt3rdzlkC6SoAUQN1rJZF
         C/kw==
X-Forwarded-Encrypted: i=1; AJvYcCWCN2/LbAbu7+D46MGSc3BqxJADqPss7tBgOZoedgvkFQjgQ6/MWc2+EOeFd6aGGrgnf9bih2/h@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd9QC9C1t629OZ2jcTj8+m7jz1y/ChDso7zMKj1uFh63xQfX6C
	5Q2WbR8MR5etkLQFObMhAJoZs3m+rxrYHCO9zAekIarKo+4JFWNjdIxJZV9Mqurttb8Q9kF043s
	OGjE=
X-Gm-Gg: ASbGncuyQcH1x6l8tXnUsQxttsORLSjS+7hP+hHI6QE3rl3HkjT50jpAKPimL152zu3
	9U5UDOXp2PPAm5injS6ztYk9AB2fA0D9WMuZRYS3+NpB36gxYLMg/ura+9CYygkQvCBMPlCqom1
	9csAbjZtucJ5iaxtcHfekyWM2Cbz7QVuttDIfzBrZi4dXsVRl38pA7wziPFq6Rrr6NMCo/JMpFi
	FLwqUYGs/Ppu5PkJJ8/+mtQqRlEOjw/E0zeMNY/KqX9bIN/BDHcnxmyCnkIKaSlz1I26W5VuvZv
	eDWySw+VjRn6FN2Xdyb/7DC8nJOSWvUGnp20bcS4djC3BnNfncMXJC22qAMxlyWtnDxtlAUdQxL
	V
X-Google-Smtp-Source: AGHT+IHIqA/JyvOGkgzQUWJNR4BM6tDOwaTAOPIOC7LOw6ny276VlEr6Rza4dH6Z5PilkIdRj7V0oA==
X-Received: by 2002:a17:906:32cb:b0:abf:2bb:13e5 with SMTP id a640c23a62f3a-abf02bb14cdmr146422066b.50.1740592799653;
        Wed, 26 Feb 2025 09:59:59 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010d58sm368336866b.88.2025.02.26.09.59.58
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:59:58 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaecf50578eso1414758366b.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 09:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5EOnhro84Zqn7oxXYss2PgIlo4/JoPpjrADuKsvCQzAgcvfYUVN2ioNXiMWZtqyot8OYXi5ET@lists.linux.dev
X-Received: by 2002:a17:906:308e:b0:ab6:511d:8908 with SMTP id
 a640c23a62f3a-abc0de19516mr1960252766b.40.1740592798401; Wed, 26 Feb 2025
 09:59:58 -0800 (PST)
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
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com> <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de>
In-Reply-To: <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 09:59:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
X-Gm-Features: AQ5f1JqHaF8iBdXsZjiLGeP-Wg76QW9xhjWAhICZNldwiZDCjoY2SKOw5r5wwWM
Message-ID: <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ralf Jung <post@ralfj.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Ventura Jack <venturajack85@gmail.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 05:54, Ralf Jung <post@ralfj.de> wrote:
>
>      The only approach we know that we can actually
> pull through systematically (in the sense of "at least in principle, we can
> formally prove this correct") is to define the "visible behavior" of the source
> program, the "visible behavior" of the generated assembly, and promise that they
> are the same.

That's literally what I ask for with that "naive" code generation, you
just stated it much better.

I think some of the C standards problems came from the fact that at
some point the standards people decided that the only way to specify
the language was from a high-level language _syntax_ standpoint.

Which is odd, because a lot of the original C semantics came from
basically a "this is how the result works". It's where a lot of the
historical C architecture-defined (and undefined) details come from:
things like how integer division rounding happens, how shifts bigger
than the word size are undefined, etc. But most tellingly, it's how
"volatile" was defined.

I suspect that what happened is that the C++ people hated the volatile
definition *so* much (because of how they changed what an "access"
means), that they then poisoned the C standards body against
specifying behavior in terms of how the code *acts*, and made all
subsequent C standards rules be about some much more abstract
higher-level model that could not ever talk about actual code
generation, only about syntax.

And that was a fundamental shift, and not a good one.

It caused basically insurmountable problems for the memory model
descriptions. Paul McKenney tried to introduce the RCU memory model
requirements into the C memory model discussion, and it was entirely
impossible. You can't describe memory models in terms of types and
syntax abstractions. You *have* to talk about what it means for the
actual code generation.

The reason? The standards people wanted to describe the memory model
not at a "this is what the program does" level, but at the "this is
the type system and the syntactic rules" level. So the RCU accesses
had to be defined in terms of the type system, but the actual language
rules for the RCU accesses are about how the data is then used after
the load.

(We have various memory model documentation in
tools/memory-model/Documentation and that goes into the RCU rules in
*much* more detail, but simplified and much shortened: a
"rcu_dereference()" could be seen as a much weaker form of
"load_acquire": it's a barrier only to accesses that are
data-dependencies, and if you turn a data dependency into a control
dependency you have to then add specific barriers.

When a variable access is no longer about "this loads this value from
memory", but is something much more high-level, trying to describe
that is complete chaos. Plus the description gets to be so abstract
that nobody understands it - neither the user of the language nor the
person implementing the compiler.

So I am personally - after having seen that complete failure as a
by-stander - 100% convinced that the semantics of a language *should*
be defined in terms of behavior, not in terms of syntax and types.
Sure, you have to describe the syntax and type system *too*, but then
you use those to explain the behavior and use the behavior to explain
what the allowable optimizations are.

> So the Rust compiler promises nothing about the shape of the assembly
> you will get, only about its "visible" behavior

Oh, absolutely. That should be the basic rule of optimization: you can
do anything AT ALL, as long as the visible behavior is the same.

> (and which exact memory access occurs when is generally
> not considered "visible").

.. but this really has to be part of it. It's obviously part of it
when there might be aliases, but it's also part of it when there is
_any_ question about threading and/or memory ordering.

And just as an example: threading fundamentally introduces a notion of
"aliasing" because different *threads* can access the same location
concurrently. And that actually has real effects that a good language
absolutely needs to deal with, even when there is absolutely *no*
memory ordering or locking in the source code.

For example, it means that you cannot ever widen stores unless you
know that the data you are touching is thread-local. Because the bytes
*next* to you may not be things that you control.

It also *should* mean that a language must never *ever* rematerialize
memory accesses (again, unless thread-local).

Seriously - I consider memory access rematerialization a huge bug, and
both a security and correctness issue. I think it should be expressly
forbidden in *any* language that claims to be reliablel.
Rematerialization of memory accesses is a bug, and is *hugely* visible
in the end result. It introduces active security issues and makes
TOCTOU (Time-of-check to time-of-use) a much bigger problem than it
needs to be.

So memory accesses need to be part of the "visible" rules.

I claim that C got that right with "volatile". What C got wrong was to
move away from that concept, and _only_ have "volatile" defined in
those terms. Because "volatile" on its own is not very good (and that
"not very good" has nothing to do with the mess that C++ made of it).

              Linus

