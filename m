Return-Path: <ksummit+bounces-2638-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A46FFC6BAAE
	for <lists@lfdr.de>; Tue, 18 Nov 2025 21:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id B178029BD1
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40B230BB80;
	Tue, 18 Nov 2025 20:51:00 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721C430AAB3
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 20:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763499060; cv=none; b=GjZYOwO9ftcRx62icau1NsgJXhDv2wY1+4a2FDm1pjkhOVldsx9GzeXuxFND8xgFjOEMF9C2TVKmwWH13U7OPN7JGx9EhWDmZS4FeaJqbcudmawMtDMaRMuqzLk9wqLEdiMAMoQhRZPj49blp0IV19f7DFr1hWnUOJOSKhsEPXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763499060; c=relaxed/simple;
	bh=5ASUogyXDIWC/hW9WF/VxdomNKwFMRSybdwGRql/fRo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWXTjyPXR3Zx5rKcHD0/ME1rcJViHcZtvzVasy7VH3EPw/XnHxAZyLg1iMEdSoTSk70fcRmIA+u8O9mJDBOVXKIq/UQ+THXlV3wEl5++Yu7yWEEyAcDE4MPCPAWf+jT/039diBoY9lKyFu7FcIed/4f3+O3Ar5DAoOoLecSDiYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id E259E1401FC;
	Tue, 18 Nov 2025 20:50:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id DC65660017;
	Tue, 18 Nov 2025 20:50:54 +0000 (UTC)
Date: Tue, 18 Nov 2025 15:51:22 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linus Torvalds  <torvalds@linux-foundation.org>, Bart Van Assche
 <bvanassche@acm.org>, ksummit@lists.linux.dev, Dan Williams
 <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20251118155122.59dde92f@gandalf.local.home>
In-Reply-To: <bff6d9974e50f7cb27cc2b150ecd6e5e2252ae54.camel@HansenPartnership.com>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
	<CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
	<20251118141720.11c8d4d6@gandalf.local.home>
	<bff6d9974e50f7cb27cc2b150ecd6e5e2252ae54.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: DC65660017
X-Stat-Signature: 6rc4sxogwe7p737kbxxzr4ao8cp4o638
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19p08BADk01/3fTeb1Mn9wMuliHzFsFUH8=
X-HE-Tag: 1763499054-699771
X-HE-Meta: U2FsdGVkX182lbmEjYPG08gRCBdzKgPZXxyNyoxW3gNTNn8Z7NnPy59B8XddxM22fzsYV5vwcL1dsTH3nV+phscaTKlotBwx/aNo838vPXFWY5ghB3UXmYZ7yugYp8/n7qLoRpDtEZPBQxgip2zmqZk3lsQpi8sOMr20PnQKvgagfYhDBwvViScGFuK02mQjXwLnHGTjr/R4AGi1xgmFSNDXZ2fw+YyxCGVknwhHnsCZD2fHj/KEMGlTUoJlz4XtjcxXXK61KUtTNJZi9wVLCL2EhhajjTSz4Oq9P8bWPqlbnj97kB+tGFLMbFPvAhHUO8u0S9ipCXkj8+cSmsFoPx3tpj5i+nXb5exvQihy3WiN33lckQ5hrSYmh48vUWhA

On Tue, 18 Nov 2025 15:21:10 -0500
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> There is one last case that hasn't been discussed, which is where you
> deliberately introduce an extra scope block for the free and
> allocation, so in your example above it would look like
> 
> 	if (ret < )
> 		return -ERROR
> 
> 	[ several more error exits ]
> 
> 	{
> 		struct foo *var __free(kfree) = kmalloc(...)
> 
> 		[...]
> 	}

I'm not too big on explicit blocks for just declarations. Especially, in my
case where the var is used until the end:

	{
		struct foo *var __free(kfree) = kmalloc(...)

		[...]

		return func(..., var);
	}

It seems a bit strange to have the final return of a function from within
an explicit scope block. Especially since the beginning is just for error
conditions, and the meat of the function is now in that explicit block.

-- Steve

