Return-Path: <ksummit+bounces-562-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3740ABFD
	for <lists@lfdr.de>; Tue, 14 Sep 2021 12:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8554B1C0772
	for <lists@lfdr.de>; Tue, 14 Sep 2021 10:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A673FD9;
	Tue, 14 Sep 2021 10:48:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1F3FC4
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 10:48:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84B452A5;
	Tue, 14 Sep 2021 12:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631616483;
	bh=X77vKS14INBOA/73KJdAwCg8Phu/GFLmjCWzYnAykvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKkEghAyqA+7g9A120ql8CTmqKEn5sYi0nlvqRWwMicluJrBQ326eTVYZLQjkmIXA
	 fIX31UDZDkjCKWfaZjk0PnrpJlKoG5KjrPEUI8xIxtj3PeRNQDJl6Xd0Hgxzuj+4uS
	 qYg2GWxF3r4vLjYz2157OIVHYDOgkjuv+UTCTpMA=
Date: Tue, 14 Sep 2021 13:47:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>,
	Leon Romanovsky <leon@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev,
	dev@tvm.apache.org
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YUB9ypMApWBzHTjK@pendragon.ideasonboard.com>
References: <CAPM=9twpxAP13fEv8BxsSkd4Xcqxu989F3biiPFFDgKRADL0KQ@mail.gmail.com>
 <CAKMK7uHQw8=GKpayxzOJUs4BnwoVDS08Y9bynp6=VH+eW35Pgw@mail.gmail.com>
 <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com>
 <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
 <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com>
 <CAKMK7uFrOpH9NG3XB1dT889r4HrUHaotte1D4Nh2=5tjD9VEpg@mail.gmail.com>
 <CAK8P3a2pvCwuSic9yevW0xmMy0-F1FEgfQ-_Rc7wWDs7PJEf_w@mail.gmail.com>
 <CAPM=9tw3WTUb6R5VaDR002P0QYbcZ0uPETC4r0MPBBqySLe09Q@mail.gmail.com>
 <CAK8P3a2rATGsoQWGMESMWChQ317YKpryyVTwxkU8J1sUajxf-w@mail.gmail.com>
 <CAKMK7uF8doVEPOmm1Do5Qa+JZ7Lji6Runw5F=wrxeVjrsMLLSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKMK7uF8doVEPOmm1Do5Qa+JZ7Lji6Runw5F=wrxeVjrsMLLSw@mail.gmail.com>

On Tue, Sep 14, 2021 at 11:23:56AM +0200, Daniel Vetter wrote:
> On Tue, Sep 14, 2021 at 11:09 AM Arnd Bergmann wrote:
> > On Tue, Sep 14, 2021 at 1:33 AM Dave Airlie wrote:
> > > On Tue, 14 Sept 2021 at 08:05, Arnd Bergmann wrote:
> > > > >On Mon, Sep 13, 2021 at 3:54 PM Daniel Vetter wrote:
> > > > > I think BLAS are too high-level for these. Sure fore perfect speed the
> > > > > vendor probably wants to have their own BLAS thing, their own NN
> > > > > optmizer and a heap of other things, but for the low-level userspace
> > > > > we're talking about here that pretty much doesn't matter.
> > > >
> > > > I suppose high-level vs low-level is not the correct distinction here,
> > > > it's more like fixed-function vs programmable.
> > > >
> > > > As a fixed-function interface, something like GEMM is probably as
> > > > low-level as you would want to get, as it's big enough to make sense
> > > > as a single atomic command, but small enough to be able to build on
> > > > top of it.
> > >
> > > The distinctions is more programming model than fixed vs programmable
> > > in rough order of complexity
> > >
> > > a) device is MMIO programmed and can process one thing, kernel needs
> > > to mediate between exclusive users (big lock, initial drm subsystem)
> 
> I think even for these you might want a drm style uapi, where
> drm/sched takes different jobs and hammers them into hw in a kernel
> thread. Ofc it all depends what the programming model is, and
> something more fixed like media might make sense.

For completeness, there's a similar component in the V4L2 M2M framework,
but simpler. Jobs are executed sequentially in the order they are
received. The simplicity is mostly due to the fact that the type of
hardware V4L2 M2M supports doesn't have the ability to run multiple jobs
in parallel.

We also have ISPs that fall in this category, and use the V4L2 API in
memory-to-memory mode but without any scheduling, because context
switching doesn't exist at the hardware level and is too expensive to
implement in software. For those we restrict operation to a single
process at a time.

> > > b) device has a queue that can process untrusted userspace command
> > > with no memory safety (old drm drivers, in-kernel command stream
> > > parsing)
> > > c) device has queues, contexts, memory safety, virtual address space
> > > (newer drm drivers)
> > > d) device has full preempt on all hw blocks, is fully coherent, can
> > > trigger paging sanely, userspace can submit directly (pipe dream).
> > >
> > > What the device processes is of little consequence to the kernel
> > > driver model. the uAPI of course needs to reflect the above along with
> > > what the device can program. Since there could be a queue for a DMA
> > > device that isn't specificed but can be programmed to DMA random
> > > system memory.
> >
> > Thank you for the useful overview!
> >
> > > Devices in category (a) are the sort of things that can need kernel
> > > interfaces like a GEMM or BLAS level, however there is no point having
> > > an interface at that level for any of the b/c/d device. That interface
> > > needs to be in userspace somewhere, level0 or something like is
> > > probably where things will end up, and the type (a) devices will die
> > > out.
> >
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
> 
> > > > I realize that fixed-function is not fashionable on GPUs, but they
> > > > are widely used in other areas (video codecs, crypto, ...) even when
> > > > you are running precompiled code on the accelerator hardware.
> > > > This would of course replace the question of open source user space
> > > > with the question of open-source firmware, as the user side would
> > > > become mostly while the accelerator goes from dynamically created
> > > > to a firmware blob.
> > >
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
> 
> > > What isn't fashionable on GPUs is programmable blocks that are single
> > > user that only the kernel can program one user on at a time, since hw
> > > has long since left that model as desirable. There are some AI
> > > accelerators going doing the same path, but eventually they'll have to
> > > be shareable and catch up with GPU programming models to remain
> > > competitive.
> >
> > I'm not convinced by this at all. While I totally understand this argument
> > for GPUs and general-purpose users (phone, PC, server, ...), I also see
> > a lot of cheap SoC hardware with much simpler requirements. If the chip
> > is built for an embedded application (face detection, smart speaker, ...)
> > you would never need to have two processes access the same
> > accelerator hardware, or even just load a new model into it after
> > boot. Adding any complexity to the hardware increases the cost, so
> > you would only do it if absolutely necessary, or if the cheapest
> > off-the-shelf solution already includes it.
> 
> Yeah for those I think a more fixed uapi like drivers/media has a lot
> of makes sense. What I don't like is when vendors then use that excuse
> of "oh you only upload a fixed model at boot" to shovel in an acccel
> driver with full generic interface, but not all the userspace
> bits&pieces. There's unfortunately another accel driver in
> drivers/misc for qualcom soc, which really should be either a media
> driver (for the fixed function use-case) or a drm driver (for the
> fully programmable) use-case.
> 
> I think for the fixed-function interface case you can also make a
> reasonable argument that just documenting that fixed interface and all
> the parameters is good enough. But as soon as the interface becomes a
> generic "submit workload" style thing because you want to make it work
> for an entire set of "firmware" compiled by your closed stack, that's
> out of the window.
> 
> So yeah there's another driver in misc which managed to bypass review
> of two subsystem, not just one :-/

-- 
Regards,

Laurent Pinchart

