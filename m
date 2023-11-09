Return-Path: <ksummit+bounces-1203-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F437E66DA
	for <lists@lfdr.de>; Thu,  9 Nov 2023 10:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1F4C1C20C1C
	for <lists@lfdr.de>; Thu,  9 Nov 2023 09:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C02212B7B;
	Thu,  9 Nov 2023 09:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q5qP7/63"
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FC512E48
	for <ksummit@lists.linux.dev>; Thu,  9 Nov 2023 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F18DAE;
	Thu,  9 Nov 2023 10:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699521992;
	bh=vH13lbwWIqijMtvhPiYr4mrtse5VKUuqdVcz2XNcd6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5qP7/63fEX5TQ4aCIks1bIjD4KiuN1fAyZLlqjUmcsK4xZkbmttGw7HyGDFrDUg3
	 GgkKxXTDav01653WzuQNaN8ORKdreNbK2GNCBgHwzDakavmA9nXeB7aFMBRdYL2fpC
	 cuot/fXqS4qZS5AQppVZMIZeTpgdK6RKm+XElJyI=
Date: Thu, 9 Nov 2023 11:27:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Joe Perches <joe@perches.com>,
	Mark Brown <broonie@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231109092701.GG21616@pendragon.ideasonboard.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <20231106110547.6956a430@gandalf.local.home>
 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
 <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>

On Thu, Nov 09, 2023 at 11:32:16AM +0300, Dan Carpenter wrote:
> On Wed, Nov 08, 2023 at 02:04:15PM -0500, Steven Rostedt wrote:
> > 
> > Right. For example, I use linux-trace-kernel@ to add patches to patchwork,
> > but I prefer the discussions to be done on LKML.
> 
> I had no idea that how tracing worked...  I normally strip out mailing
> lists from my patches if I think they're not necessary so I seldom CC
> lkml.  In years past, there used to be a lot of complaining about CC'ing
> too many people so I try to trim the CC list when I send patches.

I do exactly the same and drop LKML from most of my patch submissions if
there are more "appropriate" (in the sense of more targetted) lists
reported by get_maintainer.pl.

> Networking doesn't need to be CC'd about wireless patches.
> Drm doesn't need to be CC'd about amd gpu driver patches.
> 
> And for bug reports, I only ever CC one lore mailing list.  (For zero
> day bot stuff, the bot chooses the CC lists).

-- 
Regards,

Laurent Pinchart

