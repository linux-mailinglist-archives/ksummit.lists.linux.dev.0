Return-Path: <ksummit+bounces-405-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6B93CEAD6
	for <lists@lfdr.de>; Mon, 19 Jul 2021 20:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id AFF2E3E11C5
	for <lists@lfdr.de>; Mon, 19 Jul 2021 18:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090F32FB6;
	Mon, 19 Jul 2021 18:06:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27162FAE
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 18:06:42 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id f17so23143509wrt.6
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 11:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fvzkGiuQd0q8rAfa5XSo/UakXH61t2sNuQeeQFAMZ7Q=;
        b=sALTn8uQrBhapKPiYZFeIawMxerTxdWOFGz8K8HtIx8mHkhGAIseifVP7nEdgi3LlR
         PsijvXIfqXAPs5HzekO6Oo95ypVEAnmLP7dNvLfOffBKEfqQjqL05JF0BScpS4S91WGl
         I08vuvrB9+tiEVQyIc0+ie7CJnNQN8hbm7BD2RlQwFAcZ4tJNfPhK2V/TXy6wZihpyug
         n4j1KBRFyFE/47EtSpXLUzcLg5Bs0Php6bU9tjOWoumKDH+7L2nZXRHYheZWNYdlqyHU
         wFzMjg2XckAxT7/4rflzJ7DrUBJcFGwZwdSRuMXiJVL00BtTIc7sNhXQmLtiPBQNjNmx
         8TdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fvzkGiuQd0q8rAfa5XSo/UakXH61t2sNuQeeQFAMZ7Q=;
        b=SUkd7XEs7K+Fi/apCocn6teMkkxL8TaoAtq09jlPUoSKv2mLWTGVcsy6lwY4Uch1sm
         vUhZF4cM/0xWtEy/W0eTB5hmrSgyQaHXGphlsAsNnZlxo4EExDwC9/78bw1DzdaMyH56
         9H+U1DQAMpWmQ4loSVItsuuEnJgFCN95gxqPMfYhUEFI4EtYwksiBNpDCZ0Doe4GI9Sc
         NflvEEro5VJ/YA+LcRKE5KX1jyWUtFl8AC7z/u4nciKqZcnDj2aJYMAGd9Nly+DHmZn6
         2owZ+pyHhdp29ryWYyYb1G32VgGMn+TQ0YTD5li0n5LGyASKaCqqiUvMGT7kO3oED+tA
         auvQ==
X-Gm-Message-State: AOAM531GeQRyDAukPDunBkXRJGIcQlhaygiPLJxW9DRcgXDFj4KEOUm1
	VEknDwnk8CEQRfyizUDXQGe9
X-Google-Smtp-Source: ABdhPJwcWq/Nd3yqzwgB9Go1hFOWKNgenTSK1dn9CqDAw5QHn+d22rmcHCO3zoRUk48RAqcdUILusw==
X-Received: by 2002:a5d:52d0:: with SMTP id r16mr30753967wrv.323.1626718000722;
        Mon, 19 Jul 2021 11:06:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:7317:9289:34f3:7374])
        by smtp.gmail.com with ESMTPSA id v9sm17770485wml.36.2021.07.19.11.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 11:06:40 -0700 (PDT)
Date: Mon, 19 Jul 2021 19:06:36 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPW/LNwxwEW4h0GM@google.com>
References: <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <YPV7DTFBRN4UFMH1@google.com>
 <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>

On Mon, Jul 19, 2021 at 06:02:06PM +0200, Vegard Nossum wrote:
> 
> On 7/19/21 3:15 PM, Wedson Almeida Filho wrote:
> > On Mon, Jul 19, 2021 at 01:24:49PM +0100, Wedson Almeida Filho wrote:
> >> On Fri, Jul 09, 2021 at 12:13:25AM +0200, Linus Walleij wrote:
> >>> I have seen that QEMU has a piece of code for the Arm PrimeCell
> >>> PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
> >>> Note that this hardware apart from being used in all Arm reference
> >>> designs is used on ARMv4T systems that are not supported by
> >>> LLVM but only GCC, which might complicate things.
> >>
> >> Here is a working PL061 driver in Rust (converted form the C one):
> >> https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs
> > 
> > I'm also attaching an html rending of the C and Rust versions side by side where
> > I try to line the definitions up to make it easier to contrast the two
> > implementations.
> > 
> 
> This is really cool :-) As a Rust noob, I have a few questions:
> 
> 1. I'm curious about some of the writeb() vs. try_writeb() calls:
> 
> fn direction_output(data: &Ref<DeviceData>, offset: u32, value: bool) ->
> Result {
>         let woffset = bit(offset + 2).into();
>         let _guard = data.lock();
>         let pl061 = data.resources().ok_or(Error::ENXIO)?;
>         pl061.base.try_writeb((value as u8) << offset, woffset)?;
>         let mut gpiodir = pl061.base.readb(GPIODIR);
>         gpiodir |= bit(offset);
>         pl061.base.writeb(gpiodir, GPIODIR);
> 
>         // gpio value is set again, because pl061 doesn't allow to set
> value of a gpio pin before
>         // configuring it in OUT mode.
>         pl061.base.try_writeb((value as u8) << offset, woffset)?;
>         Ok(())
>     }
> 
> Here you have try_writeb() (and error return) where there was just a
> writeb() without any error handling in the C version. Is this what
> Miguel was answering a bit down the thread where the address is computed
> ((value as u8) << offset) so it _needs_ to use the try_() version?

The `writeb` variant only works when we know at compile-time that the offset is
within bounds (the compiler will reject the code otherwise). When the value is
computed at runtime we use a `try` version that checks before performing the
write. We need this to guarantee memory safety.

> If offset can be anything but a "correct" value here, should there be a
> check for that somewhere else and then the computed value can be
> subsequently treated as safe (i.e. there's a second try_writeb() in the
> function that now presumably does the runtime check a second time,
> redundantly)?

Oh, that's a neat idea. We can certainly implement something like this:

let woffset = pl061.base.vet_offsetb(bit(offset + 2))?;

Then woffset would be passed to writeb variants that are guaranteed to succeed.
(Rust helps us ensure that woffset cannot change without checks, which would be
harder to do in C.)

> 2. In many places you have the C code:
> 
> struct pl061 *pl061 = dev_get_drvdata(dev);
> 
> with the equivalent Rust code as:
> 
> let pl061 = data.resources().ok_or(Error::ENXIO)?;
> 
> Why doesn't the C code need to check for errors here? Or put
> differently, why can the Rust version fail?

There are two aspecs worth noting here:
1. In C there is cast from void * to struct pl061 * without really knowing if
the stored pointer is of the right type. For example, if I simply change the
struct type to say `struct mutex` in the code above, it will still compile,
though it will be clearly wrong. In Rust we prevent this by not exposing drvdata
directly to drivers, and using type-specialised functions to set/get drvdata, so
it *knows* that the type is right. So in this sense Rust is better because it
offers type guarantees without additional runtime cost. (In Rust, if you change
the type of the function to say `&Mutex`, it won't compile.

2. The extra check we have here is because of a feature that the C code doesn't
have: revocable resources. If we didn't want to have this, we could do say
`data.base.writeb(...)` directly, but then we could have situations where `base`
is used after the device was removed. By having these checks we guarantee that
anyone can hold a reference to device state, but they can no longer use hw
resources after the device is removed.

> 3. In probe() you have:
> 
> data.resources().ok_or(Error::ENXIO)?.base.writeb(0, GPIOIE); // disable
> irqs
> data.registrations()
>     .ok_or(Error::ENXIO)?
>     .gpio_chip
>     .register_with_irq(PL061_GPIO_NR, None, dev, data.clone(), irq)?;
> 
> So here, if .register_with_irq() or any of the other ?-marked calls
> fail, then the function returns and the local variable "data" and all
> its members are freed/deallocated using destructors like in C++ RAII?

Yes, everything is freed a la C++ RAII destructors on failure. Additionally, the
same mechanism is used on success when the refcount on `data` goes to zero. No
need for chained goto-based exit paths nor devm-like bookkeeping.

Cheers,
-Wedson

