Return-Path: <ksummit+bounces-2214-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4B8B321A4
	for <lists@lfdr.de>; Fri, 22 Aug 2025 19:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78FF95A6143
	for <lists@lfdr.de>; Fri, 22 Aug 2025 17:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7B9313532;
	Fri, 22 Aug 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DN6I9sm7"
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE9B610B
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755884586; cv=none; b=QVMxV/gyMynOGYWga74BLkjBxOzDGbNYM9SV+k0/2EoYbtclMaXdLpCQqwDDJWyGbO6Zybn+Y/XwckJHaa/SbvraA7C6OyjoYvALxYc7Nxs1E21CrOQPKvP/xZknOXOOXX/DIZmQRR7bmnAZFF/a04dUya5hMaBItjVGzqeqJy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755884586; c=relaxed/simple;
	bh=Rtu13v592i5oqZ2/OPchB3h2/U7b0Upz9ZLAHdstT9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhiJAT3FVR/afRMbGHQg3OZ1rmm0v05GQBrlJ892bSYJZSN9EQ1rb+AuAIUWAuvfss6N7qhF5Rnu+8NMrMqWrdQMDZ29WY16wYz7WiRUOJMxjZ0BBUzJDKzj1YD1Q501rq5pAhLHexxpewv6BRtFFf5WRfpFVnrKL5wdqkkVQxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DN6I9sm7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3At4kmhBLGosGoYl3W4xiNGWvgZL4G7WKLe5QnrFXMI=; b=DN6I9sm7tzwK15MtkSMSc7C+GL
	uX2OeS9q6qX46kxHR2IPnC9EeCOE11ZTi2ZW2xEi41RR+khyjkTdfGI9XyTmCLRwOY7tu2HVu/s1u
	QAt8gUbRLCM2CXHY8gFzeVuisHBMAQq086Nl4JuYbKdrK6w4v/0r6iI3ejCbVMPh9hWwbdehjgoFq
	SqLZqIKzLfXjG7l6HjMQnjpgSCsWelhInpvcdnlYRZbam7fDCW/wCKIkCBkz1qAcjkXcC2EWRzkWA
	TPfOmoLH2PWdaolhAbnNQywtokkDsjo4U8Z2gV7C2sMgQA5m0IOxnraVVtC0njMVI0aFZ/3YCICWZ
	DWh57imQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVn2-0000000AmIO-2TDV;
	Fri, 22 Aug 2025 17:43:00 +0000
Date: Fri, 22 Aug 2025 18:43:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: YoungJun Park <youngjun.park@lge.com>, ksummit@lists.linux.dev,
	chrisl@kernel.org, gunho.lee@lge.com, taejoon.song@lge.com,
	linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [TECH TOPIC] Per-cgroup Swap Device Control
Message-ID: <aKisJJYL9LV20qzg@casper.infradead.org>
References: <aKgm+wisMipLqnL4@yjaykim-PowerEdge-T330>
 <aKihqI8PWLFL1b5i@casper.infradead.org>
 <20250822131022.4df59a60@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822131022.4df59a60@gandalf.local.home>

On Fri, Aug 22, 2025 at 01:10:22PM -0400, Steven Rostedt wrote:
> On Fri, 22 Aug 2025 17:58:16 +0100
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > > Proposal:
> > > I am developing on a restricted internal platform where there is a
> > > technical requirement to use idle devices as extended memory.  
> > 
> > I don't think this is appropriate for the maintainer summit.  You
> > can submit it to the Plumbers MM microconf [1] or LSFMM in May.
> > 
> > [1] https://lpc.events/event/19/contributions/1995/
> > 
> > Also you should have cc'd linux-mm for this kind of thing, adding
> > it now.  Preserving the rest of the proposal for those who are
> > interested.
> 
> From Ted's original email: https://lore.kernel.org/all/20250805144357.GA762104@mit.edu/
> 
>   Related to the Maintainer's Summit, the Kernel Summit is organized as a
>   track which is run in parallel with the other tracks at the Linux
>   Plumbers Conference (LPC), and is open to all registered attendees of
>   LPC.  The goal of the Kernel Summit track will be to provide a forum to
>   discuss specific technical issues that would be easier to resolve in
>   person than over e-mail.  The program committee will also consider
>   "information sharing" topics if they are clearly of interest to the wider
>   development community (i.e., advanced training in topics that would be
>   useful to kernel developers).
> 
>   To suggest a topic for the Kernel Summit, please do two things. by
>   September 10th, 2025. First, please send e-mail with a subject prefix of
>   [TECH TOPIC] to ksummit@lists.linux.dev.  As before, please use a
>   separate e-mail for each topic.
> 
> So this appears to be appropriate.

My mistake.  I thought tech topics were part of maintainer summit, not
part of the kernel track.  It'll be up to the kernel track organiser(s)
whether to accept it to that track or whether they think it'll be more
appropriate in the MM microconf.

