Return-Path: <ksummit+bounces-403-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F405B3CE8F2
	for <lists@lfdr.de>; Mon, 19 Jul 2021 19:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id B3A133E11CD
	for <lists@lfdr.de>; Mon, 19 Jul 2021 17:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1502FB6;
	Mon, 19 Jul 2021 17:45:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D3F2FB0
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 17:45:23 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id a7so16757792iln.6
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 10:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oZ4nZ5Zya196ZiwJ1O1F435vpqontSNb8dQ0kD07LgU=;
        b=BCDnVnHjW2hOb4oO0AcWsXWL0x2A8OBDKweWeqIHhWhf1aDfoei56mDHJ2XMYsJK+d
         3VbyrhGEE2DNSP5ZEENaBHLpFVbbwlWdmzNpkuNQkbmGshMLw/BHJHCT0VV55quljSwj
         w1jxw5IGduwc4qywGaEgVCBis00rXlnESnSx69FloB6V3T4U+1XaZEEJjxAh8shHqO94
         xREjpisHO+j9j1yFUuDpfMEq8fUwqu0qK6tC1wMEQgvpEyV2n5SQBMySXtDSthgeSa2n
         /PPDMvWcqQopxZqgFpuF6zNMT5T+IwivOGz0qqut4IYAhzkMdVK3NK8wTnrmTmUZTcIf
         ClKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oZ4nZ5Zya196ZiwJ1O1F435vpqontSNb8dQ0kD07LgU=;
        b=jLx6jxaLm8M9bTH1AhhLHJGJ+Bm7qmo7NKsVlgfaIrOK8UZEGstoZ+67LCU2qxPeB/
         CGudJ+T1x8cQi6uNlCeh/HueKnSmF+yHtixOIJMXMlMjYRDLV3aGZaXVp15ujcR1UeWc
         /XEFnUzX3GSOoTD+FIpA0OJR92+VEIVW7mena6w4yhtPukuEWpdaEAn9UcKMv0A2WdzQ
         V5lvpVbgVpC+XcJC+B9fjT/kJnoKt5fiuzRpHeIK56a7a7rQXc+UBV8LBzNI4L48tx7C
         d+jzE565btgiRvYI2w27z4JCuAqdQKQ5l1Uuo93//HwCJZ26OmcWsvYhwbfYjpY+deZv
         Xigg==
X-Gm-Message-State: AOAM531W+1i5VvZaDeBm2+ez7GeE7HHrb+JVD5EG83wCdFxsN4jjCfou
	sw/ElhIl+SdGil4z1iRANLtQP7Zla2ohw76KaC8=
X-Google-Smtp-Source: ABdhPJybU3cqpG3wFN7It6Iq5nNfrPmMzCMul6s+AWChrY80PMoaJ+5/Yq8WZr5afEW/cxXNGPlVUZkHxbq/S5RZ8uw=
X-Received: by 2002:a05:6e02:de6:: with SMTP id m6mr17921524ilj.203.1626716722378;
 Mon, 19 Jul 2021 10:45:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOX+N1D7AqmrY+Oa@google.com> <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com> <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>
In-Reply-To: <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jul 2021 19:45:11 +0200
Message-ID: <CANiq72ntf=Jf=pRNbHEAt27D744Ew9+-EgqoRt+mXYxB5ohD4w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 6:02 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
> Here you have try_writeb() (and error return) where there was just a
> writeb() without any error handling in the C version. Is this what
> Miguel was answering a bit down the thread where the address is computed
> ((value as u8) << offset) so it _needs_ to use the try_() version?

Not exactly: `((value as u8) << offset)` is the value -- the address
is still controlled by the `try_()` version.

However, the offset given is not a compile-time constant here, thus
the runtime-check is used. Or we could provide an `unsafe fn` which
means the caller would be responsible to guarantee the precondition.
But see next point.

(Actually, from a quick look, there are 3 or so `try_*()` that could
be using the non-`try_*()` version)

> If offset can be anything but a "correct" value here, should there be a
> check for that somewhere else and then the computed value can be
> subsequently treated as safe (i.e. there's a second try_writeb() in the
> function that now presumably does the runtime check a second time,
> redundantly)?

Indeed, that is a pattern that we use all the time to make things
safe, i.e. we create types that hold invariants.

Here, we could definitely keep the information that a given `offset`
is safe and then reuse that knowledge statically.

Ideally, Rust would allow using the loop variable as a compile-time
value if the range is statically known (without unrolling the loop
manually and without a macro).

Cheers,
Miguel

