Return-Path: <ksummit+bounces-763-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFF358F92E
	for <lists@lfdr.de>; Thu, 11 Aug 2022 10:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7481C280C65
	for <lists@lfdr.de>; Thu, 11 Aug 2022 08:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6312F3C;
	Thu, 11 Aug 2022 08:36:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF317D2
	for <ksummit@lists.linux.dev>; Thu, 11 Aug 2022 08:36:07 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id h8so12843315qvs.6
        for <ksummit@lists.linux.dev>; Thu, 11 Aug 2022 01:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=z7TfZDREQMkXm9DVTrJ0VferWrr7wPbP39GAsf81coc=;
        b=T1/Yv1iSxDa5ztNjJJ9DrSi6qjNyD6HVxhiEl/UerPsngPfe2AvvAPCe9fykOsbXsm
         /BhC+fCY3bZ5KTvXnTzrPX79cYpcadNf7Iyz2BrcbFuqWt1jnDyqYRIRfPxts1fLF4Pq
         9dsqFePIBhffLDXwfKJ3CuIjEEdx/MorW5AqFCaXAnLxkScj1/E4Wi5nEozJdzdgg88g
         3LcnKLmQsVVs9lzYK1pkG2ipEoxiodEQhbxeo0fHI2W3BONVOWTAscYtXFYqxfUYhG4j
         OPonm9OnW/KK6w/mD/hJ51lLcYtK09FhcCnjJityqNYKAexjmkjxreOyo6bpLr2J+qLM
         f+Cw==
X-Gm-Message-State: ACgBeo3yvf5vHUkRIMTzKxCRWv9lSgN5w4GYmdf5QLvvvmyGuD507sQU
	oFCBRLxm/C1lqIg1PBGLP9giE14UxBq8PUqv
X-Google-Smtp-Source: AA6agR5yTLei5PD5GsNGzsX6elTC1WaRgJxZtppl1Yh0jg1CfQsNTA+0liGz6davaIQE4UGQagZyxQ==
X-Received: by 2002:a05:6214:c6c:b0:476:99a4:26b9 with SMTP id t12-20020a0562140c6c00b0047699a426b9mr27092848qvj.128.1660206965911;
        Thu, 11 Aug 2022 01:36:05 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id cj20-20020a05622a259400b00339b8a5639csm1281007qtb.95.2022.08.11.01.36.04
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 01:36:05 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-32194238c77so166236187b3.4
        for <ksummit@lists.linux.dev>; Thu, 11 Aug 2022 01:36:04 -0700 (PDT)
X-Received: by 2002:a81:13c2:0:b0:31f:3dc8:e01 with SMTP id
 185-20020a8113c2000000b0031f3dc80e01mr31514987ywt.316.1660206964466; Thu, 11
 Aug 2022 01:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220809171316.1d6ce319@hermes.local> <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com> <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
 <YvObmmmLiX6z8eA3@google.com> <20220810120450.GT3460@kadam> <YvOpfQAUFqjeMGWH@sirena.org.uk>
In-Reply-To: <YvOpfQAUFqjeMGWH@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2022 10:35:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2Ktw5h3Bvsc6iCq8mxLG+yf5BVXLvJts1MboD=eHgaQ@mail.gmail.com>
Message-ID: <CAMuHMdV2Ktw5h3Bvsc6iCq8mxLG+yf5BVXLvJts1MboD=eHgaQ@mail.gmail.com>
Subject: Re: Validating MAINTAINERS entries?
To: Mark Brown <broonie@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Lee Jones <lee.jones@linaro.org>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, ksummit@lists.linux.dev, 
	Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 2:50 PM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Aug 10, 2022 at 03:04:50PM +0300, Dan Carpenter wrote:
> > On Wed, Aug 10, 2022 at 12:50:50PM +0100, Lee Jones wrote:
> > > I am presently plagued with reviews for lots of files that I've
> > > touched over the years.  Even if the changes were trivial.
>
> > > Or is this just an education point?
>
> > Education is not the answer.
>
> > We've got thousands of devs and no one can keep track of everyone and
> > their motives.
>
> I think the issue there is more that if someone sent a drive by patch to
> some driver they'll start showing up in the git history and often get
> CCed on future changes going forwards, which can then result in getting
> copied into further postings done by copying from prior postings.  That
> does feel somewhat tractable to education, at least in the early stages.

And for drive-by changes to Kconfig files or Makefiles, it is amplified
to any other sections in these files :-(

Perhaps scripts/get_maintainer.pl can be taught to only consider the
subsystem maintainer, and ignore git history, for changes to Makefiles
and Kconfig files?

Or move the Kconfig/Makefile bits into the driver sources, next to
the MODULE_*() bits, which I believe was part of Roman Zippel's big
plan when he wrote the new Kconfig system...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

