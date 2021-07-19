Return-Path: <ksummit+bounces-391-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A23CD626
	for <lists@lfdr.de>; Mon, 19 Jul 2021 15:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 91EFA3E10C7
	for <lists@lfdr.de>; Mon, 19 Jul 2021 13:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005652FB3;
	Mon, 19 Jul 2021 13:53:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C0872
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 13:53:44 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id e20so26419852ljn.8
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m0FBHeKpOAleJaJTuXlo5uM/tGkX8N4iU7xmY0bgcLs=;
        b=VTz4MxV9bVMhf3Z0rgn+lk13eE1cH410EdAEP5109hDiJfoksYw3yfToeVg7faSE3q
         2XbN8XN4H602Ddgmw5bYarcipER5dH4NPAbln4Bdqi3CnLbuz1dKk4RWuihqX2zajQI+
         MTZ610WkhWGlbXGzwn1W+W+TGjV8VFJmS2tCkgTBKFyGTHw2cZ49DySOy1D0hIWcirIC
         CpItLxTZrAq3Hutiv/O1vPVIO61c3oTVqhwEbdnCSltJcqWCfB0QfNFYl1jqKuGRU7cD
         gAS8V7Va9y7Q8k3SiH7MXZyyxLKDnwNcpoHn9emq2M9GNtZzXPMAmK5fbXhH2yD1P3Zf
         V9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m0FBHeKpOAleJaJTuXlo5uM/tGkX8N4iU7xmY0bgcLs=;
        b=Mrd3erM/scS1B89Ih8osgL54wau6YhSKD+ncMRkBRANgFj6KzssG4yCGynuWJcHS6H
         Sr3o9QMe+2nzj/bZVP8b1fIeFvpjmnVRTQP3znZKRfa3Pr+KYwZBodOMeE72bl8Z9dUs
         CDqW8VmtsnZJMTSThigJu0ftXUKj/Ut5UiByk0+P15yV+qKG6sZTH45x3q7ph+Kl+30d
         Q/v6uPEX1eYiqLjlUzxM+filKA+GoqENtMb/w0vCMe8Zg5qfL2Oh+b9A1NgTISNwvPTm
         WZwjLQn1YR61OUBmgYogXOa8XFxD3ZVEup0ev65K7nKJQ0xRvLzu/vb0zGn0CS/vognm
         lhPA==
X-Gm-Message-State: AOAM532jvfIKKkrvgyguV80SskleSDzH6AuB5UrjPEMsG2BVi89eN0ib
	cMNsjGelRjuQM4Wfmt8lgQNazg8vXfPkPWGGNs9onQ==
X-Google-Smtp-Source: ABdhPJwu4ECBvbKUu1C/niiWJ8JwcZVxxdo4i3MN6Oibndcy7TgwlrCjjajbALEZF38wyRYizv7DrnpzXpTnWOh5Bms=
X-Received: by 2002:a05:651c:169a:: with SMTP id bd26mr22477236ljb.368.1626702822701;
 Mon, 19 Jul 2021 06:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com> <YPVvEZgcP1LMGjcy@google.com>
In-Reply-To: <YPVvEZgcP1LMGjcy@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Jul 2021 15:53:31 +0200
Message-ID: <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 2:24 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:

> Here is a working PL061 driver in Rust (converted form the C one):
> https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs

My first impression is that this looks very good compared to other Rust
code I have seen, and it looks very intuitive and maintainable.

use kernel::{
    amba, bit, declare_id_table, device, gpio,
    io_mem::IoMem,
    irq::{self, IrqData, LockedIrqData},
    power,
    prelude::*,
    sync::{IrqDisableSpinLock, Ref},
};

I think people want to see the code inside these classes as well,
can we browse it? Especially the gpio class in my case,
because i want to know what happens when you do
impl gpio::Chip for PL061Device { ... } I suppose it is just
a C wrapper to the struct gpio_chip?

I've got questions but they are mostly due to my lack of understanding
of Rust idioms I think. For example:

    fn unmask(data: &Ref<DeviceData>, irq_data: &IrqData) {
        let mask = bit(irq_data.hwirq() % u64::from(PL061_GPIO_NR));
        let _guard = data.lock();
        if let Some(pl061) = data.resources() {
            let gpioie = pl061.base.readb(GPIOIE) | mask;
            let _ = pl061.base.try_writeb(gpioie, GPIOIE);
        }
    }

I suppose _guard will be unlocked automatically when we leave
the function? It's a bit like with Make, it is necessary to know
what is implicit.

Then the "_" variable is some kind of idiom for a throw-away
variable I guess. Can it be named "foo" or is the "_" just specially
magic?

It looks like stuff we can even maintain superficially without
being super versed in Rust. Simple things can be altered
without knowing exactly how the language works.

> (I tested iton QEMU through the sysfs interface and also gpio-keys as QEMU
> uses one of the PL061 pins as the power button.)

Fair enough.

> 1. State created on `probe` is ref-counted.
> 2. Hardware resources (device mem and irq in this case) are "revocable".
> 3. On `remove`, we automatically revoke access to hardware resources, then free
> them.

This is neat. Just generally speaking I like the looks of this
from a driver subsystem point of view. Unless the code in the
Kernel::classes is horrible that is.

Yours,
Linus Walleij

