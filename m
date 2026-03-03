Return-Path: <ksummit+bounces-2874-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K+vL7qkpmlpSQAAu9opvQ
	(envelope-from <ksummit+bounces-2874-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 10:07:06 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8541EBA0B
	for <lists@lfdr.de>; Tue, 03 Mar 2026 10:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1526030584C1
	for <lists@lfdr.de>; Tue,  3 Mar 2026 09:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FF238C2B1;
	Tue,  3 Mar 2026 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlA3KLhz"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00FC375AC3
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528696; cv=none; b=uD8Aiv0FlVO4axkOjZ0w27gTIQjpDa+OP5rDbPk7cBuvOifyWetOKfH9QxAwnaj/+/uGqJ6402pDH6KDcv1cShUpOdoLiFgPsY06mJwoXjqwjfPmyUpM4VidGUys7Z8P7bNXZbotWMWp1/nE+uXe17F+qqi4ZmSRfvLMvX+r8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528696; c=relaxed/simple;
	bh=v4W07b6IBE11k67IglXjM+gXfTvQJy/SRQ49IMklHJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCuVwOFIzk3lyOkRH3PTJ9lDuPikKpWzZCKk0uWkReZTqT7Y9xuMrvIuJF5zBW58ySEtQSJ5g+e1oKzHMFFMlUDcRS6A6Qc2tfWq7g5FJo7AuaMR6bXCIJNomWpBRQ46+Gf2X14GEZ9uE4pQ6eQFbIAa2XLDBK6UB8pquXxCINg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlA3KLhz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E9EC2BC87;
	Tue,  3 Mar 2026 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772528696;
	bh=v4W07b6IBE11k67IglXjM+gXfTvQJy/SRQ49IMklHJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DlA3KLhzMnXcvgir/3qFCtKeIstacO9g25eq0MMpnCpjzseYiIdnCDEDoWq6eBChp
	 cAn42ionD+v1beSsyyD61QZkAkXal3OuojL/4Y7ZuCZIfyjZrNmlnlvy0D8Z4zzxRW
	 oGXITl6k7yV7RFycNb49jo2RIIL6tJiXCivp3fA7fyPC5qhwbZesrQtCyzXrMGWys3
	 HVx919k23NLUcITmDq/V0TOfUWF06nLGSiBlEwx1T1DQYoeNH8kdAFdeBh210HA3iJ
	 FMTVF9G5VVlU7dbXmTVvU6tj+CyfhJDsSrHMp4lpKiPHEQJA+qIaMiOn1KcgzbOW3o
	 ht68qwXEbTKhg==
Message-ID: <e63b348f-3527-41ac-8b1f-3c04aba87d73@kernel.org>
Date: Tue, 3 Mar 2026 10:04:51 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
Content-Language: en-US
To: Tomasz Figa <tomasz.figa@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Sasha Levin <sashal@kernel.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 ksummit <ksummit@lists.linux.dev>,
 laurent pinchart <laurent.pinchart@ideasonboard.com>,
 Thorsten Leemhuis <linux@leemhuis.info>, Steven Rostedt
 <rostedt@goodmis.org>, users <users@kernel.org>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
 <91334269.1714.1772519173246.JavaMail.zimbra@nod.at>
 <CA+Ln22Giw4_RL-BCGot9hsgQU5LA3HeFM3bppyz0XW6py=UwoQ@mail.gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <CA+Ln22Giw4_RL-BCGot9hsgQU5LA3HeFM3bppyz0XW6py=UwoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7A8541EBA0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2874-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nod.at];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/3/26 07:48, Tomasz Figa wrote:
>> > Memory footprint measured with a simple KVM guest x86_64 config:
>> >
>> >  Table: 4,597,583 entries from 4,841 source files
>> >    lineinfo_addrs[]     4,597,583 x u32  = 17.5 MiB
>> >    lineinfo_file_ids[]  4,597,583 x u16  =  8.8 MiB
>> >    lineinfo_lines[]     4,597,583 x u32  = 17.5 MiB
>> >    file_offsets + filenames              ~  0.1 MiB
>> >    Total .rodata increase:              ~ 44.0 MiB
>> >
>> >  vmlinux (stripped):  529 MiB -> 573 MiB  (+44 MiB / +8.3%)
>>
>> Hm, that's a significant increase.
> 
> Random idea: Could this additional information (and I guess the code
> that uses it too) be moved out to a loadable module?
> 
> The obvious limitation would be that the user would need to have the
> module loaded for the decoding to work, but that could be worked
> around by marking it for autoload when a crash is noticed the first
> time and then getting a better report the second time.

IMHO that's too big of a disadvantage. Many crashes are rare and either you
have this always enabled, or you missed your only chance.

> Best,
> Tomasz
> 


