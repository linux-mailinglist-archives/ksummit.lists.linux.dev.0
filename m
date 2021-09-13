Return-Path: <ksummit+bounces-558-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 0129D40A196
	for <lists@lfdr.de>; Tue, 14 Sep 2021 01:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CCF681C0F92
	for <lists@lfdr.de>; Mon, 13 Sep 2021 23:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567143FD9;
	Mon, 13 Sep 2021 23:33:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE813FD0
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 23:33:30 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id qq21so18704868ejb.10
        for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 16:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j1DDr75YwCef8eajaG5ePyRugpvYv9BdgiIh9Sjm3L4=;
        b=BSq26z4USkf8xMMNCKkZTK5W8pX/lw3xwSUzk78A+7VeiKy0kstYITo+a/lsJ0HuAa
         ivtN6l7O8QJb0C9QA/kPGaVG66qRm3AjTgzjkm4Z/V2aYAm44Wb7/PZpJw+y/bP2bH3H
         1RicPIxBMZQghDpPHJorjyMfiAFV59N0hF2ZV2OpOz50QLlnJbXgo99YFy1t0J9JDm5u
         jCkYnbhVWje6eu7a0hoa8ObIZIMRXOWXAmqZa1MnNn66P+1SygSVlLW7vk9LLksm34o9
         NF7/UQstLPj8RVuP0KYDj55co89p2BuG8gcwANCaY34XQxO4rO+f1PeZ5vv5cqMkHb48
         M89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j1DDr75YwCef8eajaG5ePyRugpvYv9BdgiIh9Sjm3L4=;
        b=1URIGDAfRd2zc47hP7BJyG6TGEjLpw2sFW2VSetziwBO8vU0DPV0feK2UYLnWAkAfu
         FnbS1bUmAiXfgEW1uuR233/fYqCgj4MObHBA8RbW+EFQlTlKl31jnxmkkLbPhQAlq6JB
         mmqs/ZSEQUSzDY6TXXYb8rWcHYSnv5CwPAjBZQW+zQCw4XDS2jsUW8tnHb6F8Akr3VUQ
         r2FqvW/DVvOg9Fyvg7cBhvDMqmu1T6m6KtjOB0V3rRDoMFK7s/qz/Eqf2Z/QIXnfty6P
         389E/LBPo+svFlsgXht6p5lBklRxPL0eOeHRR9kPm1n8R/87auFeyFKkHBjSV0J2pfMP
         DGZQ==
X-Gm-Message-State: AOAM532WT1X2HkpOqBpRjqOoGebxsF/jqri1Uwr1/lIV0nhHmo+kTh3d
	4h2cIF7HHo6iIF2lkVH1NMxsGDChSsWv7TqQtEM=
X-Google-Smtp-Source: ABdhPJw2CzgnxXa1Eljha7gHCmeKUR44oWZS5HLLAwA6zPffl8qh4w8vDkAKB/0bX1pcK8gnyj8HCkJQ9mAuwMsqaTw=
X-Received: by 2002:a17:906:6d55:: with SMTP id a21mr15524783ejt.509.1631576008905;
 Mon, 13 Sep 2021 16:33:28 -0700 (PDT)
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
 <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
 <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com>
 <CAKMK7uFrOpH9NG3XB1dT889r4HrUHaotte1D4Nh2=5tjD9VEpg@mail.gmail.com> <CAK8P3a2pvCwuSic9yevW0xmMy0-F1FEgfQ-_Rc7wWDs7PJEf_w@mail.gmail.com>
In-Reply-To: <CAK8P3a2pvCwuSic9yevW0xmMy0-F1FEgfQ-_Rc7wWDs7PJEf_w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 14 Sep 2021 09:33:17 +1000
Message-ID: <CAPM=9tw3WTUb6R5VaDR002P0QYbcZ0uPETC4r0MPBBqySLe09Q@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Josh Triplett <josh@joshtriplett.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Sept 2021 at 08:05, Arnd Bergmann <arnd@arndb.de> wrote:
>
> >n Mon, Sep 13, 2021 at 3:54 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> > > One straightforward hardware independent low-level API would
> > > be the traditional BLAS GEMM call[1] for matrix multiplication
> > > and its variants (integer, float, bfloat16, ...).  Most of the frameworks
> > > are able to use SGEMM to do the actual calculation since that
> > > has optimized versions for most CPUs and GPUs, and most
> > > hardware accelerators should be able to provide an
> > > implementation of this that doesn't completely suck. This
> > > can be used for both inferencing and training.
> >
> > I think BLAS are too high-level for these. Sure fore perfect speed the
> > vendor probably wants to have their own BLAS thing, their own NN
> > optmizer and a heap of other things, but for the low-level userspace
> > we're talking about here that pretty much doesn't matter.
>
> I suppose high-level vs low-level is not the correct distinction here,
> it's more like fixed-function vs programmable.
>
> As a fixed-function interface, something like GEMM is probably as
> low-level as you would want to get, as it's big enough to make sense
> as a single atomic command, but small enough to be able to build on
> top of it.

The distinctions is more programming model than fixed vs programmable
in rough order of complexity

a) device is MMIO programmed and can process one thing, kernel needs
to mediate between exclusive users (big lock, initial drm subsystem)
b) device has a queue that can process untrusted userspace command
with no memory safety (old drm drivers, in-kernel command stream
parsing)
c) device has queues, contexts, memory safety, virtual address space
(newer drm drivers)
d) device has full preempt on all hw blocks, is fully coherent, can
trigger paging sanely, userspace can submit directly (pipe dream).

What the device processes is of little consequence to the kernel
driver model. the uAPI of course needs to reflect the above along with
what the device can program. Since there could be a queue for a DMA
device that isn't specificed but can be programmed to DMA random
system memory.

Devices in category (a) are the sort of things that can need kernel
interfaces like a GEMM or BLAS level, however there is no point having
an interface at that level for any of the b/c/d device. That interface
needs to be in userspace somewhere, level0 or something like is
probably where things will end up, and the type (a) devices will die
out.

> I realize that fixed-function is not fashionable on GPUs, but they
> are widely used in other areas (video codecs, crypto, ...) even when
> you are running precompiled code on the accelerator hardware.
> This would of course replace the question of open source user space
> with the question of open-source firmware, as the user side would
> become mostly while the accelerator goes from dynamically created
> to a firmware blob.

We have lots of fixed function on GPUs, video codecs are on most x86
GPUs. It's how you program them that matters, most of them are behind
queues similar to the 3D engine, so you program them the same way.

What isn't fashionable on GPUs is programmable blocks that are single
user that only the kernel can program one user on at a time, since hw
has long since left that model as desirable. There are some AI
accelerators going doing the same path, but eventually they'll have to
be shareable and catch up with GPU programming models to remain
competitive.

Dave.

