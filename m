Return-Path: <ksummit+bounces-2785-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DDAD3999D
	for <lists@lfdr.de>; Sun, 18 Jan 2026 20:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC99C30080CD
	for <lists@lfdr.de>; Sun, 18 Jan 2026 19:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C699124466B;
	Sun, 18 Jan 2026 19:52:48 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F854652
	for <ksummit@lists.linux.dev>; Sun, 18 Jan 2026 19:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765968; cv=none; b=Dq63ssC9dQY4JYN/KeJLOsVQeKcEr/NZ07zXjPBLPVC3qA4K+GEu3VdauXDUQdqgpLs9xrrAFX2DGTY3O4eGpTTge5wQOtNfEOccul6Ef1lZNLjIICQ9Zs3jnNLNabRNroPJ4OrAr5DwQsGefczD3J08USgSUqrMk/SBRbPu7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765968; c=relaxed/simple;
	bh=eCg4bDmGFp0PCLIzYlb5cVvyey4yicKX0iM1roFTk1U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Or1IRN0qOvU48SLKIwircSDm52aAH0A3Kk9H/xVDBvCsVjs5ZzkzHnib1UfqX+GmHGUhQM+livFov1qMnaSdiDksWgGdBb7mpyElCeLlCiO7pu5FAO7Yn17cl3PRWAI59yv24sdnQGV5nnbR+BjW7/UNYFA5pmbTpgBkOme9HLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id DAB35B9BAC;
	Sun, 18 Jan 2026 19:52:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id 977E72F;
	Sun, 18 Jan 2026 19:52:43 +0000 (UTC)
Message-ID: <ff13a1753f2395ebfe4fe559958ae5af5b0b424b.camel@perches.com>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, James Bottomley
	 <James.Bottomley@hansenpartnership.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Alexey Dobriyan
 <adobriyan@gmail.com>,  Andy Shevchenko <andriy.shevchenko@intel.com>,
 ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Date: Sun, 18 Jan 2026 11:52:42 -0800
In-Reply-To: <aW01ludvLz9xNzkd@stanley.mountain>
References:
	 	<58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
		 <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
		 <aVUUXAKjiNroU5tR@black.igk.intel.com>
		 <20260102095029.03481f90@gandalf.local.home>
		 <38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
	 <20260118110454.4d51a50a@robin>
		 <d187bc4bb0ff1de7812cc4d1673a55b45cb59d68.camel@HansenPartnership.com>
		 <aW01ludvLz9xNzkd@stanley.mountain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 977E72F
X-Stat-Signature: f74skjyegiwatqsgq88pzo9fdp91p7z3
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/NYgfxF9bapuXvvPHEH1ESHr6GygMsl6M=
X-HE-Tag: 1768765963-338946
X-HE-Meta: U2FsdGVkX19ieeHBDR2sVD7uIZ8YMkHvq/Sq+CoG4zQNU41C3vkXVffG6D5Cr058fQfPgp7K1tbD7kOspyhAjRStQ1IWe8cAFBqrEn1Q0RO1awqm+JzVX5zVeBjCwzeKDFaHmdJaXv477iGHJl4KO0e/z+WR9qjzkYdaKkIzE/pCt8dMRfkJJXy6ahaNh1CkMAtF8NoQvAqwbcGKCQ0zH7Xrbx0jCSuk3CDvrg/Zd94DPxa7Ux09m6Rx98xBNLNQO1XjbIHIREPUyT7SXlQozVs2YL/vSdmw+AMahWcAJCHXxm+0NW3nNIMVkGfCtzgD03qwqBfw3iJ3MnfQKgwwjtp4r7JdXgd6SLPPtrlCyK6QpP6UDkMDWhwMZNM8NprCrmk2b0sY5CRO6kUXXGmEOw==

On Sun, 2026-01-18 at 22:33 +0300, Dan Carpenter wrote:
> If you're working across the entire kernel like I do then it's safest
> to assume Upside Down Christmas Tree is the rule.

It's still a silly rule.  Like James wrote: Foible.

I did about 10 years ago suggest a checkpatch test though:

https://lore.kernel.org/lkml/1478242438.1924.31.camel@perches.com/

