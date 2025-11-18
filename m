Return-Path: <ksummit+bounces-2632-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED7DC6B806
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D6D9D352EB3
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9262EC0B5;
	Tue, 18 Nov 2025 19:55:56 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8662A28371
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 19:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763495756; cv=none; b=HgMQutngWYQhwjwGrMubtuPf2ab3x1V+zpoWJW1OAa2Me4K7f85mWV+3ulM+R/aTV+Q3y592MCEPhsxYKppG/Fq0BWy42le97j/I/gCbrvCEvKjRrclNrbanP87RwIs3M20cV1CoQNAjUyZZAlEXpHhpbpTPWeZHztMIBNMJfqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763495756; c=relaxed/simple;
	bh=iQ1oWhLQVwR3nIGYJqqn7QAmCdf1ye6RZY5nMr/A3ek=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FiFt7h8UW9aOkdRc/MRd+msUfdu2BftgLD+rnCQmqFJlbuEP2Ume3n6bxwHK5cLtGU98UZ1pqwWrZq2QrGuI8ToyKwbeuEBLNjP8IoYWOV25EMDT/1Oz/HcGTcKuIuTTqSB3OeA0XV3/S26Lke74sEzJ8xdPMULGwpZV6Ta2q8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 0436556AE0;
	Tue, 18 Nov 2025 19:55:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id 137161D;
	Tue, 18 Nov 2025 19:55:50 +0000 (UTC)
Date: Tue, 18 Nov 2025 14:56:18 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, Dan
 Williams <dan.j.williams@intel.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20251118145618.7dd829f1@gandalf.local.home>
In-Reply-To: <CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
	<CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
	<20251118141720.11c8d4d6@gandalf.local.home>
	<CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: aynpkrug71brxsergx87axxm1uijacpr
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 137161D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+iIioZPDBnE9ZtDI1L8L9cuFCuYwnwLuo=
X-HE-Tag: 1763495750-876652
X-HE-Meta: U2FsdGVkX1+0YVfsAzMpHUOirAG8wAjTlNOT327GcJFYu2Y37J7d6+YPKqZD+sh+VsIaVExz68LhP5aL2zdt3gJVAIi3jo0myITYRetJb0prgrZSVKDg2nB2dQRWQrEcik5S0La9/sSOdBl3X4F1egE9xifIVghj7KbnN5aoKZuuAylVgxRdYvfPhfdjUNrRrfswTVpQCxDwZf7Zy0Eyxw+8cQwC2/M8hlA+MbyjYv4LukKd8/H8c42194Q89rq8UshwfXqlUCm2W6exgXhoCsz0kxcx7UHQPk49aCwgUu3MgkinKnmFXBMzQm++q0Xdfp9aRSRvWPxGC5j6Cry+DNZfK+u2syoWVf4Q70oJR3FfiuhZbPByzJ29w+0y+3R2

On Tue, 18 Nov 2025 11:22:27 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> But again: I don't want to make this some kind of hard rule, and I
> think it should be done judiciously and with taste, not some kind of
> crazy conversion thing.

For the few places that do what that example shows, I may update them, as I
think it does make the code look better.

I do have several places that have something like this:

        struct ring_buffer_per_cpu *cpu_buffer __free(kfree) = NULL;
        struct ring_buffer_cpu_meta *meta;
        struct buffer_page *bpage;
        struct page *page;
        int ret;

        cpu_buffer = kzalloc_node(ALIGN(sizeof(*cpu_buffer), cache_line_size()),
                                  GFP_KERNEL, cpu_to_node(cpu));
        if (!cpu_buffer)
                return NULL;

Where the allocation happens right after the declaration. I think I did it
this way because the full line goes over 80 characters, and breaks up the
declaration.

        struct ring_buffer_per_cpu *cpu_buffer __free(kfree) = 
				kzalloc_node(ALIGN(sizeof(*cpu_buffer), cache_line_size()),
                                		  GFP_KERNEL, cpu_to_node(cpu));
        struct ring_buffer_cpu_meta *meta;
        struct buffer_page *bpage;
        struct page *page;
        int ret;

        if (!cpu_buffer)
                return NULL;

Doesn't look nice. I wonder since its the first allocation, if doing:

        struct ring_buffer_cpu_meta *meta;
        struct buffer_page *bpage;
        struct page *page;
        int ret;

        struct ring_buffer_per_cpu *cpu_buffer __free(kfree) = 
		 kzalloc_node(ALIGN(sizeof(*cpu_buffer), cache_line_size()),
				    GFP_KERNEL, cpu_to_node(cpu));
        if (!cpu_buffer)
                return NULL;

Would be acceptable? The "cpu_buffer" is declared right after the declaration,
but the space after the declaration also makes it easier to read than:

        struct ring_buffer_cpu_meta *meta;
        struct buffer_page *bpage;
        struct page *page;
        int ret;
        struct ring_buffer_per_cpu *cpu_buffer __free(kfree) = 
		 kzalloc_node(ALIGN(sizeof(*cpu_buffer), cache_line_size()),
				    GFP_KERNEL, cpu_to_node(cpu));

        if (!cpu_buffer)
                return NULL;


-- Steve

