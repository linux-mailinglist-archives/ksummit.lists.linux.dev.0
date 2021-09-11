Return-Path: <ksummit+bounces-507-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C85407430
	for <lists@lfdr.de>; Sat, 11 Sep 2021 02:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A97B81C0F7A
	for <lists@lfdr.de>; Sat, 11 Sep 2021 00:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA06C2FB6;
	Sat, 11 Sep 2021 00:21:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535EB3FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 00:21:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56305510;
	Sat, 11 Sep 2021 02:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631319672;
	bh=SDpC6xaMhLcE6OEQamEeSVuw7RQRVcL8jlQZC4JYU2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsRm1Ms7AI8/VsF0Jj3HVxEAU8u+PDn33TTHfAk8huxsF5vFfkDZ1rOwJyfWgh2bQ
	 2HC+gY9Gu667QPAE1fZspPgZpXx+3V5DvWcMWycjLnO4bKqS6hZtPBbFOcva68b/IL
	 4CJWzuIgBFhJCHS1YzDLwVCTC2oqt/dqOmr9nYaw=
Date: Sat, 11 Sep 2021 03:20:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTv2YvLmzlJA4+tc@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ilz8c7ff.ffs@tglx>

Hi Thomas,

On Sat, Sep 11, 2021 at 01:55:16AM +0200, Thomas Gleixner wrote:
> On Fri, Sep 10 2021 at 16:45, Josh Triplett wrote:
> > On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> >> On media, enforcing userspace to always be open source would
> >> have been very bad, as it would prevent several videoconferencing 
> >> software to exist on Linux.
> >
> > I don't think we should enforce that all userspace users of an interface
> > be Open Source. I do think we should enforce that *some* userspace user
> > of an interface be Open Source before we add the interface.
> 
> The real question is whether the interface is documented in a way that
> an Open Source implementation is possible. It does not matter whether it
> exists at that point in time or not. Even if it exists there is no
> guarantee that it is feature complete.
> 
> Freely accessible documentation is really the key.

In principle I'd agree, but that assumes such documentation would exist
in the first place, with a sufficient level of quality. In many cases an
open implementation the exercises all device features is a better form
of documentation than what vendors have, even internally. Of course, the
opposite is true as well, having seen too much vendor code for my own
good, there is such a thing as a working for unreadable implementation.

I fully agree with your point about feature completeness by the way,
vendors will always find ways to hide pieces of the API if they really
want to, but I think that would be true of documentation as well.

In the DRM/KMS subsystem, the requirement is to provide an
implementation in a mainstream graphics stack (depending on the device,
that could be Mesa, Xorg, Weston, Android AOSP, ...) *and* get it
approved by the maintainers of that stack. Requiring maintainer approval
is the best way that was found to ensure a sufficient level of quality
in those cases.

-- 
Regards,

Laurent Pinchart

