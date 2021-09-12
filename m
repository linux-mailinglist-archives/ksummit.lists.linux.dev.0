Return-Path: <ksummit+bounces-537-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 5630F407ED3
	for <lists@lfdr.de>; Sun, 12 Sep 2021 18:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id E03213E108F
	for <lists@lfdr.de>; Sun, 12 Sep 2021 16:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FBB3FD8;
	Sun, 12 Sep 2021 16:58:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA27C3FCF
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 16:58:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2344B9E;
	Sun, 12 Sep 2021 18:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631465917;
	bh=n5a3JaIdkeVtpSaGfYHBGfWuS4PXZK0bT9NeB64wCOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPNmzG2tTsM5CZcrzcCQc8vweYQraQr9QHvPucROIMD27+qYKfsk3MMx3DMYXdXUj
	 aH7UwmJuY+9hK0cprD7yNP8cuONbK5K+xmj5I7zyugwSqovwhtZd7XBqu5QchAMEOc
	 JMuHNfpaHh2Rs9vvu3827kVwuDjA/dzfHNAskF5E=
Date: Sun, 12 Sep 2021 19:58:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT4xpX4khqr3zQ6m@pendragon.ideasonboard.com>
References: <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
 <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
 <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com>
 <YT26ebT6xXWsnVMw@unreal>
 <YT3/5kJuhw/QVqrw@kroah.com>
 <YT4i4cN4ScWY8Ikf@pendragon.ideasonboard.com>
 <680a7c9767eb0ddf8035bc90ba1d144fe1f7b4cd.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <680a7c9767eb0ddf8035bc90ba1d144fe1f7b4cd.camel@HansenPartnership.com>

On Sun, Sep 12, 2021 at 09:43:39AM -0700, James Bottomley wrote:
> On Sun, 2021-09-12 at 18:55 +0300, Laurent Pinchart wrote:
> > As mentioned in another part of the mail thread, requiring code being
> > merged in upstream userspace projects and/or packaged by
> > distributions will cause deadlocks, but requiring code to be
> > submitted and (pre-)approved is workable. That's what DRM/KMS does.
> > To upstream a new KMS property for instance, you need to show how
> > it's going to be used in Weston/Xorg/Android/... by submitting
> > patches, and have the overall architecture approved by the
> > corresponding maintainers.
> 
> This is no different from interlocks required in pretty much every
> other project crossing open source feature, so it seems like the right
> approach to me.  We already use this for confidential computing, which
> often requires interlocking changes to QEMU, edk2 and other tools. 
> Usually, for confidential computing, the evaluation is on either the
> QEMU or edk2 list which then accepts the patch and the rest of the
> projects follow.  We do, occasionally, get a late objection to the API
> from one of the other projects after part of the enabling code has gone
> upstream in the others, but we handle this like a bug fix.

On the DRM/KMS side that's also handled fine as far as I know, as
mentioned above. For cameras, libcamera is becoming the de facto
standard userspace stack, so we'll have a solution too. The harder
question is what to do when no standard userspace stack exists. The
answer obviously is to create one (or possibly multiple alternatives),
but we'll need more than wishful thinking to make that happened. I can
tell it took lots of work for libcamera to see the light of the day,
including on the business side of it, not just the technical side.

-- 
Regards,

Laurent Pinchart

