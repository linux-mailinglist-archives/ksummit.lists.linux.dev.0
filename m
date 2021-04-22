Return-Path: <ksummit+bounces-125-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 085003688A3
	for <lists@lfdr.de>; Thu, 22 Apr 2021 23:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id B4B783E486D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 21:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CFC2FA4;
	Thu, 22 Apr 2021 21:33:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04E32FA1
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 21:33:32 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1619127211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7iVccHs0YXvtA8/tSjg2q7pAxpeLlEl7T7skCk79LsY=;
	b=f5t/fskxsOaBJDgcaKVLyI5x/C9hKA9UB4KLUyXV6KbKAAX0Gd2j5ddbgX7jgSGOaSsC/W
	st3KMfEhbf+xSLwI1sIIe1p9/1aX76bRPqJIC8lp5QBekLGYOK20s5urlGU8GXQDX2LysE
	sEdnst5ZyYYGCxQ/ptIslmSzl1kW8okLG1EHnybT5p50KoNOVYfCi+xu5F/kg5IcCs93VH
	wMPn1g2MduVxzo2QnP2NaJY9cGHFlOz3x64VNZ8DnzwZugbQijGdZr1Gx36vrkDBeAPH+t
	vLTER7NT+UATvks9h1dycfl0bu2YJ0jlcG01VMu+vAz/WspV34OiknD11NhtDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1619127211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7iVccHs0YXvtA8/tSjg2q7pAxpeLlEl7T7skCk79LsY=;
	b=4KdIvdnF6ytgVK+qz+wkeiYkkAd2xCD86aLhm556PxRVrH34byeA9WLiiWO3iso5Sdd8GD
	91TRMvzDYErYQ+CQ==
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Jiri Kosina <jikos@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial" patches
In-Reply-To: <CADVatmOy2vj8itMEJa_HL2tC-gGkOnXdHTCgBFntgW_uNOEk-g@mail.gmail.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210422123559.1dc647fb@coco.lan> <CADVatmM8Nrht+nWpP99WQSm8HtHimNkjmUFDjjRTmMjuB+401Q@mail.gmail.com> <20210422100021.1a3f143c@gandalf.local.home> <nycvar.YFH.7.76.2104221602590.18270@cbobk.fhfr.pm> <CADVatmOy2vj8itMEJa_HL2tC-gGkOnXdHTCgBFntgW_uNOEk-g@mail.gmail.com>
Date: Thu, 22 Apr 2021 23:33:30 +0200
Message-ID: <87zgxqvwb9.ffs@nanos.tec.linutronix.de>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 22 2021 at 16:31, Sudip Mukherjee wrote:
> On Thu, Apr 22, 2021 at 3:07 PM Jiri Kosina <jikos@kernel.org> wrote:
>>
>> On Thu, 22 Apr 2021, Steven Rostedt wrote:
>>
>> > > May I suggest that we have a separate tree for trivial patches like
>> > > the trivial.git tree that Jiri has and all trivial patches goes
>> >
>> > Funny that you suggest something that we already have and you mention. Yes
>> > Jiri had the trivial tree, but because it ends up being a lot of work, and
>> > if the maintainer of that tree doesn't have the time to maintain it, it
>> > becomes a dead end for those patches.
>> >
>> > It requires someone with a good enough reputation to maintain it, and that
>> > means most people who have that reputation do not have the time to maintain
>> > it ;-)
>>
>> Yeah, amen to that :)
>
> I know, shortage of maintainers and reviewers.
> I guess my suggestion was that all trivial patches goes via the
> trivial tree and to have a group of interested people reviewing
> patches which are submitted to trivial.
>
>>
>> That tree still sort of exists, I am collecting the patches that are sent
>> there every now and then in big batches, and those which are still
>> relevant by then I send to Linus afterwards.
>
> I think this is a big blocker. Unless patches are applied to the tree
> soon and added to linux-next, anyone creating patches based on that
> tree and sending the patch might/will see the patch irrelevant.

The proper solution is to get rid of trivial@ completely. It's not
solving any problem at all.

And a new variant of trivial@ will have the same fate.

Thanks,

        tglx

