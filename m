Return-Path: <ksummit+bounces-415-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5933CF13C
	for <lists@lfdr.de>; Tue, 20 Jul 2021 03:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AEA5D1C0ECF
	for <lists@lfdr.de>; Tue, 20 Jul 2021 01:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09062FB6;
	Tue, 20 Jul 2021 01:20:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694B4173
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 01:20:41 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c12so6158680wrt.3
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 18:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9ozLewGbdjkcBK9DOOZuMR1A8jm2MXMT95tykglU/N8=;
        b=mSNXXVTqkLtxAfp4Qk7u8QqY2Fdn3VUmePiy6+JasYpoQKJs4Wvw1Op/YeUIZu9fsK
         +modk7pjWea+YQ2blj/AOJV+SjiT7QmaFuuWg3/0e2uub8R/0qhbnVdmiFKQKk3dEeGW
         +3Ej+h/eymt4V5qtjp4ifMBMPwCnvrp9f2BLIswnrWU7mlw5/Q+cLI0oJGsA994xgnN5
         zd35q+6fxKIX2uRWuoTIEVtg+kBRVzRZBQ+DYCDePTnfBvKpqjgNxaDceF4JWuYfg+lE
         is10VwKuT64w2CSAYdZD+nupOZY/NjwPe3nAPjew4UBFifegtOE6DgZsXWmyOGcyi2c6
         cOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9ozLewGbdjkcBK9DOOZuMR1A8jm2MXMT95tykglU/N8=;
        b=KZ+JCYb59sGKj2WY01EkCS0hNP/Ny32z6UGFQVO2e4i0JZqZPqMVYQ3fmxmokXyM83
         DrYA9eyeDOxeWGSH+oUm67WcwN7ZQQnnRPzgNjkqGKzw6GXk4Z+pJV+L6PEPKpVSOBpp
         L8rC5UMq7VOfBgbO7EolO08WC5hnIQQBJ8/5HC7WTaKEHa9uQ7pUkKk70GquniYImQfj
         qY0gRFsCvq9UiZ14HDwdXw5JwaPeR/DHt3f65W1ae59Nnyz51a0cMuU4Q1GBCPPeOpy9
         i07jBsv6bFHMM+dtCOrCGvmMLevw5GTvA4nQIeTodUzCPigzSa97Ib2VhCVvs1wvx6uz
         ED/Q==
X-Gm-Message-State: AOAM5311MET1LITrlMI4Zz78UUgvWRWCpy+Og31nTZHfpeRv0RijvDY9
	TFF/GMPkNn65+KnUXZqyQv8P
X-Google-Smtp-Source: ABdhPJy0n+byFWheguCqVgKE9pIMqwzUgw9zGNkiNxdE4WeOc0HwYvOv/UWJ6zHAh9KJ53/YFvw3dg==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr33303442wrv.9.1626744039571;
        Mon, 19 Jul 2021 18:20:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:8996:1dfb:3644:362c])
        by smtp.gmail.com with ESMTPSA id v21sm960567wml.5.2021.07.19.18.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 18:20:39 -0700 (PDT)
Date: Tue, 20 Jul 2021 02:20:34 +0100
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
Message-ID: <YPYk4gSGJrGvg+M+@google.com>
References: <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <YPWPbbqdG3aFCmAZ@google.com>
 <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>

On Tue, Jul 20, 2021 at 12:16:32AM +0200, Linus Walleij wrote:
> On Mon, Jul 19, 2021 at 4:42 PM Wedson Almeida Filho
> <wedsonaf@google.com> wrote:
> 
> > > I think people want to see the code inside these classes as well,
> > > can we browse it?
> >
> > The whole tree is available here: https://github.com/wedsonaf/linux/tree/pl061
> > -- I should caution you that the two most recent commits are not merged into the
> > rust tree yet because they're WIP. (I'll clean them up and eventually merge
> > after the feedback from you all.)
> 
> I found that the gpio_chip C wrappers lives here:
> https://github.com/wedsonaf/linux/blob/pl061/rust/kernel/gpio.rs
> 
> This file is very interesting!
> 
> I think it's not a good idea to keep these wrappers in their own
> rust directory, they need to be distributed out into the kernel
> everywhere they are used. We have made this mistake before
> with OF (device tree) that started exactly like this in
> drivers/of/*, and now I have part of the OF GPIO handling
> and tests inside files in that directory as a consequence.

That's great feedback. Our plan was to have the core parts in `rust/kernel`, but
once maintainers got involved, we would place things where it made more sense.
Since we have no maintainers involved in development yet, everything is in rust/
for now.

> The wrappers are a hard read, I notice a whole lot of unsafe
> keywords here, Chip is missing .set_config() which is understandable
> since PL061 isn't using it,

Right, I only implemented what was needed for the PL061 driver. As I said
originally, this isn't intended to be a general solution just yet.

> the New call to create an instance
> contains a lot of magic stuff I don't understand like
> state: AtomicU8::new(0) and such but I think that's all right
> it probably only needs a trained eye.

That code is interacting with C, both being called by C and calling into C, so
it necessarily has a lot of unsafe blocks. The idea though is to limit the
unsafety to these wrappers and have them carefully reviewed; users will
[ideally] need no unsafe code.

> This binding only concerns the gpio_chip abstraction though,
> which means that the struct gpio_device and the creation and
> handling of the GPIO character device, all of the ioctl()
> and passed in/out data from userspace is left in C in gpiolib.c

Right, we don't want to reinvent things already in C while trying to demonstrate
a driver. The wrappers I wrote are needed for us to have a safe Rust API that
drivers can call -- if they weren't necessary I wouldn't have written them
either. At least not to begin with.

> I think this is the current ambition of the Rust effort for now,
> which is fine, one can not be judged for doing what one
> attempts to do.
> 
> But we need to acknowledge that by leaving the userspace
> facing code in C the attack surface for buffer overruns
> etc is left in C and it buys us pretty much zero additional
> security. And with security I do not mean the kernel
> protecting itself from itself, but from things coming from
> userspace.
>
> It's not that I think GPIOs are an especially interesting
> attack vector, but if this pattern persists then it becomes
> a problem, because Rust isn't yet protecting us (GPIO)
> against userspace, which is what it needs to do in the end.

It's not protecting all the way yet, but it is offering more guarantees than C:
for example, it guarantees that driver code won't touch memory that it doesn't
own. Suppose there's a bug in gpiolib that allows an attacker to control the
value of `offset` in get/set operations, a driver written in C will take it and
read/write to memory it doesn't own; a Rust driver won't.

Suppose a driver developer forgets to call chained_irq_enter/chained_irq_exit in
their IRQ handler. An attacker could time things and trigger interrupts and DoS
the system, but this can't happen in Rust.

Suppose a driver developer copies some code from pl061_irq_type and pastes it
somewhere where irq_desc is not locked, but calls irq_set_handler_locked anyway.
An attacker could potentially exploit the resulting races. This can't happen in
Rust.

There are other bugs that Rust prevents by construction that improves the
overall quality of the drivers, with the end result being a reduced attack
surface. Less opportunities for attackers to chain vulnerabilities to exploit
the kernel -- remember that exploits are usually built as chain of
vulnerabilities to elevate from simple innocuous-looking misbehaviours to
something really bad like arbitrary execution.

> What we get now is the ability to write drivers in Rust,
> but no protection against a hostile userspace. Not really.

I do agree that having Rust on the interface with userspace would likely offer
the best protection. That's what I was working on with binder -- but you (as a
community) wanted to see a driver for "real" hardware. So here it is :)

> To that end the core of the GPIO library would probably
> have to be rewritten in Rust and used on *all* platforms
> in order to buy us any improved security. I understand that
> this is not currently the plan.

It's not the short-term plan, but if maintainers are interested in converting
GPIO to Rust, I would be happy to help now that I've learned a bit about it.
It would, for one, fix the race conditions you have when devices are removed.

> This is what I have said before as well: Rust needs to go
> where the attack surface of the kernel is to buy us any
> real security. But getting there will require rewriting entire
> subsystems in Rust AFAICT.

I'm not sure I agree with this. Incremental improvements are a good thing.

Cheers,
-Wedson

