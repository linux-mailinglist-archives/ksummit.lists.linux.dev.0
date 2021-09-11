Return-Path: <ksummit+bounces-509-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 236BB4075C9
	for <lists@lfdr.de>; Sat, 11 Sep 2021 11:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 4F3331C0FA9
	for <lists@lfdr.de>; Sat, 11 Sep 2021 09:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08633FD7;
	Sat, 11 Sep 2021 09:28:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C943FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 09:28:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C40C499;
	Sat, 11 Sep 2021 11:27:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631352479;
	bh=ckSRayzaUm8VDsHLrKZwtezFP1e/f6ZUUL/WaFVJOeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TakSFOSydNIptwqUJ8lVAo2n0qK5tvrF3jpCq4GXHNTeUs/k0HmfHNGeNQpmTlUhP
	 2RfPXQRE/nCSL1L73VlpVx2KrLTGKkIiz12a0hS31PRi7/kp6abcMZO9Mewbi9vBjq
	 FkQ3mdE6xLhI1QjP+nGJPjhHGWqt90dfj3jcMCPM=
Date: Sat, 11 Sep 2021 12:27:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTx2iShbdcrY4SMk@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuYmqLESpGvXD7@pendragon.ideasonboard.com>
 <20210911023811.74b82f10@coco.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210911023811.74b82f10@coco.lan>

Hi Mauro,

On Sat, Sep 11, 2021 at 02:38:11AM +0200, Mauro Carvalho Chehab wrote:
> Em Sat, 11 Sep 2021 02:46:42 +0300 Laurent Pinchart escreveu:
> > On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> > > Em Fri, 10 Sep 2021 15:00:58 -0600 Jonathan Corbet escreveu:
> > >   
> > > > There has been a regular disagreement in recent years about whether
> > > > drivers for accelerators (such as for the Habana Gaudi device) should be
> > > > subject to the same requirements as GPU drivers when it comes to the
> > > > availability of a free implementation of the user-space side.  It flared
> > > > up again recently:
> > > > 
> > > >    https://lwn.net/Articles/867168/
> > > > 
> > > > Happily, the Habana situation in particular seems to be resolving
> > > > itself:
> > > > 
> > > >    https://lwn.net/ml/linux-kernel/CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com/
> > > > 
> > > > But even there it is clear that the fundamental question has not yet
> > > > been resolved.
> > > > 
> > > > This seems like the sort of question that the maintainer summit exists
> > > > to address.  Specifically, we could discuss:
> > > > 
> > > >  - Under which circumstances should the kernel community require the
> > > >    existence of freely licensed user-space code that exercises all
> > > >    functionalities of a proposed kernel driver or feature?
> > > > 
> > > >  - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
> > > >    are only available to drivers with a free user-space implementation?
> > > >    Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> > > > 
> > > >  - What constitutes an acceptable user-space implementation in cases
> > > >    where these restrictions apply?
> > > > 
> > > > I suspect that more clarity (and fewer arguments) on these questions
> > > > would be welcome both within and beyond the development community.  
> > > 
> > > The media subsystem also has this sort of issues: there are several
> > > drivers there to support hardware accelerators for video encoders and 
> > > decoders. In the case of media, usually devices with such hardware have
> > > an Image Signal Processor, where the codec runs on some firmware.
> > > 
> > > On media, enforcing userspace to always be open source would
> > > have been very bad, as it would prevent several videoconferencing 
> > > software to exist on Linux.  
> > 
> > Could you elaborate on which software you're thinking of ? And maybe
> > which driver(s) you're thinking about ?
> 
> I'm referring to tools like v4l2-compliance, qv4l2 and other tools
> we maintain at v4l-utils tree.

I meant the video conferencing software that would have been prevented
from existing. I'd like to understand if you think that requiring *one*
open userspace would be problematic.

> > > Also, there are several such codec hardware that only exists on 
> > > embedded hardware that already depends on proprietary software 
> > > to run.
> > > 
> > > So, a policy like that would make more damage than good.  
> > 
> > I wonder if there's some sort of misunderstanding. We're not talking
> > about requiring *all* userspace to be open, but about requiring the
> > existence of *one* open userspace as an acceptance criteria for merging
> > drivers.
> 
> Something like EXPORT_SYMBOL_USERSPACE_GPL() implies that any
> userspace app using such symbols would be GPL'd.

I think EXPORT_SYMBOL_USERSPACE_GPL() has already been deemed not to be
the right option based on the discussions in this e-mail thread. The
requirement of having *one* open userspace is still being discussed, and
is orthogonal to EXPORT_SYMBOL_USERSPACE_GPL() I believe.

> > > What we do, instead, is to try to enforce that the userspace API to
> > > be fully documented in a way that open source software can exist.
> > > 
> > > This is easier said than done, but we have some compliance tools
> > > that we use, in order to help to validate the uAPI implementations.  
> > 
> > I won't comment on the codec side as there are people more knowledgeable
> > than me in that area, but on the camera side, my analysis of the
> > situation is different than yours. The vast majority of drivers only use
> > standard parts of the V4L2 and MC APIs. For those, we do have plenty of
> > existing open userspace, as well as compliance tools as you mentioned
> > (some drivers also expose custom controls, but that's a very small API
> > footprint and they are documented well enough to be usable by any
> > application).
> 
> Yes, that's my view too. We used to have problems in the past with
> some proprietary fourccs, but I guess the problematic ones were
> either removed (because there was no upstream driver) or documented.
> 
> > The possibly problematic case is mostly about ISP drivers. For those,
> > the userspace API is more complex, with lots of device-specific
> > elements. The first ISP that received kernel support was the OMAP3 ISP,
> > and the driver has custom ioctls. Requiring an open userspace may indeed
> > have delayed the driver from being merged. However, for that particular
> > device, we had a public datasheet that documented the ISP,
> 
> Yes, but afterwards, other ISP drivers got added. I don't think they
> all have public datasheets. 

Sure. That's addressed below :-)

> > which we
> > could consider as an alternative to the open userspace implementation
> > (a topic worth discussing I believe).
> 
> Yeah, a public datasheet sounds an interesting requirement. It offers
> a problem, though: maybe some details could be missed on it, which
> would prevent any real open source userspace development.

Absolutely, and I don't think we can come up with any process and
technical measure that would prevent a vendor from cheating if they
really want to. It will always be possible to hide some features behind
reserved registers that wouldn't need to be programmed for basic
operation but that would be crucial to optimize the quality or
performances. This is regardless of whether we want to enforce openness
of documentation in the form of datasheets or source code.

I'm not too concerned about this though. If we can address most of this
issue with a clear process and message I think it would be a very good
step forward already.

> > Even if we had considered the
> > public datasheet to not be enough, I think we would have eventually got
> > an open userspace anyway (based on my internal knowledge of the Nokia
> > team working on this project).
> 
> Yes.
> 
> > More recently, we have two ISP drivers that got merged, for the Rockchip
> > RK3399 ISP and the Intel IPU3. Those drivers differ from all previous
> > drivers in the sense that the device is configured through a blob of
> > parameters passed by userspace to the kernel, written to registers by
> > the driver in the Rockchip case, and passed to the ISP firmware in the
> > Intel case. We have for both drivers a header file that describes the
> > layout of those blobs as C structures, but I can tell with first hand
> > experience working on an open userspace implementation that at least in
> > the Intel case that's not enough to use the ISP.
> 
> Yeah, I was afraid that this would end happening some day. Not too big
> harm, though, as IPU3 is under staging. We should enforce it to be
> be supported at libcamera or to have some other open source application
> before moving it out of staging.

The same may be true of the rkisp1 driver, we haven't moved forward
enough with its support in libcamera yet to tell for sure.

> > There's also an ISP driver for Raspberry Pi that is currently out of
> > tree and that we'll try to upstream, and for that one we have an open
> > userspace already (there's actually no closed userspace, kudos to
> > Raspberry Pi for doing the right thing, I'd like to see more vendors
> > following that great lead).
> > 
> > Finally, having spent the last 2 years and a half working on an open
> > userspace camera stack (libcamera) that exercise the V4L2 and MC APIs, I
> > was quite horrified to find out how some parts of those APIs are pretty
> > badly designed. I'm not just blaming others here, this includes APIs
> > that I have designed myself. They have been tested at the time with test
> > applications (either extending tools such as v4l2-ctl, or writing
> > dedicated tested tools for the API), but failed me when exercised in
> > real use cases. In retrospect I shouldn't have been surprised,
> > developing a test application that exercises the API in the way it was
> > designed as opposed to the way a real use case would need it can only
> > lead to problems. I think that requiring an open implementation of a
> > real use case, not just a test tool, would be a very good practice for
> > new APIs or extensions or existing APIs.
> 
> I remember that, during OMAP3 development, I required several times
> to have an userspace app/lib before merging it upstream (somewhat
> similar to libcamera goals). 
> 
> On that time, we didn't have staging yet. So, when Nokia ended with
> MeeGo development, I opted to merge what we had so far to support
> OMAP3 even without having an open source counterpart, as there
> were already some public documentation that seemed to help someone
> to write userspace tools in the future.

And there was also https://git.ideasonboard.org/omap3-isp-live.git that
was published shortly after.

-- 
Regards,

Laurent Pinchart

