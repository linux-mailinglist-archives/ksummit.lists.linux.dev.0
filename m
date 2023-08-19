Return-Path: <ksummit+bounces-1032-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAAC781A8F
	for <lists@lfdr.de>; Sat, 19 Aug 2023 18:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08EC028176A
	for <lists@lfdr.de>; Sat, 19 Aug 2023 16:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E38417AC9;
	Sat, 19 Aug 2023 16:36:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C94B11C98
	for <ksummit@lists.linux.dev>; Sat, 19 Aug 2023 16:36:49 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-523b066d7ceso2326058a12.2
        for <ksummit@lists.linux.dev>; Sat, 19 Aug 2023 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692463008; x=1693067808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xZ399YqUKXNCuUQKkIutHLFmLwZABYD5nu1OifYAj0c=;
        b=GSxOP++BMGJk0rcnLNyDcJA7Q6+KiYTynLNbrXrqQQkP7s4vT2PsC9RsS3RkuifsoZ
         FJWaQVwuxohvmcTM+Cxy4jXmNEVN+wWgaygfA7imrxpvZDxVYaclCxrsNkNIzhlw/SF/
         Ja35RousEFbGkPXWa+7uGmsRBLJ9BLk/3+wWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692463008; x=1693067808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZ399YqUKXNCuUQKkIutHLFmLwZABYD5nu1OifYAj0c=;
        b=b5CiPNAMnwGBVQOcHIbWDMN+UUMd1e7pqG0fwmnstUFv36Cdr+zBZe0enPtD9+yqgr
         /JcfrKUgEkUCiXiadl6ZGpvqUFLvRUeeKn83Sv7Ti+2VKQaFl90fHvaQqWDJNOZoancd
         XOejlSAtbU7qAUtJL9Px01Y0A6PxBLcXBuhYLeqr1U3XrvLEr7tLa+gfCM8+dvH2y9Cf
         mcncPNlpVuualnQKzXfdkw376pFg5CukdP8fdnkGN8M0NJ+R/tIMq8fSjCHmDt4PHo/X
         qtVf09+kxfaZKG/QPYOLQT+qm8M/ftQdWa/y28ed8Gqwlm1S2nWo3tWt3OyPVdr4Pc+8
         qYIA==
X-Gm-Message-State: AOJu0Yyfe3Wv3T594adHrazi9208xkAtHD9yrtStPuBO3wWy0q6BbqpU
	Q7Gz0ebfxU69vdU4sqEJKE0YbnA9GUQa6T0Tj/QqwJet
X-Google-Smtp-Source: AGHT+IGjthYTPhx9JS3QOudzt3xtgp3H6e/RebbPNkJfghW8M3aq+mxg3Mwk2vNfSyASHyTdINo0qQ==
X-Received: by 2002:aa7:d651:0:b0:525:bbc0:2a8c with SMTP id v17-20020aa7d651000000b00525bbc02a8cmr1832688edr.33.1692463007852;
        Sat, 19 Aug 2023 09:36:47 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id j21-20020aa7ca55000000b0052596c88941sm2796350edt.39.2023.08.19.09.36.46
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 09:36:47 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so255573366b.2
        for <ksummit@lists.linux.dev>; Sat, 19 Aug 2023 09:36:46 -0700 (PDT)
X-Received: by 2002:a17:906:2921:b0:99c:f966:9ea2 with SMTP id
 v1-20020a170906292100b0099cf9669ea2mr1587234ejd.25.1692463006695; Sat, 19 Aug
 2023 09:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZN9ZfUVHrRhd+btc@shikoro> <CAHk-=wgQKBvXaSNVxy-2Q3KYeTbv-CGSTf3LSV3=O5howAPifA@mail.gmail.com>
 <ZODsKnm7B1Q0aPbx@shikoro>
In-Reply-To: <ZODsKnm7B1Q0aPbx@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Aug 2023 18:36:29 +0200
X-Gmail-Original-Message-ID: <CAHk-=whAAQi8EtCbaXx6rn63EfrvpeB10fQKqGCH1x8JfdM60g@mail.gmail.com>
Message-ID: <CAHk-=whAAQi8EtCbaXx6rn63EfrvpeB10fQKqGCH1x8JfdM60g@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Transparency when rejecting patches without
 technical reason
To: Wolfram Sang <wsa@kernel.org>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Aug 2023 at 18:22, Wolfram Sang <wsa@kernel.org> wrote:
>
> I hope you understood that my wish for transparency was not about
> discussing if the patches should have gone in or not. It is about
> discussing or at least stating which reasons we have for not accepting
> patches.

I don't think there is any value at all in discussing hypotheticals.

But I will say that the next time some has-been superpower ends up
with a premier that goes crazy and starts attacking other countries,
we'll do the same thing.

So that's certainly _one_ reason to not take patches.

But let's hope that one reason ends up never being relevant again, and
as such not really worth discussing (and it's sure as hell not worth
debating).

And other reasons? I don't think most people had "Russia ends up going
rogue, so kernel developers stop taking patches from state-sponsored
actors" on their bingo card in 2021. I certainly didn't.

So unless you have a crystal ball and can predict what the next event
that would cause us to not accept patches would look like, what is
there to discuss?

That's kind of my point.

The Russian situation isn't worth discussing - anybody who wants to
debate it is simply not anybody I want to spend one second debating
*with*.

And any future situation is so hypothetical as to not seemingly be
worth discussing either, unless you have some inside information.

We'll have to take them as they come, and the best we can probably do
is to just hope we don't ever see anything similar in the future.

               Linus

