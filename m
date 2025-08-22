Return-Path: <ksummit+bounces-2216-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5FB32243
	for <lists@lfdr.de>; Fri, 22 Aug 2025 20:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03108B07BB0
	for <lists@lfdr.de>; Fri, 22 Aug 2025 18:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B805D2BEC2E;
	Fri, 22 Aug 2025 18:26:55 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D48277017
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755887215; cv=none; b=d5FEErTvDvocTMQnywLhnLM16OpEnQUbMrLnLkeXnI9RSxeSL03k20i4w4wALC3B/sIugBFVf8DAak4wKCj6ttD+PvIYoqGGk/0SxQArq2cd5KUGmzF3UMvXSQlSiTv9JSS/19AUzq2w37jSPlq/dG2ld+ItMdbRjBZeCx1uG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755887215; c=relaxed/simple;
	bh=hNpZ6kyurjI67RrnYo0iaO3Q8WzJT1ts4smhKeiP/ag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTpiMJAi0BT591vuuAO/ujK0kJTho803OqIkx3Q/eIEWSokilUYYBulCeZMFEd98TmkJOx8ZYbPEjnwvw6MEZod2/R0ExyA+3euX4RzW5hk1ZT6cQBH6YVgmsWJwHlgAbqnrNv29ojOEkL6O/u0lq21dge/+9ZxRKLz63aueJmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id CC684819ED;
	Fri, 22 Aug 2025 18:26:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id C440231;
	Fri, 22 Aug 2025 18:26:43 +0000 (UTC)
Date: Fri, 22 Aug 2025 14:26:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Chris Li <chrisl@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, YoungJun Park
 <youngjun.park@lge.com>, ksummit@lists.linux.dev, gunho.lee@lge.com,
 taejoon.song@lge.com, linux-mm@kvack.org, David Hildenbrand
 <david@redhat.com>
Subject: Re: [TECH TOPIC] Per-cgroup Swap Device Control
Message-ID: <20250822142650.572507ff@gandalf.local.home>
In-Reply-To: <CACePvbUYp7w68C8z_TeMhOJQ0hmWw1jkwy+D_Lb+N5WbmufAug@mail.gmail.com>
References: <aKgm+wisMipLqnL4@yjaykim-PowerEdge-T330>
	<aKihqI8PWLFL1b5i@casper.infradead.org>
	<20250822131022.4df59a60@gandalf.local.home>
	<aKisJJYL9LV20qzg@casper.infradead.org>
	<CACePvbUYp7w68C8z_TeMhOJQ0hmWw1jkwy+D_Lb+N5WbmufAug@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 8o1zs5wuk65g1g9wuxwbyunznxxfidzk
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: C440231
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19qApwMrh7stjceUbbTYGOhEuvVEc9W+D0=
X-HE-Tag: 1755887203-398458
X-HE-Meta: U2FsdGVkX18C6W5l/ocCnOU79zFmh36vZY7+wfTLac660UKzn13RzukaFrddo4l44BiOL+UWqAxbmdGL9fRRLeuWhUKHha6eFN9MU6taVE4q9Sq8QwcGuAZ64bi6hu2YpGTjAnWpES1ewABidgMmUjgtlXxUELGR62hBkXt9fwTQRzT3q0BpPfDVjCpxqbjK1cGCWf3x8SCEe4IVsYb2ziylmyzH/sxMTjxJHg7nCJ220wjShgTb5kEmbxMh7Kzmivcm5u8fABxWILQsSxzv2rsd311ZIUv1hw3zOB/8MsSMDnLHSUvg700JGAFZ72dqkrTp2s2dARstE3zbkrX8rFzDwpPmovPhuGKfFICgs58ZZUEjiG/u4rhA9HwxrvLUI/pLpUTFAQumhEULY7nEkryE7nGCnETyIxOogG0pWC3PWYEhsZEjGQ==

On Fri, 22 Aug 2025 11:13:41 -0700
Chris Li <chrisl@kernel.org> wrote:

> Anyway, is there any conflict to apply to LPC MM Micro Conference
> track as well? Of course which conference to apply to is a decision
> for YoungJun to make. I am just curious what options are available
> now.

Note that MC topics are more discussion focused than either the Refereed or
Kernel Summit tracks. A MC topic is between 15 to 30 minutes which does not
give much time for presentations. A Track topic is longer and allows more
presentation of the topic. Also, acceptance to a Track talk gives a pass to
Plumbers, whereas acceptance to an MC topic does not guarantee one.

> 
> Hi, YoungJun,
> 
> If you decide to apply for LPC MM MC track as well, don't forget to
> register yourself as a speaker on the LPC website.
> https://lpc.events/event/19/abstracts/
> The lower right of the page, there is a button "Submit a new abstract",
> Click on that to start the process. Don't forget to select the pull
> down menu MM Micro conference.

The part I left out of Ted's email was:

   Secondly, please create a topic at the Linux Plumbers Conference
   proposal submission site and target it to the Kernel Summit track:

        https://lpc.events/event/19/abstracts

   Please do both steps.  I'll try to notice if someone forgets one or the
   other, but your chances of making sure your proposal gets the necessary
   attention and consideration are maximized by submitting both to the
   mailing list and the web site.


So YoungJun has already signed up to the website and proposed a Kernel
Summit track. It can be switched over to a MM MC topic by editing the
submitted abstract and switch the Track over to:

  "Kernel Memory Management MC"

-- Steve

