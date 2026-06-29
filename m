Return-Path: <ksummit+bounces-2940-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cR8fK7GbQmpq+gkAu9opvQ
	(envelope-from <ksummit+bounces-2940-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 29 Jun 2026 18:22:09 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CCA6DD485
	for <lists@lfdr.de>; Mon, 29 Jun 2026 18:22:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="N/C+8gb6";
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2940-lists=lfdr.de@lists.linux.dev" designates 172.105.105.114 as permitted sender) smtp.mailfrom="ksummit+bounces-2940-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E24E130683FC
	for <lists@lfdr.de>; Mon, 29 Jun 2026 16:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCED43E9CD;
	Mon, 29 Jun 2026 16:00:44 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905043DA31
	for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 16:00:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748843; cv=none; b=M3DmuAWcvRM0PLqCGcHUqJ8lVBnd0GS3cVJeZ3Tvtx2w3+Sern0TaoqgEC4z1st5HtRarVZebPdiagIDtou/Oi3WH4ajKb/U5Z5UihJDvVgFO/of4k6/fXVgW4pPhXCL6WHkHk+iFEbzEftDdQHRn+NFnfnStMVsh276sGvrWtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748843; c=relaxed/simple;
	bh=jr33+xN9GZ/Y45yw8kVAwl06p4Tnpw3Tr/5t8N2AAYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSIqgR024yfeSVBeAS1hMc+uTAvh1n6eq6hOomhHynjCs+/yKVfNx67zvv2s8Rk66mqfZOkU6v3tuQbshtwfEi7as4mUHhqKBIZESI5Gx3sGJyRpdKJZHnsap2ZpXlj1MytGE4y76Cswub+inq53+Q68nIC/vqRNq3nB+tbAMms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/C+8gb6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AA41F000E9;
	Mon, 29 Jun 2026 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782748842;
	bh=4mQKOszc6amaCCSYdlKj9jSCb28EHcKyJZoGxBdCiAg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N/C+8gb6GLv0ZKTGKqph0t/a4W7TdfN79P5ZflsNA7UOsIxnBF0Jjfwzo2MhE320a
	 mlkxwhCXobrIot23CD4B5qYVDtkuFID6pNskQoW5BYgutGweTIejrOJ5BtzgVL6QhO
	 AV4kh322XAw1AGcYU4YNhg05wK0cBi2eK3HpMDyzGdyteeGuRe27F3BBEMt8gD5PrJ
	 e+nruu56pzA/DBBWriv6etj9l0QamvK2Hu8XWwUFLfMbby4nK9/63N3sIORT10QUyd
	 d6FDa7vHlZALHumfe9BdG30yrSOm09dm8PPBHhnk5H7+LLtOBN8hHtY2+cbmyV24cB
	 EiwoZSUK8xJDQ==
Message-ID: <e74cc115-23e2-45b7-b273-4c3c030738b5@kernel.org>
Date: Mon, 29 Jun 2026 18:00:40 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Implementing malloc
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>, Dan Carpenter <error27@gmail.com>
Cc: ksummit@lists.linux.dev
References: <akKBVsFBro_4QM74@casper.infradead.org>
 <akKKP4SlVs846Qp0@stanley.mountain> <akKPtGfBKDtuTai2@casper.infradead.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <akKPtGfBKDtuTai2@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2940-lists=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23CCA6DD485

On 6/29/26 17:31, Matthew Wilcox wrote:
> On Mon, Jun 29, 2026 at 06:07:43PM +0300, Dan Carpenter wrote:
>> I wish that we would just acknowledge say that small allocations cannot
>> fail.  We could add a BUILD_BUG_ON() in km/zalloc_obj() which ensures that
>> it is only used for small allocations.  Then we could remove all the
>> error handling from those.
> 
> That's part of the fallibility discussion I alluded to.  The problem
> is that kzalloc_obj(x, GFP_NOWAIT) can fail, even for small objects.
> And that is what the caller asked for!  So we have a tension there.

Indeed. Also userspace malloc() isn't "cannot fail" either?

>> With regards to use after frees, my impression is that the places which
>> use caches are the worst affected and also where we do the worst at
>> detecting them?  Does KASAN detect use after frees with kmem_cache and
>> mempools?
> 
> I believe it does, but I'm not an expert.  My question in this instance
> is really, "Are KASAN et al now good enough and widely deployed enough
> that we don't need eg red zones or unmapped pages to catch these things".

My understanding (also not KASAN expert, but through the slab interactions
learned some stuff) is that HW TAGS based KASAN is enough for Android
production, but the overhead is not negligible and the HW support isn't
ubiquitous.

"Classic" KASAN is powerful but overhead is large and needs a recompile. Not
something suitable for production.

Stuff like poisoning and slab_debug or debug_pagealloc (unmapping) is weaker
(less likely to catch a culprit), also have overhead, but their advantage is
they can be always compiled-in in a generic distro kernel and you can tell a
user to enable it on boot as part of chasing a bug seen in production,
without using a special debug kernel.

So I'd say everything above has its use case and its not time to drop
something in favor of something else.

