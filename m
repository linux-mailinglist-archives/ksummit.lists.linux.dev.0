Return-Path: <ksummit+bounces-87-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0050D368319
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 2D5AB1C307A
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E472FA0;
	Thu, 22 Apr 2021 15:11:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A107A70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:11:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07CE73EE;
	Thu, 22 Apr 2021 17:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1619104267;
	bh=7+yKp4URuBmC7vrgTCFbuPv98jAJDeXRRHngGJr1vL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=opqtWyZbBLHa32m+lvyLonQU+qI7idfwi0UwUj+3+Yb8J81l3OKfOyAQFny7IfWVp
	 bEN5jlc/5Ka/iC13HPOkx3fYULSTyOrnBR6o87tzkF2mIQht+Vo9X+I2uLM18/t+vC
	 dwDZjVwLouNV6NxcIBcSnXnmZ9qNIU7458q0tV6o=
Date: Thu, 22 Apr 2021 18:11:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIGSBkOvtwfCBs11@pendragon.ideasonboard.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <yq1o8e6shil.fsf@ca-mkp.ca.oracle.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <yq1o8e6shil.fsf@ca-mkp.ca.oracle.com>

On Thu, Apr 22, 2021 at 08:32:11AM -0400, Martin K. Petersen wrote:
> 
> Hi Mauro!
> 
> > Perhaps one thing that we could add would be a
> > scripts/get_developer_trustee_status, which would be returning
> > a set of indicators that would help the maintainer to know
> > how much it can trust a random contributor, like:
> >
> > 	- how many drivers and patches a contributor has written;
> > 	- how long and how frequent he's sending Kernel patches;
> > 	- what subsystems received patches from him;
> > 	- if the developer isn't on a blacklist/graylist.
> 
> I do a 'git log --grep' when I see an email address I do not recognize,
> sometimes I also Google. It would definitely be nice to automate some of
> this.
> 
> From past program committee tenures I have a bunch of perl hacks to rank
> people based on git history, mailing list posts, etc. But until now I
> hadn't really thought of doing something that elaborate in my patch
> workflow.
> 
> Scraping the list archives was the most painful part but that is now
> trivially easy thanks to lore ('git log --author pakki001'). And much
> faster too.
> 
> I think your proposal is fine as long as it is just printing raw
> statistics. I am concerned that if we turn those numbers into a
> one-dimensional "trust level", people will instantly start to game the
> system to artificially inflate their score.
> 
> Another metric that may be worth capturing is how many Fixes: tags refer
> to patches authored by this submitter.

Looking forward to the resulting discussions on when to add a Fixes: tag
:-) If Fixes: becomes a negative ranking tool, developers will lobby to
not get their patches blamed, and we'll lose part of the value of
Fixes:.

-- 
Regards,

Laurent Pinchart

