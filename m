Return-Path: <ksummit+bounces-253-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 190263BDC95
	for <lists@lfdr.de>; Tue,  6 Jul 2021 20:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A10903E10EA
	for <lists@lfdr.de>; Tue,  6 Jul 2021 18:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA012F80;
	Tue,  6 Jul 2021 18:00:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637DC72
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 18:00:02 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id r26so22258766lfp.2
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zd23+6Zi/aU7xu6mLwmlpUAnV3tbC6soKdtP1CwNfDE=;
        b=sxlAjlWxNKo6iIk4zibGV1q8fqZMy61xQKPwx8l3WT1MTA7jdZVwXABBhMKAb28UKG
         dLSLIumXn0ZDbKggVe+iGfaA8jmdvQMeltlFdkoX8qSwCmMOW/y+4vEXVYxgeMhmyZZC
         jCT9/I52fhFJrme2Eg4nmS5SIYdbWYsm+IjV5gUCpOd1CTIGjwid3umqekMr03Nnouoj
         CaUybnWHk6uelCWDOHBSnfmqzH6Uv7D5d07MbrdagC86KlToaKVbW+gjAwBnr2Wp5Cpq
         g+PZ1mKPkPV0A8B0CM9HLKjwHsLPGGykWo2QtWV5E/Mj4UXwcdA4u0HTIUbPa9vjnT2s
         wCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zd23+6Zi/aU7xu6mLwmlpUAnV3tbC6soKdtP1CwNfDE=;
        b=LyS8WKZk6VUD4/L4cA5ZhYN+spyyuOCLVtewn7Qb0lkakBul2QYSYFYRrYvSY4igBP
         V5QkKM/Cs8bWfhrFA8EEU1m5GTo+yJ3aN3brp1rDVS8kaEuJ/quT3Jr37bOIqCzLUE2e
         j50PW2JugQpnFK6NXBwL4u01Hy808mVPPYewhrcz4GwwcTDYXwpe+jQ9MD4JRdy1t4rt
         r/6ZjHWgDtz63Onh0/ZMklVQ2JY8AlRvFK4NovbtZHKo5UWan5J8mWOA9ywvL47vPBLp
         avQ9P3i/aSU66/JHCMIhFt97IceMKc8Hh4iKNjEElf8L+0F2MF85pxvryeJcYWm0A25e
         WxbQ==
X-Gm-Message-State: AOAM530eR7YeGhR7JdunVxoQh0pjuzsf0NE9HlWfFyB6Rxe0smBNuXn3
	PCydjf4Fu71VQVqMd2DEitUDMB9xTquQvXwMyr7ftw==
X-Google-Smtp-Source: ABdhPJywlK4O45mp455/aKf2VjKSEVRsXT+3mnlZ38LyZ3sIFQaNo4Q5JzDggbi8DWBuXguFnr01GC2pC36L4Mxkeok=
X-Received: by 2002:a19:c141:: with SMTP id r62mr15318089lff.157.1625594400367;
 Tue, 06 Jul 2021 11:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CAMuHMdU5FOdSj+-d38t3BuPrZsYF0YT-Ff1efYLS3W7yNN_Y6Q@mail.gmail.com>
In-Reply-To: <CAMuHMdU5FOdSj+-d38t3BuPrZsYF0YT-Ff1efYLS3W7yNN_Y6Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Jul 2021 19:59:49 +0200
Message-ID: <CACRpkdbr9orKFfDmwZDz1wPHZvUfSaDVJtJB1uz+2Ho=QZFGiQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Leon Romanovsky <leon@kernel.org>, "a. Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 12:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Jul 6, 2021 at 11:56 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > I.e. you have to compile some pieces of the kernel written in
> > Rust to even get to a working kernel.
>
> So this would break all architectures not yet supported by Rust?

I brought this up for discussion with Miguel et al and it turns out
the project to develop a GCC front-end for Rust is now well under
way and there is already a frankencompiler using LLVM first
and then feeding that into GCC IIUC.

I.e. support for m68k is on the way.

Yours,
Linus Walleij

