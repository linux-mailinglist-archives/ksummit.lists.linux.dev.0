Return-Path: <ksummit+bounces-559-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2669E40A30E
	for <lists@lfdr.de>; Tue, 14 Sep 2021 04:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id E20911C0D50
	for <lists@lfdr.de>; Tue, 14 Sep 2021 02:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE11B3FD3;
	Tue, 14 Sep 2021 02:08:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04942FAE
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 02:08:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 501C52A5;
	Tue, 14 Sep 2021 04:08:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631585283;
	bh=ZlWL6oYrxuAzE1gNVo1Ft1g91PMjQ7EE3AH+OsFRNuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FE5g1bdi2+ciS3ii9j6/hVz372M2eAnTEOv2rS2TqVdyXzFy61GvFArHgzfZYBo5j
	 6ucztG69jp+LHL/WFbZoKJDk0o/3WoSh+y6BDXeIFPpzBB7VDcvetlg6Ql+7JPL3iM
	 RgDPjKmeirDGWo+568qf3XURW74dNyNdrH+Oi2T0=
Date: Tue, 14 Sep 2021 05:07:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian Brauner <christian.brauner@ubuntu.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YUAD6+fel9roitEF@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <YTvPAMT9FRCUeWjR@localhost>
 <20210913135014.ydhk42ncnzakvvii@wittgenstein>
 <CAKMK7uFPxVosEvdwSOrfUvq7+W-dUo39ktEm2Yag_wvJ5YvZNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKMK7uFPxVosEvdwSOrfUvq7+W-dUo39ktEm2Yag_wvJ5YvZNg@mail.gmail.com>

Hi Daniel,

On Mon, Sep 13, 2021 at 03:57:25PM +0200, Daniel Vetter wrote:
> On Mon, Sep 13, 2021 at 3:50 PM Christian Brauner wrote:
> > On Fri, Sep 10, 2021 at 02:32:48PM -0700, Josh Triplett wrote:
> > > On Fri, Sep 10, 2021 at 03:00:58PM -0600, Jonathan Corbet wrote:
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
> > >
> > > I think it'd be reasonable to ask, as well: if we required this for
> > > *all* kernel functionality, such that we never add any userspace
> > > interface to the kernel unless there's *some* Open Source userspace that
> > > needs/wants it, what problems would that cause if any?
> > >
> > > It appears that in this case the kernel pushing back has influenced the
> > > release of Open Source userspace code. Having a kernel-wide policy here
> > > seems like it'll *help* people within many companies to push for such
> > > changes: "We're never going to be able to get our changes into the
> > > upstream kernel if there's no userspace to drive them."
> >
> > I can certainly see why that discussion is needed for features that deal
> > with hardware which requires an elaborate userspace component in order
> > to work.
> > But I'm not convinced this policy makes sense for all kernel features.
> > For example, when we introduce a new general api in kernel core it will
> > often be driven by requirements of other well-known open source
> > projects. If such projects state that they will add support for it once
> > a kernel supporting this feature is released that expression of their
> > intent is often sufficient. We usually don't make such projects jump
> > through the hoops of implementing the userspace side upfront to proof
> > that they would use it. Although to the credit of a few open source
> > projects that does also happen. But I'm hesitant to make this a general
> > rule.
> 
> I agree it's an orthogonal discussion, but I think we've also had our
> fair share of fully generic interface that turned out to miss the mark
> in real-world usage. This is why the generic kernel
> modesetting/display interface for drivers in drivers/gpu also needs
> fully open implementation. Not because we really need that for
> long-term maintainability - the interfaces are generally well-defined
> enough that testcases + docs are sufficient for that, but because in
> practices it just catches so many small gotchas that are otherwise
> overlooked in good generic uapi design.

I concur here. I've spent the past 3 years working on libcamera in
userspace after a decade of experience in the kernel side of V4L2. It
was an enlightening (and embarassing) moment to realize that some kernel
APIs that I had designed myself didn't stand the test of being used for
real. A test application written to test an API in the way the API was
designed will generally not be good at finding design flaws.

> But I do think we should keep this apart from the discussions for hw
> drivers, where 80+% of the driver that's absolutely needed to drive
> the hardware is in userspace.

-- 
Regards,

Laurent Pinchart

