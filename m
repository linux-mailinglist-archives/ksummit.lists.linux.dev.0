Return-Path: <ksummit+bounces-516-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3A9407A90
	for <lists@lfdr.de>; Sat, 11 Sep 2021 23:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6B1D21C0FA9
	for <lists@lfdr.de>; Sat, 11 Sep 2021 21:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67F73FDA;
	Sat, 11 Sep 2021 21:52:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145463FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 21:52:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D2F0DD;
	Sat, 11 Sep 2021 23:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631397158;
	bh=eS1HEQSenO6i9egwvYXnLomeoaTrwRQnGWP39px1J2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/muAxgwolAxHunMxUSv2ZZXk263atjvJeo7/4hbC3Ec47kUhHErvV0MM/J3EIUl+
	 zQthLvRtEN8Cga0bXx677KY5AQpT3NZ3AgUzQRxmyBzFOU69MQYrpyB/OlRcbbTHV2
	 eJdJU1aeZ8yp2yBZx1lY8pNxj7W24CnDzpKr6ECc=
Date: Sun, 12 Sep 2021 00:52:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT0lDyMMSRSmhD95@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>
 <YTvVKrfyMc7fKsZx@piout.net>
 <05c1591b0e3744233e78ae35ba66d2721ee6af5e.camel@HansenPartnership.com>
 <87y283np2i.fsf@meer.lwn.net>
 <9bbe54192d9b4807422941bccfd2f0e48a5525ff.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9bbe54192d9b4807422941bccfd2f0e48a5525ff.camel@HansenPartnership.com>

Hi James,

On Sat, Sep 11, 2021 at 08:24:38AM -0700, James Bottomley wrote:
> On Sat, 2021-09-11 at 08:51 -0600, Jonathan Corbet wrote:
> > James Bottomley <James.Bottomley@HansenPartnership.com> writes:
> > 
> > > On Fri, 2021-09-10 at 23:59 +0200, Alexandre Belloni wrote:
> > > > I think the question is not whether we want to forbid proprietary
> > > > user space using an API but whether we want to merge said API so
> > > > the license on the kernel doesn't matter much.
> > > 
> > > I thought that *was* the statement I made in the last paragraph: we
> > > can choose whether or not to merge the enabling API into the
> > > kernel. However, if we merge it we can't choose whether a
> > > proprietary user space takes advantage of the API.  My original
> > > reply was to the notion of EXPORT_USERSPACE_GPL, which I think we
> > > have no legal basis for enforcing without modifying the system
> > > exception.
> > 
> > That wasn't thinking when I pulled the idea of EXPORT_USERSPACE_GPL
> > out of whatever dark place it was lurking in.
> 
> OK, but you can see how that thought is arrived at since
> EXPORT_SYMBOL_GPL is a technically enforced licensing permission tag. 
> However, I was seriously pushing back against the *idea* of such a tag
> because once it crosses the kernel to user boundary it would cause huge
> confusion of our current licensing positions ... regardless of what it
> actually means.
> 
> >   The idea was, instead, to document that if your driver is using
> > that interface, it won't be considered for merging into the kernel in
> > the absence of a working, free, user-space implementation -- should
> > we choose to adopt such a policy, of course.
> 
> Right, and if you have a driver with an internal API that's used for
> communication with a userspace blob, we can evaluate that, as we have
> done before, on a case by case basis.  It's not a new thing, because
> we're both old enough to remember "my wireless driver has to have a
> proprietary component for regulatory reasons".
> 
> We've made decisions both for and against such drivers in the past, but
> I think the issues are too nuanced to make a general rule.  If you do
> have a general rule, what other things, like firmware, would get caught
> by it and so on ...
> 
> > Nobody is trying to prohibit proprietary user space, that's not the
> > point.
> 
> I didn't think you were in general, but requiring a free userspace
> driver implementation is prohibiting a proprietary one and so then you
> get into questions of how wide the reach is and what the knock on
> effects are if you try to craft a general policy around this ...
> especially if it has technical enforcement measures.

Requiring the existence of one open userspace implementation doesn't
preclude the ability for vendors to develop and ship closed
implementations in parallel, at least in the general case. For instance,
with GPUs or cameras, an open implementation could be developed (in Mesa
and libcamera respectively) to exercise the device features (such as the
GPU shader instruction set, or the camera ISP processing parameters),
but wouldn't be required to include all the tuning and optimizations
that a closed implementation would typically have. A vendor could thus
ship a closed-source shader compiler in its OpenGL/Vulkan userspace
driver, protecting the R&D investment to implement those optimizations
(this would most likely also include lots of hacks to please
benchmarks), and the community would be able to use the GPU and improve
the open implementation.

For GPUs, the situation has been quite clear for years: if a vendor
wants an upstream driver, with all the benefits this brings, they have
to also provide a (mostly?) feature-complete (in the sense of hardware
features) but not necessarily optimized open-source counterpart. We're
exploring here whether or not the same deal should cover camera ISPs and
ML/AI accelerators (and possibly other devices that I'm less familiar
with).

For a wireless driver the situation is possibly different, I suppose
that if the closed-source userspace blob is there only for regulatory
reasons, then there would be very little point in having a closed-source
implementation with a parallel one.

-- 
Regards,

Laurent Pinchart

