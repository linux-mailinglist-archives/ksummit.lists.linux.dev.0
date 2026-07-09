Return-Path: <ksummit+bounces-2958-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vxffBNbtT2oTqgIAu9opvQ
	(envelope-from <ksummit+bounces-2958-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 20:52:06 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A839F7348A0
	for <lists@lfdr.de>; Thu, 09 Jul 2026 20:52:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=he8RY+Xb;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2958-lists=lfdr.de@lists.linux.dev" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2958-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35C01305A989
	for <lists@lfdr.de>; Thu,  9 Jul 2026 18:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6182E7364;
	Thu,  9 Jul 2026 18:45:27 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476EA126C02
	for <ksummit@lists.linux.dev>; Thu,  9 Jul 2026 18:45:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622727; cv=none; b=fCsxH9XnNgG4PtzUNQWO/GesuoabREFv9v0fhsLTsdB+wuJRTElxIKW5fsQyrKtMUwoRcbW6wYJtK3wOCWz1kIU4w1V5UTRfrf1seHvjloyD/J2WhgfP6hZ6ZaLozESU97lTKCN9Asue58m5FIdzRTOuBvN3XektYyHi9QS3shE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622727; c=relaxed/simple;
	bh=3rkGVAkga8W6GsIr2tFsFMNtQE7ZfQ/GsqV5+Ph2vXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wtssdw61yRxiZpYlly5WjFUcQgAYU79zfdIICc9cHWt+FX393t5E1lUarp/cRpH5RYj2fCMl+sKfPO8oSXVKW1bF/8g9iOlyK6X/v8maFcHM6gW6qxGqsnVixFGo9XoveRb4faoy18n3oQDHuk+WQR4D7RRq8SqQTw3ZFQEOPRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=he8RY+Xb; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EUV/3XlG14S0aqBJvVUhAOrUtLd9nSNv6B0JKETq4h4=; b=he8RY+XbN++WEFGJ7XcFv+0iWB
	Yfam6G258oYuh01R1uTbxH24eTnk4li1fZSJGLwkVJ8vzYKCOzgD+2ZCHyIx0SE6VcZSsNAnUVIVQ
	xRCM8cU00LBh7IoK4pL6mT8N+LDvDObYnRYNS3+lawf/2sA+/rO6FL9kV3UHvOwPGidC7VuOJXKaI
	hICsI1FJb3C3o+tiI2lh+sqL+EErAITxlQpTjGVQdcwCG8oC/ZAZS3RJBeFN0N1dpetA98ui0PV2Y
	pRmOx75smi/QjQ7IWSknKrd549e5dj4BuxluD7TljU5b7RWAhuayrfmrLNO4quvnnAsdofzKvLso+
	UznnRjMQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtkR-00000005OTi-0eZd;
	Thu, 09 Jul 2026 18:45:23 +0000
Date: Thu, 9 Jul 2026 19:45:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
Message-ID: <ak_sQvh0IfBbjLPO@casper.infradead.org>
References: <akKBVsFBro_4QM74@casper.infradead.org>
 <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org>
 <ak_rr7I4wVPieWYT@stanley.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak_rr7I4wVPieWYT@stanley.mountain>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2958-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.linux.dev:from_smtp,infradead.org:from_mime,infradead.org:dkim,casper.infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A839F7348A0

On Thu, Jul 09, 2026 at 09:42:55PM +0300, Dan Carpenter wrote:
> On Thu, Jul 09, 2026 at 06:11:21PM +0100, Matthew Wilcox wrote:
> > I agree that many memory allocations benefit from providing more semantic
> > information to both the compiler and the runtime, as you suggest.
> > What I don't think we benefit from is "And you have to pass this magic
> > GFP_KERNEL argument too.  Unless it's GFP_ATOMIC or something".
> 
> You know that most people are using kzmalloc_obj() these days and so
> they don't pass GFP_KERNEL...

They are, they just don't know that they are.  Honestly, I think that's
almost worse.  Imagine if you could call kzmalloc_obj() from any context.
I think the instinct was right, but the implementation needs to be
done right.

