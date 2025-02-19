Return-Path: <ksummit+bounces-1698-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B47A3BFE5
	for <lists@lfdr.de>; Wed, 19 Feb 2025 14:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 302C816BD84
	for <lists@lfdr.de>; Wed, 19 Feb 2025 13:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257261E8345;
	Wed, 19 Feb 2025 13:26:16 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37201E3DFA
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739971575; cv=none; b=WRBcReTPRRGR97MXFwZ/seDgmBMUIjicR/RytcOyIQhAQ9FhOIOzDRPgxkjq1eUUxwguaVplQuqvjDBHLRILOU2B4yLKjz6ky00J3JtU91jNbBZxjb0VCqrbOHMtWXdy1cbtMdoJ8PuXA2S6CJQWIQxWijRCjPqD6hWn5Gv16Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739971575; c=relaxed/simple;
	bh=HYlKWCDdRQA017nK/x1uUpaYrn41MgwmoI5QgAxA2hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exJhKizVnIZIAU6Hns7i1fbNi509hjAtj7eE7+7P+8Haph+e4prU4Bv2uBuUQIY1X2YwM887n0nk7mVtcK1NR0ZHs/Sp/mh1q7Q1XWsJIHyY40/T7hRRXgh/9cu+uAUtXCKkqOA2ScdK8R9wgOy8oUwKZtCuz7YxGg7aTWbKnJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso4421528e0c.3
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 05:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971572; x=1740576372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOe7FxW1+GHMaHIpdwnQzHku6W752ees95gkUS64ZLg=;
        b=gIkjqUkrC4ooCEo8/YM/PAaZPomuDmZ3litij46a3j1ddQWOCXeZA1PqWOCdhKyNiB
         ITFK/NC+aSF0pjHeAYg+hrQCOI1z7I0xsoK96advxmKeNoXp8fXonTvBGgBVjjmHEwfD
         ik/ZUu5rO9/Lrcw5aufiZ3b7fneA0mC6xHJEqITSZk5N/jMP+BO06f91lwmWbCXzt4r4
         coxmqw2P95m6nJ4CLEM3ThPUOWJvZOHZXYkwlVebYwuSAOGDVZbICFBEh6CwZGmH2XvV
         cduTcQCvr4n5TsjcXgJh4uTEgvDNbM4hpAIFeekPldSP/bRTzHHzCuPGbxLr57xpT9Cr
         1K0w==
X-Forwarded-Encrypted: i=1; AJvYcCWRjHGCCb9CciPnCU1EAeGiolYikipj4sPa6Xz3TD14LGIiAX/GCV7TyIMJuqN/zbX4YTpZa0+W@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0RkV7179NoHjDeP/dh7EW1+f00+qv9QGmwLCs2ukcprRnodEa
	58dbsGd6nkk8UDqoVtfJp10jgodZglKJCzUuDg3drk2deXXZbRJuAczJNA0P
X-Gm-Gg: ASbGncsdhxd6F0RaNX2SxSfy7hMigS6RnW7YvZqdhIJ/t/XijV9Bg9BA7KuqPhrFA00
	Fb2R0j+rt3fDySvfizovvHEEYVt/yCk/0fs0FAiO7g/d30LOb4VoBnkNN6AjEhGQCyS5J9oGH0F
	0Wnomkjw3ytzb9A+aREJHvgubVZaKX5Ir11RtVVnedQQPaS/CRLdMAt3Qm9C8O1Rg+FzWDFLecX
	35WPgoD7nWmfqYGhv0iJUg6gR+2X+hFZbUtQjolpHzEJsb060lplCSPz498Tit7HZS5tvLbtg6o
	Fjoi51BSpSUACNvriSprZajxU/2XuF1iJc3vU4J9ZFC8PTnAujqnQQ==
X-Google-Smtp-Source: AGHT+IF9Ttoaa5VyonkUJ0SUQIujYCxSpP3+PVQsB0cIpFsJePuoIhdtm5T+a0+a5N8xuYXXdXTB4Q==
X-Received: by 2002:a05:6122:6606:b0:51d:e9c0:e607 with SMTP id 71dfb90a1353d-5209daed0bemr9869879e0c.4.1739971572438;
        Wed, 19 Feb 2025 05:26:12 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5208be87693sm2751247e0c.4.2025.02.19.05.26.11
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 05:26:11 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-869440f201eso320526241.3
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 05:26:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFGX3pPgI8DIt5dsbRwTnKkOUCpM+Z/T+gDMusQpF9JWNI6n9ZIrHDTeGkLKperYz68x8RigAq@lists.linux.dev
X-Received: by 2002:a05:6102:80a3:b0:4bb:edc9:f95c with SMTP id
 ada2fe7eead31-4bd3fd57f40mr9878304137.15.1739971571449; Wed, 19 Feb 2025
 05:26:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7SwcnUzjZYfuJ4-@infradead.org> <36783d51be7576fcdbf8facc3c94193d78240816.camel@kernel.org>
 <4cbd3baf81ca3ff5e8c967b16fc13673d84139e8.camel@kernel.org>
 <e63089e15c6f4d19e77d2920d576e0134d8b7aa7.camel@kernel.org>
 <Z7T5_WGX_VXBby9k@boqun-archlinux> <615ce44fa528ad7be28ba518e14a970f04481078.camel@kernel.org>
 <CAPM=9txBg1m=qp9=nHJXS1h2XB8TSL1tj6CF=Z802u=YX7hBDg@mail.gmail.com> <c84254c0164de551189a1f92ddec71f5dc222e42.camel@kernel.org>
In-Reply-To: <c84254c0164de551189a1f92ddec71f5dc222e42.camel@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2025 14:25:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWNQfmNgMBkkMezeUt573fczzyf7FhXKEo7621xuhWC4Q@mail.gmail.com>
X-Gm-Features: AWEUYZn4XOlU3xEA8NygLrT4kEbl_JLjkhKpcGEqNeKU7F_TibfeVbW1m0EArKo
Message-ID: <CAMuHMdWNQfmNgMBkkMezeUt573fczzyf7FhXKEo7621xuhWC4Q@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jarkko,

On Wed, 19 Feb 2025 at 12:39, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Wed, 2025-02-19 at 16:35 +1000, Dave Airlie wrote:
> > On Wed, 19 Feb 2025 at 16:20, Jarkko Sakkinen <jarkko@kernel.org>
> > wrote:
> > > On Tue, 2025-02-18 at 13:22 -0800, Boqun Feng wrote:
> > > > FWIW, usually Rust code has doc tests allowing you to run it with
> > > > kunit,
> > > > see:
> > > >
> > > >       https://docs.kernel.org/rust/testing.html
> > >
> > > I know this document and this was what I used to compile DMA
> > > patches.
> > > Then I ended up into "no test, no go" state :-)
> > >
> > > I put this is way. If that is enough, or perhaps combined with
> > > submitting-patches.rst, why this email thread exists?
> >
> > There is users for the DMA stuff (now there should be some more
> > tests), the problem is posting the users involves all the precursor
> > patches for a bunch of other subsystems,
> >
> > There's no nice way to get this all bootstrapped, two methods are:
> >
> > a) posting complete series crossing subsystems, people get pissed off
> > and won't review because it's too much
> > b) posting series for review that don't have a full user in the
> > series, people get pissed off because of lack of users.
> >
> > We are mostly moving forward with (b) initially, this gets rust folks
> > to give reviews and point out any badly thought out rust code, and
> > give others some ideas for what the code looks like and that it
> > exists
> > so others don't reinvent the wheel.
> >
> > Maybe we can add more rust tests to that particular patch series? but
> > this is the wrong thread to discuss it, so maybe ask on that thread
> > rather on this generic thread.
>
> Here's one way to do it:
>
> 1. Send the patch set as it is.

You mean the series from b) above, right?
(To be repeated for each subsystem for which you have such a series).

> 2. Point out to Git tree with branch containing the patches + patches
>    for e.g. driver (hopefully for something that QEMU is able to emulate)
>    and other stuff/shenanigans that allows to test them.

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

