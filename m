Return-Path: <ksummit+bounces-2628-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79FC6B6A1
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45DD934EA42
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BA82F12DB;
	Tue, 18 Nov 2025 19:16:58 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013F92F0690
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 19:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493418; cv=none; b=EnH0nAxXul6YU4SUB9/R4PDkCZd+vWdHUFVHakzi7GYcwQmX909Sfbltubsaen0dOP/XORdFbr+XtuvYBf+UkKMwpS5Tawc+tQpBhwdSCfb79FCJnTSJANxTAUqbbRpt4IfIIMRYyVBUOlnIcMgc3Jr6qw6LdEXImjp88kleb6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493418; c=relaxed/simple;
	bh=CZ4zQXr3mYEy/5KeQyHnEEAufNqEiEXQwuD0Q0+BDLA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgnqmudtY+S4igkg7nbJ/LS42x7COND9Z05Dv4dfz0/sYVDR2fVqkYa5C8j6YlQluoVrluScbi0dVSKz4N1xIVEw4eq1f7uW/752RM+yhKdd7qK06zCXMUihGhTnz4McNE2KiLQJCVfgJI+O7GqCFtaqjVtMOTJba80YRlfbK4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id B79031DFB7A;
	Tue, 18 Nov 2025 19:16:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id BD5F519;
	Tue, 18 Nov 2025 19:16:52 +0000 (UTC)
Date: Tue, 18 Nov 2025 14:17:20 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, Dan
 Williams <dan.j.williams@intel.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20251118141720.11c8d4d6@gandalf.local.home>
In-Reply-To: <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
	<CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 8d6i3a1caitx9wms4bs3fbu88yuctcrz
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: BD5F519
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19H5Pt7vRMUomskwB0r1opScdP6e6PSxK8=
X-HE-Tag: 1763493412-455765
X-HE-Meta: U2FsdGVkX1+BWJr2CCpjqV1+Q0zLGLMXDEcZrM2JZcqJGW8guHWmui7xr4teWjz+KNv+c1rNMDM1LOLfXn0uMioPU5EOzo5Cyc//5cakU85FmNlE/v3hMcl6ybcTGttFPLDB1NlckW8hRfI9DNiJO+VgV05ExsiJolAXJZ6KcM5AZkGQqXI66muPm8MbLQBlpsmKFGJwvyUgmEPnCkhn/cgSofuL6w+MZtwdTv8ae3+K4RgW6DCJ1Oru653ERWgkfWwVTz2Qb7xu75WVPEYt/yRkpWZ6oDEue8+u5E7BA3H7YILqsfz9oXm7N+uvn5zbTR+qq7OZXj9m/t3fcdYU4uLvTjBZWInvLKPTHjKAASSydr11N3M7SQbv8SsjOg9GsFUD/GrfwNeckTRYvYVHqg==

On Tue, 18 Nov 2025 10:38:20 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

>         struct x509_parse_context *ctx __free(kfree) = NULL;
>         ... other code ...
>         ctx = kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);
> 
> where you have now split up the whole "this is allocated by kmalloc,
> and free'd by kfree" into two different sections that are not next to
> each other.

I've been doing the above, and was even going to recommend it to James. But
if it is preferred to declare the __free() variables where they are
allocated, I'd be much happier.

I think the code could also be better optimized? I haven't run an objcopy to
confirm but now early exits do not require calling the __free() function on
NULL pointers.

Most of my code allocates near the top where I don't find this a problem,
but I do have a few places of:

	struct foo *var __free(kfree) = NULL;

	if (ret < 0)
		return -ERROR;

	[ several more error exits ]

	var = kmalloc(..);

-- Steve

