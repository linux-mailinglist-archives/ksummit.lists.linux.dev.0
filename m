Return-Path: <ksummit+bounces-394-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA573CD6FA
	for <lists@lfdr.de>; Mon, 19 Jul 2021 16:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id EC1EE1C0EFD
	for <lists@lfdr.de>; Mon, 19 Jul 2021 14:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A832FB3;
	Mon, 19 Jul 2021 14:43:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676D70
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:42:59 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f10-20020a05600c4e8ab029023e8d74d693so143166wmq.3
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f96vBhxYNpZKiuOgKNWsuSo+EFN1/eLcYAPe+Uj2OuI=;
        b=LC77w1+gSmruV73Pi8v+wpiJrkz5m5WIYbiYJe5kuWdqwc1X1vDDpbycjnviaRuMFp
         BVFPOtcHsEz0Lch/xeD7VaqqUxT7l1NaWIz9S5jsUZP0HiqNOdaEhGaRFINI3TTCjvKz
         ZFbCDYnoAX15WMEygkmsLG5rHI75kD1ql7bOSloLCsOEewBnG7UqS31clgJ5t/yIdlhn
         +M5u7UiC2rVBr+QStNG60uZMUUMrwZtCWoAsz7m3A+XWjwm6OoZQ/BSX4m9mFv+igns7
         jOZ0vQCDM4fQPrejaupBG9QSYD1AqXhJnRO0GKZjDstjHsoM6+Uh4HKAXbL4mnwV48JM
         63xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f96vBhxYNpZKiuOgKNWsuSo+EFN1/eLcYAPe+Uj2OuI=;
        b=Ku3AhqHliJddFmVPzWviRoUxb6CaI8Vsh+kJazr7ckkHx8zFOtDvocFsO2NtGI2RsW
         siP+YHKPxLm3kcyZfJj/6mWsHlJsFoe44nKGOQrPW4LVZSK3Shaize9+n43pqKPQf7v1
         J7MN0S7Uaq/58aHT5Gqz8+e81Ee9BHxha1PPOGJYoZatV8sRKE/ib5F87XKa9Uk6mdSa
         1BM2tYpx6YbQh2w5JLjz7KEt6QR5nR9VBW7kSuF8BBWT4esdx9MsbB/aiKkPmqEVivXh
         V6qF4Rxc4Ohrtr4Wa6ofMQiICz4/acAJLBifrl8hmydgEAOrdqwn/ulpKMsx0bSpX02U
         zajw==
X-Gm-Message-State: AOAM532cTAK6tCoJng3DcZfy6Zp6jiSbLn+ls06LhMxhOSU6185xqiqQ
	6Sc0nN3p2OMyB8dfWQTj64+t
X-Google-Smtp-Source: ABdhPJzBZK9VO3D/vPZZlzKwqa0XkV3IGACh0oSM4YCbD4cAQwlKh77hj/pTQ2c1r3rR4HV9Fg4ygw==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr26154729wmh.104.1626705777926;
        Mon, 19 Jul 2021 07:42:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:7317:9289:34f3:7374])
        by smtp.gmail.com with ESMTPSA id s24sm22560764wra.33.2021.07.19.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 07:42:57 -0700 (PDT)
Date: Mon, 19 Jul 2021 15:42:53 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPWPbbqdG3aFCmAZ@google.com>
References: <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>

On Mon, Jul 19, 2021 at 03:53:31PM +0200, Linus Walleij wrote:
> On Mon, Jul 19, 2021 at 2:24 PM Wedson Almeida Filho
> <wedsonaf@google.com> wrote:
> 
> > Here is a working PL061 driver in Rust (converted form the C one):
> > https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs
> 
> My first impression is that this looks very good compared to other Rust
> code I have seen, and it looks very intuitive and maintainable.

Thanks for taking to time to check it out.

> use kernel::{
>     amba, bit, declare_id_table, device, gpio,
>     io_mem::IoMem,
>     irq::{self, IrqData, LockedIrqData},
>     power,
>     prelude::*,
>     sync::{IrqDisableSpinLock, Ref},
> };
> 
> I think people want to see the code inside these classes as well,
> can we browse it? 

The whole tree is available here: https://github.com/wedsonaf/linux/tree/pl061
-- I should caution you that the two most recent commits are not merged into the
rust tree yet because they're WIP. (I'll clean them up and eventually merge
after the feedback from you all.)

> Especially the gpio class in my case,
> because i want to know what happens when you do
> impl gpio::Chip for PL061Device { ... } I suppose it is just
> a C wrapper to the struct gpio_chip?

`impl gpio::Chip for PL061Device` is just saying that the functions within that
block conform to the ones in `gpio::Chip`. The C wrapper glue is really in
`gpio::Registration::register_with_irq`, called in `probe`: it calls the C
functions and registers "trampolines" that C code can call that routes those to
type-safe Rust code.

> I've got questions but they are mostly due to my lack of understanding
> of Rust idioms I think. For example:
> 
>     fn unmask(data: &Ref<DeviceData>, irq_data: &IrqData) {
>         let mask = bit(irq_data.hwirq() % u64::from(PL061_GPIO_NR));
>         let _guard = data.lock();
>         if let Some(pl061) = data.resources() {
>             let gpioie = pl061.base.readb(GPIOIE) | mask;
>             let _ = pl061.base.try_writeb(gpioie, GPIOIE);
>         }
>     }
> 
> I suppose _guard will be unlocked automatically when we leave
> the function? It's a bit like with Make, it is necessary to know
> what is implicit.

Correct, `guard` will unlock the spinlock automatically when it goes out of
scope. Also note that `pl061` is also a guard, it will unlock RCU read side when
it goes out of scope.

> Then the "_" variable is some kind of idiom for a throw-away
> variable I guess. Can it be named "foo" or is the "_" just specially
> magic?

You can choose any name, however the compiler will issue a warning for an
unused variable. Prefixing it with an underscore silences the warning.

Ordinarily this isn't a problem because you'd access some variable explicitly 
protected by the lock, which isn't the case here.

> It looks like stuff we can even maintain superficially without
> being super versed in Rust. Simple things can be altered
> without knowing exactly how the language works.
> 
> > (I tested iton QEMU through the sysfs interface and also gpio-keys as QEMU
> > uses one of the PL061 pins as the power button.)
> 
> Fair enough.
> 
> > 1. State created on `probe` is ref-counted.
> > 2. Hardware resources (device mem and irq in this case) are "revocable".
> > 3. On `remove`, we automatically revoke access to hardware resources, then free
> > them.
> 
> This is neat. Just generally speaking I like the looks of this
> from a driver subsystem point of view. Unless the code in the
> Kernel::classes is horrible that is.

Once you've had a chance to browse through the code, let me know if there are
concerns.

Cheers,
-Wedson

