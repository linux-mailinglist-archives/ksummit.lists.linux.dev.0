Return-Path: <ksummit+bounces-483-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE73F9078
	for <lists@lfdr.de>; Fri, 27 Aug 2021 00:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 8C9833E10F0
	for <lists@lfdr.de>; Thu, 26 Aug 2021 22:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481753FCF;
	Thu, 26 Aug 2021 22:33:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324FC3FCB
	for <ksummit@lists.linux.dev>; Thu, 26 Aug 2021 22:33:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D80B0BB0;
	Fri, 27 Aug 2021 00:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1630016843;
	bh=qdqcgKLlsehYPDRQLtoWR5Uy2sZgccWzgCRbumLVjVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b6P1+lMDdfrBM3m6qyc60TqrP4iTEUaBuC17upXGh1cbFG8WcWwynupQF6x1K39Tn
	 P9EeMrTW7kOEV9etbytUhMFyhnFELFzJM78IxlC0mRLoafAmJzn0IeNk2SWQ2UXqWg
	 M/BlZGzGTQSRwXcpnAOcncJvEmW9pzXFVRj4cDFM=
Date: Fri, 27 Aug 2021 01:27:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alex Levin <levinale@google.com>, ksummit@lists.linux.dev,
	Jesse Barnes <jsbarnes@google.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
Message-ID: <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com>
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
 <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>

On Fri, Aug 27, 2021 at 12:07:56AM +0200, Linus Walleij wrote:
> On Tue, Aug 24, 2021 at 3:06 AM Alex Levin wrote:
> 
> > - Testing the upstream RC on as many platforms as we can as early as we can.
> > - Updating the Linux kernel on existing platforms (millions of users at a time).
> > - Managing technical “debt” and keeping the ChromeOS kernel as close
> > as possible to the upstream kernel.
> > - Current pain points in dealing with upstream.
> >
> > We feel 45-60 minutes would be enough and will allow a discussion.
> 
> I think this is really interesting.
> 
> Also explain what this stuff is: drivers/platform/chrome/* and why it is
> so necessarily different and can't live in existing subsystems?
> 
> Also: your experience with using ACPI and when firmware can be
> fixed and when it can not, and when/if the kernel has to accommodate
> quirks rather than fixing the firmware.

Could this also include lessons learnt related to convincing and helping
SoC vendors to upstream drivers ?

-- 
Regards,

Laurent Pinchart

