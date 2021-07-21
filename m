Return-Path: <ksummit+bounces-438-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7F33D1109
	for <lists@lfdr.de>; Wed, 21 Jul 2021 16:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id C41183E0FA2
	for <lists@lfdr.de>; Wed, 21 Jul 2021 14:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131E82FB6;
	Wed, 21 Jul 2021 14:19:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F172
	for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 14:19:22 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id h4so3224845ljo.6
        for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B0bby+E+kfh1HizJIdQhvngnJHXhgIb5TA/YJsLViCM=;
        b=Z2uWbY3mjCKrfmaUjMp9EMwN1VIJuF4iXWKmm9xjKEaXwmwdAUJ1XD/EsJyTz3hc00
         EXsskCtj1wB8eGvK+qCbFrHL7Mpx9BuS4GK0xiUjnsn0M7rcgx2a9g0tLFzMnKUjmGrV
         PCIFdPWSH25n+q+sgL2U2SReVdio6Zd6BZQlUwPbfna2n1MlXwkv1kE9wYtWoRVPncyF
         cXnYV8Zj/Kut4Q4SHADakYu9bLPuoWpr8SHWpYbuC+Qf12KRXPuu4+w9xCRfeFIQOYdt
         O1eopfAf5BMXzN0B5EDc9G4KNX8uMfcjRowRpXpkPcJJGq7s71FUAVMTGbsdYkG6B6F1
         bpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B0bby+E+kfh1HizJIdQhvngnJHXhgIb5TA/YJsLViCM=;
        b=bDHTxbO50y38ccvtkeszKXjyAtXTyNwUjG9jmoKPsa/hFdWDSUC48gP/klpn93KtpS
         ES6zAclyw853zgtxVxINteYD2/sJ4Ld07L6ELF77w3jeWGUrLU2X8CP93gxY3i9K72f9
         Zpjr7wHK26DAlCPOMqDSivw3y97VZjRZpDPZGBSda8gz86ltFQzDzKMqYr7IUYQqX50U
         1WHYh80wNLlghCsUtDgbsin/uSS0J4Qeee2x9XJe9HqUB2b/QxTNL0CkekCXxSUt8vS0
         ks4EfQb33meix38u7k/xSECBpGhuYWOAOJtLoEYGn4tf8HR/2LMcmCFlubgcFZxfK64B
         rxng==
X-Gm-Message-State: AOAM530X5Do+6k84EoFMm4A403hzkUehIYzIitik0Qz0InXlx+UH+k/A
	jZcHpkK7CtjTbkRig0dkLKSBZJr5VgnTJjoMOCpyAg==
X-Google-Smtp-Source: ABdhPJzkJLJ5u6xdQKGe3sDd5HJH+5GkWsyoy93GrZHUhZfIv/tq2OVLl+Njx5Rz/wAHMKxGOJ6nEFvfyufvC9LJpsM=
X-Received: by 2002:a05:651c:169a:: with SMTP id bd26mr31304431ljb.368.1626877160911;
 Wed, 21 Jul 2021 07:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
 <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com> <YPW/LNwxwEW4h0GM@google.com>
 <YPXUkKVL+/bw/7QD@pendragon.ideasonboard.com> <YPXqGoTWprjpslbP@google.com>
 <YPdiMHr/t5K6RJck@pendragon.ideasonboard.com> <CALCETrWH4N17C+uHaDbzGkgS005feaOVQ25yGo9Zy0cb3+eeGA@mail.gmail.com>
 <YPd7byfwcfbOvPyn@pendragon.ideasonboard.com> <CACRpkdavy-fg30tfDpJthuU1WOeLTLJ4bbuKnG+Fgkx-tgRStg@mail.gmail.com>
 <YPgrdZY+5gDXOSGT@google.com>
In-Reply-To: <YPgrdZY+5gDXOSGT@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 16:19:09 +0200
Message-ID: <CACRpkdaCde6Wd2rP3CaYRam0nwOVp8afy5xEDBqff+Cr=yyo4Q@mail.gmail.com>
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

On Wed, Jul 21, 2021 at 4:13 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
> On Wed, Jul 21, 2021 at 03:54:33PM +0200, Linus Walleij wrote:

> > We have something like this for GPIO but it is coded by a notoriously
> > crappy programmer (me) in C, so there are some bugs in it pointed
> > out by Miguel.
> > https://lore.kernel.org/ksummit/CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com/
>
> Would you mind sharing details of the bugs Miguel found?

Nah, just me being confused. They were found by you :)
https://lore.kernel.org/ksummit/CACRpkdb1W=M5EJkGbSS4QxObU-Gd5yZ1qE439k_D4K=jevgcrQ@mail.gmail.com/

Yours,
Linus Walleij

