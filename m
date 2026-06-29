Return-Path: <ksummit+bounces-2938-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9hd/H1OPQmoH9wkAu9opvQ
	(envelope-from <ksummit+bounces-2938-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 29 Jun 2026 17:29:23 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E26DCAD1
	for <lists@lfdr.de>; Mon, 29 Jun 2026 17:29:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=zytor.com header.s=2026062701 header.b=Gu6jZuxZ;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2938-lists=lfdr.de@lists.linux.dev" designates 172.105.105.114 as permitted sender) smtp.mailfrom="ksummit+bounces-2938-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=zytor.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59A313047E49
	for <lists@lfdr.de>; Mon, 29 Jun 2026 15:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B75426D02;
	Mon, 29 Jun 2026 15:21:23 +0000 (UTC)
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE4E4266A2
	for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 15:21:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746483; cv=none; b=Mqwy4rnyffJ1937d5GvuuBfxlmdcsnKyec0W0Bn4vlcbU4ly5jov4Hqdn6qFnw6+DAdTz36zjE5lHiR2jx4I/VCemT9ijSM1wvBmh95aOAp97rpX8xS/DP8SY5v12XMPTb9mV1yddbbDkr2lPcaeXh3fnWandTpu/vI1v2eBeX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746483; c=relaxed/simple;
	bh=rVvv5grSSpmk1IlZH9PE7kl3h88Ft+gNb/cLRMCZans=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=CTW4c/6XTJqhotHzX0YSzBiOUNAXJKOPp96GO2qvIFwSZlw3QmqJZLAWpaqAlIN6kC4NNksRoS0mSuo4rZ0c+YJOdaLOMtYWz2paisgkh95258K1AyB8pXvp3dPTqHiTWBSk7LrJARlbpLnYLnFbEdF37yrZhNfbviNcs/FntmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Gu6jZuxZ; arc=none smtp.client-ip=198.137.202.136
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 65TFLE2q513148
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 29 Jun 2026 08:21:15 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 65TFLE2q513148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1782746475;
	bh=6v7Yrep4nnuwKESVgsatMiuCxAsXPf+b5Cntu6ZXYwE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Gu6jZuxZ3mXzAAFV6onYrkbDf2ZrVU6vdkJmpKfe5YN+F1gj5hjNqF12iOrP2khAA
	 TV61Wn4x+TG6wQKQao0Dh6KEHXbnxvceXr+4IwxJRgJbSQYgLMQjtwotw1CZ3Gv8MB
	 3Pdt/9/i2hacELyC7Z+a8SNqfk5MYyOTx1XF575msVg+fByVwZp1O5cVBwdwVhSy/R
	 KWo2BGUxBH1mwBe6W4wZESAn78DJVXbG+NELZJv3wDFD4KWQ+8rl007IzABA7aP3Ki
	 Mw1s4BEnhrpzXTnDHNz31B1vTSDmBycbvIckK4aQ8yg93N+RhuVoP9Wb1Z/RM7VkjE
	 OYiYt2TAULrVg==
Date: Mon, 29 Jun 2026 08:21:08 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Dan Carpenter <error27@gmail.com>, Matthew Wilcox <willy@infradead.org>
CC: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
User-Agent: K-9 Mail for Android
In-Reply-To: <akKKP4SlVs846Qp0@stanley.mountain>
References: <akKBVsFBro_4QM74@casper.infradead.org> <akKKP4SlVs846Qp0@stanley.mountain>
Message-ID: <619108C4-E4F7-48CB-8CFB-722DC87B5A6C@zytor.com>
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
	TAGGED_FROM(0.00)[bounces-2938-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.linux.dev:from_smtp,xkcd.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E87E26DCAD1

On June 29, 2026 8:07:43 AM PDT, Dan Carpenter <error27@gmail=2Ecom> wrote:
>On Mon, Jun 29, 2026 at 03:29:42PM +0100, Matthew Wilcox wrote:
>> malloc() is a standard part of the C library=2E  Yet we force new Linux
>> programmers to learn the difference between vmalloc(), kmalloc() and
>> kvmalloc()=2E  They even have to acquire an understanding of the differ=
ence
>> between GFP_KERNEL and GFP_ATOMIC=2E  If they are particularly unlucky,
>> they may have to understand other combinations of GFP flags=2E
>>=20
>> This topic proposes that we should implement malloc() and calloc()=2E
>> Various options will be discussed, their increasing implementation
>> complexity corresponding to utility in a greater range of situations=2E
>> This will also benefit Rust as we can use the same infrastructure to
>> implement std::alloc=2E
>>=20
>> We'll also discuss the semantics of corner cases (fallibility, zero
>> sized allocations, overflowing allocations and very large allocations)
>> as well as out-of-bounds and use-after-free detection=2E
>
>I'm not sure I understand=2E  You're saying that it's too complicated
>and then you're suggesting we introduce a new kind of allocation function
>as the fix=2E  It feels like the classic XKCD comic about standards:
>https://xkcd=2Ecom/927/
>
>Are we just collecting a wish list?
>
>I wish that we would just acknowledge say that small allocations cannot
>fail=2E  We could add a BUILD_BUG_ON() in km/zalloc_obj() which ensures t=
hat
>it is only used for small allocations=2E  Then we could remove all the
>error handling from those=2E
>
>With regards to use after frees, my impression is that the places which
>use caches are the worst affected and also where we do the worst at
>detecting them?  Does KASAN detect use after frees with kmem_cache and
>mempools?
>
>regards,
>dan carpenter
>
>
>

It's like memory management in a kernel is difficult or something=2E=2E=2E

