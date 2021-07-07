Return-Path: <ksummit+bounces-299-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8D03BEC53
	for <lists@lfdr.de>; Wed,  7 Jul 2021 18:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 682431C0DF6
	for <lists@lfdr.de>; Wed,  7 Jul 2021 16:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96A92F80;
	Wed,  7 Jul 2021 16:34:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBD472
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 16:34:56 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id w1so1490660ilg.10
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nErIxdhpfsISK9+FjERkMylpWh62mB23N4X9DOh1KTA=;
        b=JqVp2z86LCrwTHT/taXf2VZex/rkdpBTyN927290IKNuRuA5yegMBkmBeuQuUzSBRU
         npbI/fxWucndg2O2k32tDk8J3F+EfGMeJfhn54ZenNPLnepoIDUHI4MpoiXmUCrjiN7l
         jlJ914/NLAFYlduPZvr/jYNgcw10kZNZJ2vOHeHXfCfUMww2Dc7X+R7pqtj7rGrXTMFS
         O8Q0BUytaqFGanAfbc0/SLNHcNU1cdBD/5GYs4KtpFtCY/UDOoniCFB8cR34uViAWFJF
         jbaNzQVk6lsNMJSHl4X8cjIw3MairbyeiOqaIL7Fk+8QXFyL0XRnoJPzBrhwxAKtM1Zl
         iEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nErIxdhpfsISK9+FjERkMylpWh62mB23N4X9DOh1KTA=;
        b=ShNM8ui40VrsXDdE31f88YkklUWtBeLjhbpdPzlCP5uSbJK41wukNHFaVhsvqKygj8
         0NHB0L7upErSR2BloVQJTDt8cSGs7MKRxs6dc+N8eBEv8ndMMeEC/cYZstQQ+freQvBY
         T1cmqE/XyWwyXv/RxyZlAqaP9ZwLF81KZBrR4xnlKXN3M/ZO1l9sxLvdJ9c728PTQzYe
         HjkMcBtGKLlyfN29p/raAeenJXoc+MpzhWvEn3HV9n0S2v3CJpwPwBR179hB3KRq6iIo
         l5DI8aLP2H3vbnCtyzs5azrBqsi/INYhvbIbI2jGTv9X9sugc4cdmimCKc7Rq/hAMaSo
         3xnA==
X-Gm-Message-State: AOAM531DxyQfmdIE8wcCsDLjHkb4zAwrOx2RNCt36cxdhf51RifPepjD
	rX8iSVnn0wEJmXTCTYaXX9H5kUiH+VtFJSXdSfU=
X-Google-Smtp-Source: ABdhPJy4y4haMLBOkXLD+d0TNiEF8ZXY5/xRfhhz5u2SWa33rh36gT2WWwUJy/Ae8xYeOBL17Bd8/H8SaiNojdgAnug=
X-Received: by 2002:a05:6e02:20ed:: with SMTP id q13mr19060574ilv.176.1625675695884;
 Wed, 07 Jul 2021 09:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CAMuHMdU5FOdSj+-d38t3BuPrZsYF0YT-Ff1efYLS3W7yNN_Y6Q@mail.gmail.com>
 <CACRpkdbr9orKFfDmwZDz1wPHZvUfSaDVJtJB1uz+2Ho=QZFGiQ@mail.gmail.com>
 <CANiq72no33T6RXMyZ18bS_nVaUcOpWEmu15Bs=+zJPnnhrnYRA@mail.gmail.com>
 <CAK8P3a1UZ9kdyokJWYxdsn-3doO6gVw9Saivm2Adv6P_=xS8jg@mail.gmail.com>
 <CANiq72n0AHks543X7U58Rmtujptcj5TxjNYq4=9Hs6bGmTAZSg@mail.gmail.com> <YOXNPWYN45pphSZ4@lunn.ch>
In-Reply-To: <YOXNPWYN45pphSZ4@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jul 2021 18:34:44 +0200
Message-ID: <CANiq72mwQOgFohrkz0LR=+OUbnnVjTh5SbVe6br9hrrGwGGs=Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Andrew Lunn <andrew@lunn.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 5:50 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> How does that work with -stable? Are you saying that rust patches
> which are backported to an earlier kernel also need to be backported
> to an earlier rustc?

Yes, but changes are only needed if they rely on an unstable feature
and only if that feature changed. If that happens, we should know
about it when we migrate to a newer version if something breaks.

Thus this mainly applies to code in `rust/kernel` and `rust/alloc`,
because we statically enforce that modules only use a fixed set of
unstable features that we really need. Thus modules will not be able
to introduce new unstable features themselves.

Please note that we use unstable features either out of necessity or
because they lead to substantially better code, and only if we expect
them to be stabilized. In other words, we are conscious about it and
trying to strike the right balance here.

Moreover, this problem will go away progressively as features get
stabilized. That, of course, may take a long time. This is why we are
also trying to get support from companies to help fund people to
develop `rustc` if Rust gets into the kernel. Meanwhile, there is
already several people involved with `rustc` that know what we need
and will try to help us as much as possible (and have done so
already!).

Finally, please note that we explicitly say Rust support is
experimental, thus until we mark it as "stable enough", we could
simply avoid promising backports if -stable prefers that. One of the
reasons we say it is experimental is precisely because we need
unstable features from the compiler.

Cheers,
Miguel

