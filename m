Return-Path: <ksummit+bounces-960-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615777824F
	for <lists@lfdr.de>; Thu, 10 Aug 2023 22:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4F16281E92
	for <lists@lfdr.de>; Thu, 10 Aug 2023 20:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D6B22EE1;
	Thu, 10 Aug 2023 20:47:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AAEEAD9
	for <ksummit@lists.linux.dev>; Thu, 10 Aug 2023 20:47:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 697A04DE;
	Thu, 10 Aug 2023 22:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1691700357;
	bh=kIP/cCXt0hRs4ekr3AURTvoW0gx4krzd2c52m6181n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKPBT5kahCb8y8EQ4JiVEotcjvPYQM40iQPCftor71PjnBWyWk/WjYCg0qDNxtmIR
	 baIfX3OvLAxjCUmgcfunsYSd5IRqpkUUKJoURBqwbLE/i+luCsQrC7GemZRFK3yUrx
	 5roJmu4MaR2YoF1sl1d4VMKfjYJbethVNdnMWnfc=
Date: Thu, 10 Aug 2023 23:47:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <greg@kroah.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Improving resource ownership and life-time in linux
 device drivers
Message-ID: <20230810204713.GF402@pendragon.ideasonboard.com>
References: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
 <2023081048-skittle-excusable-2c9f@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023081048-skittle-excusable-2c9f@gregkh>

On Thu, Aug 10, 2023 at 05:47:02PM +0200, Greg KH wrote:
> On Wed, Aug 09, 2023 at 08:04:39PM +0200, Bartosz Golaszewski wrote:
> > Hi!
> > 
> > I submitted this proposal on time using the website but forgot about
> > sending it here too. Hope that's alright. The abstract follows.
> > 
> > Bartosz Golaszewski
> > 
> > --
> > 
> > Recently there have been several talks about issues with object
> > ownership in device drivers, use-after-free bugs and problems with
> > handling hot unplug events in certain subsystems.
> > 
> > First Laurent Pinchart revisited an older discussion about the harmful
> > side-effects of devres helpers during LPC 2022[1]. I then went down
> > that rabbit hole only to discover a whole suite of issues, not really
> > linked to devres in any way but rather mostly caused by the way
> > subsystems and drivers mix reference counted resources with regular
> > ones[2]. This year Wolfram Sang continued the research and presented
> > even more vulnerable subsystems as well as some potential remedies
> > during his talk at the EOSS 2023 in Prague[3].
> > 
> > I have since experimented with several approaches and would like to
> > present some updates on this subject. During this talk I plan to jump
> > straight into presenting concrete ideas and timelines for improving
> > the driver model and introducing some unification in the way
> > subsystems handle driver data. While this is a significant effort
> > spanning multiple device subsystems that will need to be carried out
> > in many phases over what will most likely be years, without addressing
> > the problems, we'll be left with many parts of the kernel not being
> > able to correctly handle simple driver unbinds.
> 
> I'm all for this, we need some major work in this area.

Likewise. I will however not be physically present at the kernel summit
this year, but plan to participate remotely.

-- 
Regards,

Laurent Pinchart

