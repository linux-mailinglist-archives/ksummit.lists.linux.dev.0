Return-Path: <ksummit+bounces-120-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id A11C33687E0
	for <lists@lfdr.de>; Thu, 22 Apr 2021 22:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 207363E87B2
	for <lists@lfdr.de>; Thu, 22 Apr 2021 20:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7B52FA3;
	Thu, 22 Apr 2021 20:27:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C8C2F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 20:27:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 9DA9DE54E7
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 20:15:40 +0000 (UTC)
X-Originating-IP: 89.83.200.203
Received: from localhost (i15-lef02-th2-89-83-200-203.ft.lns.abo.bbox.fr [89.83.200.203])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3927320003;
	Thu, 22 Apr 2021 20:15:32 +0000 (UTC)
Date: Thu, 22 Apr 2021 22:15:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIHZY1oWNRLOCtQa@piout.net>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421194702.GH1981@kadam>
 <20210422113404.09f35a85@coco.lan>
 <68c628ed354ea1ddea81878f0d713d2ce6426126.camel@sipsolutions.net>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68c628ed354ea1ddea81878f0d713d2ce6426126.camel@sipsolutions.net>

On 22/04/2021 11:59:38+0200, Johannes Berg wrote:
> On Thu, 2021-04-22 at 11:34 +0200, Mauro Carvalho Chehab wrote:
> > 
> > Here, I use "wdiff" in order to deal with renames. It has a somewhat
> > funny dialect, but it helps a lot reviewing renaming patches.
> 
> This also helps for casual "git show" etc.:
> 
> [core]
> 	pager = /usr/share/git-core/contrib/diff-highlight | less -RFX
> 
> (path may vary, of course)
> 

I've been shown https://github.com/dandavison/delta/ a little while ago
and it has a very good side by side view, showing exactly what change on
each line. I'm using:

[core]
        pager = delta
[delta]
        plus-color = "#012800"
        minus-color = "#340001"
        syntax-theme = Solarized (light)
        line-numbers = true
        side-by-side = true

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

