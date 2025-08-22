Return-Path: <ksummit+bounces-2212-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776DB320E5
	for <lists@lfdr.de>; Fri, 22 Aug 2025 18:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8651D600D0
	for <lists@lfdr.de>; Fri, 22 Aug 2025 16:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFB12472A5;
	Fri, 22 Aug 2025 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZINRpkSL"
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303051D5CC9
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755881901; cv=none; b=rJi4JeI5UZgROPxZiF78tF7uJMBZtwNse74VvVHVdB106XbqzS92bYfOpT+H6l1rpcitk0CfWXqwALNfbh4Lrn3zWO8EBfWFtV7yNRh9bTb+v9eNTxvhc5TlyPnDIemeqLX1L5Q2M3nAvmb0jA6K+CUJXHkmuhJvl7YHsaxUI6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755881901; c=relaxed/simple;
	bh=DJpNdA9BK3AdIJPoNcO6Z8Bh6TF6JV6rSE1G69yHqx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLDfEVJQHHGVf1XptiPnhgCgFgJL+t8rVhCld7SdEwvE6/37T19boRaBbFVrqpGNLzI9ETYRUzgSyFhzyebA7lR7OQ2xg0we59sqtU84+7Wtkpp9rpouKb4F6b5kB2UiGfvnwEN/ettE0C56riwgI0dKLuZvckac9yH8js0H5UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZINRpkSL; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MKdbhKjsfZrzfYbtn1iE/cK3FQ8I6bHiqoIsBnSCrPQ=; b=ZINRpkSLs+zzHOpnO/AeTcLNTx
	7ZG4vzDmX1ipSKMRU+fnZn0agxdGZbZdjHkVSREkYS1xhEsSmvMK7iJ+Ilm/pW/6GuUlMHa5L6Uw7
	MNI5QuKzn0DTlYDcFV3/EHHEM0fACDNrZ0he4MTi43kKskVuuJ2LvO8u1T89RbTyOkQVe2RfX5Suf
	7nH/vi8G1fLCPKf595NZDHC3XIt5BlSiQhKCj4L8kaEnu5mJzowQePe5HbjAymTGpr4i7kOHC/rfa
	iF3u1ulTAXl5Ge4K90XNO1PmR4CrclcsIu24qcsvPvGYEFkKeunmP02Up3FTDiyUMy6S6PC1Aiv16
	LBTdrJMg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV5k-0000000AJAe-1UEg;
	Fri, 22 Aug 2025 16:58:16 +0000
Date: Fri, 22 Aug 2025 17:58:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: YoungJun Park <youngjun.park@lge.com>
Cc: ksummit@lists.linux.dev, chrisl@kernel.org, gunho.lee@lge.com,
	taejoon.song@lge.com, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>
Subject: Re: [TECH TOPIC] Per-cgroup Swap Device Control
Message-ID: <aKihqI8PWLFL1b5i@casper.infradead.org>
References: <aKgm+wisMipLqnL4@yjaykim-PowerEdge-T330>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKgm+wisMipLqnL4@yjaykim-PowerEdge-T330>

On Fri, Aug 22, 2025 at 05:14:51PM +0900, YoungJun Park wrote:
> Abstract:
> Enabling cgroup-level control over swap devices for diverse workloads
> 
> Proposal:
> I am developing on a restricted internal platform where there is a
> technical requirement to use idle devices as extended memory.

I don't think this is appropriate for the maintainer summit.  You
can submit it to the Plumbers MM microconf [1] or LSFMM in May.

[1] https://lpc.events/event/19/contributions/1995/

Also you should have cc'd linux-mm for this kind of thing, adding
it now.  Preserving the rest of the proposal for those who are
interested.

> One motivating scenario discussed was to configure background processes
> to use slow swap (network) while foreground processes use fast swap
> (local storage).
> 
> Currently, the kernel does not provide per-process or per-cgroup swap
> selection, making this idea unachievable. To meet this usage need, and
> after reviewing alternatives, I reached the conclusion that swap
> devices must be controllable on a per-cgroup basis.
> 
> I would like to present the motivation, implementation progress, and
> directions of this work, and invite discussion and feedback from the
> community. Through prior exchanges with Chris Li[1], I also recognized
> that this topic has already triggered meaningful technical debate, and
> I believe a broader discussion at Kernel Summit would be valuable.
> 
> Agenda:
> 1. Motivation for per-cgroup swap priority [2]
>    - Comparison with alternative approaches
> 
> 2. Implementation reviews and problem solving
>    - Changes in percpu clusters & swap [3]
>    - Consistency with cgroup parent-child semantics [4]
>    - Challenges with NUMA autobind and swap priority [5]
> 
> 3. Criticism and alternative ideas
>    - Technical concerns raised by Chris Li [6]
>    - Introduction of the swap tier approach
> 
> 4. Further discussion
>    - Topics expected to arise in ongoing reviews before Plumbers
> 
> These agenda items reflect issues that have emerged through the ongoing
> RFC → PATCH development process. The presentation aims to summarize
> these discussions, share the current direction, and invite further
> feedback and open discussion from the community.
> 
> [1] https://lore.kernel.org/linux-mm/CAF8kJuMo3yNKOZL9n5UkHx_O5cTZts287HOnQOu=KqQcnbrMdg@mail.gmail.com/
> [2] https://lore.kernel.org/linux-mm/20250612103743.3385842-1-youngjun.park@lge.com/
> [3] https://lore.kernel.org/linux-mm/CAMgjq7BJE9ALFG4N8wb-hdkC+b-8d1+ckXL9D6pbbfgiXfuzPA@mail.gmail.com/
> [4] https://lore.kernel.org/linux-mm/rivwhhhkuqy7p4r6mmuhpheaj3c7vcw4w4kavp42avpz7es5vp@hbnvrmgzb5tr/
> [5] https://lore.kernel.org/linux-mm/jrkh2jy2pkoxgsxgsstpmijyhbzzyige6ubltvmvwl6fwkp3s7@kzc24pj2tcko/
> [6] https://lore.kernel.org/linux-mm/CAF8kJuMo3yNKOZL9n5UkHx_O5cTZts287HOnQOu=KqQcnbrMdg@mail.gmail.com/

