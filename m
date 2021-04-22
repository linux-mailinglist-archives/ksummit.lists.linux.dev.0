Return-Path: <ksummit+bounces-80-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 0176336821D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id BB7463E62E9
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9912F2FA1;
	Thu, 22 Apr 2021 14:07:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85DA2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 14:07:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1259D613DC;
	Thu, 22 Apr 2021 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619100453;
	bh=V82kcpwjcppmFBzqg+sUKmcJbxeHRTQogS/YIai8SKQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gDszl/zEGwPByFFelperIYIh1YFjpIQLojWHQyYLV4PuypLdhKUij0DwVBuiutkwi
	 ImpbSPx5mVD+L3pnIIeysE6odaJS49whxyPcHFGM43FsFLUhI61gkjOJNzYhHb3cz0
	 tyZQN9gP2HshLdYtxUxnp+xBzvo//5wa2a/pu5OgqCdJfuCy64kzuaCtFdHwFTPxco
	 zneQjjZw2RIMv2553VpT2IxoyB5dtZJNO8m7nDgpOpNlwN7fr1vLp0dUDHIjKnBLJY
	 De+SkFBZIlUA8SVjUIvRpRwHtZt4RoUC//7NeNWE6DKyJrluDCyYvo18QxX10j1iqU
	 /Qgd2GrCpHArA==
Date: Thu, 22 Apr 2021 16:07:29 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
    Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <20210422100021.1a3f143c@gandalf.local.home>
Message-ID: <nycvar.YFH.7.76.2104221602590.18270@cbobk.fhfr.pm>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210422123559.1dc647fb@coco.lan> <CADVatmM8Nrht+nWpP99WQSm8HtHimNkjmUFDjjRTmMjuB+401Q@mail.gmail.com> <20210422100021.1a3f143c@gandalf.local.home>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Apr 2021, Steven Rostedt wrote:

> > May I suggest that we have a separate tree for trivial patches like 
> > the trivial.git tree that Jiri has and all trivial patches goes
> 
> Funny that you suggest something that we already have and you mention. Yes
> Jiri had the trivial tree, but because it ends up being a lot of work, and
> if the maintainer of that tree doesn't have the time to maintain it, it
> becomes a dead end for those patches.
> 
> It requires someone with a good enough reputation to maintain it, and that
> means most people who have that reputation do not have the time to maintain
> it ;-)

Yeah, amen to that :)

That tree still sort of exists, I am collecting the patches that are sent 
there every now and then in big batches, and those which are still 
relevant by then I send to Linus afterwards.

The problem with that aproach of course is that it implicitly assumes 

	trivial -> non-urgent

which is a dubious asumption to take. But so far, it has actually worked 
reasonably well in that mode of operation, because the trivial && urgent 
ones are picked up by maintainers normally anyway by their own interest 
(and usually people are reasonable enough to send the urgent ones the 
proper route anyway).

-- 
Jiri Kosina
SUSE Labs


