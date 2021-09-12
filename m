Return-Path: <ksummit+bounces-540-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id D9649407FC9
	for <lists@lfdr.de>; Sun, 12 Sep 2021 21:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id D78591C0F23
	for <lists@lfdr.de>; Sun, 12 Sep 2021 19:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE6A3FD8;
	Sun, 12 Sep 2021 19:48:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94393FC3
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 19:48:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26C608F;
	Sun, 12 Sep 2021 21:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631476120;
	bh=iU83MYI4ojV5W5gymptVHU9Z6ZG5niBLGyBGryL0KmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gw1cWDJgMP1xFibsHINJLqGwDZNB6nEBzC984ynnFskr3s0zJVcUanKz2IE0ZzSo3
	 kqgppif6pl18g+CJAoNHMRqaIdN5GQRDFRinXv9F3SPeXS7OwC+SnyhSqusPVpNBvM
	 uSPNzTFnaT6tvgQVH813e/KTHmWXWF3Mjk1xgGkg=
Date: Sun, 12 Sep 2021 22:48:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT5Zf/nq5WobZLyI@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <CAPM=9tx+wAUSuYm+8eyGX2Y7+J5qY9hZHB7JY_XO_TYEQYJk8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPM=9tx+wAUSuYm+8eyGX2Y7+J5qY9hZHB7JY_XO_TYEQYJk8g@mail.gmail.com>

Hi Dave,

On Mon, Sep 13, 2021 at 05:13:05AM +1000, Dave Airlie wrote:
> On Sat, 11 Sept 2021 at 07:10, Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > There has been a regular disagreement in recent years about whether
> > drivers for accelerators (such as for the Habana Gaudi device) should be
> > subject to the same requirements as GPU drivers when it comes to the
> > availability of a free implementation of the user-space side.  It flared
> > up again recently:
> >
> >    https://lwn.net/Articles/867168/
> >
> > Happily, the Habana situation in particular seems to be resolving
> > itself:
> >
> >    https://lwn.net/ml/linux-kernel/CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com/
> >
> > But even there it is clear that the fundamental question has not yet
> > been resolved.
> >
> > This seems like the sort of question that the maintainer summit exists
> > to address.  Specifically, we could discuss:
> >
> >  - Under which circumstances should the kernel community require the
> >    existence of freely licensed user-space code that exercises all
> >    functionalities of a proposed kernel driver or feature?
> >
> >  - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
> >    are only available to drivers with a free user-space implementation?
> >    Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> >
> >  - What constitutes an acceptable user-space implementation in cases
> >    where these restrictions apply?
> >
> > I suspect that more clarity (and fewer arguments) on these questions
> > would be welcome both within and beyond the development community.
> >
> > Thanks,
> 
> Can everyone take a read of:
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> 
> I think in order to clean the signal/noise ratio up in here, some
> education effort might help people realise how non-trivial these
> things are.
> 
> 1. These drivers are not one or two ioctls that a few selftests and a
> small test app can cover. It's like saying LTP is all we need to
> define the uAPI for the kernel and if anyone does something LTP
> doesn't cover the app is broken. These systems are generally complex,
> multithreaded and multiuser uAPIs, involving command streams recorded
> in userspace being submitted to the devices. They interact with memory
> management and can cause unfindable deadlocks across the system if
> designed incorrectly. Documentation or kselftests aren't going to cut
> it here.
> 
> 2. In my experience we don't build communities by merging everything,
> we build them by saying No more and pushing back on companies with
> education and cross-vendor cooperation. Responsible kernel maintenance
> shouldn't end at the kernel boundaries. If you aren't the person to
> help enforce a userspace for a driver you are being asked to merge,
> then don't merge it, but try and engage the vendor with the
> communities of interest in the kernel who already deal in those areas.
> 
> 3. The pressures on these companies to merge things into Linux isn't
> altruistic or even that they necessarily want to be in the Linux
> kernel upstream. They are being told by Red Hat, Facebook, Google or
> someone else that they need an upstream driver. They will generally
> engage at a minimal level to get past that blockage and then
> disengage. Having a clear set of rules (or a place to discuss those
> rules, for new subsystems) and a gentle pushback helps develop
> communities by unlocking funding within those larger areas. As Laurent
> has said this isn't free, but just putting things into the kernel and
> not caring about userspace hasn't built any Linux communities in the
> accelerator areas.
> 
> That said I started writing a cleaned up version of the above document
> which is more generic that other subsystems could sign on to. I was
> going to engage with a coalition of like-minded maintainers rather
> than trying to gain consensus among a herd of cats to see if we can
> draw clearer lines in the sand that cross more subsystems so the
> experience of drivers/gpu doesn't go unwasted but also isn't just
> bypassed by subsystem hunting.
> 
> https://cgit.freedesktop.org/~airlied/linux/log/?h=wip-open-source-userspace

Thank you for that effort. Could you add camera ISPs to the list with
FPGAs, DSPs and ML accelerators ?

You mention Level0 in that document. I assume you don't mean the
OpenStreetMap editor ?

-- 
Regards,

Laurent Pinchart

