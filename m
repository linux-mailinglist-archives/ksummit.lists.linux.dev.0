Return-Path: <ksummit+bounces-563-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD3340AE77
	for <lists@lfdr.de>; Tue, 14 Sep 2021 14:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A678E3E0FFD
	for <lists@lfdr.de>; Tue, 14 Sep 2021 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5463FDA;
	Tue, 14 Sep 2021 12:58:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1494F3FC3
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 12:58:41 +0000 (UTC)
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MJW18-1mAmzW3AXw-00JqDE for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021
 14:58:38 +0200
Received: by mail-wm1-f44.google.com with SMTP id e26so9200989wmk.2
        for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 05:58:38 -0700 (PDT)
X-Gm-Message-State: AOAM530FtE9ybVgQCq3VKLKqF4GTai9Vh1MgWoUF7ASCkLz+PXOfqv2q
	562rw8GRrwhP1CYW3vuObB2J3Ok6sRAnVXXjFo0=
X-Google-Smtp-Source: ABdhPJxqI0wdF2lHbVwYpyFMYWIT54bcvH/sA2seJWEFrmT8UHIHELyvVCaDtxxiGxH5oJQ5LYyiMhMMYQ13Rzw1omg=
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr2050433wmj.1.1631624318316;
 Tue, 14 Sep 2021 05:58:38 -0700 (PDT)
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
 <CAK8P3a2rATGsoQWGMESMWChQ317YKpryyVTwxkU8J1sUajxf-w@mail.gmail.com> <CAKMK7uF8doVEPOmm1Do5Qa+JZ7Lji6Runw5F=wrxeVjrsMLLSw@mail.gmail.com>
In-Reply-To: <CAKMK7uF8doVEPOmm1Do5Qa+JZ7Lji6Runw5F=wrxeVjrsMLLSw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 14:58:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2REUBb9yr4c2W2txwX4Ki3aOb2x1SiWhMkWb+5Gk7Qfw@mail.gmail.com>
Message-ID: <CAK8P3a2REUBb9yr4c2W2txwX4Ki3aOb2x1SiWhMkWb+5Gk7Qfw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>, 
	Leon Romanovsky <leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, 
	dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:pFXe+1rmJ36lK21BsxKUvShT4F+dh3Oq1NNDW1G6eNO9fvN5uim
 N8gV0ATve9L3xdN2E82o2YD1Rvx7NAk41zUf6VvdunKej0j+uy36kTvH0GF0vg1SeaFurhw
 oySrUYWR05WFcwU4J9nRGhyAkXb6eybtHf3x7rIqNR1FqXRTbCErE+2ppS622C/0OIPvtLl
 iD5pDPpsdw8rnl0uxoj4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eOPgob99M90=:oPhRONp/ow/f3kOzOtmSXv
 W0hj5lOHs4hGz7QIWG5YGvVhc3pVAT7tK3CEmwgzg7dBKBTsvEcCxT4Uu1oX8b9/kUDXOx3OL
 6h+GsKst2bT5a5wW5TklX32xUS3fRd2z+kCeVDI1reAxtrjmC+tMKuMKcDN+5SBNw24vv3iqC
 9Bbl/7Lwb1wwNcghT3bGELLOTP6cp/WRrgoHerdT7+VHwf4tJFE7c93OGulbk/+gBqf9YFRBn
 waGLbZ2slfTGO4NFa2Z+di02y0Ce2wSjJ/bf0tavzLaUR4ls35cv/k+WrLQcg6mo/4K2HuQvs
 Ju4/GOcJiZAfGqY/3heDA9mSk4kkDp+uUXB3kzR/0UIfYaNMKK2L5G0gaj7WDut1cfOfz/HE1
 o5s5kZMmlGaGiayCEiiJ3sXP59jOTAHGxSSD+CSm2FVCTfbcV9ywN/ds8K/qyrloRAqgK/LQz
 E1yac2tmBua+++v5Tv+zsK8hMkmJuuk2+F4V2a28+HQPokrDOEOEszPWswSSey6uWeYntnRqm
 qo6a+m+RK3bMmZZqINb1PiSiwUdh1yLPcR08Z8oE46hEpCHmlw6q96kVq2p1xDimTuXAlyf0T
 iRDLwB4JwwUhm3VNHkpndN3lOyrP1jtJv9qkPLzFD5mL19JTMYWFteZhtRmBuCcQUg35wMsaG
 Mv7ffhm7mefV/O+4P7fLxDVIyOfsxyGQUXUf8qPgbsDuwLm/LTh/mwD0aqkJUwPVsFSI+KFpS
 JiNfnU/pwxPjrYDLil4jYhpENLYo2q2EbyScEg==

On Tue, Sep 14, 2021 at 11:23 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Tue, Sep 14, 2021 at 11:09 AM Arnd Bergmann <arnd@arndb.de> wrote:

> > I can see two reasons why one would want to support a type (a)
> > interface even with the more versatile devices:
> >
> > - It can be done in a generic way so that simply adding a kernel
> >   driver and loading some firmware into it makes existing user space
> >   software work out of the box.
> >
> > - It gives the manufacturer a way to get an upstream kernel driver
> >   without open sourcing their firmware (a.k.a. compiler and user
> >   space driver). Whether you consider this a good or bad thing is
> >   of course a matter of perspective.
>
> I think for some embedded use-case this makes sense, especially around
> media stuff.
>
> I don't think it's BLAS, because on the compute side you really want a
> compiler that sees through the entire thing and can optimize it. Afaik
> BLAS is for some quick prototype of matrix algorithms and most
> importantly, for the top500 list :-)

It's probably not the only thing you need, but I would assume something
like sgemm and its variants are one of the building blocks you'd need
in this kind of interface. Note that oneDNN also comes with a
simplified interface similar to gemm[1] as well as straight wrapper around
gemm itself.

There are definitely frameworks that are successfully built just on top
of NumPy and blas (with NumPy itself being built on top of blas).
I used to make fun of linpack as the supercomputer benchmark that
has no practical use, but in the end it does spend most of its time in
the SGEMM function that is the most optimized algorithm in the world
and that is also where you end up spending your cycles in many AI
applications. I found a link to this blog post[2] explaining why this is still
used everywhere, and this matches what I've seen elsewhere, but
unlike me, the author seems to know what they are talking about ;-)

To get back to my own question from earlier about which part of oneAPI
is actually being used, I see that pytorch (to pick a common framework)
can use either mkl (oneMKL, BLAS) or mkldnn (dnnl, oneDNN) as a backend,
next to cuda, cudnn, openmp and certainly a number of third-party
backends.

The mkl backend seems to mostly be a wrapper around cblas_*gemm(),
though I may be reading that wrong.
The oneDNN backend operates on a higher level, calling into a
subset of the oneDNN interfaces. The other frameworks I looked at
(mxnet, tensorflow) look similar, probably each using other subsets of
oneDNN.

> > > We have lots of fixed function on GPUs, video codecs are on most x86
> > > GPUs. It's how you program them that matters, most of them are behind
> > > queues similar to the 3D engine, so you program them the same way.
> >
> > So these would go through /dev/dri instead of /dev/media0? I can definitely
> > see a lot of codec drivers in the kernel that use a /dev/media interfaces,
> > and the tradeoffs between those two seem very similar to the tradeoffs
> > you get for machine learning accelerators.
>
> Yeah we have plenty of codes running on top of /dev/dri0, with all the
> magic in userspace.
>
> They are all very far away from anything that is a machine learning accelerator.

Sure, I only meant the relation between dri codecs and media codecs
is similar to the relation between the ways one can implement the AI
accelerator APIs.

> Yeah for those I think a more fixed uapi like drivers/media has a lot
> of makes sense. What I don't like is when vendors then use that excuse
> of "oh you only upload a fixed model at boot" to shovel in an acccel
> driver with full generic interface, but not all the userspace
> bits&pieces. There's unfortunately another accel driver in
> drivers/misc for qualcom soc, which really should be either a media
> driver (for the fixed function use-case) or a drm driver (for the
> fully programmable) use-case.

I would argue that for the fixed-function use case, the media subsystem
isn't a great fit either. It would probably work just as well (as would the
crypto subsystem), but having a distinct interface that does just
one thing makes more sense conceptually, if only to make it clear
where to look for such drivers and to have a consistent interface
documentation.

> I think for the fixed-function interface case you can also make a
> reasonable argument that just documenting that fixed interface and all
> the parameters is good enough. But as soon as the interface becomes a
> generic "submit workload" style thing because you want to make it work
> for an entire set of "firmware" compiled by your closed stack, that's
> out of the window.

Right, agreed. If we add a fixed-function interface, that should ideally
not allow any vendor specific extensions at all, just a set of well-defined
operations, and certainly not a bypass mode that gets used to
send compiled binaries.

       Arnd

[1] https://oneapi-src.github.io/oneDNN/dev_guide_matmul.html
[1] https://petewarden.com/2015/04/20/why-gemm-is-at-the-heart-of-deep-learning/

