Return-Path: <ksummit+bounces-538-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C67E4407EDB
	for <lists@lfdr.de>; Sun, 12 Sep 2021 19:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 54A463E10A4
	for <lists@lfdr.de>; Sun, 12 Sep 2021 17:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA7C3FD8;
	Sun, 12 Sep 2021 17:09:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC743FCF
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631466539;
	bh=aOK6G+jheVTLxhSCMa15jncvQTa7X7vOAj/CEbCFYxk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=IpXoPTF+KeM/uVlBiWCYxMYGfSQZoUerxS7HMw7PPeUIRwRJDuQkNZfrYvp3v8RQr
	 4TdN/xR+eCSI+hbSif4V6dWlGdFPt614yMvuJF6POT+mlO/FwC6UpwYSB9z933A8aE
	 JEgsPN39Cjis+PCy8I+qsdQ3UKjIj+oGtpGjCFf0=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id B3B1B128065E;
	Sun, 12 Sep 2021 10:08:59 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZKZcbiP_FU2; Sun, 12 Sep 2021 10:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631466539;
	bh=aOK6G+jheVTLxhSCMa15jncvQTa7X7vOAj/CEbCFYxk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=IpXoPTF+KeM/uVlBiWCYxMYGfSQZoUerxS7HMw7PPeUIRwRJDuQkNZfrYvp3v8RQr
	 4TdN/xR+eCSI+hbSif4V6dWlGdFPt614yMvuJF6POT+mlO/FwC6UpwYSB9z933A8aE
	 JEgsPN39Cjis+PCy8I+qsdQ3UKjIj+oGtpGjCFf0=
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 2AB081280659;
	Sun, 12 Sep 2021 10:08:59 -0700 (PDT)
Message-ID: <c6a1b1bc5a82cd95a0a3af7cf6e823a6da5c3c67.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 ksummit@lists.linux.dev
Date: Sun, 12 Sep 2021 10:08:58 -0700
In-Reply-To: <YT4xpX4khqr3zQ6m@pendragon.ideasonboard.com>
References: <YTyFZufZHu9BSFxk@unreal>
	 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com> <YTybN5QwAnLfSBZC@unreal>
	 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com> <YT2By1+yuo7rcu2D@unreal>
	 <YT2rwbBR6ilHmwSZ@kroah.com> <YT26ebT6xXWsnVMw@unreal>
	 <YT3/5kJuhw/QVqrw@kroah.com> <YT4i4cN4ScWY8Ikf@pendragon.ideasonboard.com>
	 <680a7c9767eb0ddf8035bc90ba1d144fe1f7b4cd.camel@HansenPartnership.com>
	 <YT4xpX4khqr3zQ6m@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-09-12 at 19:58 +0300, Laurent Pinchart wrote:
> On Sun, Sep 12, 2021 at 09:43:39AM -0700, James Bottomley wrote:
> > On Sun, 2021-09-12 at 18:55 +0300, Laurent Pinchart wrote:
> > > As mentioned in another part of the mail thread, requiring code
> > > being merged in upstream userspace projects and/or packaged by
> > > distributions will cause deadlocks, but requiring code to be
> > > submitted and (pre-)approved is workable. That's what DRM/KMS
> > > does. To upstream a new KMS property for instance, you need to
> > > show how it's going to be used in Weston/Xorg/Android/... by
> > > submitting patches, and have the overall architecture approved by
> > > the corresponding maintainers.
> > 
> > This is no different from interlocks required in pretty much every
> > other project crossing open source feature, so it seems like the
> > right approach to me.  We already use this for confidential
> > computing, which often requires interlocking changes to QEMU, edk2
> > and other tools.  Usually, for confidential computing, the
> > evaluation is on either the QEMU or edk2 list which then accepts
> > the patch and the rest of the projects follow.  We do,
> > occasionally, get a late objection to the API from one of the other
> > projects after part of the enabling code has gone upstream in the
> > others, but we handle this like a bug fix.
> 
> On the DRM/KMS side that's also handled fine as far as I know, as
> mentioned above. For cameras, libcamera is becoming the de facto
> standard userspace stack, so we'll have a solution too. The harder
> question is what to do when no standard userspace stack exists. The
> answer obviously is to create one (or possibly multiple
> alternatives), but we'll need more than wishful thinking to make that
> happened. I can tell it took lots of work for libcamera to see the
> light of the day, including on the business side of it, not just the
> technical side.

Well, you know, this is where Open Source as a Standard comes from.  We
see the same in Confidential Computing.  There are several
manufacturers and they always specify how they think their stuff should
work in their standards or code drops, but rarely get beyond a proof of
concept in their own labs.  Once we start moving it upstream, we find
points of similarity between the different chip vendors, or sometimes
specified implementations which plain don't work, and start modifying
the APIs to take this into account.  What we eventually end up with
often doesn't mirror what the manufacturer standard says but it ends up
being the actual standard for current and future confidential computing
chips.

James



