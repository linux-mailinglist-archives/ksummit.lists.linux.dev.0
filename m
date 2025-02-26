Return-Path: <ksummit+bounces-1913-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BDAA45F8A
	for <lists@lfdr.de>; Wed, 26 Feb 2025 13:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDA423AAE6B
	for <lists@lfdr.de>; Wed, 26 Feb 2025 12:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DEC85931;
	Wed, 26 Feb 2025 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfgfpvEH"
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E6FDF49
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573385; cv=none; b=YGgwqO0T7mt8HZgsgDyHrvjMHo1/jMvkknuhEYfQBgpN882Xbcg4PdZG5wQhDLE0yOvET+oEPN+u0BExyZGFWOmC6bm2MT5B8uP+k9hJSWRufmfx+omJZp9DI1SdXV9BoM3cQkOSz6aQxgSG7IVOaEuiihLYPizi7LOXfWNM6D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573385; c=relaxed/simple;
	bh=92n6rT14mjdgXOWURdvvchLgYP2Hh6EuZZsyVMzB8RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ck4SJeH0vJiI5bfWW8VNHtW+9EfnL4X2CSQNV/Rx6NA2P7wUeeHQILSYwDo3Q70JLZONdy4QklJSweIIbqmCt1KZ+rNydvdKfDQENJ5sXziGVQOglgRY9kNFNVTlTDP5W2vYEqU7ynQp66ZiSUnrh3rV+0jIzboRr3a92szpk5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfgfpvEH; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54838cd334cso5818548e87.1
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740573382; x=1741178182; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pl76ZFXvVQ3QruCcPmuehiBJsl1isJD7C32/jCs5+z4=;
        b=GfgfpvEHTo6yLpYKdYe5jD9I5z8vZjSXzsEKK2wYhLV5LAHkE1LzC8eziPHZTECVID
         LxtawMUWHr+qqByIoSZOXAPnnBE9832TgTTa3B1m2fyWd7UpsXOpiGBz6cpJyDgAGIXQ
         lYzI9wZMMzAtjCNJEthCuPJXRXCcDU0Cwivbxi20aNLtovZt4F5REYI1UwtA+wIAPdow
         s2H/zVZnjq8QgsGvR45nQKWFL1MWDwjObTqJ9n5lpKVaRz0rkkZb6H7ZaFELd+1QpN2t
         GZr2HEC/jDU9AQnyhfu6rsWU481X6lKEdIoezAAwrcvzyKclEx1Tiv1CeW12PfeiclKK
         5zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573382; x=1741178182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pl76ZFXvVQ3QruCcPmuehiBJsl1isJD7C32/jCs5+z4=;
        b=nOCatZShBGNaaE04vHh8heZyBQjFyTr4XDcVQg96VCoDqt1OiUZ8A9er9KH1keCF18
         Qz+DMYrt6IRPi+ix0DjFLEP1Xm0bh4B+XKrXZoNsv9u9mRMFbx29V7DEhZ+6XygzEPHn
         Am41bOWWz5SWnM5FvKi6OXyoXb8F5Zas18ibyNxdzI0HRVtTodiDDNP3C3zM5PzRooX9
         cKt48UvTp3brP4g23F0vWnlegPuL+o2FNPvZj2mf3JbdLFnh7UVD1urQVXn7joGpydsW
         aPlFKO7ZZXk/CyXI77TI4f4u9cYGLAIICFItIer9mP90kZ0RkNXDTKVHeQbCE3jELYzO
         f7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYagLvgHlM9K+2K/ndUbkv4bV3euPInM91OuvXlwjWLoe0AV6/dKfflbge3uTiLb4Lz5wo5G58@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqij9dhtZ7R41D+XQeTW2lJLMwuWEDydhLGx/pmamcc3n95nNx
	YjQ01vleCMP+/V6yHG89rJ++8ZykhqnRGAOAfFgcvhkB7SB6LW8QY4XdUUi7GC7fiKIBbpAu0sv
	4HKThxYrpGwymWI2jMSJukPtM9O4=
X-Gm-Gg: ASbGncsaK5yLonFf0BZ07BvlA/Cb3xAwCDAooGgPn3UM5ym2RytHbg2mrGqi8yjoPzl
	wR7+eUqcgke0nM8nw5l883N3h2ObCoqc05wYaqtTAIEBmI9WqNYfH7Inx3ez3JSPzi9R+YH4dk6
	6B+gX1prQV
X-Google-Smtp-Source: AGHT+IH0rUEMkuNYGrN+VaabcQKgeiFDW/1Q+Wg/7vyv4L732RZag7tnG3cvm26ZxScyYimB04hFJve/xhsEN/vM1Hw=
X-Received: by 2002:a05:6512:1388:b0:545:2df3:9a89 with SMTP id
 2adb3069b0e04-5493c57028amr2538872e87.17.1740573381534; Wed, 26 Feb 2025
 04:36:21 -0800 (PST)
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
 <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com> <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
In-Reply-To: <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Wed, 26 Feb 2025 05:36:06 -0700
X-Gm-Features: AQ5f1JqcHl_yN2WeO9fnXdb96QHwrkLMtXGfv8iqsyjzF8H3THrMvYs0azYkCMk
Message-ID: <CAFJgqgRxfTVxrWja=ZW=mTj1ShPE5s-atAqxzMOq5poajMh=4A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Alice Ryhl <aliceryhl@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 10:36=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Tue, Feb 25, 2025 at 6:21=E2=80=AFPM Ventura Jack <venturajack85@gmail=
.com> wrote:
> > Is there a specification for aliasing that defines your first bullet
> > point, that people can read and use, as a kind of partial
> > specification? Or maybe a subset of your first bullet point, as a
> > conservative partial specification? I am guessing that stacked
> > borrows or tree borrows might be useful for such a purpose.
> > But I do not know whether either of stacked borrows or tree
> > borrows have only false positives, only false negatives, or both.
>
> In general I would say read the standard library docs. But I don't
> know of a single resource with everything in one place.
>
> Stacked borrows and tree borrows are attempts at creating a full model
> that puts everything in the two first categories. They are not
> conservative partial specifications.

Tree borrows is, as far as I can tell, the successor to stacked borrows.

    https://perso.crans.org/vanille/treebor/
        "Tree Borrows is a proposed alternative to Stacked Borrows that
        fulfills the same role: to analyse the execution of Rust code at
        runtime and define the precise requirements of the aliasing
        constraints."

In a preprint paper, both stacked borrows and tree burrows are as
far as I can tell described as having false positives.

    https://perso.crans.org/vanille/treebor/aux/preprint.pdf
        "This overcomes the aforementioned limitations: our evaluation
        on the 30 000 most widely used Rust crates shows that Tree
        Borrows rejects 54% fewer test cases than Stacked Borrows does."

That paper also refers specifically to LLVM.

    https://perso.crans.org/vanille/treebor/aux/preprint.pdf
        "Tree Borrows (like Stacked Borrows) was designed with this in
        mind, so that a Rust program that complies with the rules of Tree
        Borrows should translate into an LLVM IR program that satisfies
        all the assumptions implied by noalias."

Are you sure that both stacked borrows and tree borrows are
meant to be full models with no false positives and false negatives,
and no uncertainty, if I understand you correctly? It should be
noted that they are both works in progress.

MIRI is also used a lot like a sanitizer, and that means that MIRI
cannot in general ensure that a program has no undefined
behavior/memory safety bugs, only at most that a given test run
did not violate the model. So if the test runs do not cover all
possible runs, UB may still hide. MIRI is still very good, though,
as it has caught a lot of undefined behavior/memory safety bugs,
and potential bugs, in the Rust standard library and other Rust
code.

    https://github.com/rust-lang/miri#bugs-found-by-miri

> > For Rust documentation, I have heard of the official
> > documentation websites at
> >
> >     https://doc.rust-lang.org/book/
> >     https://doc.rust-lang.org/nomicon/
> >
> > And various blogs, forums and research papers.
> >
> > If there is no such conservative partial specification for
> > aliasing yet, I wonder if such a conservative partial
> > specification could be made with relative ease, especially if
> > it is very conservative, at least in its first draft. Though there
> > is currently no specification of the Rust language and just
> > one major compiler.
> >
> > I know that Java defines an additional conservative reasoning
> > model for its memory model that is easier to reason about
> > than the full memory model, namely happens-before
> > relationship. That conservative reasoning model is taught in
> > official Java documentation and in books.
>
> On the topic of conservative partial specifications, I like the blog
> post "Tower of weakenings" from back when the strict provenance APIs
> were started, which I will share together with a quote from it:
>
> > Instead, we should have a tower of Memory Models, with the ones at the =
top being =E2=80=9Cwhat users should think about and try to write their cod=
e against=E2=80=9D. As you descend the tower, the memory models become incr=
easingly complex or vague but critically always more permissive than the on=
es above it. At the bottom of the tower is =E2=80=9Cwhatever the compiler a=
ctually does=E2=80=9D (and arguably =E2=80=9Cwhatever the hardware actually=
 does=E2=80=9D in the basement, if you care about that).
> > https://faultlore.com/blah/tower-of-weakenings/
>
> You can also read the docs for the ptr module:
> https://doc.rust-lang.org/stable/std/ptr/index.html

That latter link refers through the undefined behavior page to.

    https://doc.rust-lang.org/stable/reference/behavior-considered-undefine=
d.html
    http://llvm.org/docs/LangRef.html#pointer-aliasing-rules

The aliasing rules being tied to a specific compiler backend,
instead of a specification, might make it harder for other
Rust compilers, like gccrs, to implement the same behavior for
compiled programs, as what the sole major Rust compiler,
rustc, has of behavior for compiled programs.

> > On the topic of difficulty, even if there was a full specification,
> > it might still be difficult to work with aliasing in unsafe Rust.
> > For C "restrict", I assume that "restrict" is fully specified, and
> > C developers still typically avoid "restrict". And for unsafe
> > Rust, the Rust community helpfully encourages people to
> > avoid unsafe Rust when possible due to its difficulty.
>
> This I will not object to :)
>
> Alice

On the topic of difficulty and the aliasing rules not being
specified, some have claimed that the aliasing rules for
Rust not being fully specified makes unsafe Rust harder.

    https://chadaustin.me/2024/10/intrusive-linked-list-in-rust/
        "The aliasing rules in Rust are not fully defined. That=E2=80=99s
        part of what makes this hard. You have to write code
        assuming the most pessimal aliasing model."

        "Note: This may have been a MIRI bug or the rules have
        since been relaxed, because I can no longer reproduce
        as of nightly-2024-06-12. Here=E2=80=99s where the memory
        model and aliasing rules not being defined caused some
        pain: when MIRI fails, it=E2=80=99s unclear whether it=E2=80=99s my=
 fault or
        not. For example, given the &mut was immediately
        turned into a pointer, does the &mut reference still exist?
        There are multiple valid interpretations of the rules."

I am also skeptical of the apparent reliance on MIRI in the
blog post and by some other Rust developers, since
MiRI according to its own documentation cannot catch
everything. It is better not to rely on a sanitizer for trying
to figure out the correctness of a program. Sanitizers are
useful for purposes like mitigation and debugging, not
necessarily for determining correctness.

Best, VJ.

