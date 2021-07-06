Return-Path: <ksummit+bounces-237-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAEC3BC957
	for <lists@lfdr.de>; Tue,  6 Jul 2021 12:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 142903E1032
	for <lists@lfdr.de>; Tue,  6 Jul 2021 10:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9EF2F80;
	Tue,  6 Jul 2021 10:16:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0265168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 10:16:53 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id h5so9835522vsg.12
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 03:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rFudlMRqVsFe/B2Ib7n5TbDqeDfS8ypOoj2VMlQlfFE=;
        b=c4I0yLHN7oChyvargdmVhgA+7gc+WfbIT9g8CVxsFmUCG3w1EJfTpNrlljiOocM+Un
         Qo090pU4Rb36Jjy0YaD35w+UQsMPt0pdpHzty2yut7cMmx+D9UXo1MK9ZebGDozr5OZj
         tFelk3W9r18ZH/5RKdbtspOJbNjG3xjuXWJ8y3pomSRvz7qF/LFuuuUs/XC6xkX0D0SY
         vEWAQvohnkF9teUNGsPW8zaitwCcr0DZXZr+NFzVai3pxiJ2KEep7k3H6um8xvjig444
         mm/dye2zVEpHJcbFLDqEuqAKWAxJMtL9k/Eaisno66vs/WeikztUByen9zE7CeJVbbHA
         UCwQ==
X-Gm-Message-State: AOAM530T+G/ovEKrXjLaUgVCGmUn6jGvaMKw/Z1PXUgyfxPokTLE/W9B
	NzRdIeyuz4kfwSS8nlx6jK7yukxqg0GXOLxHdo8=
X-Google-Smtp-Source: ABdhPJywM5emufHeGgvegBefXm5csCR1EeoP5fN7lds5HuNbfeedRhSCZjIr1D68cuIDthUFxBbUBIw2ESfjEPOSyEA=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr13682282vsd.42.1625566612999;
 Tue, 06 Jul 2021 03:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
In-Reply-To: <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jul 2021 12:16:41 +0200
Message-ID: <CAMuHMdU5FOdSj+-d38t3BuPrZsYF0YT-Ff1efYLS3W7yNN_Y6Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Leon Romanovsky <leon@kernel.org>, "a. Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Tue, Jul 6, 2021 at 11:56 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> I.e. you have to compile some pieces of the kernel written in
> Rust to even get to a working kernel.

So this would break all architectures not yet supported by Rust?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

