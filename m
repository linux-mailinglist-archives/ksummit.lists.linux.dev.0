Return-Path: <ksummit+bounces-571-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108240B850
	for <lists@lfdr.de>; Tue, 14 Sep 2021 21:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6D4421C0A44
	for <lists@lfdr.de>; Tue, 14 Sep 2021 19:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751313FD8;
	Tue, 14 Sep 2021 19:45:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCFE3FC4
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 19:45:55 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id t2-20020a4ae9a2000000b0028c7144f106so35008ood.6
        for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 12:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iOM/DAX9+y99JQqQuqZZHCsvRDQS4+60eYm2uU/gvLs=;
        b=KN1NvlzF6Der2ATy0TyRZHmjveqczjGq/3hcdLDHeEtoax3tgbIuEIdU2mmrWCBs/h
         yJhVYeSgNm3CiuhY72wYjInwZOiIkFGl0P060qDcqeNRV9prHGTjHr2jGNYiFKDisZlI
         As/ts5LPWROQaicniOJBlZ2mCXAouWl/NMKeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iOM/DAX9+y99JQqQuqZZHCsvRDQS4+60eYm2uU/gvLs=;
        b=SMMe/003QXL+MDr4KeCC0YuLFIOJznUQ8tBJJ6Oxs3TOjcs8uI4smX1pCVSmLaB5Br
         SkD2loHxqISvfpZzza6A0vXv4097cpgm1PzWFTJqHGTRG6Ik/kpXnT1ZeFiToGedY1j4
         eurVPbIRnPpd94lHQk5GNKRB14+XrIK3S6r9+b9qzhA6WfK7QHnFwZ4ZFWw9FYOyaOY5
         lOnhVKYuLQPGpuUHCIA31t3+N890wVkIo/oR3JJU2BtrXRIqLtg/AjdtePgB+Gpy6+jN
         iYV4muJa/wP7+IPhjU7BZPAxQX6kvCOrNQs7QS2+Cv8m5ASlZreYakLFaaUE6azco+dl
         KWyw==
X-Gm-Message-State: AOAM531GbDA4BoyLJZKF0lwqQNdY7tHvAHNNN62X/PVKorD1+pYm4J04
	IbmZGv6P79ILcLc299899h5jmCpHYMfheFIK03RinQ==
X-Google-Smtp-Source: ABdhPJzEVO5GZnJhs/TrGT3IBeXKNJ4TELSHSAm7sI1F56pJLgreas1xWZWBvNynSCHxJFUBMMU+0vxdv8oiEItARhY=
X-Received: by 2002:a4a:dc51:: with SMTP id q17mr15270869oov.10.1631648754512;
 Tue, 14 Sep 2021 12:45:54 -0700 (PDT)
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
 <CAKMK7uFrOpH9NG3XB1dT889r4HrUHaotte1D4Nh2=5tjD9VEpg@mail.gmail.com>
 <CAK8P3a2pvCwuSic9yevW0xmMy0-F1FEgfQ-_Rc7wWDs7PJEf_w@mail.gmail.com>
 <CAPM=9tw3WTUb6R5VaDR002P0QYbcZ0uPETC4r0MPBBqySLe09Q@mail.gmail.com>
 <CAK8P3a2rATGsoQWGMESMWChQ317YKpryyVTwxkU8J1sUajxf-w@mail.gmail.com>
 <CAKMK7uF8doVEPOmm1Do5Qa+JZ7Lji6Runw5F=wrxeVjrsMLLSw@mail.gmail.com> <CAK8P3a2REUBb9yr4c2W2txwX4Ki3aOb2x1SiWhMkWb+5Gk7Qfw@mail.gmail.com>
In-Reply-To: <CAK8P3a2REUBb9yr4c2W2txwX4Ki3aOb2x1SiWhMkWb+5Gk7Qfw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 14 Sep 2021 21:45:42 +0200
Message-ID: <CAKMK7uHxbN8DQkgQn6QyjEWijRKnK9p0eqcHOTr1D9D0F=3M6g@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dave Airlie <airlied@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Josh Triplett <josh@joshtriplett.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 2:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Sep 14, 2021 at 11:23 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Tue, Sep 14, 2021 at 11:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > > I can see two reasons why one would want to support a type (a)
> > > interface even with the more versatile devices:
> > >
> > > - It can be done in a generic way so that simply adding a kernel
> > >   driver and loading some firmware into it makes existing user space
> > >   software work out of the box.
> > >
> > > - It gives the manufacturer a way to get an upstream kernel driver
> > >   without open sourcing their firmware (a.k.a. compiler and user
> > >   space driver). Whether you consider this a good or bad thing is
> > >   of course a matter of perspective.
> >
> > I think for some embedded use-case this makes sense, especially around
> > media stuff.
> >
> > I don't think it's BLAS, because on the compute side you really want a
> > compiler that sees through the entire thing and can optimize it. Afaik
> > BLAS is for some quick prototype of matrix algorithms and most
> > importantly, for the top500 list :-)
>
> It's probably not the only thing you need, but I would assume something
> like sgemm and its variants are one of the building blocks you'd need
> in this kind of interface. Note that oneDNN also comes with a
> simplified interface similar to gemm[1] as well as straight wrapper around
> gemm itself.
>
> There are definitely frameworks that are successfully built just on top
> of NumPy and blas (with NumPy itself being built on top of blas).
> I used to make fun of linpack as the supercomputer benchmark that
> has no practical use, but in the end it does spend most of its time in
> the SGEMM function that is the most optimized algorithm in the world
> and that is also where you end up spending your cycles in many AI
> applications. I found a link to this blog post[2] explaining why this is still
> used everywhere, and this matches what I've seen elsewhere, but
> unlike me, the author seems to know what they are talking about ;-)
>
> To get back to my own question from earlier about which part of oneAPI
> is actually being used, I see that pytorch (to pick a common framework)
> can use either mkl (oneMKL, BLAS) or mkldnn (dnnl, oneDNN) as a backend,
> next to cuda, cudnn, openmp and certainly a number of third-party
> backends.
>
> The mkl backend seems to mostly be a wrapper around cblas_*gemm(),
> though I may be reading that wrong.
> The oneDNN backend operates on a higher level, calling into a
> subset of the oneDNN interfaces. The other frameworks I looked at
> (mxnet, tensorflow) look similar, probably each using other subsets of
> oneDNN.

Hm I didn't know that in practice it's all just matrix multiplies in
AI land too. I thought there's more fun going on here, but I guess as
long as you have dense (enough) networks it's fully limited by the
matrix multiply step and nothing else matters. Thanks for the
references.

I still dont think BLAS is what you want, except for a very specific
NPU thing in a soc maybe that can't do anything else than actually
matrix multiplies in hw. The reason is that vendors are most likely
not going to give you the optimized kernels, and the dumb kernels are
very boring (just multiply-add in a loop). So for anything somewhat
programmable you want want level below that, or it's just not very
interesting as userspace demonstraction vehicle for your kernel
interface. Also there's generally quite some featurs in the command
streamer (inter-engine sync as just one example), so a gemm ioctl call
(or whatever you pick from blas) is definitely not what you want for
anything that has a command streamer in hw.

But I guess for the various NPUs that pop up in socs all over a
limited blas interface with documentation might be good enough.

> > > > We have lots of fixed function on GPUs, video codecs are on most x86
> > > > GPUs. It's how you program them that matters, most of them are behind
> > > > queues similar to the 3D engine, so you program them the same way.
> > >
> > > So these would go through /dev/dri instead of /dev/media0? I can definitely
> > > see a lot of codec drivers in the kernel that use a /dev/media interfaces,
> > > and the tradeoffs between those two seem very similar to the tradeoffs
> > > you get for machine learning accelerators.
> >
> > Yeah we have plenty of codes running on top of /dev/dri0, with all the
> > magic in userspace.
> >
> > They are all very far away from anything that is a machine learning accelerator.
>
> Sure, I only meant the relation between dri codecs and media codecs
> is similar to the relation between the ways one can implement the AI
> accelerator APIs.
>
> > Yeah for those I think a more fixed uapi like drivers/media has a lot
> > of makes sense. What I don't like is when vendors then use that excuse
> > of "oh you only upload a fixed model at boot" to shovel in an acccel
> > driver with full generic interface, but not all the userspace
> > bits&pieces. There's unfortunately another accel driver in
> > drivers/misc for qualcom soc, which really should be either a media
> > driver (for the fixed function use-case) or a drm driver (for the
> > fully programmable) use-case.
>
> I would argue that for the fixed-function use case, the media subsystem
> isn't a great fit either. It would probably work just as well (as would the
> crypto subsystem), but having a distinct interface that does just
> one thing makes more sense conceptually, if only to make it clear
> where to look for such drivers and to have a consistent interface
> documentation.

Yeah for tiny soc NPU a fixed interface might work out. Would need
some benchmarking to check the ioctl overhead isn't too bad, I guess
worst case the new uring ioctl stuff could be used for real fast
dispatch. I've seen an nvida npu (but not sure that shipped anywhere)
and the arm npu that Linus mentioned somewhere else with open enough
drivers to make this possible.
-Daniel

> > I think for the fixed-function interface case you can also make a
> > reasonable argument that just documenting that fixed interface and all
> > the parameters is good enough. But as soon as the interface becomes a
> > generic "submit workload" style thing because you want to make it work
> > for an entire set of "firmware" compiled by your closed stack, that's
> > out of the window.
>
> Right, agreed. If we add a fixed-function interface, that should ideally
> not allow any vendor specific extensions at all, just a set of well-defined
> operations, and certainly not a bypass mode that gets used to
> send compiled binaries.
>
>        Arnd
>
> [1] https://oneapi-src.github.io/oneDNN/dev_guide_matmul.html
> [1] https://petewarden.com/2015/04/20/why-gemm-is-at-the-heart-of-deep-learning/



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

