Return-Path: <ksummit+bounces-78-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C08368210
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 4C8E43E43C1
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693BF2FA1;
	Thu, 22 Apr 2021 13:58:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB182F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:58:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A4F66142F;
	Thu, 22 Apr 2021 13:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619099929;
	bh=s3pvpCDOREvE27flcago34oZz5ZFfbpfGg37m8ZmJuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DtUSL35wU9Y6RVF8qItoClvwm+Cjn547F9LXiZKQQxcDOWi5fc/IiIA1jkb1M/dnz
	 0S8O0o/kOUSjtF5RO5P5lihPosyVhd4oZ6bEuWqn8r7xhCSWtDcnjojlWLSdGd0IwD
	 pcxxiL7eDFKEV+Huw1r7DoUfvmKQghOJNtGPTrguDj2Q91/v7g2oEt7NcO/l1ThfAg
	 Ukb5D4EUtJb5t32J29W5MJAKvbluFxgTWDbxfyCdz8mmahYSthRgxnK4/MHjTOOm5/
	 wG+4qOcD95xSbIVM7oXfvdKHOh/Jh4tQqOwqPM3gK3x3k1BdcLONgNu5cZy5l9mNDz
	 vXxhWfXG3wmLA==
Date: Thu, 22 Apr 2021 16:58:45 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIGBFeTlaY947wh3@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <YIFfXTVMDmHwVmSR@unreal>
 <20210422092916.556e5e50@gandalf.local.home>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422092916.556e5e50@gandalf.local.home>

On Thu, Apr 22, 2021 at 09:29:16AM -0400, Steven Rostedt wrote:
> On Thu, 22 Apr 2021 14:34:53 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > > This is not a matter of bad practice. There are a couple of reasons
> > > why each patch on a series will have a different group of Cc, like:
> > > 
> > > 	- driver maintainers for each patch may be different;
> > > 	- scripts/get_maintainers.pl will return a different Cc/To;
> > > 	- patch series touch different subsystems;  
> > 
> > Like Christoph said, if it is unrelated send the patches as separated
> > series.

<...>

> Please, just Cc me on code that touches something I maintain or listed as
> a reviewer (which is still a lot).

Actually, we are drifting into another interesting topic to discuss.
"How to make life of patch submitters easy?" The difference in
maintainer's preferences, mailing list rules, e.t.c makes submission
process unbelievably painful.

<...>

> > I'm pretty happy with my email flow and see a little value in reconstruction
> > of emails thread with b4 just to realize that the series is not important to me.
> 
> It's not b4 you need. I seldom use that (but perhaps I should start). But
> lore is really easy. My email client, by default, shows the message id of
> the email I'm looking at. If I want to know more, I copy that message id,
> open a browser, and type:
> 
>  lore.kernel.org/r/<message-id>
> 
> Hit enter, and boom! the entire thread is there!
> 
> Try it!

I'm using lorifier on daily basis.

> 
> > 
> > It also don't solve my "knowledge island" issue.
> 
> I believe lore does.

Did you try to follow netdev and MM with lore only?

Thanks

> 
> -- Steve

