Return-Path: <ksummit+bounces-2687-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C0FCEECCC
	for <lists@lfdr.de>; Fri, 02 Jan 2026 15:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4E873028F4E
	for <lists@lfdr.de>; Fri,  2 Jan 2026 14:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6473222ACEF;
	Fri,  2 Jan 2026 14:50:26 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACAC20299B
	for <ksummit@lists.linux.dev>; Fri,  2 Jan 2026 14:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767365426; cv=none; b=SqfAFXxrQajCL2toIuliObrR7wbEFWUNFisNm7pUsTGCqufGo7A+l9SM2wlqg6ztZFDrA286dC55gs/DA9Xp251kQSks9EP4o+duPNQoI/kPzM1M6MQorMzH1FrxJlC2NxlMdJuVYPA7FKr9mcxPsBRrSWv1sS+mnHJLKLNC030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767365426; c=relaxed/simple;
	bh=yfRx30KjDTEX4KAZyZqR747iZZKamAXMrYRCbmdoXdY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJ2n8KeGqSRvHv1WSIaWZcoHtFaG8Rv/4kt/+cAhQJlgQEgeQAK20rruvpNXURB8EW+hgQLah7veABaTsVelQ3XxTEEaufCp0tz6QCbbboPCqD42ylL/y2dMxF4ZdRswfYvY39a34/pq/zwGQUilNP7l954Bl6lkGQUFS+zh2I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id B484F1A03D2;
	Fri,  2 Jan 2026 14:50:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id AADB880009;
	Fri,  2 Jan 2026 14:50:14 +0000 (UTC)
Date: Fri, 2 Jan 2026 09:50:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, Dan
 Williams <dan.j.williams@intel.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20260102095029.03481f90@gandalf.local.home>
In-Reply-To: <aVUUXAKjiNroU5tR@black.igk.intel.com>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
	<aVUUXAKjiNroU5tR@black.igk.intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AADB880009
X-Stat-Signature: gw3uk1c4nh8cht98g4xi6p5kqemdo6uj
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19fF92WfXwRHI2suQUgYvmdUN7owaZNG7A=
X-HE-Tag: 1767365414-960068
X-HE-Meta: U2FsdGVkX19OZmoNBFlMnruJahKt80+qXPziuaFwTo4TAwem8EkhCFcTsebfwNnh8KsEf83waIgxOy//FDlmevwsq8r8GS4S+cVMKpYh0f0AnsW0ZZ6gsADszt2MoDZMzsQw8V5hPXy4SoVAARRugHAJhqd9fjLeJoTw+J5mPsYX58tmQGrRCnx5SBWEam2mUFJRamkLUIh8h1rdTN95R4dB04iuBZUzGu8NE6YFHN0LqeWND6kKNwXj3iJR6iEwmLCz1Z8UScHPptueBkGnjy5BiwbVepVsNvQejQLVt/tUwhr9bwgVjs3b9ALmWnwvU3m6zjsraMfeKyFS4SdK4PcjIVNq66dfLdCCrWznLjFhZ5RF4zbpkg==

On Wed, 31 Dec 2025 13:17:32 +0100
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> > There was variation of this type of nonsense with headers (not only it has
> > to be sorted alphabetically but by length too!)  
> 
> By length it indeed sounds weird, but alphabetical is the natural language
> order everybody learnt from the daycare / school years, so it's properly
> programmed in our deep brain. Having that allows to find easily if anything one
> is interested in is already being included. Also it allows to avoid dup inclusions
> (was there, fixed that for real). So, it's not bad.

Actually, I like the "by length" because its aesthetically easier on the eyes.

Alphabetically is fine, but either one helps in catching duplicate headers.

-- Steve

