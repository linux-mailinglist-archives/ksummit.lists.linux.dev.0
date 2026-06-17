Return-Path: <ksummit+bounces-2929-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zJ17IBemMmq33AUAu9opvQ
	(envelope-from <ksummit+bounces-2929-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 17 Jun 2026 15:50:15 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39069A427
	for <lists@lfdr.de>; Wed, 17 Jun 2026 15:50:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=WPrmogBr;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2929-lists=lfdr.de@lists.linux.dev" designates 172.105.105.114 as permitted sender) smtp.mailfrom="ksummit+bounces-2929-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23ACB3172F7F
	for <lists@lfdr.de>; Wed, 17 Jun 2026 13:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E5125F984;
	Wed, 17 Jun 2026 13:45:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A151DFFB
	for <ksummit@lists.linux.dev>; Wed, 17 Jun 2026 13:45:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703947; cv=none; b=MKHtx6KRQ6kh7ScR+aUSyOQn7ERHuazruK2kiKIMn8ZdNhW9ecTU3QwWQKgoP19XwrvlUO8e2QDWClux0FIlkW85LrxYAyfVn4jWC2xaxb2LDqCeWa/ojGS17/7icGa5uzQVX/q3x64sG+xssw8Riwr58vTsLO2kewUqKZCEw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703947; c=relaxed/simple;
	bh=YyvVyyL/3KVXVNuTBr2/UARFUPPHDUV/pMsS1GrSuYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hey8nEH34tKKoJKmPEzSReFy/u979RW3jm1fXB+ZbwIbhFkqrCGSldq4QxtPU7q5jcoJMqaGLRfcj6/zvziKKicR8ajirvKfa5/469JS3ijp9q3tSc7e4gaZQFrSUha+w7nFX4MkmFxQysTAKNHINfe5+FtFrTapAl/X2xV4Uug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WPrmogBr; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3C0D2E99;
	Wed, 17 Jun 2026 06:45:38 -0700 (PDT)
Received: from [10.57.81.10] (unknown [10.57.81.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA9083F915;
	Wed, 17 Jun 2026 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781703943; bh=YyvVyyL/3KVXVNuTBr2/UARFUPPHDUV/pMsS1GrSuYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WPrmogBrEZB2b/68CQmLhjCZ+W1tNiR3V1IAvLolhF3IHhLtYfI2FLrbn7dvu7QjX
	 vZca5R8yFULORhe3w169uHNyC+VOJwxnO+NRZTysB6AVqYTCZqz6KpMo4YIUaJJWSX
	 oEwENmE+XA3fCVs7qca9Pe3NkVgdVbm77O7feWjA=
Message-ID: <5ef8a9d5-1d49-4cf9-ac53-71381128b02e@arm.com>
Date: Wed, 17 Jun 2026 15:45:37 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [LPC] pkeys ABI
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Florian Weimer <fweimer@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Yury Khrustalev <yury.khrustalev@arm.com>,
 =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jeff Xu <jeffxu@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>,
 ksummit@lists.linux.dev, Mark Rutland <Mark.Rutland@arm.com>
References: <20082b1d-a4c3-4852-b48e-aeaed4f6acf2@arm.com>
 <95266f105965da3164e7f6ee994e7c11449e64ce.camel@HansenPartnership.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <95266f105965da3164e7f6ee994e7c11449e64ce.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-2929-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,arm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB39069A427

On 17/06/2026 15:06, James Bottomley wrote:
> On Wed, 2026-06-17 at 14:57 +0200, Kevin Brodsky wrote:
>> Hi,
>>
>> I am considering submitting a Refereed presentation proposal for LPC,
>> but I would first like to check if it makes sense to everyone in
>> To/Cc.
>>
>> The pkeys ABI is heavily underspecified when it comes to asynchronous
>> kernel interactions, such as signal delivery [1], rseq [2], io_uring
>> worker threads, etc. Depending on the situation, we might reset the
>> pkey register to "allow all", or "allow acess to pkey 0 only", or use
>> the interrupted context's register (even though it is arguably
>> unrelated). It isn't always consistent across architectures either. 
>>
>> As Thomas put it, "that's all broken". LPC feels like the right
>> occasion to summarise where we are, and explore potential solutions.
>> Unfortunately this topic isn't an obvious fit for any MC, so a
>> Refereed presentation seems like the least bad option.
> That's not necessarily true, especially if you want a group discussion.
> If all of your attendees are going to plumbers anyway you might
> consider a BoF ... or possibly a workshop like the Nova GPU people did
> last year if you need more than an hour.  The downside of BoF or
> Workshop is that you have to run your own A/V connections (we'll have
> at least USB speaker/Mic's to provide you at reception and might have
> one of the owl camera things)

Right, a BoF session would indeed be a good fit (1h should be more than
enough). According to [3] the Refereed track also accepts BoFs so I
suppose that it's the right place to make the submission regardless?

- Kevin

[3] https://lpc.events/event/20/abstracts/

