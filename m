Return-Path: <ksummit+bounces-2095-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CFEB1C384
	for <lists@lfdr.de>; Wed,  6 Aug 2025 11:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0358C18C0956
	for <lists@lfdr.de>; Wed,  6 Aug 2025 09:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0965328A1E6;
	Wed,  6 Aug 2025 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="gW8D7Z6q"
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72398270540
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473239; cv=none; b=h0CKUHIHld2d5Lt3o9o99RkTjO17+1s5sZd3wh/bPm+88aVQj8CR7tNGYju3OSemfoQGcj5529Jq5b9iCo/YNlgA4QhNqPcuN9ddLTksuW7iTtSetHFAAQu5V8jdwAk8oYtE2NZlUzk9IsbsAPR7/IthbpuIqrODvwZymlbwgf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473239; c=relaxed/simple;
	bh=AJzmZ4tSeyqUND6BDQGIRPhUy7gsuic5ncgOLZx5jBk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dnUQ28pyQ9Z2OpEyh+2BkBT4c2uyXsykB6Q0NACpPXMf5da6SSXQtudGJuDsZC2n8d8eKDELBwzdlBsXLPrK0SWUXD8+c0g8vxEIaf3O8GExec5s0Ji6d6tMpzGiVt3DNosoL2L8vYV9b7UwDgrXcPLvHU536yMPO/ACoA1D0Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=gW8D7Z6q; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JYF5ASgguA+B3i0U37XmQP0aS0w+iGS+Eh3IpT1YI1o=;
  b=gW8D7Z6qVGMwqi6WsgAKza4YAShjqRD8Su3kVYVo4ZCq//7D7zq8vNTn
   FMbPoMto8rDfugY7FyjCBZHvs0OPT/z6R6ndavYS49NnquAidxGtWC1Ax
   ZaeVm4HARG9dV8WlmIXxCAvKLJKUQsMIdDed9FR2rIh/oQCz8TZRbMHqF
   U=;
X-CSE-ConnectionGUID: Vac/xhqnTZyI4geV5SCwkA==
X-CSE-MsgGUID: ocd8WNukTIOBANl7pkLfQA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.17,268,1747692000"; 
   d="scan'208";a="122867757"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 11:39:26 +0200
Date: Wed, 6 Aug 2025 11:39:25 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: "H. Peter Anvin" <hpa@zytor.com>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
In-Reply-To: <e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
Message-ID: <d13bf260-7630-50b9-b3a6-fdf8bf8cd864@inria.fr>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local> <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com> <alpine.DEB.2.22.394.2508060747440.3518@hadrien> <e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 6 Aug 2025, Dan Carpenter wrote:

> On Wed, Aug 06, 2025 at 07:49:24AM +0200, Julia Lawall wrote:
> >
> >
> > On Tue, 5 Aug 2025, H. Peter Anvin wrote:
> > >
> > > Another genuinely good usage for AI is for especially non-English
> > > speakers to tidy up their patch comments and other documentation.
> >
> > There are also some parts of the kernel that are supposed to have
> > comments, such as memory barriers.  AI could help ensure that the comments
> > are actually meaningful, and perhaps suggest to the developer how they
> > could be improved (sort of a 0-day for comment quality).
> >
>
> I feel like I have seen patches where people have generated AI
> documentation for locking.  The problem is that if you ask AI to write
> something it always has a very confident answer but normally it's vague
> and slightly wrong.  It takes no time to generate these patches but it
> takes a while to review them.

I would have hoped for some tool that would somehow be designed to
understand comments in a good way.  Random individual efforts to generate
comments using AI would probably indeed produce something innocuous and
useless.

julia

