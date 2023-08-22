Return-Path: <ksummit+bounces-1057-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA048784429
	for <lists@lfdr.de>; Tue, 22 Aug 2023 16:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB96A1C20B37
	for <lists@lfdr.de>; Tue, 22 Aug 2023 14:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081DD1D2ED;
	Tue, 22 Aug 2023 14:29:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8297E7F
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 14:29:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21A9E899;
	Tue, 22 Aug 2023 16:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692714469;
	bh=fI3o2A6zSUHD/Rej7iCeiSzW/YpNIswkUI0qpFIuz3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vvpaWQ9VJREOCrMdPxeXqIJdXKNHoJwFytjrEwBeEw1XOuQr8/SzILIgWTpdKR5/X
	 lFukA1pAau9xoYM2OdHNgN09FVgWMK5byQapDrKMkvid9rZEOysDXokeXRW5SyEbiG
	 awFM/IdcOyl70Qp/SqPChBzAQyu74sVZBhWAJIGQ=
Date: Tue, 22 Aug 2023 17:29:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Message-ID: <20230822142913.GB14596@pendragon.ideasonboard.com>
References: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <2023082250-replace-rectangle-1d47@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023082250-replace-rectangle-1d47@gregkh>

On Tue, Aug 22, 2023 at 10:55:13AM +0200, Greg KH wrote:
> On Mon, Aug 21, 2023 at 05:43:21PM -0700, Dan Williams wrote:
> > - When do vendors need to share a common ABI?
> 
> When they do the "same type of thing" :)
> 
> > - How well is our "community consensus" protocol working to give
> >   contributors actionable feedback?
> > - Is there more we can do to enable contributors to steer the right path
> >   out of the expediency vs maintainability trap?
> > 
> > "Confidential Computing" is an example of an area with several
> > cross-silicon-vendor implementations that continue to add features with
> > a steady stream of upstream design decisions that cross multiple
> > subsystems.
> 
> And the normal "you all need to get together and agree on an api
> yourself, otherwise we can't take any of this" should work here, right?
> 
> Well, except for the groups that snuck stuff in before we realized what
> it really was, I guess we are stuck with them.
> 
> Why not have the community "fight it out" among themselves first, before
> we have to worry about it?

In some (many ?) cases, the lowest effort path is to try and sneak it in
without us noticing rather than "fighting it out" or "designing it out"
among themselves. There are cases where this behaviour is even the
consensus among vendors, as they collectively prefer keeping the design
effort low and get drivers and whole new subsystems upstream without
taking the community interests into account at all. The drivers/accel/
story is a fairly good example of the conflict between vendors who want
to disclose as little as possible and ship closed-source userpace, and a
community that insists on having fully open stacks. As long as vendors
will believe they can get away with it, they will keep trying, and we'll
spend lots of energy fighting back.

-- 
Regards,

Laurent Pinchart

