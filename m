Return-Path: <ksummit+bounces-2131-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8894AB22AD0
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6B52A1CF2
	for <lists@lfdr.de>; Tue, 12 Aug 2025 14:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C78A1C861D;
	Tue, 12 Aug 2025 14:36:31 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9573596B
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009390; cv=none; b=aKA7O94jy2z1Uu8Kl36/nHtXuwe/fvvYFdIgLfhECwhx7+O0j52lov9MGKzO2upvENsme7hJxihxFKH6tnlB4o6tKM95Ah0Gx2ZlV4AW1CrG/KAm90ASmI/ghdqAeThqIe2pV995e8AB1OKSDbwbrhkq7+HEr/2nPmuvCxrD2aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009390; c=relaxed/simple;
	bh=20AHha75eyG9HHTJSxVhDhfgUbRXYrJEAH3d3cZwZgM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RL51c81m99CLAm0kH1hu9ZytOjgWWh5+b6CCykyhLd92ru/rfV91kJXi3Pml3fQ1odc089OCZkSoLCKbDrHqnoim/lD3SCkv55ymAMAnN5aSchSolhFzbtzh95aEHaav/3t0HBO1drd0AGz4UoIVTjtlLtJWiX/RD4LyMh3BCVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 05BC3C036E;
	Tue, 12 Aug 2025 14:36:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 34EC72F;
	Tue, 12 Aug 2025 14:36:25 +0000 (UTC)
Date: Tue, 12 Aug 2025 10:37:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Julia Lawall
 <julia.lawall@inria.fr>, "H. Peter Anvin" <hpa@zytor.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20250812103710.5faf83fc@gandalf.local.home>
In-Reply-To: <d877a0d2-28b4-4231-87bb-4c7b8c10eefe@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
	<37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
	<alpine.DEB.2.22.394.2508060747440.3518@hadrien>
	<e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
	<d877a0d2-28b4-4231-87bb-4c7b8c10eefe@lucifer.local>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: em69yndbwuubk7mc97dunhhjhzm6r3jk
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 34EC72F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+NAnNlaU2RzMvyvG1KnOGjs+sDO907zqc=
X-HE-Tag: 1755009385-673805
X-HE-Meta: U2FsdGVkX1+hc6w9kx3ftBb0DnndqSegYfwmfmqXSHSHKWmSKhInN7BvyMvYcaIndI0PKoWTxHjTIY7PhYPn8N4myS+B5hFOUL9ShVMIhOXv7/mDUyaPMLzdLBqo9S//CXVSmtG2KReHP04+N09ZhmypwOIBu6EX8s9U+k85p9+F9+/o7/02I7MXQzCaAZ+q5RzqUquHM+JtlaLibv/tAT0yDQLuN8c2L15ngDRmRd9lSWSHYDnweXi91uOr0ZMBRRDRVvsPFpCdbyTdt6QGe7qcO0JMJcrKzpDKACfOm8gGhl3RitZCmW0cBEcT1afFUknXcn5sKhD4mumtPACiVCiI9KFyNyxFuZhflkRIxr38Kx9ofCiIWQ==

On Wed, 6 Aug 2025 20:30:25 +0100
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> > I feel like I have seen patches where people have generated AI
> > documentation for locking.  The problem is that if you ask AI to write
> > something it always has a very confident answer but normally it's vague
> > and slightly wrong.  It takes no time to generate these patches but it
> > takes a while to review them.  
> 
> The async relationship between effort to generate vs. effort to review is a
> very serious aspect of all this.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
          THIS!

My biggest concern with AI is that it may cause me to spend more time
reviewing what it produced than it would take me to write the code myself.

When I finally got people to help me with my work, my productivity dropped
substantially, as I found I was spending more time helping them with tasks
than it would have taken me to do it myself. But over time, that changed.

This could be the same with AI if you had a model that would learn from
what you taught it. But I suspect that AI generators will not be taking my
input from what I find and I'll likely be telling the same AI generator how
to fix the mistake over and over again.

One thing I look forward to with AI is that it will likely help me debug my
own code. I suspect it would be really good at reading my code and say
"Hey Stupid! You forgot to free this value over here". And things like that.
In other words, I trust AI to debug my code more than I can debug its code.

What's that saying? "To debug code requires someone that is smarter than
the one who wrote it."

-- Steve

