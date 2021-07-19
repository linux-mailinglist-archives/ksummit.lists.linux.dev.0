Return-Path: <ksummit+bounces-401-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF23CE8D1
	for <lists@lfdr.de>; Mon, 19 Jul 2021 19:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 18BD41C0EB7
	for <lists@lfdr.de>; Mon, 19 Jul 2021 17:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315862FB3;
	Mon, 19 Jul 2021 17:32:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02017173
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 17:32:12 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id i94so23016971wri.4
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 10:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5RCOleqnDcxb/hK4LhHU2FmBIi3f/kOJLhnYyA7iIok=;
        b=t4mzZ/LAQpYp6MmTnDA/++t8C7rd2Pg+MA72vo1UZRfJKQ6pVJ/kdHTLjecpWo0ReY
         Gb8qb7FKyoUsh588wQONWKfYsyxBITjzMQ5FnYHzlJYUZSvOI7ShN1pdXICUmLaSDYvF
         pVWENi/QlsFoAPETa32iQJ6l6+2Jvhur3EwkIx0cTwheGx+/fJnV2sGYYukQOAmtrYOV
         2CSPwwJzGhR+8/uPvuvWfOejdQIMt8kmtCWPiECDn8v48G7Y5KAX0mYLq9G8IDQMgwS7
         h+nacA+ZPl7fnhgWfPa6Bo0490DSuwP0l3RHERHGDYas8cq6MUafMtJK9NQEQvIe9IvX
         uZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5RCOleqnDcxb/hK4LhHU2FmBIi3f/kOJLhnYyA7iIok=;
        b=QBanFktQfJADKWQNQ3zR1zfvRa3FOHSQqnmm+Re5MTxkELEZqBvOwl8Id1VhV+uJrx
         gqKIMznP2QwCn+wpKH95twWnxwpJQiM4iCdEE8iInMpCu6eEAAWTLePHe3CBZayt4i1l
         KTZjkULbW9EARs0nwF8GiMMj8HqGcSgHig72MfSpMRuSIajZb4SmMrf82x3KGWr2KzZ7
         1wtKfLcLz3uKPnIoj6xYDXljsGuNa8JRCUS1OzwY2lO74eE8kTy8MiNKLK3A2wgM3H5Q
         DDpZ4oyt942HNCAVylVlzRobzyyYFdw30jLWY7E3Ae7lIi1FaCPFOC2ZW4axl0UP4QTd
         SzrQ==
X-Gm-Message-State: AOAM532fSPtqBFUV0OQHC64d1dtO8voyMpJb3o+/UpayAzj1fWaFeprR
	4cK8G+ducGRMOrmQRRfr0iar
X-Google-Smtp-Source: ABdhPJyqahVWYnMpEffC6hB9f/rdwrVz/XDBCLxwzETS85zHBprzRvGFmdAlX9Qgp3ta87LuOo50uA==
X-Received: by 2002:a05:6000:11cf:: with SMTP id i15mr30788830wrx.212.1626715931109;
        Mon, 19 Jul 2021 10:32:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:7317:9289:34f3:7374])
        by smtp.gmail.com with ESMTPSA id o19sm126339wmc.12.2021.07.19.10.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 10:32:10 -0700 (PDT)
Date: Mon, 19 Jul 2021 18:32:06 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Arnd Bergmann <arnd@arndb.de>
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
Message-ID: <YPW3FgN0qtDpPSAc@google.com>
References: <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <YPV7DTFBRN4UFMH1@google.com>
 <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>

On Mon, Jul 19, 2021 at 04:02:38PM +0200, Arnd Bergmann wrote:
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

Thanks for taking the time to check it out.

> I have a couple of questions to understand some of the differences to the
> C version, and what the reasons are for those:
> 
> - All the dev_dbg() seem to be replaced with pr_debug!(). Does that mean
>   we lose the information about the device instance in the output, or is
>   that magically added back?

At the moment we lose information about the device, but simply because we
haven't implemented dev_ variants yet, there is no fundamental reason for this
though.

> - There is a lock of type IrqDisableSpinLock, which sounds like it would
>   correspond to a spinlock_t that is always locked with spin_lock_irqsave(),
>   but the original driver uses raw_spin_lock_irqsave(). Does that mean it
>   won't work on CONFIG_PREEMPT_RT until both types are supported?

Yes, it uses spinlock_t. But again, just because we don't have an implementation
that uses raw_spinlock_t yet.

> - What's with all the CamelCase? Is that enforced by the language, or
>   can we use the same identifiers here that we have in the C version?

I see the Miguel and Linus have already chimed in :)

> - What is the mechanism behind power::Operations that replaces the
>    #ifdef CONFIG_PM of the C version? Will the rust compiler just drop
>    the dead code when CONFIG_PM is disabled?

It's not there yet, but the idea is to wrap the place where `drv.pm` is
initialised in the amba code with `if cfg!(CONFIG_PM)` -- if CONFIG_PM is
disabled, all references to PM code are gone and they are removed by the
compiler. This way we move configuration-dependent code out of drivers and into
core libraries.

Cheers,
-Wedson

