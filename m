Return-Path: <ksummit+bounces-103-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D1A36843A
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 15E2B3E7A5E
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38F02FA0;
	Thu, 22 Apr 2021 15:52:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63FA70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:52:38 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D8DB460241;
	Thu, 22 Apr 2021 15:52:36 +0000 (UTC)
Date: Thu, 22 Apr 2021 11:52:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Mauro Carvalho Chehab 
 <mchehab+huawei@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422115235.0526dabd@gandalf.local.home>
In-Reply-To: <dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210422123559.1dc647fb@coco.lan>
	<0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
	<a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
	<dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Apr 2021 08:48:21 -0700
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Thu, 2021-04-22 at 08:42 -0700, James Bottomley wrote:
> [...]
> >    2. Improving the requirement for bug fixes and large series, like
> > cover letters to everyone, adding fixes: tag and clear explanation.  
> 
> Just on this one, can we get the mailing list to help now we're moving
> to a new infrastructure?  I was already thinking of asking if it could
> reject email with html parts rather than simply losing it, but perhaps
> it could reject threaded submissions where the cover letter isn't
> correctly cc'd?  I know that's a big ask because there has to be an
> easy way to recognize them (heuristics on the PATCH tag?) and a way to
> recognize missing cc's (perhaps simply that someone cc'd on the
> threaded [PATCH x/y] reply isn't cc'd on [PATCH 0/y]?)

Unfortunately, this breaks all quilt users, as quilt does not support this.

Which includes myself, perhaps Peter Zijlstra, and I believe Andrew Morton.

I also, don't want to be Cc'd on the cover letter of stable patches, which
also doesn't follow this procedure.

-- Steve


