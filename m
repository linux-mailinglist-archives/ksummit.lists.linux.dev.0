Return-Path: <ksummit+bounces-2928-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WdSNGsmbMmok2wUAu9opvQ
	(envelope-from <ksummit+bounces-2928-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 17 Jun 2026 15:06:17 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DE6699F6E
	for <lists@lfdr.de>; Wed, 17 Jun 2026 15:06:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=dNEhprrU;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2928-lists=lfdr.de@lists.linux.dev" designates 172.232.135.74 as permitted sender) smtp.mailfrom="ksummit+bounces-2928-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 525ED302A0B4
	for <lists@lfdr.de>; Wed, 17 Jun 2026 13:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1084C3BCD31;
	Wed, 17 Jun 2026 13:06:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA03EFFA8
	for <ksummit@lists.linux.dev>; Wed, 17 Jun 2026 13:06:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701572; cv=none; b=qZs9I3By519fBp/56l6UUm0NquDBEEfa3uR7mjxb6EBFkv9bHIR5AqUFBg/gKcBK51AEj7Q4ERCMzNokwCtrqhJLH5BXoDfCCOXmEIDIfwVFtFy6/qoP2WSeSV2jBqgps7pmmjSZk+56mfxaDsFnx6Obs8N/4loabthJkl8AoZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701572; c=relaxed/simple;
	bh=3UUkKgPHzTUWcFm7bh3I2tiR54HD1N0D6Lle50uaT7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/NALJo/G/G+tqm1vKVLqKFE6YyzNBZTgjHnwgdgAuCgz82ygYDiBtlY4nY4p+nC4cWaOjOAxB/Su//jKz5ed4GVYqjdvwTA8A1KEwM0x0uRMZozc1TB0UTe6Y0IZVY2e7+N4A8W/izC1Q/IxOgGgKym/kRQwlf0hJNxNFzhjfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dNEhprrU; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b8adf813so6664075e9.1
        for <ksummit@lists.linux.dev>; Wed, 17 Jun 2026 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781701569; x=1782306369; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otgybBbyAQMare58UyQbJea6PrvdbtIxAEZfZROphBA=;
        b=dNEhprrUoUew9iWfXgd7rSf6OW7UKbYSCd/E5T/DEnI/FI63w687fZvUPTMFL+lyYG
         T26H3TXZ4ka3mNqjx6Hoezg4ROmiUagkeHbMjPm6JYlBHDPm+ukrmSDsjIq92DA7FsAY
         1L2v+JYstQ/Ubc5ezJHN90WOFyxgjUmbx/CmksdtE4lxmms67U9zMkMcMp3nHh0cXqF4
         4w3HuCP4AnkVAImcYnETHdZ+Co7DDBM7U++nW9xUsZkqPIQMGWsPfGYj4lZJGjuGiXgC
         g9MBXQA1i5U/kmDyvf7kt/w5LvU6ZpQFe/ZX8tsgEm69z3Vc8mPcb97ETAOWI6nHHWr6
         ACJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701569; x=1782306369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otgybBbyAQMare58UyQbJea6PrvdbtIxAEZfZROphBA=;
        b=Dh3alQh/7FlkeS/oTFVRUnH/Q0ExKi6rhMSxm733I4rKIZ4oTIIg7JIgElxBC6BzUq
         BM9mGVDka/ctuUJmgGXnC5F86wvS+DJry5PzwkFGRPjjq44L3Rm0SxvdQYcDHtGUpHpx
         cygwKfm1yxzghbD+PiBTVb8oTrd92PIONP2U0tuVGE3BL+jf7Eh1+/xdpRSF/Or+sb6R
         lgMJN89oISs20/fvvtxX/gw//UOG/8rOdd0JhoL+tJBHidVVG8ia2ZxPWlNcBwUc6wM4
         538aO64cpIlN4RG7VUvQHd7e1nBm+VDtytsSoihYOLEmmq5GB2SpmmXEVwlvYjJ1u5yr
         zMOw==
X-Forwarded-Encrypted: i=1; AFNElJ+TaxFYk1Z3oPWPE0vdOMoo2G9sAokFEZAlZaNnjmmu/BE44ZHbQMIZeNWe52Am+YnsrEc+KBQc@lists.linux.dev
X-Gm-Message-State: AOJu0YwM813ZScXBThFXVXckTq39S3B6zDQ704BVFRjip9rqGlMQP1Ub
	epZObXniAFrmjga6axj1XduLju+J8h5MZKxGgjU20zQIOOBN/KmPw89rmjGI12b7s6ie2vFff6H
	wHt0/
X-Gm-Gg: Acq92OFQW/gOjpuQd6Z46NtDSH+HsAjMZW1vqgDIwUXdA16vM7j4XVp4lx/sx7RVmvf
	yqyNWxl6Wif2KqPtTXXJaDErBRNkGmpv5mJ6be1YxqlX6+ormVcbgfoZG8ZrXeZnMyV7dNWI3IF
	qk/W84jmxbpHavqxgabKuUmJ01bYu2UT+ZDOLDTmUSTqpicqDlDLsibmMc/hW/wyJ5c6lrck29s
	FAINVJXCbaa1oMiFCQ4wDQPZGgP2N3W1ut3fXBrh3SKXj/Hup/LdcF4VL4pVJs1ScOCEv52rmur
	+GKc5IBeV7foE7TvrXKSwyvJNJXBlEemC6BwatRfMiu8dJqaSZqQnsTW1ixfDipG2ucqJLFYSUw
	nVxxSXK/cBTH3QBzSJlzGXzKcFaBYDJeic5W+xGJyqkG1OzNY+pf7BxaNUVuOfAvaCIWat1PXhc
	aU/32ysbsgwd7VDVHzqg==
X-Received: by 2002:a05:600c:1392:b0:492:1eaa:a8ba with SMTP id 5b1f17b1804b1-492333e6c17mr27664665e9.6.1781701567633;
        Wed, 17 Jun 2026 06:06:07 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903::e14? ([2001:1a48:8:903::e14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa5120esm173539925e9.8.2026.06.17.06.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:06:06 -0700 (PDT)
Message-ID: <34eb61f0-f7ea-40b7-815b-def48f0e1bfa@suse.com>
Date: Wed, 17 Jun 2026 15:06:05 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [LPC] pkeys ABI
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, Florian Weimer
 <fweimer@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Yury Khrustalev <yury.khrustalev@arm.com>,
 =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jeff Xu <jeffxu@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>,
 ksummit@lists.linux.dev, Mark Rutland <Mark.Rutland@arm.com>
References: <20082b1d-a4c3-4852-b48e-aeaed4f6acf2@arm.com>
From: Vlastimil Babka <vbabka@suse.com>
Autocrypt: addr=vbabka@suse.com; keydata=
 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
 pYekxJujNeEDkUlky0Y=
In-Reply-To: <20082b1d-a4c3-4852-b48e-aeaed4f6acf2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-2928-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@suse.com,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,lists.linux.dev:from_smtp,sourceware.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,suse.com:dkim,suse.com:mid,suse.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2DE6699F6E

On 6/17/26 14:57, Kevin Brodsky wrote:
> Hi,
> 
> I am considering submitting a Refereed presentation proposal for LPC,
> but I would first like to check if it makes sense to everyone in To/Cc.
> 
> The pkeys ABI is heavily underspecified when it comes to asynchronous
> kernel interactions, such as signal delivery [1], rseq [2], io_uring
> worker threads, etc. Depending on the situation, we might reset the pkey
> register to "allow all", or "allow acess to pkey 0 only", or use the
> interrupted context's register (even though it is arguably unrelated).
> It isn't always consistent across architectures either. 
> 
> As Thomas put it, "that's all broken". LPC feels like the right occasion
> to summarise where we are, and explore potential solutions.
> Unfortunately this topic isn't an obvious fit for any MC, so a Refereed
> presentation seems like the least bad option.

What about the Kernel Summit "[TECH TOPIC]" track? see
https://lpc.events/event/20/abstracts/

Seems like this would fit perfectly.

> Any thoughts/suggestions?
> 
> Thanks,
> - Kevin
> 
> PS: Cc'ing ksummit@lists.linux.dev as there is no dedicated mailing list
> for Refereed presentations.
> 
> [1]
> https://inbox.sourceware.org/libc-alpha/fc31e639-f1eb-42d6-9dea-3665d9507f12@arm.com/
> [2] https://lore.kernel.org/all/87ikexhbah.ffs@tglx/
> 


