Return-Path: <ksummit+bounces-2939-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iD5UHJ+RQmqZ9wkAu9opvQ
	(envelope-from <ksummit+bounces-2939-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 29 Jun 2026 17:39:11 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0539E6DCCC8
	for <lists@lfdr.de>; Mon, 29 Jun 2026 17:39:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=Rc4KeSJc;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2939-lists=lfdr.de@lists.linux.dev" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2939-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C79F73049EF1
	for <lists@lfdr.de>; Mon, 29 Jun 2026 15:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E483DC4B6;
	Mon, 29 Jun 2026 15:31:06 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969519DF62
	for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 15:31:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747065; cv=none; b=Kk0Pxt9Xb6NtUGOBuoJU8tNPKahVaBzEbeHHZ4Z0Ae4Qn/36D9mTnCwcZ5kh+thTumAgGflyUhLSUHiJlNZPvLfqYE3giJkymrY36kngqUfK3GxnAzdOAVsomOjnNrIpSEo0aFEt7kQOtPrOwQFnyhISZ3IYLfakvQApFa+0obw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747065; c=relaxed/simple;
	bh=F+olvb8X3SFFmKI1emWWJBrS309+m0IpBoerlFzvYXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOrvw46DFb4RiHYP9zk/zVqd62vSLBxpbzeZfRl2xGwRuKyinwuRAS/mY8VnXENwKkINaS2E89nhJ7upBAIzUdHwlPmC1pIVQqZoiH9wCQPDZnpQlmpxuacFywqSr0r6r9Ze5GqYtDooZhCvlA0PSUSojxMtI0/1X6Dl6X4UMmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Rc4KeSJc; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RYL8a7aD4noigWRObVAHwA5AECxSZ2Q/C7ukj9v3Ags=; b=Rc4KeSJcm+XaCsxrjVhMhK5Txm
	8sRwE4o9igJq9nZLNgg0mBXjG3HputhMqFkccUd47BzGiWmSPahUcEmfFCwUrNzyJWV6XcqV70Mdk
	h2m9pZX0Mg9xiGxn1r50CAxQn4v0k5l6F0HGatll1wvX1CX/96OEsRljTGajf0+WxV4sjQPY+fe8U
	PVjH0yoK99rnLfKqxuBCfIHWY0ohu3lSFs0GZFa58oRoY2pmUw4F1noOVP8o7QoxNjQgG2KWc6fNP
	jlpamo6CbDljqjccF2+5ecrc0/Tfec/9yJcTnWqKZyjDkFA4hJ6mKKyMQfQ9uYLJSeJutxD5ZQ+Cp
	6KGCtrkw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDwq-00000003Rx3-4C8F;
	Mon, 29 Jun 2026 15:31:01 +0000
Date: Mon, 29 Jun 2026 16:31:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Carpenter <error27@gmail.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
Message-ID: <akKPtGfBKDtuTai2@casper.infradead.org>
References: <akKBVsFBro_4QM74@casper.infradead.org>
 <akKKP4SlVs846Qp0@stanley.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akKKP4SlVs846Qp0@stanley.mountain>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-2939-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xkcd.com:url,lists.linux.dev:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,infradead.org:dkim,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0539E6DCCC8

On Mon, Jun 29, 2026 at 06:07:43PM +0300, Dan Carpenter wrote:
> On Mon, Jun 29, 2026 at 03:29:42PM +0100, Matthew Wilcox wrote:
> > malloc() is a standard part of the C library.  Yet we force new Linux
> > programmers to learn the difference between vmalloc(), kmalloc() and
> > kvmalloc().  They even have to acquire an understanding of the difference
> > between GFP_KERNEL and GFP_ATOMIC.  If they are particularly unlucky,
> > they may have to understand other combinations of GFP flags.
> > 
> > This topic proposes that we should implement malloc() and calloc().
> > Various options will be discussed, their increasing implementation
> > complexity corresponding to utility in a greater range of situations.
> > This will also benefit Rust as we can use the same infrastructure to
> > implement std::alloc.
> > 
> > We'll also discuss the semantics of corner cases (fallibility, zero
> > sized allocations, overflowing allocations and very large allocations)
> > as well as out-of-bounds and use-after-free detection.
> 
> I'm not sure I understand.  You're saying that it's too complicated
> and then you're suggesting we introduce a new kind of allocation function
> as the fix.  It feels like the classic XKCD comic about standards:
> https://xkcd.com/927/

I'm not proposing introducing any kind of "new standard".  I'm proposing
that we implement the old standard from the 1970s which is "good enough"
for most allocations.

At some future point, I might suggest that we remove kvmalloc(), which
would reduce the number of APIs we support.  But that's not on the cards
for this year.

> Are we just collecting a wish list?

No, I'll have a concrete proposal by then.

> I wish that we would just acknowledge say that small allocations cannot
> fail.  We could add a BUILD_BUG_ON() in km/zalloc_obj() which ensures that
> it is only used for small allocations.  Then we could remove all the
> error handling from those.

That's part of the fallibility discussion I alluded to.  The problem
is that kzalloc_obj(x, GFP_NOWAIT) can fail, even for small objects.
And that is what the caller asked for!  So we have a tension there.

> With regards to use after frees, my impression is that the places which
> use caches are the worst affected and also where we do the worst at
> detecting them?  Does KASAN detect use after frees with kmem_cache and
> mempools?

I believe it does, but I'm not an expert.  My question in this instance
is really, "Are KASAN et al now good enough and widely deployed enough
that we don't need eg red zones or unmapped pages to catch these things".

