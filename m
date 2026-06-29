Return-Path: <ksummit+bounces-2944-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O6SEBzS3QmpsAAoAu9opvQ
	(envelope-from <ksummit+bounces-2944-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 29 Jun 2026 20:19:32 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF9E6DDF8B
	for <lists@lfdr.de>; Mon, 29 Jun 2026 20:19:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=TRWXgquN;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2944-lists=lfdr.de@lists.linux.dev" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2944-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 137B93006173
	for <lists@lfdr.de>; Mon, 29 Jun 2026 18:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EB6348C6F;
	Mon, 29 Jun 2026 18:19:27 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0FA29B799
	for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 18:19:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757166; cv=none; b=HVTnA6Q4pU8z4erptlSfWR+F8kOHKY0/CSTHB7hFubrNOK7GI1LKbFMwX2LpvkWbcIkyS45gfCiD3L/WWRbovuaXSSvGcKvJmyYai6Mv2G6jtbYzXkzLwgiPdYha4xCfeYwkAzuiuM1a1jzVFms5kVrai06cb1lPNn3Agf3mmbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757166; c=relaxed/simple;
	bh=zfUAwLsbGmdCCut/4H4GGBQnqSH8Q5Fc93GdBFYkUes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcxT6F9X1glMl7XwLbMne2glGwoKNBp4ehNjIznRs3gzMkwWIC4oRzRYFF05HlhMGPdBRd+8pc3fkYMcVc4tnrHeOmiVoLMAZSPSLac3bw32DBfcT7gTe/kS/XYlDpamrT2iIaG/Btlg3dmVeSAPWuJ7HQHqhBmv5ZA3Xxtkk7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TRWXgquN; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k9ucZHlIBTB6rqyciyJ46R56zsQp+QlxtrYY/kot+JY=; b=TRWXgquNUMVSMQ++5e+Xxf1K7n
	d2iVjs11Pl3QCDFkm2PP5n+WJCpIYBN83LwcLgAqiO08OjTyZOoeluSIqyA16SU756gxAZiXtn4aZ
	iUmRqRlaU/0sh5dunSe9q77mXwxCI/wGx9Y54evmhXROoezrrLmLlxAetjkeCbhyAwKO0xYY1a8Fb
	szo9B7vebrG/z+m3TtOKu7fza5bZ2lsj8iSx1AkvNfrm3MMV0ipzvSK/a6YFYXQcZFb4fiiQDfAXv
	8NENhrFntlCkO1TzjsLoId5cf17O5nfdvs8SaFjAgKC312aJ06j1Y82Am7kUkwx7QdycUELMj3QnM
	Jw6cPd+w==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGZk-00000003eoN-1rBo;
	Mon, 29 Jun 2026 18:19:20 +0000
Date: Mon, 29 Jun 2026 19:19:20 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
Message-ID: <akK3KACxE9gIFZSH@casper.infradead.org>
References: <akKBVsFBro_4QM74@casper.infradead.org>
 <c48a77db-98a3-4860-ab30-bcbbe0884baa@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c48a77db-98a3-4860-ab30-bcbbe0884baa@zytor.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-2944-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,infradead.org:from_mime,lists.linux.dev:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CF9E6DDF8B

On Mon, Jun 29, 2026 at 09:48:25AM -0700, H. Peter Anvin wrote:
> On 2026-06-29 07:29, Matthew Wilcox wrote:
> > malloc() is a standard part of the C library.  Yet we force new Linux
> > programmers to learn the difference between vmalloc(), kmalloc() and
> > kvmalloc().  They even have to acquire an understanding of the difference
> > between GFP_KERNEL and GFP_ATOMIC.  If they are particularly unlucky,
> > they may have to understand other combinations of GFP flags.
> 
> You *NEED* to understand that if you are going to program kernel code. There
> probably isn't anything more important, *really*.

There's a lot of kernel code where that's true.  malloc() is not The One
True Interface to allocate memory, and at this point I'm not advocating
for removing any of the existing ones.

But we do have code which just needs to allocate "some memory", doesn't
have any particularly weird restrictions, and where usability is more
important than "pedal to the metal".  An example might be something
like zlib.  It needs to allocate some temporary memory, and why have to

#ifdef __KERNEL__
#define malloc(x)	kvmalloc(x, GFP_KERNEL)
#endif

> The kernel is a memory manager first, a scheduler second, all else is commentary.

Some filesystem people might have things to say about that.  But
increasingly the kernel is just the runtime for eBPF programs ;-)

