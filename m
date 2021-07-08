Return-Path: <ksummit+bounces-346-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 609E33C1540
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 773341C0F20
	for <lists@lfdr.de>; Thu,  8 Jul 2021 14:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F6C2F80;
	Thu,  8 Jul 2021 14:36:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33672
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 14:36:06 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id h6so8438521iok.6
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T0y510G4VND5fLpnetNVvxo88ijxd8g2ByoivFPwGQM=;
        b=shqTrwNuvivHwgsXTvyJREyR6j69IuVtHTv6B53zqdcmTJ5zVbUD3awQes/LabSWvU
         WCHIlFOubSl/2gLSuvLKzd6E5ysyJWVJUqMyFR0caGPFLtS4Kpz/i2J0DwxoMzZvBgmK
         o8uOibclAtVLl1+KWSnh6Br5b9xViqWJvamhXKMImPshHwOPFiNqZzszv0jNIec+Q1SN
         raHFKjFO8LT3Q79YiUyuCeR5Nh1L/YApv9zKrQrutrWwiw6INpqsTXQlym3vrSvkry0x
         ALtL+BsJFgLaOsN7AtZYTXxHENN5IIud8ajxDIgO7rs0NKFtAGIREvBDpqPgpHMszfUn
         WAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T0y510G4VND5fLpnetNVvxo88ijxd8g2ByoivFPwGQM=;
        b=igShcqyXSCv4STjaIf3cuvbzhsJEE/7ro3und4+2Xgz8WvLcFjD6T2Qo8njRCJrPr/
         n/SZIYzXLGT5C4VLjAQwM07Sk/YBemCv57EsoyRUZk/kBD8HZ2eAZhhROVGrtkHQxLtf
         d4QDTGhCwfZGXyHvDv4007cNPvyTlVNejocvTNAVnIpL8uZDUEfKt1ZiueSDmPISPgo8
         WqMD88v3fTZWFsqBjelIibAWWokYeS9mewwAdfe8t8S7FY4Ohhgpb+/ZmdH3RYzVszjM
         imCk/3RlB6G+KJcHJnzPszXVZhooLFAqWexg7sT72eYV908nVGbHkCyauvXsAWZvQWSS
         Z9TQ==
X-Gm-Message-State: AOAM533nDk6mcegui3EGh1FSahgmfnMf6jcTAhymNhDWFUCyZqG48QHP
	BM5gXEWIbR/I1loKmzeqn+QKzwA6piqYQfJ8iAw=
X-Google-Smtp-Source: ABdhPJytIirtYCxPgDi/hN3wD3GMxNncM7JmZcchv5j4eEAm0OA5N4rRXx6OtrMpEoptPDoW4xYX5rbY520cE9WY9bc=
X-Received: by 2002:a02:2b21:: with SMTP id h33mr10207161jaa.31.1625754965644;
 Thu, 08 Jul 2021 07:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
 <YOcApBj/puXe3Yig@google.com> <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
 <CANiq72mquf7oVc8hYntYvksuiLDwqUJKvtx7sri6XXgqAAVAsA@mail.gmail.com>
 <CAMuHMdXcL6iYzcL+W9NLkhk+bHXddHna6XYE_Wu6Wun9XKxm2A@mail.gmail.com>
 <CANiq72kGBz=ohqS_YbTGc_CuRGxd-xmim-RT=pHHjMzi=39gSw@mail.gmail.com> <CAMuHMdVeFtRp5tUbErqqyUXz2Mrz8kCc7XbYs4Y6vr8n50A_jA@mail.gmail.com>
In-Reply-To: <CAMuHMdVeFtRp5tUbErqqyUXz2Mrz8kCc7XbYs4Y6vr8n50A_jA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 16:35:54 +0200
Message-ID: <CANiq72mG42G1n7TB+FWyxFxQPaoKWZOq-uXQcLz_CRwny0Ho+g@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> What if I would ignore that? I.e.
>
>     let Some(content) = strong;
>     println!("{}", content);
>
> ?

It does not compile :-)

You can play with it here if you want

    https://godbolt.org/z/MeqznshPx

> Please forgive my silly questions, I'm a Rust newbie ;-)

No problem at all! It is perfectly understandable to ask these
questions -- from a C perspective, it is indeed quite shocking that
this "cannot happen".

Cheers,
Miguel

