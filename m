Return-Path: <ksummit+bounces-2945-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lqCAEne4QmqtAAoAu9opvQ
	(envelope-from <ksummit+bounces-2945-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 29 Jun 2026 20:24:55 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA16DE039
	for <lists@lfdr.de>; Mon, 29 Jun 2026 20:24:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=zytor.com header.s=2026062701 header.b=WoN+Ec6M;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2945-lists=lfdr.de@lists.linux.dev" designates 172.105.105.114 as permitted sender) smtp.mailfrom="ksummit+bounces-2945-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=zytor.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B25D307EA79
	for <lists@lfdr.de>; Mon, 29 Jun 2026 18:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E810F383318;
	Mon, 29 Jun 2026 18:22:32 +0000 (UTC)
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8C384CED
	for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 18:22:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757351; cv=none; b=m0kOxavpdbGmrgPuZEWMQXXOQP/NFTUpeB4WP68F+4bMrpnx8prGlFecsBL+4NNFYpheDbMuPKLt/4Ie6XI8zSBFUiepJk25LFuVMJIDCrBvLERpIYrdFydIIdXn02SBlt1f4KyrZ5KdPo0TN8E49GG0GXoSpaHKnm3xlaIJjK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757351; c=relaxed/simple;
	bh=TZeIXTB2yLYHVA90ES008UM/8XrcgqRvuhCNalm8+oA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ED2NEz+AT8HsSB+3jb+PMfDg/pdx7fLWh/mSCUyALj28ul9RXw9IzpS/iG0gExu78k9XeXqcwQG5zSUKL5vXRcRhtVFOdV12oqAsOrbMcAs9HWP2uljTlWWCEYxfBntiEsXIcCLi859F+mYnTxu8AkTX7ItfTRZ0ZOtY1o0w9gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=WoN+Ec6M; arc=none smtp.client-ip=198.137.202.136
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 65TIMIkg835168
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 29 Jun 2026 11:22:19 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 65TIMIkg835168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1782757339;
	bh=hL+ZdIo5Z6BsgCvPcOm3NCux3jvV3Bkw/y4neGUNa3s=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WoN+Ec6MqaZtufTiYYIASg/cYaQeLsuKHNHkfEiEO+uhsEp+WrF4WOjzBN0jEppFg
	 oaiY3AfutJDK0mbc+JF+ZYUT4jXoL0SvqsE82JnLvx/WlWzhhXhDEi1pVDqTpIyT8U
	 tGTyogE2M2vOoXKZy81MT6zcD+75Qbdcrh8vm8KXdqisEZ4mtJpzouzvfxG55aZX5N
	 dDHscy1naMyIWA7A0C5pRm47cZL42s4plOUH1khbx3w7VYLvYrTtlPkvpORFBgKueS
	 oMMYs/arrxdMNUvtizlOM3gWSnodvh1PK/ihvy89Ei37cyVjRzYL63MC1H+SaejbDN
	 elcVT7GrFgjkw==
Date: Mon, 29 Jun 2026 11:22:12 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Matthew Wilcox <willy@infradead.org>
CC: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
User-Agent: K-9 Mail for Android
In-Reply-To: <akK3KACxE9gIFZSH@casper.infradead.org>
References: <akKBVsFBro_4QM74@casper.infradead.org> <c48a77db-98a3-4860-ab30-bcbbe0884baa@zytor.com> <akK3KACxE9gIFZSH@casper.infradead.org>
Message-ID: <C71A5E1F-ED28-4989-8257-E4981A735638@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026062701];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2945-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[zytor.com:+];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,lists.linux.dev:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,zytor.com:dkim,zytor.com:mid,zytor.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CBA16DE039

On June 29, 2026 11:19:20 AM PDT, Matthew Wilcox <willy@infradead=2Eorg> wr=
ote:
>On Mon, Jun 29, 2026 at 09:48:25AM -0700, H=2E Peter Anvin wrote:
>> On 2026-06-29 07:29, Matthew Wilcox wrote:
>> > malloc() is a standard part of the C library=2E  Yet we force new Lin=
ux
>> > programmers to learn the difference between vmalloc(), kmalloc() and
>> > kvmalloc()=2E  They even have to acquire an understanding of the diff=
erence
>> > between GFP_KERNEL and GFP_ATOMIC=2E  If they are particularly unluck=
y,
>> > they may have to understand other combinations of GFP flags=2E
>>=20
>> You *NEED* to understand that if you are going to program kernel code=
=2E There
>> probably isn't anything more important, *really*=2E
>
>There's a lot of kernel code where that's true=2E  malloc() is not The On=
e
>True Interface to allocate memory, and at this point I'm not advocating
>for removing any of the existing ones=2E
>
>But we do have code which just needs to allocate "some memory", doesn't
>have any particularly weird restrictions, and where usability is more
>important than "pedal to the metal"=2E  An example might be something
>like zlib=2E  It needs to allocate some temporary memory, and why have to
>
>#ifdef __KERNEL__
>#define malloc(x)	kvmalloc(x, GFP_KERNEL)
>#endif
>
>> The kernel is a memory manager first, a scheduler second, all else is c=
ommentary=2E
>
>Some filesystem people might have things to say about that=2E  But
>increasingly the kernel is just the runtime for eBPF programs ;-)
>

You *do* know that zlib gets passed an allocation function to it, and for =
good reason, right?

