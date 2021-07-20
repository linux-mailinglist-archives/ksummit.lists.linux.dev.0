Return-Path: <ksummit+bounces-421-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B933CF962
	for <lists@lfdr.de>; Tue, 20 Jul 2021 14:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 4D1931C0F0F
	for <lists@lfdr.de>; Tue, 20 Jul 2021 12:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59482FB6;
	Tue, 20 Jul 2021 12:11:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D130168
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 12:11:01 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id p3so18910542ilg.8
        for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I5gQtoc7NXSvKEpNsEyz31agb+4fpYD8fN/uh4Mq3b4=;
        b=YfswUSYDKjVn7LdAaEc4RDSJfOK2555404ULO2eQJtePTzgPlVThlCYSXkqNyRPnFp
         1fzKTs/TRBEvOcUuPk3jnqSDstNVdN8raJp4jy4sFPa/mDr0JSJqQL//yd958CSOHVRF
         qCkDtit0H4L7HfOk4EDOi2LywoXs8LzKJQomoLxvXs86HbeatYLUUz1+tBeiGotoa5Fv
         O+2TRGxJq4yjnRpDoyU0sMhnusi/sWBvMs8UEMgIpkFZT5+Y4xrpJ53goXtBZRMkTAdm
         CEkiwX6Tg5x5K4KDjuAJlTxfVY1m+rsDMwTfeYdm8eMhF70FJIdJuNSmoN88dgDrWuIU
         vKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I5gQtoc7NXSvKEpNsEyz31agb+4fpYD8fN/uh4Mq3b4=;
        b=dsgBMa2jbWjiHWMRizgk0poDvfY++cd6kVmJ18jLFkqMwe5vqBPRcQWziPoLHLPjDD
         UMcIEwUV0/Y8LLdImNYs9hqlhQvUCcqH5h0BSaJ483ZS1+tRE9cj3mmeI5AsPZW5/TqQ
         H4ksiuUrJUWvwN9tmlESIe8CmrNcdC9HkSvgKNryb67/exSj1jeZXvxL7J1oJaI5lf6o
         uoBA4lRYjNvi555NTe0GZyOuD4csbNTaPdQxxCN9XZUmpNEyPNNwphjolmXJdTGy87mJ
         dE0dakkTp0enjL4c2fFsDlIJkZjjhZvKOw4YUW/SbAmVxoIh9KDFI6BnjIOTCpW27Vme
         wNdw==
X-Gm-Message-State: AOAM531UJQZCAQuDZ1OOwSRAQ3DVg2vCjp8D2+B6LfrirvCn0g6tvBw/
	0NVrxyVr+aFBjyG+WcYzFWpqUqMjYx9yj4rGw7o=
X-Google-Smtp-Source: ABdhPJzazYa2q5J0O5KddYyCLsExnKttTTsNsykiUvWj5cHY9paMOZhbhaTgpyMH1QBedsrrCTtPxYIGVLXDWbyiWec=
X-Received: by 2002:a92:b74d:: with SMTP id c13mr20286830ilm.176.1626783060413;
 Tue, 20 Jul 2021 05:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
 <YPYDb0Z19qohUjua@piout.net> <CANiq72mpCysR3B=sLBWOi4PGSZf9B5e1bXQJaGQ5MkknKfixhg@mail.gmail.com>
 <YPaZ4zTZHOQfBhOk@piout.net>
In-Reply-To: <YPaZ4zTZHOQfBhOk@piout.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jul 2021 14:10:48 +0200
Message-ID: <CANiq72kcuXYrUt4SoCmWmbbiRzuPHCmFt0es2Z67bWsAoCgGew@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 11:39 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Well, the point is exactly to have a look at that extra work.

That is fine, but you did not say so :) I interpreted you wanted to
compare the codegen quality, rather than take a look at the extra
features.

> I was under the impression that you would compile the kernel with
> overflow checks enabled, why would you disable them here?

Please see the previous point: it is not that useful to compare object
files that do different things (if checking codegen quality), thus I
removed some of the differences, including the overflow checks.

The extra work can be done in both C and Rust (or in neither), so it
is not related to the language choice.

> But do we care about very simple test cases? The pl061 driver is already
> simple and this would be an example of what to expect for most of the
> simple drivers that would get converted.

Ditto.

> This is a function call, I would not call that closer to the C

I explained this in the beginning of the message: `bindgen` cannot
convert C macros, thus we use a helper function, and since
cross-language LTO is not yet supported, LLVM cannot inline the call.

Of course, we could do inline assembly in the Rust side too, but I
would say it is best to work on cross-language LTO and see if that is
good enough before duplicating code.

We could also do it here for demonstration purposes, if you want.

> version. Can we see rust_helper_readb?

Of course:

    00000000000004d8 <rust_helper_readb>:
        4d8:    39400000    ldrb    w0, [x0]
        4dc:    d50331bf    dmb     oshld
        4e0:    92401c08    and     x8, x0, #0xff
        4e4:    ca080108    eor     x8, x8, x8
        4e8:    b5000008    cbnz    x8, 4e8 <rust_helper_readb+0x10>
        4ec:    d65f03c0    ret

As you can see, it is just the inline assembly generated by the arm64
arch macros.

Cheers,
Miguel

