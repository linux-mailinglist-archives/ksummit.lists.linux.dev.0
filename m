Return-Path: <ksummit+bounces-71-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA1C368176
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0CFFE3E5DDF
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592A82FA1;
	Thu, 22 Apr 2021 13:29:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094A32F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:29:19 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A6151613DE;
	Thu, 22 Apr 2021 13:29:18 +0000 (UTC)
Date: Thu, 22 Apr 2021 09:29:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422092916.556e5e50@gandalf.local.home>
In-Reply-To: <YIFfXTVMDmHwVmSR@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<YID5xhy2vv45fnOv@unreal>
	<20210422112001.22c64fe9@coco.lan>
	<YIFfXTVMDmHwVmSR@unreal>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Apr 2021 14:34:53 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> > This is not a matter of bad practice. There are a couple of reasons
> > why each patch on a series will have a different group of Cc, like:
> > 
> > 	- driver maintainers for each patch may be different;
> > 	- scripts/get_maintainers.pl will return a different Cc/To;
> > 	- patch series touch different subsystems;  
> 
> Like Christoph said, if it is unrelated send the patches as separated
> series.

Since I use quilt to send my patches, my only two choices are all patches,
or individual ones with Cc. Some of my patches will need to touch every
architecture. I'll Cc the maintainers of the architecture code, but not
include them in every architecture patch. And because this code depends on
other patches, I can not send them as individual series.

I use to have issues with this, but now with lore, I can trivially find the
entire thread and read it the whole story. IMO, it is no longer bad
practice to Cc only a single patch is a larger series to a maintainer, for
the one patch that touches their code. It's a "FYI, I'm touching your
code". But because of lore, it's really easy for them to get the full
picture.

I much rather have my INBOX today be only patches that touches my code,
then full series of patches that I really don't care about. Worse yet, I'll
get Cc'd on a full series of 20 patches, where only one patch touches my
code. The sad part is, I'm much more likely to ignore that series, because
I'm added to stuff by get-maintainers for the strangest reason, and
completely miss that there's a single patch in there that really requires
my review.

Please, just Cc me on code that touches something I maintain or listed as
a reviewer (which is still a lot).

> 
> > 	- sending a patch with too many c/c can make it rejected by
> > 	  mail list servers.  
> 
> In such cases, I put in To people who will apply the patches and in CC
> only mailing lists.
> 
> > 
> > Also, nowadays, with lore and b4, it would be easy to retrieve the
> > entire patch series, even for those that aren't subscribed on a 
> > c/c mailing list.  
> 
> I'm pretty happy with my email flow and see a little value in reconstruction
> of emails thread with b4 just to realize that the series is not important to me.

It's not b4 you need. I seldom use that (but perhaps I should start). But
lore is really easy. My email client, by default, shows the message id of
the email I'm looking at. If I want to know more, I copy that message id,
open a browser, and type:

 lore.kernel.org/r/<message-id>

Hit enter, and boom! the entire thread is there!

Try it!

> 
> It also don't solve my "knowledge island" issue.

I believe lore does.

-- Steve

