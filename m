Return-Path: <ksummit+bounces-260-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5F13BDDDA
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 4D0413E10A9
	for <lists@lfdr.de>; Tue,  6 Jul 2021 19:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE342F80;
	Tue,  6 Jul 2021 19:11:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F56670
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 19:11:17 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id h3so21844436ilc.9
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 12:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vGHOigRSbdPfAEL/S9ADbloej343+md9Z5vhE1U9YN4=;
        b=sfn5tWUjzUOy1z6yZjGzdXHj/d/mW2A4clZmB5CpvmiSh5+mFp/sclZPfpjCpcbsSu
         KI8/GIKcJUs65+ztEDImXihv3a+prkVH0+ORsnxQTNcGNVNmShdz0NrWnzKpV4E8zHAQ
         Ni2weSeAqnEjmY9DPT2Iynws2WFmT1uATSIfV6EF1WGSLWrB/dmIv2B51GArGsF56AU1
         g6cGbWMObTASPFa/Q9zmhWHJhE46bozfoGXsFKCrVHCInf4FxnoEMnNJmdzlJ5bx+Nh4
         BT5xsEmgVWQL/MTzN4rCjZ8D7O/8husPsO4qAaeNO6KYwL7aGDunroSuTQLu5WvO4Kxj
         OmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vGHOigRSbdPfAEL/S9ADbloej343+md9Z5vhE1U9YN4=;
        b=hDRjHt/kPZLz3GanGq5TiyBrra569IMCXs5tiOH3VgDiJf11cwaa3mfHt6UXYHr2jh
         25z09SnyzWIqj23uJSQ9pepoGvh/vlYvdzjW4RB2DBjngtus3TbeqMJXWFmBUwbF1bTB
         DzH69n/w+dxt6N6yqkE9u8MJg5jclpjw3gZ4tLF5QhFfJCcztxKpoCVr4VJ+Qj88t5lM
         e3YYl43kG4TB5l5NdCZwetPk4/HkmTzmp4r1Qee5RMFRBHXEiuA56a+SJZGNwkyCiUHq
         yW6h1QApJoi2js3m+poTEdyh9PL5p3Jhzls40ClRLVWPSQCtHOJFwDYWCd5UdWZyCJJ4
         /gNA==
X-Gm-Message-State: AOAM5313/BE2dSLFM3XUzB3GMQaCy5TkdjzVD02HeGR3ayuODw3Fafrx
	SDclg7NT9htHDE1vDrGUct6efe/cyGb+LWkuPF8=
X-Google-Smtp-Source: ABdhPJxIT0JajKZJL+N8FPVbGosAjsEHHxpQGgkK9vpyzla2PnoRme3PXLmZl33cxtOpi23uanvtr5ddM1ztr6NrZJI=
X-Received: by 2002:a05:6e02:b46:: with SMTP id f6mr16098909ilu.94.1625598676753;
 Tue, 06 Jul 2021 12:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com> <CACRpkdatK-U16oefmGoov7u_obekVP4m1fT=6joCVpT00Sm09A@mail.gmail.com>
In-Reply-To: <CACRpkdatK-U16oefmGoov7u_obekVP4m1fT=6joCVpT00Sm09A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 21:11:05 +0200
Message-ID: <CANiq72mi-oGAgsws5SpbVyp+NOPXp_6NYq-oWLKe_UD95POGVA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 8:27 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This reasoning assumes that Rust is in the "leafs" of the kernel, if
> such a thing even exists, and device drivers have been mentioned.
>
> If we want to *write* a subsystem in Rust then of course it will
> go the other way: Rust need to expose APIs to C. And I assume
> the grand vision is that after that Rust will eat Linux, one piece
> at a time. If it proves better than C, that is.

In general, I would avoid exposing Rust subsystems to C.

It is possible, of course, and it gives you the advantages of Rust in
the *implementation* of the subsystem. However, by having to expose a
C API, you would be losing most of the advantages of the richer type
system, plus the guarantees that Rust bring as a language for the
consumers of the subsystem.

In any case, I agree it is a good idea to make things as smooth as
possible for interop in both directions. In that regard, for instance,
I presented a `[[safe]]` attribute in the C committee, and while it
did not make it, I hope to get things like that into Clang and GCC.

> The leaf nodes imagined as a starting point is some device
> driver subsystem where individual drivers for that subsystem
> can be written or rewritten in Rust, correct?
>
> And I asked very pointed questions as to whether device drivers
> is really a good place to start.
>
> If the whole rationale with doing device drivers first is strategic,
> not necessarily bringing any benefits to that device driver
> subsystem but rather serving as a testing ground and guinea
> pig, then that strategy needs to be explicit and understood
> by everyone. So while we understand that Rust as
> all these $UPSIDES doing device drivers first is purely
> strategic, correct? I think the ability to back out the whole
> thing if it wasn't working out was mentioned too?

So let me try to clarify the whole "leaf modules" thing.

It is possible to rewrite code in Rust and to also write Rust code and
expose it to C. It is also possible to write non-leaf modules in Rust.

However, the key is that the moment you go back from Rust to C, you
would be losing some of the advantages of Rust, such as the rich type
system, and the ability to write safe code (since C does not have it).

So, the current design is having Rust as a consumer of C APIs,
transform those into Rust APIs, and then Rust modules consume those
APIs. That is:

  C APIs --> Rust abstractions --> Rust modules

Now, nothing prevents you to write a Rust subsystem from scratch --
and in fact, that would be ideal. But if you want to make that
subsystem available back to C, then you are losing part of the appeal
(for the C modules only, of course).

That is why we say it is best for "leaf modules", in the sense that it
is Rust code that uses Rust APIs only. Whether those APIs come from a
new Rust-only subsystem or from some abstractions based on C APIs is
not very important.

Cheers,
Miguel

