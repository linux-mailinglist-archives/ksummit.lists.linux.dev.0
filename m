Return-Path: <ksummit+bounces-564-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0240AE96
	for <lists@lfdr.de>; Tue, 14 Sep 2021 15:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id D27673E10A3
	for <lists@lfdr.de>; Tue, 14 Sep 2021 13:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8153FD9;
	Tue, 14 Sep 2021 13:08:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D583FC3
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 13:08:03 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id p15so23741156ljn.3
        for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tEfQKqhEOqxLeMLucMBuPBhbUXwUoi2vQfL1xzKd6ps=;
        b=BkWrtL4w+kdsCPXYM+02jFH+UuR7skrOHTO4CoF+WVY/opIB4E9j4zuznCw/1B1153
         8rAtHI6sbK1FnJD98RKPDDAQLEAkLMPlxGRaSIzURDBvrV+o9iYIJlYJAhDva9hdc5Vr
         OC7JhSBecVTUX0XkaWiaOtxr0qtc19/50K4ASYA9mI6P+aq1XBSJ8CmyuAL+hGIDbGeK
         SdyhSNYHztUexKvrVl9DeK43U2+7xRK86jQ6jsTzhlCGNvZDugSCX0iUCqaXpBuxl5Dg
         vnUXXwd1uA2JJ0iVZfQWA51OA4JaqQeNSru6iu9AGH4mxuieDoNwdZlGF9O6Dvs5HMlf
         Isqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tEfQKqhEOqxLeMLucMBuPBhbUXwUoi2vQfL1xzKd6ps=;
        b=Ih8VaY2xLKb/bopYDKzQ0MoJgxtxmCE1jxn+j0wJAdbN1TWlual0kfjzJS4dXdAWaF
         VP1knhiKCy3wZ64Afesz6jbw/H6yhLAKr6NadBexXCigkqqLAMR63OYpEPbFWqG4Lle4
         Z7AMHDcOPw/1xmriOGBeknq5kdeGaGriOG3LOUwhboB2G6DfDqjSCdFaNupvX4L3XG36
         KZSOq/2yR7XfkfiBo+r8/2vPr6NFSVNzqJAOMTG+3LeGsf9ZLKZZ06mzEAFZIg/oevgi
         0/5n7WA4j3itr2vkMUimp7zjcMXJ2Coov/fd0tEvOUhMUif1Col8qV23WpQsk+NfFI7Q
         YhdA==
X-Gm-Message-State: AOAM530nPwtR1LwzcgP5vAQpuqjpoaeujD6Kp4WfEpnRbkU2h9ClPrWI
	ITmJ7QQupQt1vD4YGuRq7dqL9xqtudCRiA/opJztGA==
X-Google-Smtp-Source: ABdhPJwZ2uqSMHW99bUwuW3Pnkoep060C6jEQojp32uDgOu/noNm5UAB0fOVNqvAxTWtRWHuTxfEU1ak6fA8p0Mawhk=
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr15119085ljo.288.1631624881872;
 Tue, 14 Sep 2021 06:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87ilz8c7ff.ffs@tglx> <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com> <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com> <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com> <YT26ebT6xXWsnVMw@unreal> <YT3/5kJuhw/QVqrw@kroah.com>
 <YT4LgkK+ejUWljEh@unreal> <YT4QCHwnqZL/rl0z@kroah.com> <CAPM=9twpxAP13fEv8BxsSkd4Xcqxu989F3biiPFFDgKRADL0KQ@mail.gmail.com>
 <CAKMK7uHQw8=GKpayxzOJUs4BnwoVDS08Y9bynp6=VH+eW35Pgw@mail.gmail.com>
 <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com>
 <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com> <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com>
In-Reply-To: <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Sep 2021 15:07:50 +0200
Message-ID: <CACRpkdZ_xwCepDXx+2nywzmBqq0ey_5kC9e06m4+ef9k3JUHeQ@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg KH <greg@kroah.com>, 
	Leon Romanovsky <leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, 
	dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 3:20 PM Arnd Bergmann <arnd@arndb.de> wrote:

> One straightforward hardware independent low-level API would
> be the traditional BLAS GEMM call[1] for matrix multiplication
> and its variants (integer, float, bfloat16, ...).

What this (and subsequent posts from Dave and Daniel) show, is
that the general pattern is that what we are accelerating is no longer
the specialized use cases of linear algebra such as 3D "shaders"
or whatever inference linear algebra NPUs are doing, which
appear to include regression, bayesian stuff, gaussian quadrature...
name it.

What we are talking about here is acceleration, using an efficient
data path, of numerical analysis, using tailored hardware.
I'm not even sure we are limited to linear algebra anymore.

Is this what is happening, and should we be thinking numerical
analysis accelerators and their different shapes and sizes
rather than usecase-foo-accelerators, so we don't end up with
this situation again the next time applied math comes knocking
on the door with their next usecase?

Yours,
Linus Walleij

