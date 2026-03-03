Return-Path: <ksummit+bounces-2878-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGInBKPYpmnHWgAAu9opvQ
	(envelope-from <ksummit+bounces-2878-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 13:48:35 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 047281EFB21
	for <lists@lfdr.de>; Tue, 03 Mar 2026 13:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B371C3017AAA
	for <lists@lfdr.de>; Tue,  3 Mar 2026 12:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682B235E943;
	Tue,  3 Mar 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITi4VQEZ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8701624DF
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772542055; cv=none; b=dd2LEonBEf7qpN7WrxsdGNBXoYpRljqe4poSo2H7bVpJX0Lj4CDFUGfuD2AlPdraPlr7WgwSgPg34gVfOK7j/Vxf7AeJDAc+xgsRs490x9tbmWoQ0F0mat5mRJZQRka9Smi3mhwHxfghT3XLVFCsyRx86Msu79SUKTLkzng9+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772542055; c=relaxed/simple;
	bh=MrBbeD1oOMSsm2ilIP0hvPCGu3TfYa13HwpZ91iTEao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSOW/I4fORmyR6hwaTEoCQ3ElsQRpbyIQOjkswMyl3BCeFbiPctG7YJHCnaYGf1hSjgIde7q2HjVSROlYGd89vmN/Dlo4cRC9vktjLBEjvHexGYM2QCmnR/a2rVytk10FPOBY+3zil7FuyNukvtV7VK19lLYa0QuElz3QNjCk+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITi4VQEZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AA6C116C6;
	Tue,  3 Mar 2026 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772542055;
	bh=MrBbeD1oOMSsm2ilIP0hvPCGu3TfYa13HwpZ91iTEao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITi4VQEZlcM0IAZl1fBeFBF06KSimiAf+AtN0p3vtahqYc+iAhdhQ2CdQlzPOUQZs
	 MmNXfdgB8rVAt8el5HBp3b2e5+Vg+DBDjFW8NJhHKbvMffNFLpcJT8j+4dVmrdJl1v
	 oY5G3EVTUSy8eJYSzemrSKZa5MkuSbQepvKkX4jHJ/1Hee+IY/g6h97jhFIsl8XO48
	 3sa6XsvCjAlBVXm8kNyDma60UgRa4uIrBPC+ofmCKzYoZCZNWz4oXXCaAs3z4H3yq8
	 ByaU9dTH/JStQXXXG4cj56EfMzk3WVKg4ufdIU7V1gs8Nhabo4iLjnkLVxMn+PcZ9H
	 oLGgT3O1p8aMQ==
Date: Tue, 3 Mar 2026 07:47:33 -0500
From: Sasha Levin <sashal@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	ksummit <ksummit@lists.linux.dev>,
	laurent pinchart <laurent.pinchart@ideasonboard.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Steven Rostedt <rostedt@goodmis.org>, users <users@kernel.org>
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
Message-ID: <aabYZSvpilnJxETk@laps>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
 <91334269.1714.1772519173246.JavaMail.zimbra@nod.at>
 <CAMuHMdXevwo-dgURJimDJrrfgt108v9TR=P1fq6N5P36egz4tA@mail.gmail.com>
 <10bef54e-eb0c-4ed3-84ca-4e393449e974@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <10bef54e-eb0c-4ed3-84ca-4e393449e974@kernel.org>
X-Rspamd-Queue-Id: 047281EFB21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-2878-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nod.at:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:31:46AM +0100, Jiri Slaby wrote:
>On 03. 03. 26, 9:11, Geert Uytterhoeven wrote:
>>On Tue, 3 Mar 2026 at 07:26, Richard Weinberger <richard@nod.at> wrote:
>>>>Von: "Sasha Levin" <sashal@kernel.org>
>>>>Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
>>>>lookup table in the kernel image so stack traces directly print source
>>>>file and line number information:
>>
>>>>Memory footprint measured with a simple KVM guest x86_64 config:
>>>>
>>>>  Table: 4,597,583 entries from 4,841 source files
>>>>    lineinfo_addrs[]     4,597,583 x u32  = 17.5 MiB
>>>>    lineinfo_file_ids[]  4,597,583 x u16  =  8.8 MiB
>>>>    lineinfo_lines[]     4,597,583 x u32  = 17.5 MiB
>>>>    file_offsets + filenames              ~  0.1 MiB
>>>>    Total .rodata increase:              ~ 44.0 MiB
>>>>
>>>>  vmlinux (stripped):  529 MiB -> 573 MiB  (+44 MiB / +8.3%)
>>>
>>>Hm, that's a significant increase.
>>
>>Other random idea: this data is only needed in case of a crash.
>>Perhaps it can be stored compressed, and only be decompressed
>>when needed, or even during look-up?
>
>But obviously not when dumping OOM stack traces :P.

Right - I really wanted to avoid memory allocations or disk I/O here.

I'm sure we can come up with more efficient ways to store this information - I
wanted to keep the initial version simple and easy for review.

-- 
Thanks,
Sasha

