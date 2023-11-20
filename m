Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C8D7F15EF
	for <lists@lfdr.de>; Mon, 20 Nov 2023 15:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFF08281186
	for <lists@lfdr.de>; Mon, 20 Nov 2023 14:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B047134CC;
	Mon, 20 Nov 2023 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liAY0ue9"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDBC746A
	for <ksummit@lists.linux.dev>; Mon, 20 Nov 2023 14:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13ADC433CB;
	Mon, 20 Nov 2023 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700491342;
	bh=3NN/grbV6MAKE/rEXvkpaEp2bj+3vodd/TdPSce58TE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=liAY0ue9TvCBeXr9xLk/sS22DxncW1gBEwXxz+NhAcHBBna7EJQirTLpR4631sdvg
	 aWSvayxR9gVG0OGgbgudaVb3Hh3M/wLAZXI0g8kaB4bhaXpG833pBWKvaRKqGji6xj
	 9qu32RiErvpwU5fIjkXW8/pPDu/pP3fw8/MyCceNnhAhhKa4f8wOCXM511JPbnVUzJ
	 6RFDrmTtai/xqMCLxnnvPUxrycFNobVISeU5tUirm46ZaeEPv+gpOKcPSHzVO5KOqi
	 JVMHEhUhcxwhvMJuhH9B6CFQZv7Knh+B7x3Lq1t6qDhBbFdGJSdV+b3uwM4u50BldE
	 fTCmBwGLuHzTw==
Date: Mon, 20 Nov 2023 15:42:16 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jani Nikula
 <jani.nikula@intel.com>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Kernel documentation
Message-ID: <20231120154216.683c1203@coco.lan>
In-Reply-To: <877cmc7cut.fsf@meer.lwn.net>
References: <87fs6rxppz.fsf@meer.lwn.net>
	<871qi6glzl.fsf@intel.com>
	<87v8fiq6cl.fsf@meer.lwn.net>
	<430ee6bb-2556-4674-ae9d-fd7729bf8afd@oracle.com>
	<877cmc7cut.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 20 Nov 2023 06:50:34 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Vegard Nossum <vegard.nossum@oracle.com> writes:
> 
> > (We already exchanged on this topic, but repeating it for the list:)
> >
> > On 20/06/2023 21:30, Jonathan Corbet wrote:  
> >> Jani Nikula <jani.nikula@intel.com> writes:
> >>   
> >>> It should be more feasible to build the documentation. Make it
> >>> faster,  
> >
> > When using PyPy instead of CPython to run Sphinx, I see a 22%
> > performance improvement on the kernel documentation, which is not
> > insignificant.  
> 
> That is nice, but we can't really assume that everybody building the
> docs has pypy around.
> 
> >> A while back, I went into Sphinx with a hatchet and managed to take 
> >> about 20% off the build time.  The C domain stuff builds a data 
> >> structure of incredible complexity, then just tosses much of it
> >> away. I've never had the time to figure out why they do that or to
> >> try to get my hack job into a condition where I'd be willing to show
> >> it to my dog, much less the Sphinx developers.  
> >
> > I also profiled the documentation build some weeks ago and came to the
> > same conclusion: around 40% of the time is spent inside resolve_xref(),
> > the exact same C domain stuff you mentioned.
> >
> > The gcc project/documentation has the same problem, albeit in the C++
> > domain code, there is an open ticket for it:
> >
> >    https://github.com/sphinx-doc/sphinx/issues/10966
> >
> > If we're really not using the functionality provided by the C domain
> > code, maybe instead of ripping it out we could provide something like a
> > conf.py toggle to disable it? (The idea being that the patch would be
> > smaller and more acceptable upstream...)  
> 
> Ah but we are - it's how we generate all of the cross-references in the
> built docs.  My sense, from a couple of years ago though was that parts
> of that code aren't used by *anybody*.  But I didn't feel that I'd
> understood it well enough to make a proper patch.  I'd really like to
> get back to that.

Cross references is quite useful for media docs. Having a way to
optionally disable it to speedup builds may make some sense, but
the default should be to have it enabled and producing warnings.

There is still a long-term bug on Sphinx C domain logic: it still can't
have symbols with the same name for different types. So, we have a
dozen warnings due to that when building with Sphinx version 3.1 and 
above:

	https://github.com/sphinx-doc/sphinx/pull/8313

Thanks,
Mauro

