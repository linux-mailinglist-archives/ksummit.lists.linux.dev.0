Return-Path: <ksummit+bounces-553-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0EC4090A6
	for <lists@lfdr.de>; Mon, 13 Sep 2021 15:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A05E11C0EF5
	for <lists@lfdr.de>; Mon, 13 Sep 2021 13:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835B93FDA;
	Mon, 13 Sep 2021 13:54:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53083FC4
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 13:54:13 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so13364518otg.11
        for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kpD+LLmPIMiBkkIpaix/aZEV41d00lW8J9adf145vFQ=;
        b=bbU4eb++mCMqCB0Qr+4RolunXO8flcI/NghdNtq/0yOASX16mwBMiCFmCiPt9E4SL2
         6LGBTkojwQLZ7fqNQrDj9lG88824U44DBOt++vl3wbievQi4gyxJ1nMyjI7r38Ezufxo
         lTbArTNjdcMNJWKIcAx4uBmN8WJe/3MIpL75c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kpD+LLmPIMiBkkIpaix/aZEV41d00lW8J9adf145vFQ=;
        b=wwLoJHJdP6GRTcuPTmQTu75z9Vr0jt3sdiMxQVlf9sYgxUhS9H2ECr9bw17muQH28H
         I70a1Foiutjcj34UempFKHSrUhkSjWBBT1RS2TKWWIE5A+U0prsDl5QJCsSQFJsJhFAG
         2Ue4CKXHs/sGuZWrWtGqUgOqvYZUVXn8yidL3bzkJo+S8eYKwW1foM/J0AhY9tgUnhTU
         ypPjMLNNHuxoqsUFiXRskN/lAgu1bHwesC0EluukOhEkroT7IBvqQTyHsAujVfOU96j8
         wQEIXTMtCzRpeaq1zYxCV6ppCDfeLImIhvwTItwQzG/i73/Tw6j4H0qvFIUYzdP9Spr1
         mnKA==
X-Gm-Message-State: AOAM531buEyai9axZqus6AyUz9kEShiZo8G9HB1ltSh6yeIrYPOnIONV
	8FqohjMe7v6KvqBOKRKvoEJJimqRM6/tC/cQIXs/Dw==
X-Google-Smtp-Source: ABdhPJxXSJ7EDfuTBHeUvW07RHJpz4F+5vcGrZos+9oyqoR6do/QRZRLhbacBRAiM42dXN0Jb1MwBMIxH/i0q0YJ5Yw=
X-Received: by 2002:a05:6830:156:: with SMTP id j22mr9455591otp.75.1631541252607;
 Mon, 13 Sep 2021 06:54:12 -0700 (PDT)
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
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 13 Sep 2021 15:54:00 +0200
Message-ID: <CAKMK7uFrOpH9NG3XB1dT889r4HrUHaotte1D4Nh2=5tjD9VEpg@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dave Airlie <airlied@gmail.com>, 
	Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Josh Triplett <josh@joshtriplett.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 3:20 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Sep 13, 2021 at 12:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Sun, Sep 12, 2021 at 11:13 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > > For userspace components as well these communities of experts need to
> > > exist for each domain, and we need to encourage upstream first
> > > processes across the board for these split kernel/userspace stacks.
> > >
> > > The habanalabs compiler backend is an LLVM fork, I'd like to see the
> > > effort to upstream that LLVM backend into LLVM proper.
> >
> > I couldn't agree more.
> >
> > A big part of the problem with inference engines / NPU:s is that of no
> > standardized userspace. Several of the machine learning initiatives
> > from some years back now have stale git repositories and are
> > visibly unmaintained, c.f. Caffe https://github.com/BVLC/caffe
> > last commit 2 years ago.
>
> Caffe as a standalone project was abandoned and merged into
> PyTorch, see https://caffe2.ai/. I think this is the kind of consolidation
> of those projects that you are looking for.
>
> > Habanalabs propose an LLVM fork as compiler, yet the Intel
> > logo is on the Apache TVM website, and no sign of integrating with
> > that project. They claim to support also TensorFlow.
> >
> > The way I perceive it is that there simply isn't any GCC/LLVM or
> > Gallium 3D of NPU:s, these people haven't yet decided that "here
> > is that userspace we are all going to use". Or have they?
> >
> > LLVM? TVM? TensorFlow? PyTorch? Some other one?
> >
> > What worries me is that I don't see one single developer being
> > able to say "this one definitely, and they will work with the kernel
> > community", and that is what we need to hear.
>
> I don't actually think this is a decision we can possibly wait for.
> The ones you listed all work on different levels, some build on top
> of others, and some may get replaced by new ones over time.
>
> For a generic kernel interface, we need something that can be
> supported as a back-end for multiple such libraries, and that
> works on more than just one hardware. Most likely we will need
> both higher-level and lower-level interfaces, so that a
> framework (or an application directly) may target one interface,
> but some hardware may not be able to implement this.
>
> One straightforward hardware independent low-level API would
> be the traditional BLAS GEMM call[1] for matrix multiplication
> and its variants (integer, float, bfloat16, ...).  Most of the frameworks
> are able to use SGEMM to do the actual calculation since that
> has optimized versions for most CPUs and GPUs, and most
> hardware accelerators should be able to provide an
> implementation of this that doesn't completely suck. This
> can be used for both inferencing and training.

I think BLAS are too high-level for these. Sure fore perfect speed the
vendor probably wants to have their own BLAS thing, their own NN
optmizer and a heap of other things, but for the low-level userspace
we're talking about here that pretty much doesn't matter. I think a
really good example of this is the compute stack Intel is building:
- level0 is the absolute bare-bones low level driver. For this
discussion here that's enough of a userspace to make at least Dave&me
happy. In 3d this would be vulkan. In AI/NN space, there's nothing
here, at least nothing cross-vendor.
- Then there's the entire OneApi ecosystem on top. Lots of this is
open, some of it is closed, but from the pov of an accel stack it's
all looking like applications, not like driver code. BLAS is sitting
here. For AI/NN this is pytorch, tensorflow and all these higher-level
frameworks (which often have quite sophisticated optimizers of their
won)
- then there's funny intermediate apis like opencl, where the state of
the art is still to implement them directly as userspace drivers on
top of the kernel. Although on the 3d side at least we're getting to a
point where opengl on top of  vulkan is impressively close to an
optimized driver. But for know it's still mostly custom. This is what
AI/NN drivers generally look like, with the high-level library fused
together with the backend. Or the backend being an out-of-tree fork
(which is pretty much always an llvm fork for the compiler side).

Especially BLAS isn't the most impressive, since largely it's fused
multiple-add benchmark and not much else. Ok, enormous amounts of
tuning to perfectly exploit the execution bw and interconnect/cache
hierarchy of your chip, whatever it is. That's often something vendors
don't like sharing (intel's math kernels are still closed afaik)
because it leaks a bit much about actual implementation details of the
chip as opposed to how it's programmed. Also not something I really
care about with my maintainer hat on.

> On the kernel side, this could probably be done inside the
> existing crypto (async), media (mem2mem), or gpu/drm
> interfaces that all provide ways to offload computational
> functions on blocks of memory potentially backed by a dmabuf,
> but having a new top-level chardev interface may be a better
> fit.
>
> A completely different interface would something that lets you
> compile a model into a hardware specific blob in user space
> and then submit that blob into the kernel, using further commands
> to send and receive model specific data. As I understand it,
> this method is roughly what habanalabs and some of the
> other ones do for inferencing. The performance is almost
> certainly better here, but it requires a high degree of integration
> between model, framework, user space driver, compiler and
> kernel driver.
> We already do similar things in the gpu, fpga and remoteproc
> frameworks, all of which could be used here, or we add a more
> specialized interface.

Not even the interface matters that much, there's very little the
3d/compute gpu drivers share there. It's the community of experts that
matters, and the cross-vendor userspace project.

> What the actual interfaces should be I have no clue, those
> two are just examples of what it could be, being completely
> ignorant of what drivers do today. As Dave said, this really
> needs a maintainer that understands both the kernel side
> and what kind of hardware and frameworks exist and
> what interfaces both sides actually require.

So yeah, agreeing here.
-Daniel



>        Arnd
>
> [1] http://www.netlib.org/lapack/explore-html/db/dc9/group__single__blas__level3_gafe51bacb54592ff5de056acabd83c260.html



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

