Return-Path: <ksummit+bounces-443-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A343D3104
	for <lists@lfdr.de>; Fri, 23 Jul 2021 02:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 411853E1079
	for <lists@lfdr.de>; Fri, 23 Jul 2021 00:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F632FB6;
	Fri, 23 Jul 2021 00:45:45 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86270168
	for <ksummit@lists.linux.dev>; Fri, 23 Jul 2021 00:45:44 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id v6so11269083lfp.6
        for <ksummit@lists.linux.dev>; Thu, 22 Jul 2021 17:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nhm/PM1Y7QCFPPm5Q66TZnHxsroIxWcYhYgOCRKUiB8=;
        b=Qh8uLWI1J/1BuqYdk48eugu+xnsCcSpYibFZN1A9P/1HE+n88Awqk+nZvD2pU37kcI
         1AiABiygtB3i6FAnGWIuuAW0aFtfujlTQqsLB65l5T/oVwg2JYFf6BREZiPKdJ0uYAu6
         pLjbfVj8qtbzRXnAkTGmFrJckz4E6B3mCcDHEoKtINbhSoYUIQfHsEFaShevjBt/fdZW
         qLoOsPpIaULjRcFpZqpG3ShVtGU+Uf5xCb7UFZsJ+QPLuB/y1IptHcNtfVz5+Trhjra2
         IczlzIF+KfM1UuBa/nL6YPnyrOadZ5CFaz6YdjiKit8SFZdIG5TL0b9yFBvdp9idUwRM
         gnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nhm/PM1Y7QCFPPm5Q66TZnHxsroIxWcYhYgOCRKUiB8=;
        b=M2609NG5b+7coIKtMDiBQmJrwKsI4p3cHL1EJod2XA7VbLY7nrsqAV+dkF30pqE+HZ
         FT8zvSIa5REL9cqKOrq8VrpjRBfKen9nBdLzKoq8ysGEj9m3caliVGU3CRDIrgK4pqiA
         f8W5cgNUqTdTJ2kQ4V5Qe0cJ1LG4r39fKLvInnb4AB0VR5XRkMPwQtWSLusN74VaGJet
         DjquqsfbQ9ONeIcZIV+jDQTXIvp7sr18Uw0mh0iR1rgKGDi8lxVy09n5u0XOJZSX9tlB
         LacRq1M8XGdd4kzacWMJ0n8bQLYyemFkueVOOe7naz8SAqIgWT3S0Lafg8VbBq1KX32Q
         l9UA==
X-Gm-Message-State: AOAM533F4IEG8xPHJxIbJPuxyoDMa8TntagLIe30QVK684izDulsrpMo
	PLJ25krZDkYvOL9C5jthNFGh/eKK3JgmXpWEShlJTg==
X-Google-Smtp-Source: ABdhPJzBSXlMKMswTpXXleNRtwHiWMHc5oodPV6EVWxUgN60HM3O8Lx04NxdOR+aL0GiJll5n0uzP9+F+OUnmnrvom0=
X-Received: by 2002:ac2:4c4c:: with SMTP id o12mr1241907lfk.157.1627001142530;
 Thu, 22 Jul 2021 17:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>
 <YPW/LNwxwEW4h0GM@google.com> <YPXUkKVL+/bw/7QD@pendragon.ideasonboard.com>
 <YPXqGoTWprjpslbP@google.com> <YPdiMHr/t5K6RJck@pendragon.ideasonboard.com>
 <CALCETrWH4N17C+uHaDbzGkgS005feaOVQ25yGo9Zy0cb3+eeGA@mail.gmail.com>
 <YPd7byfwcfbOvPyn@pendragon.ideasonboard.com> <CACRpkdavy-fg30tfDpJthuU1WOeLTLJ4bbuKnG+Fgkx-tgRStg@mail.gmail.com>
 <YPgrdZY+5gDXOSGT@google.com> <CACRpkdaCde6Wd2rP3CaYRam0nwOVp8afy5xEDBqff+Cr=yyo4Q@mail.gmail.com>
 <YPlXocbJBH0IcMzv@google.com>
In-Reply-To: <YPlXocbJBH0IcMzv@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 02:45:31 +0200
Message-ID: <CACRpkdbLyaXwH4d-CseorKba4v87c57yQmWFuuf6enrm6jANng@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Lutomirski <luto@kernel.org>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 1:34 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:

> I had two more questions from reading the code that you may be able to answer:
> 1. Drivers like the one for pl061 call `irq_set_irq_wake` from their
>    `irq_set_wake` callbacks. These are "counted", which is great because it
>    allows us to just call the same function for each gpio/interrupt. However,
>    when a gpio irq chip is removed, what ensures that these increments are
>    accordingly decremented?

Really a question for the irqchip people.

I think you will just see many shortcomings of this type since
the irqchip has very little state in general.
IIUC the framework is designed to be be very lightweight.

The following is based on my relatively superficial understanding
of irqchips.

I don't really get what you mean with "counted" here?

It's just consumers setting a flag that that IRQ should be able to wake
up the system.

In PL061 that percolates up to the parent, the cascaded IRQ.
The parent doesn't "count" the number of wake flags either, not
any driver I know of, the framework only provides these callbacks,
it has no state.

The only practical effect is setting a bit in the hardware (if available)
that the IRQ can wake up the system so the hardware bit *is* the
state. The driver may record it in its state container to ascertain not
to shut off clocks when sleeping for example but in practice it's often
not very thorough.

The IRQ wake status of the parent before we probe is unknown and
there is no way to retrieve it. It can very well be a power-on default,
so by definition undefined.

It could be dangerous to attempt to set it back to disabled when we
leave the since the IRQ may be shared and the irqchip doesn't count
so that will yield a first come-first serve bug.

In practice there are a few calls to this function and the same bit
will be set in hardware a few times from different callers and that
is fine because it is all that is needed most times. Then the whole
state goes away with the hardware it is in when the system goes
down.

I think this is partly by design to keep the state in the hardware.
If the hardware changes state because of external factors, then
the state reflects reality through reading the registers etc.
This is maybe a questionable design principle.

> 2. `irq_domain_remove` requires that all mappings have been disposed of before
>    being called. I see that `gpiochip_irqchip_remove` calls
>    `irq_dispose_mapping` for each pin before calling `irq_domain_remove`. But
>    what prevents *new* mappings from being added back before `irq_domain_remove`
>    is called?

Again mostly a question for the irqchip people I guess but nothing I
think since the irqdomain does not have any synchronization
primitives or any counting.

We have made it mostly work fine in practice for many years
because in practice there is often just one way in which the
IRQ tree can come up and down and once up it doesn't change
much.

It could be more elegant I guess. Especially since it could very well
have state as the domain is just a piece of software.

If you start to think that irqchip could use some more developers
and maintainers you are probably right.

Yours,
Linus Walleij

