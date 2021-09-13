Return-Path: <ksummit+bounces-551-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE39408D89
	for <lists@lfdr.de>; Mon, 13 Sep 2021 15:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AD4B01C077A
	for <lists@lfdr.de>; Mon, 13 Sep 2021 13:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C55E3FDB;
	Mon, 13 Sep 2021 13:25:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686993FC4
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 13:25:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MmU5P-1mq4IF3ovZ-00iXf6 for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021
 15:20:26 +0200
Received: by mail-wr1-f49.google.com with SMTP id g16so14699581wrb.3
        for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 06:20:26 -0700 (PDT)
X-Gm-Message-State: AOAM530kqCdGpo2wq5iNSHVOjEWM56VuyZN3Zw/VE1yuC3OU2/BJRY8z
	OxYX3q0uvWZdmv59uptbKxnqRFgklYhAqoVVFTc=
X-Google-Smtp-Source: ABdhPJx06dI7kCJRWsHm+PNusUvKlEQmCoukDx4azHzjdnmJ7gOSJoNATt5dO+fzxh/BqughtZaQ7ymHQ/dy9y48ATs=
X-Received: by 2002:a5d:528b:: with SMTP id c11mr12071865wrv.369.1631539226333;
 Mon, 13 Sep 2021 06:20:26 -0700 (PDT)
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
 <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com> <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
In-Reply-To: <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Sep 2021 15:20:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com>
Message-ID: <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg KH <greg@kroah.com>, 
	Leon Romanovsky <leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, 
	dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EjLWFGn5wYKUE95KcxXvX6V7tPlptdZCu3ToSiVYPxyJ0XOM2/y
 KawATE6oVZXP4IqjevvK0hz++jnfn70cYZxlN1eLgJ8rUPi1JWjsIqMNuRf5EA+39rrOVxJ
 OWOrPaB08U9RC73IUG+w1cEgmaA3q/CO5CjDnnA1iPdhI0DN1Tzkl4Aqc6rCQdrajVg03SA
 SvF+8BUwFV1UDgL140VmQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/NYdRsTDjwA=:+yLOXjIRggw/HQSM1arfPP
 PfeWktI+dkT/srVqKVZC6JypCZh7/96lAaGT4+iCrSlxi4NrsM9iVGhhvqGr+y4ydchmyUMCw
 86duxwU4nv9qKuPiP/DJyc8jJgXyfQeNqilnh/C8rNm7IcO9klKkI9IJJdUuS5nlpo56UFxoF
 /xHdGg5fAqM4NX+8oja36iqd0fin9AzJlLQyW26PhO9w/e1vXgJpaPzblRhjp2NjWOp7FPuHU
 LpvdnTtzkrYDDuQLPl4XN/o3h/ECEAF/xHf4sa9oq8yNKDA8jlgbMW4ZbpFsVgIrengGll69c
 gF1wa21/WszUCQaj9Z5HzBRlwncA7XutZ4rzugO41fZiwqdnGNHwD6bUXN0e/K0k9jsLNFACd
 tQKGLBc2ok8AM0XeEP8JWDp2pr+0TY+MZc2kjLx82cocq4bFWkdFycvd6ep552789USXlkzDq
 zLXvhwIaNM5LnTlHyiMKctgpcsUmSv2FDJuK3Ss05aCHOPP5NahLomKnaNp9IWpMVlyFMHr6R
 +ib4HOaVh9akK/2W4vlkTd3WzVWBpFXQr4VejI/kHtps2wfVdf43KyDt7DO3d9q2xp2a+TLV1
 hTSeArdLCavbm0kM/QXm+7VIK3YVM0S3GMBBRMmC/d4aWDZ9hGVeJ1Ife9EKaDk5Y7YyibgAy
 NvI64+J2PfzcGZqNzfilsA33/oSGUyi6TU5oVqUHYNo8czN9ncbuUFXKQ3mVkhhJWC4MRQMDB
 k+KQzpXRNrU0Pybk4FrUKH0THBxrRNi+yHQ077sT1kJjtZH4/63BAomoODbUR6LffysVcOhfv
 GcYwoHQnEum0BL88AxnunluBpN2Cf7F9GedexO+8+G4t/eyoy/+XYpV/tebL9rlSr+kDMTBeR
 8HQ4ZRvL3CgNsjd4HHWA==

On Mon, Sep 13, 2021 at 12:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sun, Sep 12, 2021 at 11:13 PM Dave Airlie <airlied@gmail.com> wrote:
>
> > For userspace components as well these communities of experts need to
> > exist for each domain, and we need to encourage upstream first
> > processes across the board for these split kernel/userspace stacks.
> >
> > The habanalabs compiler backend is an LLVM fork, I'd like to see the
> > effort to upstream that LLVM backend into LLVM proper.
>
> I couldn't agree more.
>
> A big part of the problem with inference engines / NPU:s is that of no
> standardized userspace. Several of the machine learning initiatives
> from some years back now have stale git repositories and are
> visibly unmaintained, c.f. Caffe https://github.com/BVLC/caffe
> last commit 2 years ago.

Caffe as a standalone project was abandoned and merged into
PyTorch, see https://caffe2.ai/. I think this is the kind of consolidation
of those projects that you are looking for.

> Habanalabs propose an LLVM fork as compiler, yet the Intel
> logo is on the Apache TVM website, and no sign of integrating with
> that project. They claim to support also TensorFlow.
>
> The way I perceive it is that there simply isn't any GCC/LLVM or
> Gallium 3D of NPU:s, these people haven't yet decided that "here
> is that userspace we are all going to use". Or have they?
>
> LLVM? TVM? TensorFlow? PyTorch? Some other one?
>
> What worries me is that I don't see one single developer being
> able to say "this one definitely, and they will work with the kernel
> community", and that is what we need to hear.

I don't actually think this is a decision we can possibly wait for.
The ones you listed all work on different levels, some build on top
of others, and some may get replaced by new ones over time.

For a generic kernel interface, we need something that can be
supported as a back-end for multiple such libraries, and that
works on more than just one hardware. Most likely we will need
both higher-level and lower-level interfaces, so that a
framework (or an application directly) may target one interface,
but some hardware may not be able to implement this.

One straightforward hardware independent low-level API would
be the traditional BLAS GEMM call[1] for matrix multiplication
and its variants (integer, float, bfloat16, ...).  Most of the frameworks
are able to use SGEMM to do the actual calculation since that
has optimized versions for most CPUs and GPUs, and most
hardware accelerators should be able to provide an
implementation of this that doesn't completely suck. This
can be used for both inferencing and training.

On the kernel side, this could probably be done inside the
existing crypto (async), media (mem2mem), or gpu/drm
interfaces that all provide ways to offload computational
functions on blocks of memory potentially backed by a dmabuf,
but having a new top-level chardev interface may be a better
fit.

A completely different interface would something that lets you
compile a model into a hardware specific blob in user space
and then submit that blob into the kernel, using further commands
to send and receive model specific data. As I understand it,
this method is roughly what habanalabs and some of the
other ones do for inferencing. The performance is almost
certainly better here, but it requires a high degree of integration
between model, framework, user space driver, compiler and
kernel driver.
We already do similar things in the gpu, fpga and remoteproc
frameworks, all of which could be used here, or we add a more
specialized interface.

What the actual interfaces should be I have no clue, those
two are just examples of what it could be, being completely
ignorant of what drivers do today. As Dave said, this really
needs a maintainer that understands both the kernel side
and what kind of hardware and frameworks exist and
what interfaces both sides actually require.

       Arnd

[1] http://www.netlib.org/lapack/explore-html/db/dc9/group__single__blas__level3_gafe51bacb54592ff5de056acabd83c260.html

