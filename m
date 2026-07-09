Return-Path: <ksummit+bounces-2950-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cTm/MKrWT2oPpAIAu9opvQ
	(envelope-from <ksummit+bounces-2950-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 19:13:14 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D0D733BFF
	for <lists@lfdr.de>; Thu, 09 Jul 2026 19:13:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=qU1wW7Dl;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2950-lists=lfdr.de@lists.linux.dev" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2950-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 136DE303C7D6
	for <lists@lfdr.de>; Thu,  9 Jul 2026 17:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCB339DBE5;
	Thu,  9 Jul 2026 17:11:27 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCED239E9CF
	for <ksummit@lists.linux.dev>; Thu,  9 Jul 2026 17:11:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617086; cv=none; b=ZRdvEbHfzdyKEjdc9XtGumRAiB9/KqltiYNvcuT48bgx2wcnClqpHTEAdsWGTkG1BupPJDKtvRTpzSDLubwP6gkbBGqTlGBdWP0RY+kiqduhK7i9dRbtB/uSikAR0hy8qHbDdJH3sCsWvFbVihTEjdhrrbjqtixVSRjr14Cltj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617086; c=relaxed/simple;
	bh=R6IWdqT7vr27SevLKCtgeb1nEEgsdLsQoF57/gcD5BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLx3e9IMJ+ZPLgZPhGe6lkKKI0jSNC5kUkBnrij1l8ohs/qqw77NwWWTum0fVYu1T8VKLTyY4WxnDVjR7U6Qf/Rk/FoWXLZYjcAmV+hg6UkjyJHcejiJk+9E5reK9I6qve93zv1Im7e0993ZJIIt08EvISDOE4ve5GoqyayPLtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qU1wW7Dl; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fVhVnKJzHhzojYjEekKd8C0L6ENvayCTHMeMdpQ/PCM=; b=qU1wW7Dl9b9xTNWLSSIk935fK7
	WgACGt/Vhz/aHxWFE8hYksCXhfXHsoyZNYNeOUxEE13c/9GWK78aVRE8aDJ35qKtOObsgZLlM+lvO
	rA5JFkMS64cOtLQrvrClT9UI938LQ5mlAGOl9pht5+KGtex9IT+eRzet1MLszi5atrob2ImH53pYx
	W3r/7uc/CcvykSI+pG1FIf6QAk4puHXZxQoeqZ/1EZyxo4uZwAX6p60qe+kjye+le5TDUzkPfJ87r
	QqARMkKmdi5L2cPjEQe9SMjxabUpR6ZGIrf4Cm0zQ2r9+vIwFG8HlRRxAVgGfywoM6eJYBXrQZNhV
	Jib51WCw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsHR-00000005FOU-2er3;
	Thu, 09 Jul 2026 17:11:21 +0000
Date: Thu, 9 Jul 2026 18:11:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
Message-ID: <ak_WOfpcaZIuh99t@casper.infradead.org>
References: <akKBVsFBro_4QM74@casper.infradead.org>
 <202607090956.6381F35@keescook>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607090956.6381F35@keescook>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2950-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:from_mime,infradead.org:dkim,casper.infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97D0D733BFF

On Thu, Jul 09, 2026 at 09:58:37AM -0700, Kees Cook wrote:
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
> 
> No surprise, but I strongly disagree with this. Those APIs are flawed
> and we shouldn't emulate them. This is why we just removed strncpy(),
> for example.
> 
> Allocations need to be type-based, not size-based. When we force people
> to reduce it to just byte count tons of metadata that can be used by
> both the kernel and the compiler is lost. The size is a by-product of
> "what do you need space for?" "I need X many Foo objects" or "I need
> Bar with Z many trailing Baz objects" or even "I need a plane of pixels
> X by Y". The uncommon case is "I need X many bytes from this stream".

I agree that many memory allocations benefit from providing more semantic
information to both the compiler and the runtime, as you suggest.
What I don't think we benefit from is "And you have to pass this magic
GFP_KERNEL argument too.  Unless it's GFP_ATOMIC or something".

Maybe I'm confusing / distracting by framing this around "Hey, malloc()
is a great interface and we should implement it" when what I really mean
is "GFP flags suck and we should strive to redesign the kernel so that
the vast majority of allocations don't need them".

I'm happy to rephrase the proposal in that way if it'll help.  I thought
that malloc() would be the right vehicle for getting my point across,
but it seems to be a distraction.

What I really don't want to see is a whole pile of Rust changes to
accommodate having to pass GFP flags to memory allocations.  Would that
be a better vehicle for the discussion?

