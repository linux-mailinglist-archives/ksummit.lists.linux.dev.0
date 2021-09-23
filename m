Return-Path: <ksummit+bounces-633-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EAE415CD8
	for <lists@lfdr.de>; Thu, 23 Sep 2021 13:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 57C413E103B
	for <lists@lfdr.de>; Thu, 23 Sep 2021 11:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E770F3FCF;
	Thu, 23 Sep 2021 11:32:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1743FC7
	for <ksummit@lists.linux.dev>; Thu, 23 Sep 2021 11:32:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED77745E;
	Thu, 23 Sep 2021 13:32:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1632396757;
	bh=yThQeoLH+6e1qc4yu3r3aVfm7XwKIvgSY/zYJzXb2p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvHxNd4otfWmiAa0GS7g0pZa/qkXJWnDChqm898+C7os5pwUyRgrQF6s3S7t06uGX
	 k9fQwY4u90wYOons156flctfzAp4HUsDD+BAaHUqpoiUwdaZVhg1SxXQ9xnynAcqZ5
	 B314aIUteofufjN/UoU6IEB4T31aWYW1hs1Wubm4=
Date: Thu, 23 Sep 2021 14:32:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <greg@kroah.com>
Cc: Theodore Ts'o <tytso@mit.edu>, ksummit@lists.linux.dev
Subject: Re: Potential topics for the 2021 Maintainer's Summit
Message-ID: <YUxl06hJ8rFK7ur4@pendragon.ideasonboard.com>
References: <YUwOE5ExtvMye2t/@mit.edu>
 <YUxNpVkO68dllK/N@pendragon.ideasonboard.com>
 <YUxga4g1puy68oVv@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YUxga4g1puy68oVv@kroah.com>

Hi Greg,

On Thu, Sep 23, 2021 at 01:09:31PM +0200, Greg KH wrote:
> On Thu, Sep 23, 2021 at 12:49:25PM +0300, Laurent Pinchart wrote:
> > On Thu, Sep 23, 2021 at 01:18:11AM -0400, Theodore Ts'o wrote:
> > > 
> > > After discussions amongst the program committee, and looking at some
> > > of the discussions to date at the LPC and the Kernel Summit, we've
> > > come up with the following potential topics for the Maintainer's
> > > Summit.
> > > 
> > > This is not the final agenda.  We are soliciting suggestions and
> > > comments about these topics.  Is there anything we are missing?  Is
> > > there something you think wouldn't be productive for us to discuss?
> > > 
> > > 
> > > 		  Potential Maintainer Summit topics
> > > 
> > > * Reviewing how we reacted to the University of Minnesota issue
> > >     After Greg K-H gives a non-technical summary of what
> > >     happened, and we would have a discussion about what should be
> > >     done differently next time.
> > > 
> > > * User-space requirementrs for accelerator drivers
> > >     There was some good discussion on the ksummit list, but there still isn't
> > >     a clear consensus of what the policy should be.  From Jon's message
> > >     kicking off that thread:
> > > 
> > >     - Under which circumstances should the kernel community require the
> > >       existence of freely licensed user-space code that exercises all
> > >       functionalities of a proposed kernel driver or feature?
> > > 
> > >     - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
> > >       are only available to drivers with a free user-space implementation?
> > >       Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> > > 
> > >     - What constitutes an acceptable user-space implementation in cases
> > >       where these restrictions apply?
> > 
> > Just a quick comment on this. if it can be useful information, I'd be
> > happy to briefly explain and answer questions about the ongoing effort
> > to build a camera stack for Linux. We're running into the exact same
> > issues, and have been trying to build bridges with SoC vendors over the
> > past few years (with various levels of success).
> 
> I think there's two different main topics here:
> 	- where to move the existing accelerator drivers to in the tree
> 	  and who should maintain them
> 	- requirements for accepting kernel code that has new
> 	  user/kernel apis
> 
> The first topic doesn't really pertain to v4l and libcamera, but the
> second topic would :)

I'm sure libcamera will use accelerators one day, but for the time
being, you're right :-) The discussion stemmed from accelerators and has
broaden to more types of devices. Depending on the scope of the
discussion at the maintainer's summit, I'll be happy to contribute or
stay away :-)

-- 
Regards,

Laurent Pinchart

