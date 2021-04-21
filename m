Return-Path: <ksummit+bounces-10-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A536735F
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A89FC1C1502
	for <lists@lfdr.de>; Wed, 21 Apr 2021 19:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161D82FA0;
	Wed, 21 Apr 2021 19:22:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77712F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 19:22:11 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F0AFA61454;
	Wed, 21 Apr 2021 19:22:10 +0000 (UTC)
Date: Wed, 21 Apr 2021 15:22:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210421152209.68075314@gandalf.local.home>
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Apr 2021 11:35:36 -0700
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> I've long been on record as not really being a fan of trivial patches
> because they can cause merge issues with current patches and introduce
> bugs, particularly in older drivers, that don't get detected for a long
> while.  However, the recent events with the University of Minnesota:
> 
> https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> 
> Have elevated the risk factor around trivial patches claiming to fix
> bugs to the point where it looks like there's no such thing as a truly
> trivial patch and they all need reviewing.
> 
> Our policy in SCSI for a long time has been no trivial patches accepted
> to maintained drivers, and I think that would be a good start if
> adopted kernel wide, but I think the next policy should be no trivial
> bug fix without a pointer to the actual bug report or report from a
> trusted static checker.  This would likely mean we have to create a
> list of trusted static checkers ... obviously 0day and coverity but
> what else?

I take a lot of trivial fixes. I found two that I accepted that were from
umn.edu, and both of them (after a second review) were legitimate fixes.
One was in Greg's revert patch series, which I asked him to not revert, and
the other was me looking at all patches I've received with a Cc to umn.edu
emails, and was from a gmail account (which I'm assuming was someone that
was part of this group).

I have no problem with taking a trivial patch if they are really fixing a
bug. I think what needs to be done here is look at the patches that got in
that were buggy, and see why they got in.

Perhaps the answer is to scrutinize trivial patches more. To me, the only
"trivial" patch is a comment fix, or update to documentation. And even
then, I spend time reviewing it.

If you don't have time to review a patch, then by all means, don't accept
it. Perhaps the answer is simply have a higher bar on what you do accept.

There are a few people that I will accept patches from with out review. But
anyone else, I scrutinize the code before taking it in.


-- Steve


