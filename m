Return-Path: <ksummit+bounces-334-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8E3BF74A
	for <lists@lfdr.de>; Thu,  8 Jul 2021 11:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B047F1C0E3B
	for <lists@lfdr.de>; Thu,  8 Jul 2021 09:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CCC2F80;
	Thu,  8 Jul 2021 09:08:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FB672
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 09:08:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2496961C9A;
	Thu,  8 Jul 2021 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625735338;
	bh=dgQHeVjBA+6YTLqPIUBsSvYtd3LiRKY5Jy8uG6H0b9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q/eCfOV28e9UX7jSr5yEQAqs2XWgxQJzyiaV/17L3Puv+woAn52k2zi6M77pITjgc
	 VWDViEzcNZf7fH06H/2XIF3l/omEkPfmj/fpRpmSJnNvVmkxMBLAyX3uAfw7zCbiO5
	 TMacMzR2iUJczgihy3cjXyTZZ2z0teCSaFXroagiEaT4XC3SxNSKviKcq491n8tRKX
	 ahhGETiGhutoMsDVvMAwnY+sv42jDTNEy+OUDcDWlTg0NUH/DdDjGYxEKzgwve8yQ4
	 t55U0xQZ0j5OfPjKHqj+in8bjy+997+vJYYhHIW1v1jhUCHerOmSiqhvGks6eKVMmb
	 OMdQL+TTK/mcA==
Date: Thu, 8 Jul 2021 11:08:52 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg KH <greg@kroah.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Roland Dreier
 <roland@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210708110852.1c4f8148@coco.lan>
In-Reply-To: <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	<CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	<CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
	<CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
	<20210707105000.GA4394@sirena.org.uk>
	<c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
	<YOWcCG9Pm/S+EXFw@kroah.com>
	<11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
	<YOWh0Dq+2v+wH3B4@kroah.com>
	<YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 7 Jul 2021 20:17:08 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Wed, Jul 07, 2021 at 02:45:04PM +0200, Greg KH wrote:
> > On Wed, Jul 07, 2021 at 01:38:44PM +0100, James Bottomley wrote:  
> > > On Wed, 2021-07-07 at 14:20 +0200, Greg KH wrote:  
> > > > On Wed, Jul 07, 2021 at 12:34:31PM +0100, James Bottomley wrote:  
> > > > > On Wed, 2021-07-07 at 11:50 +0100, Mark Brown wrote:  
> > > > > > On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:  
> > > > > > > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier wrote:  
> > > > > > > > "devres" / devm_xxx was an attempt to deal with this in C,
> > > > > > > > but it only solves some cases of this and has not received a
> > > > > > > > lot of adoption (we can argue about the reasons).  
> > > > > > >  
> > > > > > > Really? From my point of view that is adopted all over the map.
> > > > > > > I add new users all the time and use it as much as I can when
> > > > > > > writing new drivers.  
> > > > > > 
> > > > > > Yes, it's *super* widely used in most of the kernel.  Perhaps
> > > > > > there's some subsystems that reject it for some reason.
> > > > > >   
> > > > > > > I think it's a formidable success, people just need to learn to
> > > > > > > do it more.  
> > > > > > 
> > > > > > There *are* issues with people adopting it too enthusiastically -
> > > > > > as well as the memory lifetime issues that Laurent mentioned it's
> > > > > > easy for it to cause problems with interrupt handlers that are
> > > > > > left live longer than they should be and try to use things that
> > > > > > were already deallocated.  
> 
> (CC'ing Daniel Vetter as the author of the DRM devres-based resource
> management)
> 
> I've given this lots of thoughts lately, in the context of V4L2, but it
> should be roughly the same for character devices in general. Here's what
> I think should be done for drivers that expose character devices.
> 
> - Drivers must stop allocating their internal data structure (the one
>   they set as device data with dev_set_drvdata()) with devm_kzalloc().
>   The data structure must instead be allocated with a plain kzalloc()
>   and reference-counted.
> 
>   Most drivers will register a single character device using a
>   subsystem-specific API (e.g. video_register_device() in V4L2). The
>   subsystem needs to provide a .release() callback, called when the
>   last reference to the character device is released. Drivers must
>   implement this, and can simply free their internal data structure at
>   this point.
> 
>   For drivers that register multiple character devices, or in general
>   expose multiple interfaces to userspace or other parts of the kernel,
>   the internal data structure must be properly reference-counted, with a
>   reference released in each .release() callback. There may be ways to
>   simplify this.

Good point. Yeah, indeed some work seems to be required on that area.

Yet, V4L2 is somewhat different here, as most (if not all) devices 
expose multiple cdevs. 

Also, in the case of V4L2 USB and PCI devices, their "dev->parent" is 
usually a PCI bridge, or an USB device with multiple functions on it,
as those hardware contain both audio and video and sometimes input
(either buttons or remote controllers), typically using different 
drivers. So, when the hardware is hot-unplugged or unbind, several 
drivers and multiple cdevs will be released. Ensuring that those will
happen at the right time can be a challenge, specially if there are
pending syscalls and/or threads by the time the device is unbound.

The DRM subsystem likely fits on the same case, as drivers also 
usually create multiple cdevs, and there are DMABUF objects shared
between different struct devices.

So, yeah, using devm_* for V4L2 and DRM can indeed bring troubles.
I can't see a solution there currently but to avoid using devm*,
handling it using an approach similar to the one you described.

-

I'm not so sure if using devm_* is a problem on several cases, though.
I mean, when the hardware is not hot-pluggable, the data lifetime
is a lot simpler.

So, for instance, a regulator driver probably can use devm_* without
any issues, as it doesn't seem to make much sense to unbind a regulator
once the device was probed. On drivers like that, not using devm_*
would just make the probing part of the driver more complex, without
bringing any real benefit.

Thanks,
Mauro

