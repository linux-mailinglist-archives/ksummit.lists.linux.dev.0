Return-Path: <ksummit+bounces-2218-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE88B32603
	for <lists@lfdr.de>; Sat, 23 Aug 2025 02:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464AB1D60D7A
	for <lists@lfdr.de>; Sat, 23 Aug 2025 00:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE8C341AA;
	Sat, 23 Aug 2025 00:42:37 +0000 (UTC)
Received: from lgeamrelo07.lge.com (lgeamrelo07.lge.com [156.147.51.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C234144C63
	for <ksummit@lists.linux.dev>; Sat, 23 Aug 2025 00:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.51.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909756; cv=none; b=MeyD2Spb02hE86M3zCk+wL9W+rlhy8CLNPUd1gHp/TfY9badLP9yCTHBNLzOdVnaGQ/4ayLdIe3y2Bz7uX2B26mkoQBIyAYWKp+s6xLiQan3F66zVWBrYfcefq/tHZMMyCa61rFIuSXDxdedFpV7uqPbLtO1alRGpUoRDc1l+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909756; c=relaxed/simple;
	bh=9UqRZTclI2aHpVqrkL4osiKSfbk1TPwLMAT7YTXqoCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sp2y+kEYBSN3LMQKtUY78TWMAwxM5z4+uIgo6gz5lIXW5xQgc3nyLgWygbFaWrm4IPkbkYXHTAYJH8vOd0dzHFb/GV5cQztWgzynfVZep7WT/k1t6KzlmEMysx5LtC6WCfiGCcPNEO2Sz6q+OKYgyzR7LI9EaTBhUIZJa9bYZz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.51.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.51.103 with ESMTP; 23 Aug 2025 09:42:30 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Sat, 23 Aug 2025 09:42:30 +0900
From: YoungJun Park <youngjun.park@lge.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Chris Li <chrisl@kernel.org>, Matthew Wilcox <willy@infradead.org>,
	ksummit@lists.linux.dev, gunho.lee@lge.com, taejoon.song@lge.com,
	linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [TECH TOPIC] Per-cgroup Swap Device Control
Message-ID: <aKkOdkGJh3pQtJ/u@yjaykim-PowerEdge-T330>
References: <aKgm+wisMipLqnL4@yjaykim-PowerEdge-T330>
 <aKihqI8PWLFL1b5i@casper.infradead.org>
 <20250822131022.4df59a60@gandalf.local.home>
 <aKisJJYL9LV20qzg@casper.infradead.org>
 <CACePvbUYp7w68C8z_TeMhOJQ0hmWw1jkwy+D_Lb+N5WbmufAug@mail.gmail.com>
 <20250822142650.572507ff@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142650.572507ff@gandalf.local.home>

On Fri, Aug 22, 2025 at 02:26:50PM -0400, Steven Rostedt wrote:
> On Fri, 22 Aug 2025 11:13:41 -0700
> Chris Li <chrisl@kernel.org> wrote:
> 
> > Anyway, is there any conflict to apply to LPC MM Micro Conference
> > track as well? Of course which conference to apply to is a decision
> > for YoungJun to make. I am just curious what options are available
> > now.
> 
> Note that MC topics are more discussion focused than either the Refereed or
> Kernel Summit tracks. A MC topic is between 15 to 30 minutes which does not
> give much time for presentations. A Track topic is longer and allows more
> presentation of the topic. Also, acceptance to a Track talk gives a pass to
> Plumbers, whereas acceptance to an MC topic does not guarantee one.
> 
> > 
> > Hi, YoungJun,
> > 
> > If you decide to apply for LPC MM MC track as well, don't forget to
> > register yourself as a speaker on the LPC website.
> > https://lpc.events/event/19/abstracts/
> > The lower right of the page, there is a button "Submit a new abstract",
> > Click on that to start the process. Don't forget to select the pull
> > down menu MM Micro conference.
> 
> The part I left out of Ted's email was:
> 
>    Secondly, please create a topic at the Linux Plumbers Conference
>    proposal submission site and target it to the Kernel Summit track:
> 
>         https://lpc.events/event/19/abstracts
> 
>    Please do both steps.  I'll try to notice if someone forgets one or the
>    other, but your chances of making sure your proposal gets the necessary
>    attention and consideration are maximized by submitting both to the
>    mailing list and the web site.
> 
> 
> So YoungJun has already signed up to the website and proposed a Kernel
> Summit track. It can be switched over to a MM MC topic by editing the
> submitted abstract and switch the Track over to:
> 
>   "Kernel Memory Management MC"
> 
> -- Steve

Thanks everyone for the clarifications and helpful guidance.  
I have updated my submission and switched the track to
"Kernel Memory Management MC"

Best Regards,
Youngjun Park.

