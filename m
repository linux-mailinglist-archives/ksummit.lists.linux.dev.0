Return-Path: <ksummit+bounces-442-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56D3D22CA
	for <lists@lfdr.de>; Thu, 22 Jul 2021 13:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 9A45D3E10A2
	for <lists@lfdr.de>; Thu, 22 Jul 2021 11:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234602FB6;
	Thu, 22 Jul 2021 11:34:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0472870
	for <ksummit@lists.linux.dev>; Thu, 22 Jul 2021 11:34:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id a23-20020a05600c2257b0290236ec98bebaso2767259wmm.1
        for <ksummit@lists.linux.dev>; Thu, 22 Jul 2021 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i8ScvAYEhSQ+Jn/zbbCYXGNn7yZ0fc29RINpPqvn3Pg=;
        b=u7V3SxizE9iZvzjkwepmYX/W18GEjwPy4m3CCGMytvDVy4D20sVTnWS2v/QeXyvuht
         c5YSDT6Fj1dZhIM+tn9QGpLIfKSjsUK14SClQW16Da4X4mQ2po5m2tiNBgq901+W0Are
         VaoCE0rIYuLXmGpBbkLLNz4XSMHihuqRka0xC0XVsUceYYX9snsKi+uOuRpM2KlPianF
         StQM91JwIOJKPbzEzE2AHV+MnC8t+//Rg1biALx5fcANUDAqmy8sWy8EbeIVYk5AlOy6
         vOsucKXKW3atvTwp7hEM+f/3oaEUJP6QduYs61wrajajUD6IrkBPDKInp+hLiuIJ8rHW
         TJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i8ScvAYEhSQ+Jn/zbbCYXGNn7yZ0fc29RINpPqvn3Pg=;
        b=oGQJORegoW4ZAfwitSfD/E8QxT+F0FJMv2EXLwmIrJwKrjmqYF3wnuNJ3vHxNlpjBl
         7fV6T7gYbSH+wvYd6JfUjybdGeoDTfx3vwQUj5Gnvl4b2WqGc6whR2K1h1HiGFCHuTYt
         K6h1t8P5TWtEBS7/hHZE2SIOBolmZILUwx+LyNRoqOvbJEKKXozmSKk3Th+F5T93IdHq
         4rzoccMqSITeHi5KjeUbbE+5Cq9OkVDfWWd0jJcZlMqxb9384uDnZbFuW6B/8sGQhqHV
         x00Tjge3ThNrR+mlzqHKm7DEhXyVPPvP4wkA/zcoVMzO7jpfdPe/rSKfr/OvwcbwqB/u
         YRDw==
X-Gm-Message-State: AOAM532uvNYZAkEdSB/IWsxvauf/4YIpNEjKKD7FX1BXSJBtmwM62wos
	HjoyG9zcEpaGHUeAuI1mbQZO
X-Google-Smtp-Source: ABdhPJxiST8T+DcC69Ol8b3mzX0rC845AbCFAwNgnEYL8yZ51qAn9LCs3O0KcPo7j74Bxw2aT2XNfg==
X-Received: by 2002:a05:600c:ac3:: with SMTP id c3mr43154080wmr.4.1626953643135;
        Thu, 22 Jul 2021 04:34:03 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:fd2c:3ef3:a3c:2c36])
        by smtp.gmail.com with ESMTPSA id b6sm2362040wmj.34.2021.07.22.04.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 04:34:02 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:33:53 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andy Lutomirski <luto@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPlXocbJBH0IcMzv@google.com>
References: <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>
 <YPW/LNwxwEW4h0GM@google.com>
 <YPXUkKVL+/bw/7QD@pendragon.ideasonboard.com>
 <YPXqGoTWprjpslbP@google.com>
 <YPdiMHr/t5K6RJck@pendragon.ideasonboard.com>
 <CALCETrWH4N17C+uHaDbzGkgS005feaOVQ25yGo9Zy0cb3+eeGA@mail.gmail.com>
 <YPd7byfwcfbOvPyn@pendragon.ideasonboard.com>
 <CACRpkdavy-fg30tfDpJthuU1WOeLTLJ4bbuKnG+Fgkx-tgRStg@mail.gmail.com>
 <YPgrdZY+5gDXOSGT@google.com>
 <CACRpkdaCde6Wd2rP3CaYRam0nwOVp8afy5xEDBqff+Cr=yyo4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaCde6Wd2rP3CaYRam0nwOVp8afy5xEDBqff+Cr=yyo4Q@mail.gmail.com>

On Wed, Jul 21, 2021 at 04:19:09PM +0200, Linus Walleij wrote:
> On Wed, Jul 21, 2021 at 4:13 PM Wedson Almeida Filho
> <wedsonaf@google.com> wrote:
> > On Wed, Jul 21, 2021 at 03:54:33PM +0200, Linus Walleij wrote:
> 
> > > We have something like this for GPIO but it is coded by a notoriously
> > > crappy programmer (me) in C, so there are some bugs in it pointed
> > > out by Miguel.
> > > https://lore.kernel.org/ksummit/CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com/
> >
> > Would you mind sharing details of the bugs Miguel found?
> 
> Nah, just me being confused. They were found by you :)
> https://lore.kernel.org/ksummit/CACRpkdb1W=M5EJkGbSS4QxObU-Gd5yZ1qE439k_D4K=jevgcrQ@mail.gmail.com/

I had two more questions from reading the code that you may be able to answer:
1. Drivers like the one for pl061 call `irq_set_irq_wake` from their
   `irq_set_wake` callbacks. These are "counted", which is great because it
   allows us to just call the same function for each gpio/interrupt. However,
   when a gpio irq chip is removed, what ensures that these increments are
   accordingly decremented?
2. `irq_domain_remove` requires that all mappings have been disposed of before
   being called. I see that `gpiochip_irqchip_remove` calls
   `irq_dispose_mapping` for each pin before calling `irq_domain_remove`. But
   what prevents *new* mappings from being added back before `irq_domain_remove`
   is called?

Thanks,
-Wedson

