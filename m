Return-Path: <ksummit+bounces-2941-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6KdzLmegQmp1+wkAu9opvQ
	(envelope-from <ksummit+bounces-2941-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 29 Jun 2026 18:42:15 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E16DD6FB
	for <lists@lfdr.de>; Mon, 29 Jun 2026 18:42:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=zytor.com header.s=2026062701 header.b="o19i7F/2";
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2941-lists=lfdr.de@lists.linux.dev" designates 172.105.105.114 as permitted sender) smtp.mailfrom="ksummit+bounces-2941-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=zytor.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 275D430699D8
	for <lists@lfdr.de>; Mon, 29 Jun 2026 16:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EB245BD57;
	Mon, 29 Jun 2026 16:38:05 +0000 (UTC)
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D053F8EAB
	for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 16:38:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751084; cv=none; b=ZlZZRnQNTASyX9Feev7M6Nm1w6ABdd+D3IRXQciqqh2Vz2dXNTs6e2Egi+3IZu4/GnFyXgEKGBD320HIIlYRzZbkvZDB3xEA8aPVNQ2uWmmrAMiZRyPrMl9/rwrIMgPoFmR+2c2iYnJIg9XqPIZdpn2LuWvQGtMMUK7dkX7Nrgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751084; c=relaxed/simple;
	bh=GLRFrFaFI3l7oOzXRGuh61uyENfykobrmO2VmaiuHXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1WsCSNiiYPgtuxBpj/w0E+8zXANLD1KAy/Bj/pW9s6RmWyzRC9/bKVvEmhJg7NlF02InoK9SxdLVMq5uZcoloE7n4Zq0P7IiTQf3eqgxSYSCKhhirzEGvuSWGlmmzovCLz/Q9q0BTrKBbf6FX/TEa+ILCVrvR4ryOhOVrqN84E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=o19i7F/2; arc=none smtp.client-ip=198.137.202.136
Received: from [IPV6:2601:646:8081:7da1:68c9:ba90:b2f5:8138] ([IPv6:2601:646:8081:7da1:68c9:ba90:b2f5:8138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 65TGbuIQ647921
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 29 Jun 2026 09:37:56 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 65TGbuIQ647921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1782751076;
	bh=qZ9EdVoJBk/qoTKP9/s1uIv+8KwgcOAnVbf6pMAqAKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o19i7F/2gwzRJ+FRaixNj0Fe5S1GGCW/HYCa7ilWebMFsiFxO5HJITYsrNOXH5W/Z
	 xcvUXmUsYFkpfUg4syyWiriikCvumXeOZShfHK5+mxbel0CkqQ5CpedRJf0rgFF5ZX
	 FtXnh6dtWdG3Vh+OYCtvOPWf996cPFRqC6+hebO6fnyM3IYhLHQpUaK1mPLUmrC8Ld
	 TTy7XYOxasRwHDLE8rzDyRdCZ9yYrdfU77PRJNyT04IobQX0bRjh/hfCYkMbjzWxna
	 pzD85J40ReLW92LNz8I3HuHrdI7n0VBonA5tpj8U/Xw7yDlGHmokmooSDS/QOf0/fV
	 v//4iq2rYpCiA==
Message-ID: <35704824-3341-4c6a-b4d1-cba0bdbdbcd4@zytor.com>
Date: Mon, 29 Jun 2026 09:37:50 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Implementing malloc
To: Matthew Wilcox <willy@infradead.org>, Dan Carpenter <error27@gmail.com>
Cc: ksummit@lists.linux.dev
References: <akKBVsFBro_4QM74@casper.infradead.org>
 <akKKP4SlVs846Qp0@stanley.mountain> <akKPtGfBKDtuTai2@casper.infradead.org>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <akKPtGfBKDtuTai2@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026062701];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2941-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[infradead.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[zytor.com:+];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:dkim,zytor.com:mid,zytor.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.linux.dev:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E08E16DD6FB

On 2026-06-29 08:31, Matthew Wilcox wrote:
> 
> I'm not proposing introducing any kind of "new standard".  I'm proposing
> that we implement the old standard from the 1970s which is "good enough"
> for most allocations.
> 

... and which has 60 years of computer science textbooks talking about all the
problems with it.

malloc() models - although doesn't require - the natural API of an arena
allocator operating on a fixed-sized memory pool. Only hard failures are
recognized.

The kernel is a very special environment, and nothing is more special about it
than memory. The interface we have for "most allocations" is
kmalloc(..., GFP_KERNEL), which already there shows the need for controlling
error handling in the kernel environment.

We have all these APIs because they have different fragmentation, performance,
and failure attributes, and we need that if we want the Linux kernel to remain
lean and performant.

> At some future point, I might suggest that we remove kvmalloc(), which
> would reduce the number of APIs we support.  But that's not on the cards
> for this year.
> 
>> Are we just collecting a wish list?
> 
> No, I'll have a concrete proposal by then.
> 
>> I wish that we would just acknowledge say that small allocations cannot
>> fail.  We could add a BUILD_BUG_ON() in km/zalloc_obj() which ensures that
>> it is only used for small allocations.  Then we could remove all the
>> error handling from those.
> 
> That's part of the fallibility discussion I alluded to.  The problem
> is that kzalloc_obj(x, GFP_NOWAIT) can fail, even for small objects.
> And that is what the caller asked for!  So we have a tension there.

Touché.

>> With regards to use after frees, my impression is that the places which
>> use caches are the worst affected and also where we do the worst at
>> detecting them?  Does KASAN detect use after frees with kmem_cache and
>> mempools?
> 
> I believe it does, but I'm not an expert.  My question in this instance
> is really, "Are KASAN et al now good enough and widely deployed enough
> that we don't need eg red zones or unmapped pages to catch these things".

No. Nor will it be, because the overhead is much too high.

	-hpa


