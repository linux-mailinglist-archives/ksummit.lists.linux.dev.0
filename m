Return-Path: <ksummit+bounces-498-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id E213D407336
	for <lists@lfdr.de>; Sat, 11 Sep 2021 00:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A96643E10A2
	for <lists@lfdr.de>; Fri, 10 Sep 2021 22:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6772FB6;
	Fri, 10 Sep 2021 22:05:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00F83FC3
	for <ksummit@lists.linux.dev>; Fri, 10 Sep 2021 22:05:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 00AACC7240
	for <ksummit@lists.linux.dev>; Fri, 10 Sep 2021 21:59:14 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6D7DB1BF204;
	Fri, 10 Sep 2021 21:59:06 +0000 (UTC)
Date: Fri, 10 Sep 2021 23:59:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTvVKrfyMc7fKsZx@piout.net>
References: <877dfop2lx.fsf@meer.lwn.net>
 <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>

On 10/09/2021 14:51:43-0700, James Bottomley wrote:
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
> 
> I think our only recourse for user space accelerators is not to export
> the interface if we think it would only be used for evil purposes.
> 

I think the question is not whether we want to forbid proprietary user
space using an API but whether we want to merge said API so the license
on the kernel doesn't matter much.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

