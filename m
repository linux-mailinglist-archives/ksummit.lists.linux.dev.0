Return-Path: <ksummit+bounces-413-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEA3CEEFB
	for <lists@lfdr.de>; Tue, 20 Jul 2021 00:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A15A51C0F31
	for <lists@lfdr.de>; Mon, 19 Jul 2021 22:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29302FB8;
	Mon, 19 Jul 2021 22:16:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6172
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 22:16:45 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id l11so13237570ljq.4
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 15:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ol3YCk6i8ieOA5Hhgos9s2JP9jLRW6KsWGjVIFW/4z4=;
        b=EiIdgVdJqvBe5XaPsAXbmP135S83vi41MXtXDq0uUteT+f8FDqN49/MJoEEf0nz/qx
         cnviFeeKh92aF6D9NaZSRJ+Cgg8XhDZLq0qxrlRSrUQ0u3vcUv9wpoxx4MgDh0uDrt2U
         rdy5Rw7ApXDcr+Czri/a0JOV3pwmqQ/hSw0F0bE5pGthBrPiV0oTU9LCpBEDa0ZafCg9
         zvPK/Qi4GBIWfeGFOowB2EEGWhZK+4Mj18JrpwL0Xny0e5YldwGk3Ei+sjR0p88kJhRz
         5dfVBw2EDxAFU/5DxMKVe9sBf72JpoAaFV0jaX7Q8ISYmCYQ7aE2are7zb+0ll7v7v+O
         vJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ol3YCk6i8ieOA5Hhgos9s2JP9jLRW6KsWGjVIFW/4z4=;
        b=nLFNgXD+TAe6qHpFB7SNLiIPtJxOmjnsq97aho9RSOWlwlYM9cDx+yR8Y2bjun3A1m
         RExS1WnqKs57wqOLuNl02P4Vmb4dXh6DvSybYzt3qsOFpf8jraGm8Fyr5hPNR+l9BXX7
         YQHT3r3NGerBmlSNnISXCGW+xhMTrhM//JU5nMWMj6UpCkQd8sb57sw4xeMrovffh7sA
         C+zyO0dBJ4vmHKIEXr2bfFV+dy81A4AqsuzjAefVcobH/VtuvuIWm1XrJ9PLJKFheN9i
         /No+RYoXpwmE3LdDZHUN1Ob1nvWfWu7SySInWuYzs//KaQ0sQyLM6pb1Tsito33AMwGA
         sPhw==
X-Gm-Message-State: AOAM530/6VDhqWxM5E4h/i049o/2CYW2/uIcYJkYV1RZIaBwsT0bxQVs
	LH39hFDXtfWEoDfptKnMIbPphGf7Qg2aNwird/ec2g==
X-Google-Smtp-Source: ABdhPJzPm0TvKMJaoHNDzSMLjdHYdJHMcvMiugyyp9SNkn9nvr2fDI+bWQ3IHsktDOtirrKhxYqN+CkAe7/qCODx+SM=
X-Received: by 2002:a2e:908d:: with SMTP id l13mr23412548ljg.467.1626733003586;
 Mon, 19 Jul 2021 15:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <YPWPbbqdG3aFCmAZ@google.com>
In-Reply-To: <YPWPbbqdG3aFCmAZ@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Jul 2021 00:16:32 +0200
Message-ID: <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 4:42 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:

> > I think people want to see the code inside these classes as well,
> > can we browse it?
>
> The whole tree is available here: https://github.com/wedsonaf/linux/tree/pl061
> -- I should caution you that the two most recent commits are not merged into the
> rust tree yet because they're WIP. (I'll clean them up and eventually merge
> after the feedback from you all.)

I found that the gpio_chip C wrappers lives here:
https://github.com/wedsonaf/linux/blob/pl061/rust/kernel/gpio.rs

This file is very interesting!

I think it's not a good idea to keep these wrappers in their own
rust directory, they need to be distributed out into the kernel
everywhere they are used. We have made this mistake before
with OF (device tree) that started exactly like this in
drivers/of/*, and now I have part of the OF GPIO handling
and tests inside files in that directory as a consequence.

The wrappers are a hard read, I notice a whole lot of unsafe
keywords here, Chip is missing .set_config() which is understandable
since PL061 isn't using it, the New call to create an instance
contains a lot of magic stuff I don't understand like
state: AtomicU8::new(0) and such but I think that's all right
it probably only needs a trained eye.

This binding only concerns the gpio_chip abstraction though,
which means that the struct gpio_device and the creation and
handling of the GPIO character device, all of the ioctl()
and passed in/out data from userspace is left in C in gpiolib.c

I think this is the current ambition of the Rust effort for now,
which is fine, one can not be judged for doing what one
attempts to do.

But we need to acknowledge that by leaving the userspace
facing code in C the attack surface for buffer overruns
etc is left in C and it buys us pretty much zero additional
security. And with security I do not mean the kernel
protecting itself from itself, but from things coming from
userspace.

It's not that I think GPIOs are an especially interesting
attack vector, but if this pattern persists then it becomes
a problem, because Rust isn't yet protecting us (GPIO)
against userspace, which is what it needs to do in the end.

What we get now is the ability to write drivers in Rust,
but no protection against a hostile userspace. Not really.

To that end the core of the GPIO library would probably
have to be rewritten in Rust and used on *all* platforms
in order to buy us any improved security. I understand that
this is not currently the plan.

This is what I have said before as well: Rust needs to go
where the attack surface of the kernel is to buy us any
real security. But getting there will require rewriting entire
subsystems in Rust AFAICT.

Yours,
Linus Walleij

