Return-Path: <ksummit+bounces-2841-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMmzI023oWm+vwQAu9opvQ
	(envelope-from <ksummit+bounces-2841-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:25:01 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B11B9B9C
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA6EC305A85F
	for <lists@lfdr.de>; Fri, 27 Feb 2026 15:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C493F43D4F7;
	Fri, 27 Feb 2026 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="QICnmDkc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eDFbVEZy"
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467AE43CEC2
	for <ksummit@lists.linux.dev>; Fri, 27 Feb 2026 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205510; cv=none; b=gvzSQ1h37FK85cQ+CsTpFt4kYVQDTgXcevyrx2fMMfYXDs4NXvypzQNw0mAgHwUCL8uByxjPYq/wP3EU35uGXyg2cHh2C5jzML4zjVtJVKNn/VDRPVUVYqBFXZKeWVdFQxyDgIgan+Zjkce/kdxUJdPDjVLY18k4u/O3qBaK3yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205510; c=relaxed/simple;
	bh=VtuVYieGh8F1TjUzQB9JodFDyj40I9CU81dNkdabY44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0KlPR0xmf/SbBAqIsm1EYdQZ3xFNjwW56ZIQPruq91vUOKLBlquMQApHqD3Ivtqg1Zq8FgBhlNs/LR3q/ALhls2bEQmjBIx10CWy0ujCAUuuYcM0HnYVQRHemaUPkA1xNT05OzIbXu9ACDSn2Fm0r3aIQK/jqILjndwm7QGFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=QICnmDkc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eDFbVEZy; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1B69D7A0250;
	Fri, 27 Feb 2026 10:18:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 27 Feb 2026 10:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1772205506; x=1772291906; bh=A/ten9LgoHMIP7h78YZbvxlOsVL6THjc
	9LT8OYxhUG0=; b=QICnmDkcvw63LuFv6mUvYg5S5Jl/CCFzqXN2gFNk9RL+TLdQ
	QkZI7pgeVLZU95eR3iOl8RS9Q8Vxz40lJ1VXfY8ttMqtj7XlyKPX4socS34JqzkT
	3v4TykfxXn8Zfgphgc3jRW2pWoxsAfcyGPKMxmDkmC5ejGSRaCHeZRgnz4jbshYE
	yR5JEh3ERO5GCmUuqQn/zcqOzb9wdkQ3M0PdYn57HfzwwtoendA1QO5GXrsLIXPP
	BcFhO3hN2ElRsO1V5L0ciq+BbpjXykvEZlX8eJuth/CAcDtAFffnv/kXVaHyDFxu
	RUU4l70VUxnc8YWp1X194wLeIFsZu/485Z1veA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772205506; x=
	1772291906; bh=A/ten9LgoHMIP7h78YZbvxlOsVL6THjc9LT8OYxhUG0=; b=e
	DFbVEZyEC9FeZVLw1Z/gv65d6DD6fVNqbhskwY2cAFjfTsdUb8gwC0NUI1OuD1Ar
	mAWXLiJQzi1KmPUcsaEdNk+GtXdY1MkN27+nytrsur8oQePs0DV4qq3M0ZLqeQrE
	rq2xrej5ZT5Oe2LvI034iNbIwQhbjhvOQo/aQ7RP72La285j3OyBO3Se1yV9kkkU
	5ddVwuK+kvNgPNSb89rwjvR2gPAwWBqQbtDhfNzLwxaf5LuKaCbsQApGGh1DU8z+
	pSUyLisUhqY+LM9TmNXA/cZ5bWj+jV0TbjjsDzExk+5zH85yRF5PgFQUI/DsZ2XU
	NhBrHGPWTOC6IbL7KQgng==
X-ME-Sender: <xms:wrWhaXI88MzlfVjHC3IX4WwcFIDA-qSqBvcZ6C6vSqt51yXArAY2-g>
    <xme:wrWhae1pIaUxEzYKB0keM-C8k0Hl4KFKRIdl-o6OK-vfWbqY6d42zoK_ErxeJphAb
    uOyE2MtjuKe49RyvtiQZ9Kfye_AiLfU3HF3vm2f36RVkddYu2zri78>
X-ME-Received: <xmr:wrWhaZhipMkUPfVW1o2MIBKXelj_YPa0pbK-rRaoXwcqr6f2v7jeigccYDQMG2aO1x-w6LU0DHGPEyHAZf-JySOPR251R5cYHK7kze1RRos2FQoGMjL50A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefuvhgvnhcu
    rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnhepkeetfeefvdffgefhfffgtdevffdtjeehgeefhffhheegvdeihffgudfhgfekheek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
    hnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtg
    hpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphht
    thhopehlihhnuhigsehlvggvmhhhuhhishdrihhnfhhopdhrtghpthhtohepkhhonhhsth
    grnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuhhs
    vghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhsuhhmmhhitheslhhishhtsh
    drlhhinhhugidruggvvh
X-ME-Proxy: <xmx:wrWhaXX6nyMA4zSr4C9vsdUQQ5UEp-QnPmEqpSq5BfJ8ppql2BMwJg>
    <xmx:wrWhaQWRdKZWMv55laFHt_JY0sPfnQovMZzGYAFOuzorI0ti7O4jCg>
    <xmx:wrWhafhbuC_nYO0AGVJPaownqOys3oUQp1oCokckk8iIF9V_z2AsGg>
    <xmx:wrWhaTZvyNosIUKeCg7bYchO1qCF07VkSg5GlyM-qaIq8uxvSKBuGw>
    <xmx:wrWhaV0GTlYgnAnPs1mTk1VFal-Lpeay-Kux46UiLHPrX4vT5fMEqKpE>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 10:18:24 -0500 (EST)
Message-ID: <ebbf3e23-49e0-4b79-8e54-2f53aafbb3ae@svenpeter.dev>
Date: Fri, 27 Feb 2026 16:18:23 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: slowly decommission bugzilla?
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org>
 <20260227101631.67756268@gandalf.local.home>
Content-Language: en-US
From: Sven Peter <sven@svenpeter.dev>
In-Reply-To: <20260227101631.67756268@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[svenpeter.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[svenpeter.dev:s=fm1,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2841-lists=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[svenpeter.dev:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sven@svenpeter.dev,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,get_maintainers.pl:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 264B11B9B9C
X-Rspamd-Action: no action

On 27.02.26 16:16, Steven Rostedt wrote:
> On Thu, 26 Feb 2026 09:04:25 -0800
> Andrew Morton <akpm@linux-foundation.org> wrote:
> 
>> Perhaps point people at scripts/get_maintainer.pl
>>
>> Or heck, add a front-end to get_maintainer right here in this web page.
>> People paste in a pathname and it spits back a bunch of email
>> addresses.
> 
> This actually sounds like a good idea. Someone just told me that they found
> a bug in a driver and I asked them if they notified upstream about it. They
> said no, because they didn't know how.
> 
> I just told them to randomly modify the file, do a git diff and redirect it
> into another file (making a random patch), and run get_maintainers.pl on
> it. That's a big hack and having a better interface to point others too
> would be useful.

perl scripts/get_maintainer.pl -f drivers/some/file.c works as well 
without the random patch detour.


Sven



