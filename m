Return-Path: <ksummit+bounces-396-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id B10CE3CD702
	for <lists@lfdr.de>; Mon, 19 Jul 2021 16:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DA16B1C0F36
	for <lists@lfdr.de>; Mon, 19 Jul 2021 14:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571CD2FB6;
	Mon, 19 Jul 2021 14:43:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168BC70
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:43:55 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id v186so930453vka.1
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 07:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bDHuFf1m+i9+b73oV/Y5Nwf3Lv/igjDC49HnQ48OWvw=;
        b=B5/KFrzP7EgAa8a5tWaJgXPu/+yILnU5a9ntMT+6OYXob7aHUvdAekZgJCDxaWisgP
         TYJnNaYgcTsGoFmQ1decbPkro0lZwg9ptBqOL/7qyV3nJopy7TsQvvriwuiMIQ8MPA2F
         sjYzvNpXJjGkyjVmWWYdKrWEaM7yhenbrmy7IyRNCpKtvlwWlAwcIn9A/O6OC4tnDICy
         timqBhCsC3aFLs5+PWXM4hehBPaF+xamviR3gN/VMDesZT+a+oJxGmHwyupHvNPTUOI1
         sr0y3P3DvxinyKbvshdRNneAJszoDoYEWMbLCxhVcBVxaONnoBjJx5+fL9XjMv6T8Z1k
         lfwQ==
X-Gm-Message-State: AOAM531MHmHWuz+WNmZukaUE5PJyYzzAc0LHI99htVHaNIKMROxKdmLH
	+TPOdKek81peqv/utLC5RcRsCxFQHwx8ritq2ug=
X-Google-Smtp-Source: ABdhPJzN74MSasdcAmCm7e9mB9oE6yfsCwpzHFTxgRu/64cSX37rkV/k372cdl8lgtqcYfCN42f1zq17ZFiep2jgFLY=
X-Received: by 2002:a05:6122:a12:: with SMTP id 18mr22377379vkn.1.1626705833205;
 Mon, 19 Jul 2021 07:43:53 -0700 (PDT)
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
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com> <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jul 2021 16:43:41 +0200
Message-ID: <CAMuHMdV1M0jEMGNn4MNKULGWb-EXOBus8sQXFC5-iiySEcReRw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 4:03 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jul 19, 2021 at 3:15 PM Wedson Almeida Filho
> <wedsonaf@google.com> wrote:
> > On Mon, Jul 19, 2021 at 01:24:49PM +0100, Wedson Almeida Filho wrote:
> > > On Fri, Jul 09, 2021 at 12:13:25AM +0200, Linus Walleij wrote:
> > > > I have seen that QEMU has a piece of code for the Arm PrimeCell
> > > > PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
> > > > Note that this hardware apart from being used in all Arm reference
> > > > designs is used on ARMv4T systems that are not supported by
> > > > LLVM but only GCC, which might complicate things.
> > >
> > > Here is a working PL061 driver in Rust (converted form the C one):
> > > https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs
> >
> > I'm also attaching an html rending of the C and Rust versions side by side where
> > I try to line the definitions up to make it easier to contrast the two
> > implementations.
>
> Thanks a lot, this looks extremely helpful!

+1

For a moment I thought I found an off-by-one bug:

                for offset in 0..PL061_GPIO_NR {
                    if pending & bit(offset) != 0 {
                        router.deliver(offset.into());
                    }
                }

Turns out "a..b" in Rust does mean "range from a to b-1".
That's gonna be hard to (un)learn...

https://doc.rust-lang.org/reference/expressions/range-expr.html

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

