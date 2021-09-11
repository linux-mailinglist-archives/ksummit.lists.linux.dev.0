Return-Path: <ksummit+bounces-518-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AE1407A9C
	for <lists@lfdr.de>; Sun, 12 Sep 2021 00:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CF5C11C0DCD
	for <lists@lfdr.de>; Sat, 11 Sep 2021 22:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94F33FDA;
	Sat, 11 Sep 2021 22:09:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A963FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 22:09:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6242FDD;
	Sun, 12 Sep 2021 00:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631398158;
	bh=IzzL5bNii3FZAv/v5Wym3UngrnpexwZoKLlJDTTSwqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQsXzR2K+1Ml0pLU8T84yNapM9U8uz/Van+cq5HlrMmUohjwLmpXWaWKV54zQVLda
	 F68EDAGSHyagYGp2FZNN2ajhoVmkvN79BuVEt7bhZc3dis/Dkl2NiSOPJduXNS2SAf
	 inyu548ZqCTcXOn4HSVX4QAHAKdo8aA5FZz/kmX4=
Date: Sun, 12 Sep 2021 01:08:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT0o91bQ7+O5yBVu@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTv2YvLmzlJA4+tc@pendragon.ideasonboard.com>
 <20210911102007.77b8a189@rorschach.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210911102007.77b8a189@rorschach.local.home>

Hi Steven,

On Sat, Sep 11, 2021 at 10:20:07AM -0400, Steven Rostedt wrote:
> On Sat, 11 Sep 2021 03:20:50 +0300 Laurent Pinchart wrote:
> 
> > > Freely accessible documentation is really the key.  
> > 
> > In principle I'd agree, but that assumes such documentation would exist
> > in the first place, with a sufficient level of quality. In many cases an
> > open implementation the exercises all device features is a better form
> > of documentation than what vendors have, even internally. Of course, the
> > opposite is true as well, having seen too much vendor code for my own
> > good, there is such a thing as a working for unreadable implementation.
> > 
> > I fully agree with your point about feature completeness by the way,
> > vendors will always find ways to hide pieces of the API if they really
> > want to, but I think that would be true of documentation as well.
> 
> I would like not only documentation, but also an open source test suite
> that simply tests the interface. Honestly, I believe that all new
> interfaces to the kernel (open or not) should have full documentation
> and a test suite interface before it gets accepted. We have
> tools/selftests that should be updated with all new interfaces into the
> kernel.
> 
> Even if it's just a smoke test, that would be fine. Obviously if
> there's a driver without hardware, it can't be tested. But if you have
> that hardware, perhaps there could be a simple test suite of the
> interface to let you know it is still functional.

It really depends on the device and the interface it requires. A GPU or
camera ISP driver can't be meaningfully tested just at the interface
level. The interface exposed to userspace is usually of the form of an
ioctl that allows passing a large command buffer in a device-specific
format, full of data that is then consumed by hardware or firmware. For
instance, look at the ipu3_uapi_params structure in
drivers/staging/media/ipu3/include/uapi/intel-ipu3.h. You need very
elaborate code to exercise such an API.

If you wanted GPU drivers to have tests in tools/selftests, you'd have
to move Mesa to the kernel :-)

-- 
Regards,

Laurent Pinchart

