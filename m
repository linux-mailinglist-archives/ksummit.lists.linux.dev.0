Return-Path: <ksummit+bounces-2035-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C738A55557
	for <lists@lfdr.de>; Thu,  6 Mar 2025 19:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8569171ABE
	for <lists@lfdr.de>; Thu,  6 Mar 2025 18:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E43726D5B6;
	Thu,  6 Mar 2025 18:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djYrZM3v"
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F9D1A5BB3
	for <ksummit@lists.linux.dev>; Thu,  6 Mar 2025 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741286959; cv=none; b=Ti9R/1uREhOS/GjXG1kDy1Vw1SwJLs2tZo9aNp27Z9L99slQicyppxEt+D6tflGBKMCx/jjClivzca92GkB4W0XD/3OvMoRMW66AenQ01Tuumm17e9YVSMIqYrirtDr8hH6gVuCj/dIu9gERb7A8128QU1yxmLGrffpt23xn05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741286959; c=relaxed/simple;
	bh=0MEmcV4cxs7wXWmgVNmRKmDfW/ym2adY+O15zgxG/sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJHOQnI5QMHwduDGIOL4X+hLZh5tBUvS3ueavtZLZ0c3K6Jk5OBJdnjCnsrfH9jkmKfBbujKgVfz7bsPmFnN5pPz3TDw/gZYU2iiiF7WUQ8N/E1hFWxflttiUesjeBhRJbDbWTdI+c2gMvvOlJvBIR9peOlg5y0kppwiEJWncN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djYrZM3v; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549662705ffso1131924e87.0
        for <ksummit@lists.linux.dev>; Thu, 06 Mar 2025 10:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741286954; x=1741891754; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxzeiT2DL4xAhER3Q4JGG9lizwrNK8TNUADLYNrjhew=;
        b=djYrZM3v9w6bGTo8sJ700MLMbgmpxSJVON1nFu7DAcb07AxRZcljWVrOEdOS/0aubg
         woVjo8nC81K0oAXaeE1fKdzHeG2WScU3vP5sdhr4RFuNXwnc8HPhmzQOPDQZ/GYnE3YI
         VFbvJ05rS1dnvEZ+XoDGQZvdvnXBQv2DisH3RHImFECIRYQ/f/5gfCKe8ZMtUTjBTPq8
         VIX/vVP22TvizJnRQox6qFTnZx3rt8skanwRwWoHNmVkFUP8Z75ew1b9dXp2l0oyk6yn
         PySHicnUCKxF6XPYEQMbak0MMTB8gd/7fOu3ei1ECk96CRXrbJreXcsmKdfVLIKllT86
         S7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741286954; x=1741891754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxzeiT2DL4xAhER3Q4JGG9lizwrNK8TNUADLYNrjhew=;
        b=TnCwSz4EGcKvD++IdKnBz6ckf16U6uvqn937bH8sFXxptwjpCjPv9CQZp7unsLAajL
         goh60pqjk6/YeBzGE0G1F57+SrHVlyDwusw9USEsihcJ1islznE0q01zzP8DKJBEKab8
         KoVHG9R3FZOdV6KKdeI4aglsCHgRqlT+IR5wSMnl7EGH7Ok4sOjhhg7/s9vPPl2Gn5vU
         q9YOuLvlgvhaA+p6qmNBbmR30xcno30puTxLR35tBT92UAUnmS7Vv2K28PacyYcgvtov
         5s1ekVZqgRBeSvOds5BSnkNztm879h0Hu51Kj6HQuY0QAt8Pc8JQSb/Ohk6Rvq8IR3PV
         Y8qA==
X-Forwarded-Encrypted: i=1; AJvYcCUm2RobgsIT3ORXNs6ms+OM861Sbq0Xlm9V0SmfnQ/x7EiRqM/6+B9r7SpeR0egQi78YXyvrj6U@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9LpNliCyoZtjGhWT7T/hjLhgOcQjfGFO6JCB+lSCfnqEG/muX
	MJLZWKnZ2b20EJnstT8wm7Ps69huw7IlrvCMLSA89+MoYClKY3ArF5b2vu7l+Hmgz0ZEShqxUr6
	Pmu9NhksHg/rJ+Ko9qrCk07y4S7s=
X-Gm-Gg: ASbGncvO22pE0/HBOEUAFrsNvaElP//uG6Ir9nCSisq10ncJ9jRphTPMn2Q0WM8nwWa
	IdschOdp86m6OlzwW06nbdndg4SQgIAh2a5/A+RX06wjt0wOgS9WiRK8G4BeacnkqgeFgi8dnX6
	47POBQZ+jar1pdKyul1ivtIBAi5A==
X-Google-Smtp-Source: AGHT+IGwsY3H9pxOZeht2bK1zFUlcrDeTQGQljrtWdkclGhi6VP9xlJ4qSBubSgdO3XsRJSQA0aNmLiA8j+BFtTriPc=
X-Received: by 2002:a05:6512:2203:b0:549:9044:94ac with SMTP id
 2adb3069b0e04-54990e63107mr111290e87.23.1741286953225; Thu, 06 Mar 2025
 10:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CANiq72mdzUJocjXhPRQEEdgRXsr+TEMt99V5-9R7TjKB7Dtfaw@mail.gmail.com>
 <lz7hsnvexoywjgdor33mcjrcztxpf7lzvw3khwzd5rifetwrcf@g527ypfkbhp2>
 <780ff858-4f8e-424f-b40c-b9634407dce3@ralfj.de> <CAFJgqgRN0zwwaNttS_9qnncTDnSA-HU5EgAXFrNHoPQ7U8fUxw@mail.gmail.com>
 <f3a83d60-3506-4e20-b202-ef2ea99ef4dc@ralfj.de> <CAFJgqgR4Q=uDKNnU=2yo5zoyFOLERG+48bFuk4Dd-c+S6x+N5w@mail.gmail.com>
 <7edf8624-c9a0-4d8d-a09e-2eac55dc6fc5@ralfj.de> <CAFJgqgS-S3ZbPfYsA-eJmCXHhMrzwaKW1-G+LegKJNqqGm31UQ@mail.gmail.com>
 <d29ebda1-e6ca-455d-af07-ac1daf84a3d2@ralfj.de> <CAFJgqgQ=dJk7Jte-aaB55_CznDEnSVcy+tEh83BwmrMVvOpUgQ@mail.gmail.com>
 <651a087b-2311-4f70-a2d3-6d2136d0e849@ralfj.de> <CAFJgqgRFEvsyf9Hej-gccSdC-Ce8DbO5DgHatLoJ-aYi1_ZcyA@mail.gmail.com>
 <aab4312f-67dc-4fc8-ae5a-59b5933aa220@ralfj.de>
In-Reply-To: <aab4312f-67dc-4fc8-ae5a-59b5933aa220@ralfj.de>
From: Ventura Jack <venturajack85@gmail.com>
Date: Thu, 6 Mar 2025 11:49:00 -0700
X-Gm-Features: AQ5f1JoMsaWEaAaYE-gNfmAPtHv4qxXrhBxZmP-s2AOwf3EGKmgcjgvzt9pmjjQ
Message-ID: <CAFJgqgTWMitDGPDy-r-t3UmZvLkxtV0v9_HYXna9ZNAeThrHMw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ralf Jung <post@ralfj.de>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	torvalds@linux-foundation.org, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 11:24=E2=80=AFAM Ralf Jung <post@ralfj.de> wrote:
>
> Hi all,
>
> >>> The time crate breaking example above does not
> >>> seem nice.
> >>
> >> The time issue is like the biggest such issue we had ever, and indeed =
that did
> >> not go well. We should have given the ecosystem more time to update to=
 newer
> >> versions of the time crate, which would have largely mitigated the imp=
act of
> >> this. A mistake was made, and a *lot* of internal discussion followed =
to
> >> minimize the chance of this happening again. I hope you don't take tha=
t accident
> >> as being representative of regular Rust development.
> >
> > Was it an accident? I thought the breakage was intentional,
> > and in line with Rust's guarantees on backwards
> > compatibility, since it was related to type inference,
> > and Rust is allowed to do breaking changes for that
> > according to its guarantees as I understand it.
> > Or do you mean that it was an accident that better
> > mitigation was not done in advance, like you describe
> > with giving the ecosystem more time to update?
>
> It was an accident. We have an established process for making such change=
s while
> keeping the ecosystem impact to a minimum, but mistakes were made and so =
the
> ecosystem impact was beyond what we'd be willing to accept.
>
> The key to understand here that there's a big difference between "we do a
> breaking change but hardly anyone notices" and "we do a breaking change a=
nd
> everyone hears about it". The accident wasn't that some code broke, the a=
ccident
> was that so much code broke. As you say, we have minor breaking changes f=
airly
> regularly, and yet all the examples you presented of people being upset w=
ere
> from this one case where we screwed up. I think that shows that generally=
, the
> process works: we can do minor breaking changes without disrupting the
> ecosystem, and we can generally predict pretty well whether a change will
> disrupt the ecosystem. (In this case, we actually got the prediction and =
it was
> right! It predicted significant ecosystem breakage. But then diffusion of
> responsibility happened and nobody acted on that data.)
>
> And yes, *technically* that change was permitted as there's an exception =
in the
> stability RFC for such type ambiguity changes. However, we're not trying =
to be
> "technically right", we're trying to do the right thing for the ecosystem=
, and
> the way this went, we clearly didn't do the right thing. If we had just w=
aited
> another 3 or 4 Rust releases before rolling out this change, the impact w=
ould
> have been a lot smaller, and you likely would never have heard about this=
.
>
> (I'm saying "we" here since I am, to an extent, representing the Rust pro=
ject in
> this discussion. I can't actually speak for the Rust project, so these op=
inions
> are my own. I also was not involved in any part of the "time" debacle.)

These comments claim that other things went wrong as well as
I understand it.

    https://internals.rust-lang.org/t/type-inference-breakage-in-1-80-has-n=
ot-been-handled-well/21374

       "There has been no public communication about this.
        There were no future-incompat warnings. The affected
        crates weren't yanked. There wasn't even a blog post
        announcing the problem ahead of time and urging users
        to update the affected dependency. Even the 1.80 release
        announcement didn't say a word about the incompatibility
        with one of the most used Rust crates."

    https://internals.rust-lang.org/t/type-inference-breakage-in-1-80-has-n=
ot-been-handled-well/21374/9

        "Why yank?

        These crates no longer work on any supported Rust version
        (which is 1.80, because the Rust project doesn't support past
        versions). They're permanently defunct.

        It makes Cargo alert users of the affected versions that
        there's a problem with them.

        It prevents new users from locking to the broken versions.

        and if yanking of them seems like a too drastic measure
        or done too soon, then breaking them was also done too
        hard too soon."

And the time crate issue happened less than a year ago.

One thing that confuses me is that a previous issue, said to
be similar to the time crate issue, was rejected in 2020, and
then some were considering in 2024 to do that one as well
despite it possibly having similar breakage.

    https://internals.rust-lang.org/t/type-inference-breakage-in-1-80-has-n=
ot-been-handled-well/21374/19

        "On the other hand, @dtolnay, who objected to
        impl AsRef for Cow<'_, str> on the grounds of
        type inference breakage, announced that the libs
        team explictly decided to break time's type inference,
        which is inconsistent. But if this was deliberate and
        deemed a good outcome, perhaps that AsRef impl
        should be reconsidered, after all?"

    https://github.com/rust-lang/rust/pull/73390

There have been other issues as well. I searched through.

    https://github.com/rust-lang/rust/issues?q=3Dlabel%3A%22regression-from=
-stable-to-stable%22%20sort%3Acomments-desc%20

"Stable to stable regression", and a number of issues show up.
Most of these do not seem to be intentional breakage, to be fair.
Some of the issues that are relatively more recent, as in from
2020 and later, include.

    https://github.com/rust-lang/rust/issues/89195

        "Compilation appears to loop indefinitely"

    https://github.com/tokio-rs/axum/issues/200#issuecomment-948888360

        "I ran into the same problem of extremely slow
        compile times on 1.56, both sondr3/cv-aas and
        sondr3/web take forever to compile."

This one started as a nightly regression, but was changed
to "stable to stable regression".

    https://github.com/rust-lang/rust/issues/89601

        "nightly-2021-09-03: Compiler hang in project with a
        lot of axum crate routes"

This one is from 2023, still open, though it may have been
solved or mitigated later for some cases.

    https://github.com/rust-lang/rust/issues/115283

        "Upgrade from 1.71 to 1.72 has made compilation
        time of my async-heavy actix server 350 times
        slower (from under 5s to 30 minutes, on a 32GB M1
        Max CPU)."

This one is from 2020, still open, though with mitigation
and fixes for some cases as I understand it. 35 thumbs up.

    https://github.com/rust-lang/rust/issues/75992

        "I upgraded from 1.45 to 1.46 today and a crate
        I'm working on seems to hang forever while compiling."

Some of the issues may be related to holes in the
type system, and therefore may be fundamentally
difficult to fix. I can imagine that there might be
some examples that are similar for C++ projects,
but C++ has a less advanced type system than Rust,
with no advanced solver, so I would guess that there
are fewer such examples for C++. And a project
can switch to a different C++ compiler. Hopefully
gccrs will be ready in the near future such that
Rust projects can do similar switching. Though as I
understand it, a lot of the type checking
implementation will be shared between rustc and
gccrs. For C, the language should be so simple that
these kinds of issues are very rare or never occurs.

> > Another concern I have is with Rust editions. It is
> > a well defined way of having language "versions",
> > and it does have automated conversion tools,
> > and Rust libraries choose themselves which
> > edition of Rust that they are using, independent
> > of the version of the compiler.
> >
> > However, there are still some significant changes
> > to the language between editions, and that means
> > that to determine the correctness of Rust code, you
> > must know which edition it is written for.
>
> There exist corner cases where that is true, yes. They are quite rare. Co=
ngrats
> on finding one! But you hardly ever see such examples in practice. As abo=
ve,
> it's important to think of these things quantitatively, not qualitatively=
.

What do you mean "congrats"?

I think that one should consider both "quantitatively"
and also "qualitatively".

I do not know how rare they are. One can go through the changes
in the Rust editions guide and look at them. A few more I found.
I should stress that these issues have automated upgrading or
lints for them. For some of the Rust editions changes, there is
no automated upgrade tools, only lint tools.

    https://doc.rust-lang.org/edition-guide/rust-2021/disjoint-capture-in-c=
losures.html

        "Changing the variables captured by a closure
        can cause programs to change behavior or to stop
        compiling in two cases:

        changes to drop order, or when destructors run (details);

        changes to which traits a closure implements (details)."

    https://doc.rust-lang.org/edition-guide/rust-2024/never-type-fallback.h=
tml

        "In some cases your code might depend on the
        fallback type being (), so this can cause compilation
        errors or changes in behavior."

I am not sure whether this has changed behavior
between editions.

    https://doc.rust-lang.org/edition-guide/rust-2024/rpit-lifetime-capture=
.html

        "Without this use<> bound, in Rust 2024, the
        opaque type would capture the 'a lifetime
        parameter. By adding this bound, the migration
        lint preserves the existing semantics."

As far as I can tell, there are more changes in the
Rust 2024 edition than in the previous editions.
Will future Rust editions, like Rust edition 2027,
have even more changes, including more with
semantic changes?

One way to avoid some of the issues with having
to understand and keep in mind the semantic
differences between Rust editions, might be
to always upgrade a Rust project to the most
recent Rust edition, before attempting to do
maintenance or development on that project.
But upgrading to the next Rust edition might
be a fair bit of work in some cases, and require
understanding the semantic differences
between editions in some cases. Especially when
macros are involved, as I understand it. The
migration guides often have a number of steps
involved, and the migration may sometimes be
so complex that the migration is done gradually.
This guide said that upgrading from 2021 to
2024 was not a lot of work for a specific project
as I understand it, but it was still done gradually.

    https://codeandbitters.com/rust-2024-upgrade/

Learning materials and documentation might also
need to be updated.

I really hope that Rust edition 2027 will have fewer,
not more, semantic changes. Rust edition 2024
seems to me to have had more semantic changes
compared to previous editions.

If the Linux kernel had 1 million LOC of Rust, and
it was desired to upgrade to a new edition, how
might that look like? Or, would the kernel just let
different Rust codebases have different editions?
Rust does enable Rust crates with different
editions to interact, as I understand it, but
at the very least, one would have to be careful
with remembering what edition one is working
in, and what the semantics are for that edition.

Does upgrading to a new edition potentially
require understanding a specific project,
or can it always be done without knowing or
understanding the specific codebase?
There are not always automated tools available
for upgrading, sometimes only lints are
available, as I understand it. Would upgrading
a Linux kernel driver written in Rust to a new
edition require understanding that driver?
If yes, it might be easier to let drivers stay
on older Rust editions in some cases.

Best, VJ.

