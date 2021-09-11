Return-Path: <ksummit+bounces-505-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 49400407423
	for <lists@lfdr.de>; Sat, 11 Sep 2021 02:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 45F031C0AF4
	for <lists@lfdr.de>; Sat, 11 Sep 2021 00:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318C43FC3;
	Sat, 11 Sep 2021 00:08:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC532F80
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 00:08:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B09FF510;
	Sat, 11 Sep 2021 02:08:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631318922;
	bh=fR8lSBvYov47a4NY7X8GDU11A9yzEvR2buFle5vlUpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbJ99Yd84uLctq2t6/q7sgMo51xysvxeaOgUZDLYaRj01tVJKWV6uqy/NpotZz681
	 +R3JxCUPYpsb/U/55FxmSr/RX3YY+DnEUE8eoazwb74M0Hn3ALUSQaF1/ruaXR1CHP
	 V3HDyTPT5aNunxqjMSUAjvO/6p/dtA+9mJQdN1Yg=
Date: Sat, 11 Sep 2021 03:08:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTvzdKupt62yOchg@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>

Hi James,

On Fri, Sep 10, 2021 at 02:51:43PM -0700, James Bottomley wrote:
> On Fri, 2021-09-10 at 15:00 -0600, Jonathan Corbet wrote:
> >  - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA,
> > that are only available to drivers with a free user-space
> > implementation? Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> 
> I don't think reasonably we can do this.  The kernel GPLv2 licence
> includes this system exception:
> 
>       NOTE! This copyright does *not* cover user programs that use
>    kernel services by normal system calls - this is merely considered
>    normal use of the kernel, and does *not* fall under the heading of
>    "derived work". Also note that the GPL below is copyrighted by the
>    Free Software Foundation, but the instance of code that it refers to
>    (the Linux kernel) is copyrighted by me and others who actually
>    wrote it.
> 
>     Also note that the only valid version of the GPL as far as the
>    kernel is concerned is _this_ particular version of the license (ie
>    v2, not v2.2 or v3.x or whatever), unless explicitly otherwise
>    stated.
> 
> This means currently that once an API is exposed to user space, we've
> given up control of the type of programme (proprietary or open source)
> that may use it.
> 
> It might be possible legally to try and take back that control by
> modifying the system exception (what is a "normal" system call), but I
> personally think that would be unwise and create a raft of other
> problems for other proprietary user space code running on Linux, which
> I really think we don't want to do.

I overall agree that forbidding APIs from being used by closed-source
userspace is likely a no-go from a license point of view, and that it
would create a dangerous precedent and convey a bad message.

> I think our only recourse for user space accelerators is not to export
> the interface if we think it would only be used for evil purposes.

In my opinion the issue at hand isn't so much that the interface can be
used for evil purpose, but that drivers can reap the benefits of being
included in mainline while ignoring (in good faith or not) the
counterpart of allowing all userspace, open or not, to use the device.
The problematic part is usually not the internal kernel interfaces that
those drivers use, but the fact that they expose vendor-specific API
elements to userspace without documenting them.

One obvious option, *if* we decide that this isn't an acceptable
behaviour, is to refuse merging such drivers. DMA-BUF or P2PDMA are not
in themselves problematic, but in the case that Jon mentioned, they
indicate that the device is expected to inter-operate with other devices
by sharing data either through system memory or with direct DMA between
the devices. This makes the absence of an open userspace more
problematic as it may also affect the ability to use other devices in
the system. It could thus be considered as a criteria to decide which
drivers would require at one open userspace, should we decide that not
all drivers would.

-- 
Regards,

Laurent Pinchart

