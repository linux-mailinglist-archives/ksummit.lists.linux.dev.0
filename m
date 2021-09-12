Return-Path: <ksummit+bounces-524-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F40407BAF
	for <lists@lfdr.de>; Sun, 12 Sep 2021 06:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 82AFC1C0F4C
	for <lists@lfdr.de>; Sun, 12 Sep 2021 04:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCBF3FD6;
	Sun, 12 Sep 2021 04:28:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF7B3FD0
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 04:27:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89A0F61212;
	Sun, 12 Sep 2021 04:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631420879;
	bh=oopiKQB4kfyptj5zbdugp+s3Y3PzJlRrVGk4o0z8PXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mDalUXfHM52trGuS8DoyyurBg0i561fvjZ+KqFskold3P+RpfaPEoHhH8ixvXo5zC
	 WVbEKog8N6w9BJxq9ZiCJ0DTweX98LV2OQyevDoypRv9g6BhpZXJh8yEOiXVtP+ngF
	 cgxlQb/HqZSY8NQ4sqdDl1MNn31/OFVi6JvcD+aV4v0NynMCrE7BgtRJXh/XIdvW98
	 aU7V6UwRy5cEcUEarONnBmTXXw0V+TjmJFqfKG4msOINV/sUHGNNXY1nPvvXpNBvN/
	 t3B02XvoQS0EkS+6/tfxifRVrHVsH1LOTrD1I9dFHbNPsj17mLbjuFtCmdgQXMWbcK
	 8YhKGc/Oq0h1A==
Date: Sun, 12 Sep 2021 07:27:55 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT2By1+yuo7rcu2D@unreal>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
 <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>

On Sun, Sep 12, 2021 at 01:04:01AM +0300, Laurent Pinchart wrote:
> Hi Leon,
> 
> On Sat, Sep 11, 2021 at 03:04:07PM +0300, Leon Romanovsky wrote:
> > On Sat, Sep 11, 2021 at 02:41:52PM +0300, Laurent Pinchart wrote:
> > > On Sat, Sep 11, 2021 at 01:31:02PM +0300, Leon Romanovsky wrote:
> > > > On Sat, Sep 11, 2021 at 01:55:16AM +0200, Thomas Gleixner wrote:
> > > > > On Fri, Sep 10 2021 at 16:45, Josh Triplett wrote:
> > > > > 
> > > > > > On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> > > > > >> On media, enforcing userspace to always be open source would
> > > > > >> have been very bad, as it would prevent several videoconferencing 
> > > > > >> software to exist on Linux.
> > > > > >
> > > > > > I don't think we should enforce that all userspace users of an interface
> > > > > > be Open Source. I do think we should enforce that *some* userspace user
> > > > > > of an interface be Open Source before we add the interface.
> > > > > 
> > > > > The real question is whether the interface is documented in a way that
> > > > > an Open Source implementation is possible. It does not matter whether it
> > > > > exists at that point in time or not. Even if it exists there is no
> > > > > guarantee that it is feature complete.
> > > > > 
> > > > > Freely accessible documentation is really the key.
> > > > 
> > > > I have more radical view than you and think that documentation is far
> > > > from being enough. I would like to see any userspace API used (or to be
> > > > used) in any package which exists in Debiam/Fedora/SuSE.
> > > 
> > > We probably need to add Android AOSP to that list, as we have
> > > Android-specific APIs (not that I believe we *should* have
> > > Android-specific APIs, there's been lots of efforts over the past years
> > > to develop standard APIs for use cases that stem from Android, slowly
> > > replacing Android-specific APIs in some area, but I don't believe we can
> > > realisticly bridge that gap completely overnight, if ever).
> > 
> > Maybe.
> > 
> > > > Only this will give us some sort of confidence that API and device are usable
> > > > to some level. As a side note, we will be able to estimate possible API
> > > > deprecation/fix/extension based on simple search in package databases.
> > > 
> > > Linux supports devices from very diverse markets, from very tiny
> > > embedded devices to supercomputers. We have drivers for devices that
> > > exist in data centres of a single company only, or for which only a
> > > handful of units exist through the world. The set of rules that we'll
> > > decide on, if any, should take this into account.
> > 
> > I'm part of that group (RDMA) who cares about enterprise, cloud and supercomputers. :)
> > So for us, working out-of-the box (distro packages and not github code drops) is
> > the key to the scalability.
> 
> What if we're dealing with a device that only exists in a handful of
> machines though ? Would distributions accept the burden of packaging
> corresponding userspace code, and maintaining the packages, when only a
> handful of people in the world will use it ? It's a genuine question.

Fedora, Debian and OpenSuSE are volunteer based distributions, they
accept new packages, which need to be prepared (or asked to be
prepared) by such vendors.

There is no "accept the burden of packaging corresponding userspace code,
and maintaining the packages", it is on package maintainer who can or
can't be associated with distribution.

> 
> > Regarding "embedded devices", I remind that we are talking about
> > userspace API and most likely busybox will be used for them, which is
> > also part of larger distro anyway, so fails under category "exists in
> > Debian/Fedora/SuSE".
> 
> We're talking about APIs exposed by drivers, for devices such as GPUs,
> cameras or AI/ML accelerators. I don't think busybox will exercise those
> :-) We have Masa for GPUs, libcamera for cameras, and other frameworks
> I'm less familiar with for AI/ML accelerators, and I expect those to be
> packaged by distributions. There are however other kind of devices that
> don't fall in existing well-defined categories.

I'm a little bit confused here. IMHO, you are trying to find an universal
solution for a problem that doesn't exist.

Above you asked how to deal with niche devices? Here you talk about mass
products devices for the enterprise while before you mentioned "embedded
devices".

1. Niche devices - continue to do as they do it now, by supplying
out-of-tree solutions for their customers. Such devices and companies
rarely need upstream linux kernel support, because the burden to
upstream it is very high. We don't want them in the tree either, because
once they upstream it, the maintenance burden will be on us.
2. Devices that hits the certain level of adoption - need to be
integrated into certain userspace stack, which needs to be part of
distro.

And AI/ML is no different here, someone just need to start build such
stack. Otherwise, we will continue to see more free riders like HabanaLabs
which don't have any real benefit to the community.

> 
> I'm thinking, for instance, about dewarp engines that are used to create
> 3D surround view for cars. In a nutshell, those devices take a set of
> texture and a list of triangles, and perform texture mapping. They're a
> bit like GPUs but without 3D, so APIs such as OpenGL or Vulkan don't
> apply. There's no standard API for such devices, and no existing
> userspace framework similar to Mesa in which a vendor could upstream the
> open userspace driver code. I believe that requiring an open userspace
> to merge such drivers in the kernel would make sense, but I also don't
> think it would be reasonable to ask the first vendor who wants to do so
> to create a complete userspace framework with a standard API. The bar to
> entry would be too high. An open implementation specific to that device,
> with a custom application API, would be a good first step, and it could
> serve as a basis to create a framework once a second vendor wants to do
> the same. We have to set the end goal, but also consider how it can be
> reached.

The bar needs to be high from the beginning, We can lower it later if it
doesn't work.

Thanks

> 
> > > > IMHO, github projects to show API usage are the worst possible way to
> > > > allow acceptance for new userspace API.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

