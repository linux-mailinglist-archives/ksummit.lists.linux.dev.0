Return-Path: <ksummit+bounces-2936-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XCkeJdOFQmpZ9AkAu9opvQ
	(envelope-from <ksummit+bounces-2936-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 29 Jun 2026 16:48:51 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D29FE6DC429
	for <lists@lfdr.de>; Mon, 29 Jun 2026 16:48:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=duESylJi;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2936-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2936-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AA0B312D160
	for <lists@lfdr.de>; Mon, 29 Jun 2026 14:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C536413231;
	Mon, 29 Jun 2026 14:29:50 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A636410D3E
	for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 14:29:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743390; cv=none; b=CCjxLvv76vyBEln0LzKJYT8e5zBDGc6bEG9/wOVEp+Q8Qj0QoKO7fHp+oDEh+n9zTQQNHBBVPadR5EY8PXdpcBDtPOGOfX6fpZTN45PG7T1/xCV/ATerZw6mfUgzhm648jZtbb1JvFKf3TDoJQd24waqWhK5t1IJ8slX0Iv7NNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743390; c=relaxed/simple;
	bh=vRunn1CektrccKZ2akiMDyrwrOskpPoiVolI2Txgtos=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FSPcsMvL5JDn63yDFui1fLU8mtlDRigEbeJwwc8TLHRcS5rl1gzwle3TccXWc7fr5M3UblkGMNNWXs3P/W/UmqtuuW5AcbAEaSclN6hr+2OPOn5EA/CDoj43j+xzy+x6ubpk4moVd+fRBFHWZLkfSTJVhtC1CTIZ2clvSL9BEV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=duESylJi; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=B4FmwstoS4GD1i16x0CzhIpaal9fKyJ7grRLUYJmfsA=; b=duESylJif1ntVeiNW1tpeAqSVr
	qZJmkhggPHAmqb0lvPyulE582N9gx0V1gGT+yicd6ROl91AvJcGKJFCjHBx8TQYWCpP34v0bk8Ddz
	l01sY65ZQ0l8sXyvy5IxRfRd6nMAz8wg3aBZB6mGSuthiKIUlYA102s00edA6/HwlsIwgWTWTJvEf
	gUdI7oa7iS6BiZ/4hCtCke053NKmbNEK0ZXF9wcOwKiEJ/O3xpkNNcWdyyhqnvgh8Q7FpchJi5SfF
	9X/9Iv+RRVxkzF6EYU0jT9cYIDTtShEZrzexO+Ae13Ja40b+IVVqLhIzOWvWLFfO0uih4fYAl8Iv4
	uxTXGvWw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCzX-00000003N5n-0Mpb
	for ksummit@lists.linux.dev;
	Mon, 29 Jun 2026 14:29:43 +0000
Date: Mon, 29 Jun 2026 15:29:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: ksummit@lists.linux.dev
Subject: [TECH TOPIC] Implementing malloc
Message-ID: <akKBVsFBro_4QM74@casper.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2936-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:dkim,infradead.org:from_mime,casper.infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D29FE6DC429

malloc() is a standard part of the C library.  Yet we force new Linux
programmers to learn the difference between vmalloc(), kmalloc() and
kvmalloc().  They even have to acquire an understanding of the difference
between GFP_KERNEL and GFP_ATOMIC.  If they are particularly unlucky,
they may have to understand other combinations of GFP flags.

This topic proposes that we should implement malloc() and calloc().
Various options will be discussed, their increasing implementation
complexity corresponding to utility in a greater range of situations.
This will also benefit Rust as we can use the same infrastructure to
implement std::alloc.

We'll also discuss the semantics of corner cases (fallibility, zero
sized allocations, overflowing allocations and very large allocations)
as well as out-of-bounds and use-after-free detection.

