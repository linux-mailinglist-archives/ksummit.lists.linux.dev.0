Return-Path: <ksummit+bounces-2641-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90DC6BDF7
	for <lists@lfdr.de>; Tue, 18 Nov 2025 23:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 06DD4354FDE
	for <lists@lfdr.de>; Tue, 18 Nov 2025 22:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525F82D46D9;
	Tue, 18 Nov 2025 22:33:50 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABDB19E7F7
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763505230; cv=none; b=lX8Yydl66k03TuEFPkl0KPZYtfyIUDLj/3iwD24L05nTkWHIdMUgjHjafNP8qMTmehGC73WVVtGC52IrBb4s45V9EUlPdAcZrtCHSP8tSnRDGT12k04M2yFX9Bpl7EiYKBnl//dvrWWcrmSLjRmpOgq0IAV1dbEocsuLf7UWEp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763505230; c=relaxed/simple;
	bh=3GKAu/nCzIOMU8nff5cZZl3oR49U/UrllPL0UE6tRRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LiQvvYWb0fH27+z1KPf+MFbY1wsK4RrMoE4h5+J4kliDIpa0ap2LAHNjjSZlDkisORS1EmxA5gr4vx19d7zuafEren12oQsn5D9YTxzhjBu6JOMDrloE748TGV5sI+pv4SWxtzYmWtHJ4EubA4AvTwLw7+hC5TWMaGJiaCR6GVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 982B3B746A;
	Tue, 18 Nov 2025 22:33:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 98C682000D;
	Tue, 18 Nov 2025 22:33:44 +0000 (UTC)
Date: Tue, 18 Nov 2025 17:34:12 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Bart Van Assche
 <bvanassche@acm.org>, ksummit@lists.linux.dev, Dan Williams
 <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20251118173412.1a43125a@gandalf.local.home>
In-Reply-To: <fc255e7fb2b3fb4a2896f4e8680cca1f0cf7fe8d.camel@HansenPartnership.com>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
	<CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
	<20251118141720.11c8d4d6@gandalf.local.home>
	<bff6d9974e50f7cb27cc2b150ecd6e5e2252ae54.camel@HansenPartnership.com>
	<20251118155122.59dde92f@gandalf.local.home>
	<fc255e7fb2b3fb4a2896f4e8680cca1f0cf7fe8d.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 98C682000D
X-Stat-Signature: e51uhm7roq111k3fbxftqch71i51rf99
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/wOmmT3aokWwhoMx/wUjDEc8WlKYDM0wc=
X-HE-Tag: 1763505224-788675
X-HE-Meta: U2FsdGVkX1+7k+t95T3EE8xqzGZwtHGhORCHofgCvHn8pkAbf9UUXm8J7gvk6/NoyFOCNIZtCAlbNZERzc5XZNHKWioPR219mPixi3pip6nXDDQSsRIb4ZbqgvxdRcTCSxFIzKBqAuC4fqsnNI6ltkAeT9oCYjhMbZ+6WayqxnAzHFR0okEklnKnurI9qXqDinzEzhPMTu1O8tdbk3l9CjbzcwQsvxCg8Gge/W9Xdl/Dr58enTKiTl87Gkfs52iyC7dPzWPK7hr+gn5bI1EktXA7IEsapQND/O10o+gOdpcCSc2YmXCJawmU5dIM9g5+qJqIgZ75S3O/4nYQfTq1ifo9WuaoRu3xuvI2jQFBqhIvgSOIHGvqfb89llag2fIV

On Tue, 18 Nov 2025 16:10:00 -0500
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> > 
> > 	{
> > 		struct foo *var __free(kfree) = kmalloc(...)
> > 
> > 		[...]
> > 
> > 		return func(..., var);
> > 	}
> > 
> > It seems a bit strange to have the final return of a function from
> > within an explicit scope block.  
> 
> Well, you did that ... the return could equally well have been outside
> the block.  However, I do think additional scoped blocks for variables
> looks most readable when the scope of the variable is less than the
> code on both sides.  If the variable doesn't go out of scope until the
> final return, I can see an argument for just doing an interior
> declaration.

I guess you mean by adding a ret value?

	{
		struct foo *var __free(kfree) = kmalloc(...)

		[...]

		ret = func(..., var);
	}

	return ret;

As the var that is passed to the function that this function is retuning
(tail call) is only scoped inside the brackets. But anyway, I don't plan on
changing the code in question here.

I do quite often use the scoped_guard() as that does document exactly what
the guard is protecting.

-- Steve

