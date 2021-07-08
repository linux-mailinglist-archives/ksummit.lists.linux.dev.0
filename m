Return-Path: <ksummit+bounces-339-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE63C14B8
	for <lists@lfdr.de>; Thu,  8 Jul 2021 15:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id AC0AF3E107F
	for <lists@lfdr.de>; Thu,  8 Jul 2021 13:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EDB2F80;
	Thu,  8 Jul 2021 13:55:45 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B7168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 13:55:44 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id j12so6689547ils.5
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9nP9+Zwb1XkKQdEHIApwHYEc4+QM8EjAVWoz4VT0ycU=;
        b=KBN3zckfiO6RknkuOuPOJWHlFT2cmXmpkpdNJiieCONU4yIQoca7g5oy8wENRDMCGR
         YzXfDqbulWmsrcZrlVewZefX4P4cW5hnB3aZIp1bOOBhpuwcF+B+qsaMnt36qfw/F8Io
         Jk9y/Tg7PNF8OYincWkcg5fA8YKgEMR5fmLG5Oh8ixUKimoL2jKcDk4MaWVs7o3cLaE6
         90XQGd2wPL1QMfGUUCsXK96P2oNiv9est6BzzF8h37xfWcMDjZtYtNkmnU3haUCQiuVP
         VyLxgmB+gkNevr8jPHUP42EfqMTKA3z4lts3STX6yKI6YNKfA4SEfFXMBU3/7qpsiv2+
         AUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9nP9+Zwb1XkKQdEHIApwHYEc4+QM8EjAVWoz4VT0ycU=;
        b=nj0yP6io0nLH1RmlrOd9v8hBN6+qWdkofE38PfARBnS/4+dPLa8Khx4jsh7g5uOrLt
         IhL+WalyArw6wvydSg3J7Y0+sJ+1Mw3KZtpbxLsLaEt1hwbfJCGlr5sVr7ooqgAnCzRW
         IM2+sP70wufenE4sygIv9PhazMP1Qpvs3kxG8C1BZpxMhqjuS5/fRBRiXv9kpq2O0Us6
         KJGCPlhDAI7WkWiE+EOCr2HqJUOsQmbielrWwCX81Koh9HdRBmLory2h11qWMtBEhD4v
         jG4J7Ry0JBoLi5G6Ws//5OpSsYzuwNTpw9s6lWRam/7KEA9EIHSJ2aCn2ujATA3MkigI
         uZjQ==
X-Gm-Message-State: AOAM532rNzvZ2b+tniLd7Kj+FMawEXgtXQ5l2y3AcMIOl+/skzOLALal
	qQXldsUvBIKKSsj5+brZ7+5Vc/CZK13++am3ymo=
X-Google-Smtp-Source: ABdhPJy1tb3PFngvSJwFqdg6UOrjmyqr/hLI2ayUn93idPF2tjbG1E0YcPg/yW+wY7qbaph0d3erFLeVVaCtVuir0Ws=
X-Received: by 2002:a05:6e02:ea2:: with SMTP id u2mr21789094ilj.247.1625752543560;
 Thu, 08 Jul 2021 06:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com>
In-Reply-To: <YOaW/pR0na5N9GiT@kroah.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 15:55:31 +0200
Message-ID: <CANiq72kEfZ1NxSNrcDpavkq256YsiZSLkV_EABPZPQAE=VkaVg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Greg KH <greg@kroah.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

    On Thu, Jul 8, 2021 at 8:11 AM Greg KH <greg@kroah.com> wrote:
>
> Thanks for the detailed explainations, it seems rust can "get away" with
> some things with regards to reference counts that the kernel can not.
> Userspace has it easy, but note that now that rust is not in userspace,
> dealing with multiple cpus/threads is going to be interesting for the
> language.

Regarding parallelism, userspace deals with the same problems, so I do
not see fundamental issues coming up there. The language was designed
with parallelism in mind and is a definite improvement over both C and
C++ in that regard.

> So, along those lines, how are you going to tie rust's reference count
> logic in with the kernel's reference count logic?  How are you going to

Let me clarify that Rust does not have "reference count logic" in the
sense of some compiler magic (nor a runtime) that somehow "knows" that
there is a reference count going on.

The confusion may come from similarly worded concepts: the
lifetimes/borrowing rules are orthogonal to reference-counting
semantics.

For instance, when Wedson was explaining the lifetime associated to a
reference when e.g. passed into a function:

    fn f(x: &X) {
        ...
    }

That `&X` (a "Rust reference") is unrelated to the "reference" in
"reference-counting semantics".

In fact, Rust's lifetime/reference/borrowing rules apply to all code.
For instance:

    let mut i = 42;

    let r1 = &mut i;
    let r2 = &mut i;

    f(r1, r2)

This code has two "Rust references", but there are no
"reference-counted semantics" at all here, nor any refcount involved.
Yet Rust prevents this code from compiling because you are attempting
to create two mutable "Rust references" that alias the same object.

> handle dentries, inodes, kobjects, devices and the like?  That's the
> real question that I don't seem to see anyone even starting to answer
> just yet.

Those cases can be handled, one way or another. We will try to have
something more concrete as soon as possible.

Having said that, if people is discussing how to improve the C model
anyway (i.e. the "cdev/devm_* issues" thread), it could be nice --
longer-term -- if we could also take the chance to discuss how to come
up with a model that suites Rust too. This could lead to simpler code,
more ergonomic abstractions and/or less `unsafe` code.

Cheers,
Miguel

