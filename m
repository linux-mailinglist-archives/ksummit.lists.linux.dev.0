Return-Path: <ksummit+bounces-2926-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m5rZM+6ZMmqW2gUAu9opvQ
	(envelope-from <ksummit+bounces-2926-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 17 Jun 2026 14:58:22 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F1B699E7E
	for <lists@lfdr.de>; Wed, 17 Jun 2026 14:58:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=UkM2BNS3;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2926-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2926-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90E7F3037E4C
	for <lists@lfdr.de>; Wed, 17 Jun 2026 12:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A244C400DFF;
	Wed, 17 Jun 2026 12:57:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F763FF1AD
	for <ksummit@lists.linux.dev>; Wed, 17 Jun 2026 12:57:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701054; cv=none; b=e2Ti1HD9o0/QFjC9Wa/Gn+XlSNI0dtu4WyOhxsGktEkBmiH3YNjntqDurHEtBH8uTfUSk3sG61GyWwzGF2jqs0XQ+Be0SSTMp7qxIPJJpBJFIGQxbiYzOWYhUtr8c+YIyAu6rk40DRonft7i9tcMsBVKkV1tXFwf+xw3zWbtxvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701054; c=relaxed/simple;
	bh=JHJMh2Z7pDwiqG5HkGeMdjYhluSl0iXNP4q1qu5t+CU=;
	h=Message-ID:Date:MIME-Version:From:Cc:To:Subject:Content-Type; b=JO9yPqZPXPnFzgHUjehWEciTdHNgQ6pebIj/Un6gqnKZioz/Y1vcQ9kJyFYKB5ezDJRmc2HCoYtbVxQRSrvha1720oHSQDa39fPYUFg5qjz2iNGZhVBoz+P/KtI57w2nj6qwitCYTXbHSMhzF8b4IJEdLjmkyzDCsOMDnXhbMuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UkM2BNS3; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D949F4794;
	Wed, 17 Jun 2026 05:57:21 -0700 (PDT)
Received: from [10.57.81.10] (unknown [10.57.81.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CDDF3F905;
	Wed, 17 Jun 2026 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781701046; bh=JHJMh2Z7pDwiqG5HkGeMdjYhluSl0iXNP4q1qu5t+CU=;
	h=Date:From:Cc:To:Subject:From;
	b=UkM2BNS3Z2ZBpcqvvkCW/y+hJm7xfP2RwwiaVc5w6j4Iv51KokKp4jYp/B88FarUt
	 VS0/BFs8T7pTvOHXQkhSOQCmgG4yJKe4+zis+F+E0/Bt7UuPTJjFzgCCdYhR4LEhho
	 sRqCDSmVx+ZVrYZLjE9bh6JA55l5tiR2LZLqnRtM=
Message-ID: <20082b1d-a4c3-4852-b48e-aeaed4f6acf2@arm.com>
Date: Wed, 17 Jun 2026 14:57:20 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
Cc: Yury Khrustalev <yury.khrustalev@arm.com>,
 =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jeff Xu <jeffxu@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>,
 ksummit@lists.linux.dev, Mark Rutland <Mark.Rutland@arm.com>
To: Florian Weimer <fweimer@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [LPC] pkeys ABI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-2926-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:dkim,arm.com:mid,arm.com:from_mime,linux.dev:email,sourceware.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20F1B699E7E

Hi,

I am considering submitting a Refereed presentation proposal for LPC,
but I would first like to check if it makes sense to everyone in To/Cc.

The pkeys ABI is heavily underspecified when it comes to asynchronous
kernel interactions, such as signal delivery [1], rseq [2], io_uring
worker threads, etc. Depending on the situation, we might reset the pkey
register to "allow all", or "allow acess to pkey 0 only", or use the
interrupted context's register (even though it is arguably unrelated).
It isn't always consistent across architectures either. 

As Thomas put it, "that's all broken". LPC feels like the right occasion
to summarise where we are, and explore potential solutions.
Unfortunately this topic isn't an obvious fit for any MC, so a Refereed
presentation seems like the least bad option.

Any thoughts/suggestions?

Thanks,
- Kevin

PS: Cc'ing ksummit@lists.linux.dev as there is no dedicated mailing list
for Refereed presentations.

[1]
https://inbox.sourceware.org/libc-alpha/fc31e639-f1eb-42d6-9dea-3665d9507f12@arm.com/
[2] https://lore.kernel.org/all/87ikexhbah.ffs@tglx/

