Return-Path: <ksummit+bounces-404-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F23CEA2D
	for <lists@lfdr.de>; Mon, 19 Jul 2021 19:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 528463E1199
	for <lists@lfdr.de>; Mon, 19 Jul 2021 17:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2912FB6;
	Mon, 19 Jul 2021 17:55:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A0173
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 17:55:07 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id p186so20956905iod.13
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 10:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ZjMO+W4wuo+djUT9uwnrCr5tvNqbyTwVgrD5Xsdzs8=;
        b=fmZvaL6sHrwkDXPqqmYX28Pz8ngsOvsV7Ko50ioRL7WiaBazi2DfOKxPklq48fOv1H
         xabbtaeUc2RiobhCnfrQ7mPzL+DGqi4bilNwaTMfsqRKrZE+L1No5W/BSuGIIKiNIU/S
         rGLLnthr72A+uDbaWKfb651DEPsdp3YWhpziyKAYV9QC2GZWs1JJ0HU9WT1BeLo2b/Hx
         vV2fkYeqs5EihUW5Ewbz84YUUogz9bUoEvxNsjE77VzpoB0rOXrLOmvQtoACTHZCEJ/g
         baK/FhpeY53iIFPrFKMyfLuMBgguMFHC09mE1hfuYpLjeOIDDsJz4M/5fCdmQadM5IAP
         wVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ZjMO+W4wuo+djUT9uwnrCr5tvNqbyTwVgrD5Xsdzs8=;
        b=YYTd3IiwJ9W6McUkXHYGK8onrjobKtRLnrU9ZK54gDaFR0qSUuWQf1EcebJXNXreeU
         2XQI+K7Ug0Gz+evJ55GNJqLFYFrR/Y7ZOGAomWrXjSe/8prhZjZUPK7TWQfByyyceVRY
         E7jbsyGsJ5CIVwOY93U7Dggo7FF8APs8G/RZGUbYteQO8imS1uEV/cx4TuuH/8BUH4zt
         TN8Ar481dM6kfXWA2/X+0Gkfm+zBKaBY4On6MaweJR/0G0XusQYtH/Qk66BaYwMW8X22
         gSUPxGQATW2ilpf1cASe6UYCMQT/FzW28PDTHXi/ZB5MXclCK50SOrveDnobPfdbgDFM
         Xk2g==
X-Gm-Message-State: AOAM531nBLUtCePJSo83dRnULiy3x+5lQPU2pTHsTqsw8PaJ1Ys1cFUD
	pkWra/GJZlEyxno7NYCyb6Jb1Q//d90eyAnIUYs=
X-Google-Smtp-Source: ABdhPJx39JplDuGf6LMG1lIRryK4Xkdt7SWvnXkv7G90X6HU5SExYRljlLlqyhbOO4t2a0re/AM8IKAD1cPPStplO1s=
X-Received: by 2002:a02:2b21:: with SMTP id h33mr22379567jaa.31.1626717306958;
 Mon, 19 Jul 2021 10:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOX+N1D7AqmrY+Oa@google.com> <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
 <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com> <CANiq72ntf=Jf=pRNbHEAt27D744Ew9+-EgqoRt+mXYxB5ohD4w@mail.gmail.com>
In-Reply-To: <CANiq72ntf=Jf=pRNbHEAt27D744Ew9+-EgqoRt+mXYxB5ohD4w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jul 2021 19:54:55 +0200
Message-ID: <CANiq72kpLY=OfEiDYp6seSS4Dbcn2Af6sVhhYYBE1=-bxWpGSw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 7:45 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> However, the offset given is not a compile-time constant here, thus
> the runtime-check is used. Or we could provide an `unsafe fn` which
> means the caller would be responsible to guarantee the precondition.
> But see next point.

To clarify, by offset here I mean the actual offset passed to the
function, i.e. the second parameter `woffset` (notice the `w`), not
`offset` in the value parameter:

    pl061.base.try_writeb((value as u8) << offset, woffset)?;

> (Actually, from a quick look, there are 3 or so `try_*()` that could
> be using the non-`try_*()` version)

e.g.

    let _ = pl061.base.try_writeb(gpioie, GPIOIE);

could be:

    pl061.base.writeb(gpioie, GPIOIE);

because `GPIOIE` is known at compile-time (vs. the ones with `woffset`).

Cheers,
Miguel

