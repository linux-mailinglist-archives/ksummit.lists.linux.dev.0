Return-Path: <ksummit+bounces-532-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A7E407DD7
	for <lists@lfdr.de>; Sun, 12 Sep 2021 16:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id B2FBC3E1028
	for <lists@lfdr.de>; Sun, 12 Sep 2021 14:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E633FD8;
	Sun, 12 Sep 2021 14:54:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90643FC5
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 14:54:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E32C9E;
	Sun, 12 Sep 2021 16:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631458455;
	bh=h3OG9Z1wMLzLZrG70bw0I+UpwSX8wvRn1OukPfoXZn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riqQQE1lfnnQs295niWlcRUK/QKl4+7q/swbEh+BUY2zD4VM1quJTaVWKyXWF+9Bw
	 QMISyD2QUMKKiBG/pc71chTEeEFdFnxbVJqX2Je+1vNFUsvST4iU5TAPRPZwSBCZRV
	 CesnuN/Fe8+zWub3GqQkBAsS5rQC1xra2wGXtsec=
Date: Sun, 12 Sep 2021 17:53:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT4Uf0GOwLDxDX5C@pendragon.ideasonboard.com>
References: <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
 <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
 <YT2By1+yuo7rcu2D@unreal>
 <20210912094648.3296acfe@coco.lan>
 <YT2zryAKHc/5R2IH@unreal>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YT2zryAKHc/5R2IH@unreal>

Hello,

On Sun, Sep 12, 2021 at 11:00:47AM +0300, Leon Romanovsky wrote:
> On Sun, Sep 12, 2021 at 09:46:48AM +0200, Mauro Carvalho Chehab wrote:
> > Em Sun, 12 Sep 2021 07:27:55 +0300 Leon Romanovsky escreveu:
> > 
> > > > What if we're dealing with a device that only exists in a handful of
> > > > machines though ? Would distributions accept the burden of packaging
> > > > corresponding userspace code, and maintaining the packages, when only a
> > > > handful of people in the world will use it ? It's a genuine question.  
> > > 
> > > Fedora, Debian and OpenSuSE are volunteer based distributions, they
> > > accept new packages, which need to be prepared (or asked to be
> > > prepared) by such vendors.
> > > 
> > > There is no "accept the burden of packaging corresponding userspace code,
> > > and maintaining the packages", it is on package maintainer who can or
> > > can't be associated with distribution.
> > 
> > There is a dead lock issue, though: if we're willing to have a policy
> > of only accepting a new Kernel API after Fedora/Debian/openSuse accepts
> > its userspace counterpart, it would mean, in practice, that no new
> > APIs will ever be added, as I'm pretty sure most Fedora/Debian/openSuse
> > maintainers will refuse an application that depends on a non-accepted
> > Kernel API.
> 
> I said something different - "I would like to see any userspace API used (or to be
> used)". 
> https://lore.kernel.org/ksummit/20210912003349.6d2cacb1@coco.lan/T/#m3b7fbbe0959f1b59288dec9afd39f7cda0eeefe9
> 
> "To be used" means some open PR to existing package or request for
> inclusion for new packages.

Requiring userspace support to be merged in the appropriate framework or
accepted as a package by distributions can result in deadlocks, but
requiring only aa upstream pre-approval is I think a good way to deal
with the issue. That's what DRM/KMS does, there's no hard requirement
(as far as I can tell) to have code merged in Mesa before the kernel,
only a requirement of getting the Mesa code reviewed and acked.

> > As a maintainer of several Fedora packages myself, I would refuse
> > any attempts of adding support for a non-accepted kernel API on
> > the packages I maintain.
> > 
> > -
> > 
> > Also, it makes no sense to add support on such general-purpose
> > distros for some hardware that will never be supported by it.
> > 
> > See, there are, for instance, some types of hardware that are
> > specific for some industry, like for instance, the CAN bus.
> > While CAN buses remain restricted to vehicles, it won't make any 
> > sense to crowd a general purpose distro with support for such
> > hardware. Such distros are not certified with ASIL. So, they
> > aren't allowed by law to be used inside vehicles.

I'm not sure that's the best example, CAN has uses in other types of
devices, some of which may run a general-purpose distribution.

> And github pile of ... is certified?
> 
> In attempt to find general solution for all types of APIs and devices,
> we won't solve anything.

That I agree with.

> So I suggest to return and talk about AI/ML devices and APIs that
> targeted for enterprise/cloud and needs to be supported by major
> distros.

And that I don't :-) I think the issue is the same for at least GPUs and
AI/ML accelerators, and quite possible camera ISPs too. I'd like to try
and define clear sets of criteria to address the problem, and that can
include different alternatives (just as an example, not necessarily
something I'd advocate for, open userspace vs. documentation) that
subsystems can then select based on their specific situation.

-- 
Regards,

Laurent Pinchart

