Return-Path: <ksummit+bounces-560-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B1D40AA47
	for <lists@lfdr.de>; Tue, 14 Sep 2021 11:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 61BE01C0F3F
	for <lists@lfdr.de>; Tue, 14 Sep 2021 09:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1809E3FD9;
	Tue, 14 Sep 2021 09:09:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE46F3FC5
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 09:09:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mhl8Y-1n3p270zZY-00dqHp for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021
 11:09:11 +0200
Received: by mail-wr1-f51.google.com with SMTP id m9so19038555wrb.1
        for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 02:09:11 -0700 (PDT)
X-Gm-Message-State: AOAM532PSX7/j1hpt33z5Ia1w5WixwsUGeXW5GTQ5UDDOfgBU7wf1kTq
	Lt2DyJjWZb0iZS6Oprnot5AGWbdzr38aTrDLqRw=
X-Google-Smtp-Source: ABdhPJwmKXj6yRLOpf2cYqD1XFTZ5dzng5Ng8f6806uMhIcYZey+VThXlN2QH6mKUXvf9vfzNHsxwDWi4CIo6IpWDvc=
X-Received: by 2002:adf:c10b:: with SMTP id r11mr17504998wre.336.1631610550731;
 Tue, 14 Sep 2021 02:09:10 -0700 (PDT)
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
 <CAK8P3a2pvCwuSic9yevW0xmMy0-F1FEgfQ-_Rc7wWDs7PJEf_w@mail.gmail.com> <CAPM=9tw3WTUb6R5VaDR002P0QYbcZ0uPETC4r0MPBBqySLe09Q@mail.gmail.com>
In-Reply-To: <CAPM=9tw3WTUb6R5VaDR002P0QYbcZ0uPETC4r0MPBBqySLe09Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 11:08:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2rATGsoQWGMESMWChQ317YKpryyVTwxkU8J1sUajxf-w@mail.gmail.com>
Message-ID: <CAK8P3a2rATGsoQWGMESMWChQ317YKpryyVTwxkU8J1sUajxf-w@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Dave Airlie <airlied@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>, 
	Leon Romanovsky <leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, 
	dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:hW2oAOylf/gcrloS1ri0Kdl8J9ZKTttG+XXCPXiaP3Ougoaeh5z
 5eeJ3Cq2dLZbcvS87Rng3gjPNHMmkMZIWzqd08/re2BXbyHkDQjR50+4Aw7wGegsjTCDQZc
 /TchTDCAc089RfcMtd38rhK/LirU4NAYTmtyjrLqtbR36mM+yzBDI1RCreo67HBFbtOMvLH
 UqCYBMvN2CzkKCaFTMGCg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XBqRBqB0To4=:oIPfE3o849QFhqbI5PAw0s
 XXW60YenROPVcGEMgan+xmoC22kVhsu9pR+vHp8U5CDKBuHAbbgA1fdTzUHfhixWRLdNE8HEQ
 lh2y8eZiCEBcO5rzPl1Y3TUxbevCPPQA5TfIxQPU3YTkujs8HgZ97uYH5H75ruB4XMPhCD0L+
 8X1rcvPGk75roVfe8kY2olomlw7WV7g2N2tsdVl0WdjgzxBHkZygXjoCmJfArlNVXalMITvTR
 HNdO7hvcMk4QmlxcVlYGVnD9+hWdODP024wu4OK5VqfTji4EWEa5WOoOA21Vn0W4EZjIhtbyn
 zfeAiCm/AYKiPrCxK1FJUslroxyyj7Azsa27HVMD+9BvIvG8hFHZzXmiLycOyeioZ34riT7RD
 2uEGm3zvn8tVX5DITposU0oxTNedeX01hNi61N9UM7bINyuKtAwLXbVUgtdjhVAEF9bkZ+/JU
 1GihyDvzxV2SpDLApL3Q4DekHOn04cglQEg3imXkaDd/77nrruFJVQW6jf1dcUgt0mlfiYm5U
 bqA3qxPSIqUPVbP6r1NViN/YZreS5aNQeD5qwKaXmJzxADkwi8CkNWvRhrzxUAGwuW+b98/gQ
 sriVi8pvgoJss+45udCNLdTwB1G66V7Y5woaQXJdINwjUC4+CExBO0s23iqBEBcbzknjtV+oa
 b63DqDmPgYh6KW79Je/7mrqjipqbMyB3ZlvarBwsiIti7MFdw7x26zAJbdiKBLzs9axUQETUw
 k4u9ZM9E4WHiN53+xikudRntYZcHWKwFLiNN4g==

On Tue, Sep 14, 2021 at 1:33 AM Dave Airlie <airlied@gmail.com> wrote:
> On Tue, 14 Sept 2021 at 08:05, Arnd Bergmann <arnd@arndb.de> wrote:
> > >On Mon, Sep 13, 2021 at 3:54 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > I think BLAS are too high-level for these. Sure fore perfect speed the
> > > vendor probably wants to have their own BLAS thing, their own NN
> > > optmizer and a heap of other things, but for the low-level userspace
> > > we're talking about here that pretty much doesn't matter.
> >
> > I suppose high-level vs low-level is not the correct distinction here,
> > it's more like fixed-function vs programmable.
> >
> > As a fixed-function interface, something like GEMM is probably as
> > low-level as you would want to get, as it's big enough to make sense
> > as a single atomic command, but small enough to be able to build on
> > top of it.
>
> The distinctions is more programming model than fixed vs programmable
> in rough order of complexity
>
> a) device is MMIO programmed and can process one thing, kernel needs
> to mediate between exclusive users (big lock, initial drm subsystem)
> b) device has a queue that can process untrusted userspace command
> with no memory safety (old drm drivers, in-kernel command stream
> parsing)
> c) device has queues, contexts, memory safety, virtual address space
> (newer drm drivers)
> d) device has full preempt on all hw blocks, is fully coherent, can
> trigger paging sanely, userspace can submit directly (pipe dream).
>
> What the device processes is of little consequence to the kernel
> driver model. the uAPI of course needs to reflect the above along with
> what the device can program. Since there could be a queue for a DMA
> device that isn't specificed but can be programmed to DMA random
> system memory.

Thank you for the useful overview!

> Devices in category (a) are the sort of things that can need kernel
> interfaces like a GEMM or BLAS level, however there is no point having
> an interface at that level for any of the b/c/d device. That interface
> needs to be in userspace somewhere, level0 or something like is
> probably where things will end up, and the type (a) devices will die
> out.

I can see two reasons why one would want to support a type (a)
interface even with the more versatile devices:

- It can be done in a generic way so that simply adding a kernel
  driver and loading some firmware into it makes existing user space
  software work out of the box.

- It gives the manufacturer a way to get an upstream kernel driver
  without open sourcing their firmware (a.k.a. compiler and user
  space driver). Whether you consider this a good or bad thing is
  of course a matter of perspective.

> > I realize that fixed-function is not fashionable on GPUs, but they
> > are widely used in other areas (video codecs, crypto, ...) even when
> > you are running precompiled code on the accelerator hardware.
> > This would of course replace the question of open source user space
> > with the question of open-source firmware, as the user side would
> > become mostly while the accelerator goes from dynamically created
> > to a firmware blob.
>
> We have lots of fixed function on GPUs, video codecs are on most x86
> GPUs. It's how you program them that matters, most of them are behind
> queues similar to the 3D engine, so you program them the same way.

So these would go through /dev/dri instead of /dev/media0? I can definitely
see a lot of codec drivers in the kernel that use a /dev/media interfaces,
and the tradeoffs between those two seem very similar to the tradeoffs
you get for machine learning accelerators.

> What isn't fashionable on GPUs is programmable blocks that are single
> user that only the kernel can program one user on at a time, since hw
> has long since left that model as desirable. There are some AI
> accelerators going doing the same path, but eventually they'll have to
> be shareable and catch up with GPU programming models to remain
> competitive.

I'm not convinced by this at all. While I totally understand this argument
for GPUs and general-purpose users (phone, PC, server, ...), I also see
a lot of cheap SoC hardware with much simpler requirements. If the chip
is built for an embedded application (face detection, smart speaker, ...)
you would never need to have two processes access the same
accelerator hardware, or even just load a new model into it after
boot. Adding any complexity to the hardware increases the cost, so
you would only do it if absolutely necessary, or if the cheapest
off-the-shelf solution already includes it.

           Arnd

