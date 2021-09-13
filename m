Return-Path: <ksummit+bounces-552-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA3409033
	for <lists@lfdr.de>; Mon, 13 Sep 2021 15:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 29ED63E109C
	for <lists@lfdr.de>; Mon, 13 Sep 2021 13:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728063FDA;
	Mon, 13 Sep 2021 13:50:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD953FC4
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 13:50:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1DC161B66;
	Mon, 13 Sep 2021 13:50:16 +0000 (UTC)
Date: Mon, 13 Sep 2021 15:50:14 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210913135014.ydhk42ncnzakvvii@wittgenstein>
References: <877dfop2lx.fsf@meer.lwn.net>
 <YTvPAMT9FRCUeWjR@localhost>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTvPAMT9FRCUeWjR@localhost>

On Fri, Sep 10, 2021 at 02:32:48PM -0700, Josh Triplett wrote:
> On Fri, Sep 10, 2021 at 03:00:58PM -0600, Jonathan Corbet wrote:
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
> 
> I think it'd be reasonable to ask, as well: if we required this for
> *all* kernel functionality, such that we never add any userspace
> interface to the kernel unless there's *some* Open Source userspace that
> needs/wants it, what problems would that cause if any?
> 
> It appears that in this case the kernel pushing back has influenced the
> release of Open Source userspace code. Having a kernel-wide policy here
> seems like it'll *help* people within many companies to push for such
> changes: "We're never going to be able to get our changes into the
> upstream kernel if there's no userspace to drive them."

I can certainly see why that discussion is needed for features that deal
with hardware which requires an elaborate userspace component in order
to work.
But I'm not convinced this policy makes sense for all kernel features.
For example, when we introduce a new general api in kernel core it will
often be driven by requirements of other well-known open source
projects. If such projects state that they will add support for it once
a kernel supporting this feature is released that expression of their
intent is often sufficient. We usually don't make such projects jump
through the hoops of implementing the userspace side upfront to proof
that they would use it. Although to the credit of a few open source
projects that does also happen. But I'm hesitant to make this a general
rule.

Christian

