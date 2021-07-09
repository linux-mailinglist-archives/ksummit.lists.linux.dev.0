Return-Path: <ksummit+bounces-367-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5B3C1FFC
	for <lists@lfdr.de>; Fri,  9 Jul 2021 09:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 74E351C0F17
	for <lists@lfdr.de>; Fri,  9 Jul 2021 07:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939312F80;
	Fri,  9 Jul 2021 07:24:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAEF70
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 07:24:29 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id x20so1973317vkd.5
        for <ksummit@lists.linux.dev>; Fri, 09 Jul 2021 00:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tCqEXFc24XvKiFkOa/fiWYH4DXDnsx7wiFTJWpA4rKI=;
        b=H8cuodBlZ2FXS4YssEWaz4u93myVh6hKFlvtMFuc6iWxFYsdZR7HFuVi4Stc5G4x3H
         5nX1PklUlf16zcR0Eyk7HEPjVK2ZCUzxGxR2uk6m+sGBZL4M1m41CogKSx78gwCcqwPt
         ndMaQDoYcmcrzKL9v5ce1uH0kA12/85oNO+bLSkc2Nd0FETddlxwus8wxxT3mEZq4fOi
         QnbfmH5IZjVeGpfYmWb/9cd836HZ70PmmoF7IY1u0brGljkTCgmQlODFpbZb6+fOKDWZ
         ceGwyhPIG8yZxUNuvY+2f1dQECBIh6gThgkTaa5B/m3QkqovLCuRmtQnujVsqgphFA9A
         lQLQ==
X-Gm-Message-State: AOAM5319S9FOdFUT9j9Jdsa+gqyw8nDt7AaP8Ai/HTLQn9xmX1gN0w+4
	whKwiR5qJMr/pL2r2O/5aTYKYFIWHs/rFntsvVE=
X-Google-Smtp-Source: ABdhPJzaU3neZsjAhS7cWSCC1o70unv3wmChdBVMX3/5A9qT8J51Jrwi7Kv5qaEnjJut5BNeb//U+yH5eyrgGtV9a04=
X-Received: by 2002:a1f:1a41:: with SMTP id a62mr30561501vka.5.1625815468163;
 Fri, 09 Jul 2021 00:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com> <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
In-Reply-To: <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jul 2021 09:24:16 +0200
Message-ID: <CAMuHMdWvXsBCyJcKjOQUKyQtwcnW0PPW+xYUA-eujbxCbWht4A@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Fri, Jul 9, 2021 at 12:13 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Jul 8, 2021 at 10:34 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> > On Thu, Jul 8, 2021 at 9:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > With my GPIO maintainer hat on I'd say a GPIO driver would be quite
> > > interesting to look at. We are two GPIO maintainers and Bartosz is
> > > doing the heavy lifting for the moment so I'm connecting Bartosz to this
> > > discussion. (Now he has to read through the whole backlog,
> > > sorry Bart!)
> > >
> > > This is not to say I promise we will merge it or so, but I just generically
> > > like new approaches to old problems so I like this whole thing
> > > overall, despite being critical to some details.
> > >
> > > I am also trying to learn Rust. Baby steps.
> >
> > Thanks a lot for this offer Linus.
> >
> > Do you have a particular one in mind? Ideally, it would be one that
> > has QEMU support or a test suite of some kind, or at least one that
> > you can easily test for us etc.
>
> I don't use QEMU for GPIO development, we are so close to the
> real hardware that it's often not appropriate. We have a testing
> module but that is not a real world driver and would not meet the
> expectations set here of creating real hardware drivers.
>
> I have seen that QEMU has a piece of code for the Arm PrimeCell
> PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
> Note that this hardware apart from being used in all Arm reference
> designs is used on ARMv4T systems that are not supported by
> LLVM but only GCC, which might complicate things.

Still, the PL061 emulation may be incomplete.  It also doesn't do that
much yet, i.e. you cannot use it to blink a virtual LED.

> I am a bit oldschool in that I think real hardware is awesome to test
> on. GPIO drivers exist in many shapes and sizes, some are directly
> memory-mapped to hardware registers, some are I2C or SPI.
> Most Raspberry Pis and Beagle Boards have them, albeit the
> on-chip GPIOs are often also pin controllers which complicates
> things. Expanders on I2C and SPI will be simpler. Maybe look
> for an I2C or SPI expander that has no existing kernel support and
> implement it in Rust?

That still requires an I2C or SPI bus, which may not be that easy
to find for people who don't have embedded boards on their desk...
Do you know of any unsupported expanders that connect to USB?
Something like an MCP2210 dev board[1], but that one is mainly
intended for SPI, although some pins can be used as GPIOs.  There
is no upstream driver yet, but there is an out-of-tree driver and a
FOSDEM presentation.

[1] E.g. https://www.digikey.be/product-detail/en/microchip-technology/ADM00419/ADM00419-ND/3046570

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

