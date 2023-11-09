Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 764547E6E49
	for <lists@lfdr.de>; Thu,  9 Nov 2023 17:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 553DF1C20A54
	for <lists@lfdr.de>; Thu,  9 Nov 2023 16:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D877208DF;
	Thu,  9 Nov 2023 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o5hX4zGi"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006BD208BC
	for <ksummit@lists.linux.dev>; Thu,  9 Nov 2023 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 642D58CD;
	Thu,  9 Nov 2023 17:08:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699546086;
	bh=YhUvLlYoEUx0IfIpbbRIffE/S4RF3qfDuDROfS30e9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5hX4zGiXaKlpHOt5q8Lk4yHnS4hckFTc7Di9y2UjvqD983oLnvDlpCL2cINakXYN
	 lOz+I0zWJ5GMQW9Y/it9LPLS67xwjV4vPVc3nvgsJ0TPMSb7XxZdpWF3Mxjvymsm9f
	 AKqCib7g2F6xKpPNWUaUWWbI1mfxRhsvo2sAc2eE=
Date: Thu, 9 Nov 2023 18:08:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Joe Perches <joe@perches.com>,
	Mark Brown <broonie@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231109160834.GB6221@pendragon.ideasonboard.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <20231106110547.6956a430@gandalf.local.home>
 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
 <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
 <20231109105112.46d65fcd@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231109105112.46d65fcd@gandalf.local.home>

On Thu, Nov 09, 2023 at 10:51:12AM -0500, Steven Rostedt wrote:
> On Thu, 9 Nov 2023 11:32:16 +0300 Dan Carpenter wrote:
> > On Wed, Nov 08, 2023 at 02:04:15PM -0500, Steven Rostedt wrote:
> > > 
> > > Right. For example, I use linux-trace-kernel@ to add patches to patchwork,
> > > but I prefer the discussions to be done on LKML.
> > 
> > I had no idea that how tracing worked...  I normally strip out mailing
> > lists from my patches if I think they're not necessary so I seldom CC
> > lkml.  In years past, there used to be a lot of complaining about CC'ing
> > too many people so I try to trim the CC list when I send patches.
> 
> You usually just send fixes, which is fine for not Cc'ing LKML.
> 
> Please do not strip linux-trace-kernel, though. As it keeps the responses
> in patchwork.
> 
> > Networking doesn't need to be CC'd about wireless patches.
> > Drm doesn't need to be CC'd about amd gpu driver patches.
> > 
> > And for bug reports, I only ever CC one lore mailing list.  (For zero
> > day bot stuff, the bot chooses the CC lists).
> 
> Which is fine.
> 
> I'm care more about new features, as tracing / scheduling / etc affect the
> entire kernel. Changes in DRM usually only affect DRM. But a scheduling or
> tracing change, could affect DRM, which is why I want to keep those patches
> going to the generic mailing list.

They won't be seen by most DRM people though, as those people are most
likely not following LKML due to the amount of e-mails. I barely even
ever read lists these days due to the mail volume, even for the
subsystems I'm most involved with :-S

-- 
Regards,

Laurent Pinchart

