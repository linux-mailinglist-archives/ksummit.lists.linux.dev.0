Return-Path: <ksummit+bounces-508-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C79407437
	for <lists@lfdr.de>; Sat, 11 Sep 2021 02:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 3C1263E10B4
	for <lists@lfdr.de>; Sat, 11 Sep 2021 00:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380852FB6;
	Sat, 11 Sep 2021 00:38:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05743FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 00:38:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70DBB611C3;
	Sat, 11 Sep 2021 00:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631320695;
	bh=Xd2CdvuWvf6Dvnr8/1knRp0Pmjaien5ng1lPONIrcnk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RRRSbI2L12xlGLMuBCULPmhUeFrDS019e6n0e+jtA5HRpqNbwQx0kevRaRDt0Gwkq
	 9zGvc+akbbG0VIAEnF8TLLrt5WSrhZNugpZZNjZSJk0NwxjWz2Va/QFzwteGGX3IxH
	 X9HvZIQ3nj7twzDkPxF0E0dmfhBxF2Q7q1tTk0SdSuuRWyBzZEU2PXq3GQBjLMf/fE
	 MF8U1hqNEzzHyHenJN/8Sq1JIAlUNIAUC6O1lzFCnSOzi9q6zSZGID1N8DwECdZLUU
	 akVk+H/Wb2xfyXK174/kGn+lBqEdkFcYh1ILTe4mY9OaMWZahhuIQenS8eVKk5sJbq
	 NE5d1+fMw9a5w==
Date: Sat, 11 Sep 2021 02:38:11 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210911023811.74b82f10@coco.lan>
In-Reply-To: <YTvuYmqLESpGvXD7@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
	<20210911005214.71b55ac6@coco.lan>
	<YTvuYmqLESpGvXD7@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 11 Sep 2021 02:46:42 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 10 Sep 2021 15:00:58 -0600 Jonathan Corbet escreveu:
> >   
> > > There has been a regular disagreement in recent years about whether
> > > drivers for accelerators (such as for the Habana Gaudi device) should be
> > > subject to the same requirements as GPU drivers when it comes to the
> > > availability of a free implementation of the user-space side.  It flared
> > > up again recently:
> > > 
> > >    https://lwn.net/Articles/867168/
> > > 
> > > Happily, the Habana situation in particular seems to be resolving
> > > itself:
> > > 
> > >    https://lwn.net/ml/linux-kernel/CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com/
> > > 
> > > But even there it is clear that the fundamental question has not yet
> > > been resolved.
> > > 
> > > This seems like the sort of question that the maintainer summit exists
> > > to address.  Specifically, we could discuss:
> > > 
> > >  - Under which circumstances should the kernel community require the
> > >    existence of freely licensed user-space code that exercises all
> > >    functionalities of a proposed kernel driver or feature?
> > > 
> > >  - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
> > >    are only available to drivers with a free user-space implementation?
> > >    Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> > > 
> > >  - What constitutes an acceptable user-space implementation in cases
> > >    where these restrictions apply?
> > > 
> > > I suspect that more clarity (and fewer arguments) on these questions
> > > would be welcome both within and beyond the development community.  
> > 
> > The media subsystem also has this sort of issues: there are several
> > drivers there to support hardware accelerators for video encoders and 
> > decoders. In the case of media, usually devices with such hardware have
> > an Image Signal Processor, where the codec runs on some firmware.
> > 
> > On media, enforcing userspace to always be open source would
> > have been very bad, as it would prevent several videoconferencing 
> > software to exist on Linux.  
> 
> Could you elaborate on which software you're thinking of ? And maybe
> which driver(s) you're thinking about ?

I'm referring to tools like v4l2-compliance, qv4l2 and other tools
we maintain at v4l-utils tree.

> > Also, there are several such codec hardware that only exists on 
> > embedded hardware that already depends on proprietary software 
> > to run.
> > 
> > So, a policy like that would make more damage than good.  
> 
> I wonder if there's some sort of misunderstanding. We're not talking
> about requiring *all* userspace to be open, but about requiring the
> existence of *one* open userspace as an acceptance criteria for merging
> drivers.

Something like EXPORT_SYMBOL_USERSPACE_GPL() implies that any
userspace app using such symbols would be GPL'd.

> 
> > What we do, instead, is to try to enforce that the userspace API to
> > be fully documented in a way that open source software can exist.
> > 
> > This is easier said than done, but we have some compliance tools
> > that we use, in order to help to validate the uAPI implementations.  
> 
> I won't comment on the codec side as there are people more knowledgeable
> than me in that area, but on the camera side, my analysis of the
> situation is different than yours. The vast majority of drivers only use
> standard parts of the V4L2 and MC APIs. For those, we do have plenty of
> existing open userspace, as well as compliance tools as you mentioned
> (some drivers also expose custom controls, but that's a very small API
> footprint and they are documented well enough to be usable by any
> application).

Yes, that's my view too. We used to have problems in the past with
some proprietary fourccs, but I guess the problematic ones were
either removed (because there was no upstream driver) or documented.

> The possibly problematic case is mostly about ISP drivers. For those,
> the userspace API is more complex, with lots of device-specific
> elements. The first ISP that received kernel support was the OMAP3 ISP,
> and the driver has custom ioctls. Requiring an open userspace may indeed
> have delayed the driver from being merged. However, for that particular
> device, we had a public datasheet that documented the ISP,

Yes, but afterwards, other ISP drivers got added. I don't think they
all have public datasheets. 

> which we
> could consider as an alternative to the open userspace implementation
> (a topic worth discussing I believe).

Yeah, a public datasheet sounds an interesting requirement. It offers
a problem, though: maybe some details could be missed on it, which
would prevent any real open source userspace development.

> Even if we had considered the
> public datasheet to not be enough, I think we would have eventually got
> an open userspace anyway (based on my internal knowledge of the Nokia
> team working on this project).

Yes.

> More recently, we have two ISP drivers that got merged, for the Rockchip
> RK3399 ISP and the Intel IPU3. Those drivers differ from all previous
> drivers in the sense that the device is configured through a blob of
> parameters passed by userspace to the kernel, written to registers by
> the driver in the Rockchip case, and passed to the ISP firmware in the
> Intel case. We have for both drivers a header file that describes the
> layout of those blobs as C structures, but I can tell with first hand
> experience working on an open userspace implementation that at least in
> the Intel case that's not enough to use the ISP.

Yeah, I was afraid that this would end happening some day. Not too big
harm, though, as IPU3 is under staging. We should enforce it to be
be supported at libcamera or to have some other open source application
before moving it out of staging.

> There's also an ISP driver for Raspberry Pi that is currently out of
> tree and that we'll try to upstream, and for that one we have an open
> userspace already (there's actually no closed userspace, kudos to
> Raspberry Pi for doing the right thing, I'd like to see more vendors
> following that great lead).
> 
> Finally, having spent the last 2 years and a half working on an open
> userspace camera stack (libcamera) that exercise the V4L2 and MC APIs, I
> was quite horrified to find out how some parts of those APIs are pretty
> badly designed. I'm not just blaming others here, this includes APIs
> that I have designed myself. They have been tested at the time with test
> applications (either extending tools such as v4l2-ctl, or writing
> dedicated tested tools for the API), but failed me when exercised in
> real use cases. In retrospect I shouldn't have been surprised,
> developing a test application that exercises the API in the way it was
> designed as opposed to the way a real use case would need it can only
> lead to problems. I think that requiring an open implementation of a
> real use case, not just a test tool, would be a very good practice for
> new APIs or extensions or existing APIs.

I remember that, during OMAP3 development, I required several times
to have an userspace app/lib before merging it upstream (somewhat
similar to libcamera goals). 

On that time, we didn't have staging yet. So, when Nokia ended with
MeeGo development, I opted to merge what we had so far to support
OMAP3 even without having an open source counterpart, as there
were already some public documentation that seemed to help someone
to write userspace tools in the future.

Thanks,
Mauro

