Return-Path: <ksummit+bounces-248-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DE3BDA32
	for <lists@lfdr.de>; Tue,  6 Jul 2021 17:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 056491C0EDC
	for <lists@lfdr.de>; Tue,  6 Jul 2021 15:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5542F80;
	Tue,  6 Jul 2021 15:29:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B903168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 15:29:18 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id b5so21096347ilc.12
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7/ajafbJFqGZQ8QZZDKWfNxIhbgrTb+AtSY5INjeRCY=;
        b=uNFZGRcfjIvVknl0LtPBKUCu+xKzxm19GiGpF+R4wjVQsdaNMSLgs6/yEmXKl/gp+S
         Fe9d38dgJPkR6rMPin2miwxB9WhNBlaD6xOZwIkyEflyzu6j34Lv+VgLFkiKVJk4P4Vk
         ng5OOj+us8UsjQBl5ApkkxAmTfn4xfPWiUrbA02HXGEh9DU9mMF9jmCLslNE8+6PPeeQ
         gS+9HaBxNDp9MZ4n4dC67p8Mhd93LEyEZMCusKd78q2Yr/9EhRSLmvBNUGktnXuF68iI
         j0IUNVAcfdcvTJoLYBgVUkTmZKtaqM1B4Esy3GMXxDb+ATamUbt2wYR4Xx4JKTWvwDZg
         YOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7/ajafbJFqGZQ8QZZDKWfNxIhbgrTb+AtSY5INjeRCY=;
        b=CKPla1Su1AUrd5MeRQv7WVbEnnt9CKHThPcB0aj2JmytDHjGHQrTWZEId2rY+Usul6
         BrWTM4GwDhca4ZAF8iwNa+UX6z+6hLPqzwuNHbcb4oco+avKkiNWqInGKMv6YUFVdCn4
         EEXlsHzQmTTgrBRGByy5v3Ce/8/AvUge4lEqKy95m9SWoLseZa1Cf3pDIM+vXUXFp7Dt
         omrUGcPMuDUKjwudtLuzNCYZgRFvt+HDSfWK9UYwywWztxYBlY/RdGWs9DPa4WMgvEBv
         zXXzKeqsZ/S0tjCSvASftDY1NhG+WQveMV/SH0Is3mOrdArB1sPxwMTnOUf4hLIC44/l
         QEeA==
X-Gm-Message-State: AOAM531UqgGDGSkEOfjCFIz6T3ElomvV7cgxSBNiFMdGUzthojOHzuiQ
	QV2fXDxMpb8OnQk9dA7fKJpbkJSAYO1cFdEw5Z0=
X-Google-Smtp-Source: ABdhPJwfDGZMWtg8Xg6pNhwGORGg4H89xcdZggt+vas5wSo8XuPlvclNdmGy/rxWv97L+ZTNlZCqJ2u7AoioVndYBOw=
X-Received: by 2002:a05:6e02:20ed:: with SMTP id q13mr14977198ilv.176.1625585357316;
 Tue, 06 Jul 2021 08:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CANiq72nCDKQAJaPOjR167FWnrCcqnvovuHEx58Zmur6su897Qw@mail.gmail.com>
 <YORvE7Oe8fiJkjTh@unreal>
In-Reply-To: <YORvE7Oe8fiJkjTh@unreal>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 17:29:06 +0200
Message-ID: <CANiq72ncTdSCyGXfOQ0ob4yRHx-nUJjAcLS6Zqj3hMDwKHtOeA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Leon Romanovsky <leon@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 4:56 PM Leon Romanovsky <leon@kernel.org> wrote:
>
> In such case, I see no easy way to do refactoring. Many (at least for me)
> refactoring changes are not simple sed commands, but more comprehensive
> deep dive into the code which requires to see the actual API usage.

(Also answering to Laurent's)

Yes, of course, that is why we should avoid having Rust abstraction a
subsystem that have maintainers that actually want to have Rust
drivers, i.e. see my reply to James:

"""
Initially, our plan is to work with
subsystem maintainers that do want to start providing a Rust API for
their subsystem. Then they can maintain drivers using such API.

We definitely do not want to have drivers written for a particular
subsystem if nobody is able to review (or even write) the Rust
abstractions for that particular subsystem.
"""

> Even for the simple cases, where someone changes return value type, he/she
> will need to update the logic in the driver. How will abstractions help us here?
>
> IMHO, even worse, people will be less willing to change in-kernel APIs
> because of such abstractions.

The abstractions help because you would only need to change things
there, vs. in all the Rust drivers.

Of course, if it is such a heavy change that new concepts themselves
appear/disappear, then that does not help -- but that is why we should
avoid abstracting what nobody will maintain (see the previous point
for that).

> My point is that we have a customers who run upstream/stable/distro kernels
> on old systems which we need to support. The default CONFIG_RUST=y in .config
> is nice, but most users won't get it or enable it.
>
> So we will need CONFIG_RUST=n to make sure that code for the customers
> work and we will need CONFIG_RUST=y to make sure that at least
> compilation passes.

Ah, I think I see where the confusion comes from. The idea is that if
we are to have Rust as an actual second language, then `CONFIG_RUST`
is enabled by default. Or, putting it another way, `CONFIG_RUST` will
go away at some point.

IIRC this is what Linus wanted -- for the moment the option is there
because we thought it would give a bit of freedom to folks in case
they consider it too experimental for their purposes, plus it allowed
us to allow Rust-enabled kernels built with GCC (which are a hack).

But we can definitely take it out already if kernel folks prefer to
reduce the matrix already (in which case, we will just remove
GCC-built kernels support or put *that* under a different flag).

> Thanks for the summary, I just disagree with the punch line:
>  "the advantages of using Rust outweighs the cost".

That's fair, but you said you didn't know what the advantages are at
the top of your message, so you cannot really tell if they outweigh or
not the cost ;P

Cheers,
Miguel

