Return-Path: <ksummit+bounces-1892-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9A2A448EC
	for <lists@lfdr.de>; Tue, 25 Feb 2025 18:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0ED8877C5
	for <lists@lfdr.de>; Tue, 25 Feb 2025 17:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D5F1A7262;
	Tue, 25 Feb 2025 17:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tW+l2X9p"
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E819340B
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740504983; cv=none; b=i8bGLbGc2jo3MPPo3+2XFt+GhMg3UVTZhlycrMeO2qf4apJQYArJ/wVfCOiwgSurD9gxXEBSb7cCsZZRmnGVAJFlGiTOXCwC60wWLtyiNwAR2zRlzrEfS5PzU18cpoEef7b9N6ybpLNAy9OquW4uAQANnHr+sAtBYBKvqCyxh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740504983; c=relaxed/simple;
	bh=gOl/36Ytrp1zDSvgkiGrHn22n77JQLii4H7PNe1Rj8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GM+1L8W0qxatG4tj1t1Msr5Kb5i0798PEJyxj6fUAJkLLFkgQ+5OPBIEYX7Kx2/82xSevit42on9h+KQEdYx967rq0E/f6K2Hg5x26T0k1VruCxdtme2pyN8ihFSpW4M192XKs/6cwYWeaeF7vrYP3CLQVPQfQDwJ/SQMg3TpXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tW+l2X9p; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so57527315e9.3
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 09:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740504979; x=1741109779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jb7TDT/aVvgdtxg6kdFOwwgVqkaL6U92QY48yAXPGLY=;
        b=tW+l2X9pZREsIga9MTCBl3WtWCb4zJXdOUOQ2XjISzjdrBAn/WLJOMEHxTczxOETV8
         QweKjR8k80UEl4QBxRZ5O2B63cCRyZLoZy6OoBmzADz7gKvYr1F8NENuQ4+XkOV9giAQ
         eHClWB8gPhxWzy9Jt6ELkXFzrO8ur36ZpxKo60ModFuuqXhGVjuUvzLUUqRZcxp2SU7O
         +JPDWs5BZFDEa2M6W9sTcb8VCRErdDn2dglePsheyV0BNCkcdizde/AkkG2q92Q3iLWh
         zKTsLuTJ4HSe9xVPL5JpDvJCn2QFLzM5IkofPdVB/siy2/BJ2yaWfzFRvMDf7zY5J+in
         tkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740504979; x=1741109779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jb7TDT/aVvgdtxg6kdFOwwgVqkaL6U92QY48yAXPGLY=;
        b=xBrNaClFV5adcEavNr/aGFFhHsPfle7jwTTe85XDJ+rIQuo1Vvqp7L6OqKuiatJQ5q
         hD2AxVaF6ooQWZBxLJNELlWVgXnCCuGRcpErpnxVi0Vi+KadxzV41bRRZf+hdht7Sjn9
         xu3nw0ZVSTuSxC6Jb91OeJrqoxOf5iPlJQ2uqypCGoIp/hcIxJ7BqTbCPuvBkcoo9vl9
         I7Dkjn+3mtxbh/zsmBDQs4llTadQma5mYR8GHGQKifI7jlCAn3x9moDODQJ2w7P0ELd7
         /JAnwVwhyCyGoFYvsHGgsns+1CpCfFU09bPK+JvyWq1rKz2rWVP4v1oomgAV5O2Mmb6N
         /eYg==
X-Forwarded-Encrypted: i=1; AJvYcCUfCFxkUa2D7iJvnmJuvaQPJ2JkuxraklvJRGo2aHflq/n1up+I6yVuU0cxFCrNyVj8FU44owzO@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf18wdKHm6F8RBSmF3JRKUzz9/on8CaaFgw05y/FT3VDhwmsC8
	7u92sENL/7jBo/5FCrg6NRBNGI4cDMRH9IXt1FTlHUK10JR64YOZkJu7ii7ZVXYcR7F4aCfTABr
	ww00VFjLe7APlhihJOna92EQ2XijSV8YbmWft
X-Gm-Gg: ASbGnctv5iRICHyEIiy2zpdFF56noMx2PlFDy4eQejx+/4lPpboBhIbGIBLFTHj47Cn
	OzUye9/C0D4iUvGUVbeiG+wgX+FHF1YJbsoGNTwp2K1QfNv5q3zVwwyc9X3qDFy2I7TFIL0E7aZ
	hSZ4oQAe7WGrhdQO31yp1Of2KuagZXcPUgi9UTpg==
X-Google-Smtp-Source: AGHT+IEKeLbYDcWbkUCjv9WAAKpj5i9urIXFAIil9bTEvJFu6/6yC9kyIte/8TvLmHWUW8IDBAxxehZuyfy5A6xga1I=
X-Received: by 2002:a05:600c:1d8c:b0:439:98ca:e39b with SMTP id
 5b1f17b1804b1-43ab44b58c3mr31936975e9.29.1740504979330; Tue, 25 Feb 2025
 09:36:19 -0800 (PST)
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
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com> <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
In-Reply-To: <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 18:36:07 +0100
X-Gm-Features: AQ5f1Jrk5Ircg0d1PeSghOYiJs5Q14TTxoym4eosxDvw1DHTRuGD27YpgvptUqQ
Message-ID: <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ventura Jack <venturajack85@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 6:21=E2=80=AFPM Ventura Jack <venturajack85@gmail.c=
om> wrote:
>
> On Tue, Feb 25, 2025 at 9:12=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Sun, Feb 23, 2025 at 4:30=E2=80=AFPM Ventura Jack <venturajack85@gma=
il.com> wrote:
> > >
> > > Just to be clear and avoid confusion, I would
> > > like to clarify some aspects of aliasing.
> > > In case that you do not already know about this,
> > > I suspect that you may find it very valuable.
> > >
> > > I am not an expert at Rust, so for any Rust experts
> > > out there, please feel free to point out any errors
> > > or mistakes that I make in the following.
> > >
> > > The Rustonomicon is (as I gather) the semi-official
> > > documentation site for unsafe Rust.
> > >
> > > Aliasing in C and Rust:
> > >
> > > C "strict aliasing":
> > > - Is not a keyword.
> > > - Based on "type compatibility".
> > > - Is turned off by default in the kernel by using
> > >     a compiler flag.
> > >
> > > C "restrict":
> > > - Is a keyword, applied to pointers.
> > > - Is opt-in to a kind of aliasing.
> > > - Is seldom used in practice, since many find
> > >     it difficult to use correctly and avoid
> > >     undefined behavior.
> > >
> > > Rust aliasing:
> > > - Is not a keyword.
> > > - Applies to certain pointer kinds in Rust, namely
> > >     Rust "references".
> > >     Rust pointer kinds:
> > >     https://doc.rust-lang.org/reference/types/pointer.html
> > > - Aliasing in Rust is not opt-in or opt-out,
> > >     it is always on.
> > >     https://doc.rust-lang.org/nomicon/aliasing.html
> > > - Rust has not defined its aliasing model.
> > >     https://doc.rust-lang.org/nomicon/references.html
> > >         "Unfortunately, Rust hasn't actually
> > >         defined its aliasing model.
> > >         While we wait for the Rust devs to specify
> > >         the semantics of their language, let's use
> > >         the next section to discuss what aliasing is
> > >         in general, and why it matters."
> > >     There is active experimental research on
> > >     defining the aliasing model, including tree borrows
> > >     and stacked borrows.
> > > - The aliasing model not being defined makes
> > >     it harder to reason about and work with
> > >     unsafe Rust, and therefore harder to avoid
> > >     undefined behavior/memory safety bugs.
> >
> > I think all of this worrying about Rust not having defined its
> > aliasing model is way overblown. Ultimately, the status quo is that
> > each unsafe operation that has to do with aliasing falls into one of
> > three categories:
> >
> > * This is definitely allowed.
> > * This is definitely UB.
> > * We don't know whether we want to allow this yet.
> >
> > The full aliasing model that they want would eliminate the third
> > category. But for practical purposes you just stay within the first
> > subset and you will be happy.
> >
> > Alice
>
> Is there a specification for aliasing that defines your first bullet
> point, that people can read and use, as a kind of partial
> specification? Or maybe a subset of your first bullet point, as a
> conservative partial specification? I am guessing that stacked
> borrows or tree borrows might be useful for such a purpose.
> But I do not know whether either of stacked borrows or tree
> borrows have only false positives, only false negatives, or both.

In general I would say read the standard library docs. But I don't
know of a single resource with everything in one place.

Stacked borrows and tree borrows are attempts at creating a full model
that puts everything in the two first categories. They are not
conservative partial specifications.

> For Rust documentation, I have heard of the official
> documentation websites at
>
>     https://doc.rust-lang.org/book/
>     https://doc.rust-lang.org/nomicon/
>
> And various blogs, forums and research papers.
>
> If there is no such conservative partial specification for
> aliasing yet, I wonder if such a conservative partial
> specification could be made with relative ease, especially if
> it is very conservative, at least in its first draft. Though there
> is currently no specification of the Rust language and just
> one major compiler.
>
> I know that Java defines an additional conservative reasoning
> model for its memory model that is easier to reason about
> than the full memory model, namely happens-before
> relationship. That conservative reasoning model is taught in
> official Java documentation and in books.

On the topic of conservative partial specifications, I like the blog
post "Tower of weakenings" from back when the strict provenance APIs
were started, which I will share together with a quote from it:

> Instead, we should have a tower of Memory Models, with the ones at the to=
p being =E2=80=9Cwhat users should think about and try to write their code =
against=E2=80=9D. As you descend the tower, the memory models become increa=
singly complex or vague but critically always more permissive than the ones=
 above it. At the bottom of the tower is =E2=80=9Cwhatever the compiler act=
ually does=E2=80=9D (and arguably =E2=80=9Cwhatever the hardware actually d=
oes=E2=80=9D in the basement, if you care about that).
> https://faultlore.com/blah/tower-of-weakenings/

You can also read the docs for the ptr module:
https://doc.rust-lang.org/stable/std/ptr/index.html

> On the topic of difficulty, even if there was a full specification,
> it might still be difficult to work with aliasing in unsafe Rust.
> For C "restrict", I assume that "restrict" is fully specified, and
> C developers still typically avoid "restrict". And for unsafe
> Rust, the Rust community helpfully encourages people to
> avoid unsafe Rust when possible due to its difficulty.

This I will not object to :)

Alice

