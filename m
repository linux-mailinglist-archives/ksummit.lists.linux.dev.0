Return-Path: <ksummit+bounces-485-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2953F9A87
	for <lists@lfdr.de>; Fri, 27 Aug 2021 15:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 032ED3E1443
	for <lists@lfdr.de>; Fri, 27 Aug 2021 13:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FB53FCE;
	Fri, 27 Aug 2021 13:57:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844263FC6
	for <ksummit@lists.linux.dev>; Fri, 27 Aug 2021 13:57:16 +0000 (UTC)
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 1DECC245; Fri, 27 Aug 2021 08:50:23 -0500 (CDT)
Date: Fri, 27 Aug 2021 08:50:23 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alex Levin <levinale@google.com>, ksummit@lists.linux.dev,
	Jesse Barnes <jsbarnes@google.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
Message-ID: <20210827135023.GA3439@mail.hallyn.com>
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
 <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>
 <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Aug 27, 2021 at 01:27:10AM +0300, Laurent Pinchart wrote:
> On Fri, Aug 27, 2021 at 12:07:56AM +0200, Linus Walleij wrote:
> > On Tue, Aug 24, 2021 at 3:06 AM Alex Levin wrote:
> > 
> > > - Testing the upstream RC on as many platforms as we can as early as we can.
> > > - Updating the Linux kernel on existing platforms (millions of users at a time).
> > > - Managing technical “debt” and keeping the ChromeOS kernel as close
> > > as possible to the upstream kernel.
> > > - Current pain points in dealing with upstream.
> > >
> > > We feel 45-60 minutes would be enough and will allow a discussion.
> > 
> > I think this is really interesting.
> > 
> > Also explain what this stuff is: drivers/platform/chrome/* and why it is
> > so necessarily different and can't live in existing subsystems?
> > 
> > Also: your experience with using ACPI and when firmware can be
> > fixed and when it can not, and when/if the kernel has to accommodate
> > quirks rather than fixing the firmware.
> 
> Could this also include lessons learnt related to convincing and helping
> SoC vendors to upstream drivers ?

That sounds awesome.

