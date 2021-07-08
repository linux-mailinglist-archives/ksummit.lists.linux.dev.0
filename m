Return-Path: <ksummit+bounces-357-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1B3C1A25
	for <lists@lfdr.de>; Thu,  8 Jul 2021 21:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5AB593E10F4
	for <lists@lfdr.de>; Thu,  8 Jul 2021 19:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59382F80;
	Thu,  8 Jul 2021 19:49:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D56F168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 19:49:28 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id n14so18481122lfu.8
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 12:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YqCcKMfCn6KIf6YzKQ50P7XM3AkVJWZbm2YLWSRDFO8=;
        b=JSp1DSgGVEX097wmsT3YRPbTWWVcXJYz3Jcj6RkuNrwq0mQ6KX4iiuqaEpHpF1fSCN
         f4buIJqejVZQ0yWxKarTohJ1WXOl82v9be7OZldjh6YsQcm0bu3oTXxgPFDWOQifYqMl
         o7z3z9YkqxYakTrAdtT/ylBlzEgvVjZvDD6ugpAio+G8wA+IY2BawHcjwuzj7TEJj/w8
         U35W+6LMf3Kjv1fZmgb04hXszm+KdZX+zpPdEIOjpds0JZphBkmv8HUKhyDLzoL29gu9
         5/9ac6S8QPvRRSxDohJJVoKQcrBjXfG5Zx8LhdCd/0n/ED4AuD8H83SXTX63Azpm41BM
         UmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YqCcKMfCn6KIf6YzKQ50P7XM3AkVJWZbm2YLWSRDFO8=;
        b=mYaZfUs1gFiFIPjLPKCpyu21WdsUVyxtmdwidmAMq4S0+OuD9Up0egtvcdPy7xDlyQ
         lfQKdvkx0Iwr6FMbCBc2C5Q4/QjgqyBW0cUZGsFzE483/EwZWF2H57+ECH3fiEqsUbOF
         tHt/2zLFCcbv8DCw0sV8m6KjiKqMFWA/w6Jk0DctflU+b00RpY+Tc4lMMMw/rQc+7UgR
         SGH/b6az0Pr4Zc9LXADV9vm1D8oMUYSyQZjXdta7ZPVDiXouHvyMPUmE/jY4wQvEsxRa
         y+MX5Di/KA2itZ940Di2ifTizqOwz56dOrA3udAU42IDXhLW1USLq+Z+apN0jWgr+N85
         crog==
X-Gm-Message-State: AOAM5300eh4nRTyOOVeQsCyBEDUF0ZHF1rFwoMyrxPGhsLuigRgSZoB5
	y3cn0JGH5Q6+WmWYto+LXjnsQlHy2L/oRq3wPFTo5w==
X-Google-Smtp-Source: ABdhPJzuhk5BLOs63yD16rGtD2cyvi31+EFTRUjEjvehiI7OOl6mh0Xgm2mIoCJBNrTyPd8Muuzx7vnForPpA7r4RKY=
X-Received: by 2002:a05:6512:1508:: with SMTP id bq8mr25990719lfb.529.1625773766614;
 Thu, 08 Jul 2021 12:49:26 -0700 (PDT)
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
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
In-Reply-To: <YOdJLYmUkoMyszO7@kroah.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Jul 2021 21:49:15 +0200
Message-ID: <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 8:51 PM Greg KH <greg@kroah.com> wrote:

> But if you didn't like the previous examples (nvme block driver, i2c
> driver, gpio driver), how about looking at the drivers used by your
> current desktop and picking something that you use today that actually
> talks to hardware?

With my GPIO maintainer hat on I'd say a GPIO driver would be quite
interesting to look at. We are two GPIO maintainers and Bartosz is
doing the heavy lifting for the moment so I'm connecting Bartosz to this
discussion. (Now he has to read through the whole backlog,
sorry Bart!)

This is not to say I promise we will merge it or so, but I just generically
like new approaches to old problems so I like this whole thing
overall, despite being critical to some details.

I am also trying to learn Rust. Baby steps.

I also Cced Viresh Kumar who I think is thinking about Rust these
days, using it for one end of a virtio pipe (IIUC) and Andy also brought
up virtio, but now on the other side, in the kernel.

My concern is still whether this really brings Rust closer to the actual
problems we have and that Rust can solve. If the problem is really
about real world security issues, I would ask Kees where the actual
attack surface of the kernel is. He knows.

It kind of matters. EternalBlue (WannaCry) was a horrific Windows
exploit in that it shows us pretty well what kind of cyberweapons the
intelligence agencies of the world have been constructing and
stockpiling, and probably also used. We need to put countermeasures
where such exploits are likely to hit, yesterday. Intuitively I would
say any in-kernel network daemons, anything complex that
responds directly to network traffic, is a good thing to fix. I do not
know why people are so hung up on device drivers. I would
look at something like fs/nfsd or what else is there that act like
this? ksmbd is out-of-tree. Maybe contribute ksmbd in the form
of Rust and show how nicely this implementation of SMB avoid
all the dangers exposed in WannaCry for Windows? That kind of
stuff would build real trust.
KSMBD in C is there:
https://github.com/namjaejeon/ksmbd

If the problem is security in the sense of being secure from random
crashes and general instability, drivers is an as good place to start as
any.

Yours,
Linus Walleij

