Return-Path: <ksummit+bounces-488-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 870953FBADE
	for <lists@lfdr.de>; Mon, 30 Aug 2021 19:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CCBA83E1054
	for <lists@lfdr.de>; Mon, 30 Aug 2021 17:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539803FCE;
	Mon, 30 Aug 2021 17:22:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A31E72
	for <ksummit@lists.linux.dev>; Mon, 30 Aug 2021 17:22:48 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BD36660ED8;
	Mon, 30 Aug 2021 17:22:45 +0000 (UTC)
Date: Mon, 30 Aug 2021 18:25:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alex Levin <levinale@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, ksummit@lists.linux.dev, Jesse Barnes
 <jsbarnes@google.com>, jonathan.cameron@huawei.com
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
Message-ID: <20210830182555.5a7d4902@jic23-huawei>
In-Reply-To: <CACRpkdaaTXH8GMz2GrYoQOLDcTjaHSeGv8-mM96q63c5Nbx=8w@mail.gmail.com>
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
	<CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>
	<YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com>
	<CAEeCyJY8bXNQHL-kSbxrGcVwQ45kTaR9pW4eOm=ZShEwE5hFiQ@mail.gmail.com>
	<CACRpkdaaTXH8GMz2GrYoQOLDcTjaHSeGv8-mM96q63c5Nbx=8w@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Aug 2021 22:22:15 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Fri, Aug 27, 2021 at 3:01 AM Alex Levin <levinale@google.com> wrote:
> 
> > > Also: your experience with using ACPI and when firmware can be
> > > fixed and when it can not, and when/if the kernel has to accommodate
> > > quirks rather than fixing the firmware.  
> >
> > We can definitely touch on this topic. It might be too narrow of a
> > topic to discuss widely (I would gladly have a virtual cup of coffee),  
> 
> This has been and remains a really big and recurring problem
> for drivers across the whole board of devices using ACPI, so I bet
> more people are interested.
> 
> Yours,
> Linus Walleij
> 
Indeed. I'm interested (in this and the proposal in general!)

Jonathan

