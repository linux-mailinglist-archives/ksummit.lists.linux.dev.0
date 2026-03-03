Return-Path: <ksummit+bounces-2885-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBWLCRllp2mghAAAu9opvQ
	(envelope-from <ksummit+bounces-2885-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 23:47:53 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EFF1F823C
	for <lists@lfdr.de>; Tue, 03 Mar 2026 23:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FE7D3051C89
	for <lists@lfdr.de>; Tue,  3 Mar 2026 22:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6FB39021D;
	Tue,  3 Mar 2026 22:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPvATTmW"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095E1377EBE
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578065; cv=none; b=pylkUCxiaa7k3lSoOH5UcNfQsqLzYYgeHT+zw2hrWtZNHDOVvIeqYWcccqkmPDVVH9lXrjr5vCieiZ3JRuFNswBN4LvzppYgViLbEigjrRk3QPnZ6FR5OsqEGoSG/rCYQHKl+VVlLOsUw3S4oqaELzUOP7sdsfOSKb19FwiqeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578065; c=relaxed/simple;
	bh=bEIKtas/07X7hI7Kv15QXNP8d0ktnc4szIn7DJXJSww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nd44HyaVd99MdHRDGJn1LK9+Lsv0+TULbwUTQf2m7GsbLX9lyCmhpk7KRyM1Jtc8BNInWBmEASPpOny2lMfyAw9q3n3xLEyVgYXeImqq1Og3URhPMG7Yi64Qq0zt24AjLhjuraTZQ19TESz1Bz3b2klUrE3qrfdFOXH3u9T3zSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPvATTmW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7F4C116C6;
	Tue,  3 Mar 2026 22:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772578064;
	bh=bEIKtas/07X7hI7Kv15QXNP8d0ktnc4szIn7DJXJSww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPvATTmW3j8R8/azPt7rJqXfKpXjNPOg82ih00TqkZtcoytxHGIoEfrmLqOy8iQXJ
	 Tge4zlWS997fhb5SUYocrLGSERn0+xf98iac6WpIY57c1ePL4HYOe65/OoFii1naVV
	 v6BpfMYLcL9G3uJ+/QVgQzQnaSE+JhpHXOHx8CVjVgzL7nG+YQy4/0axKBulV9ciDL
	 JDPOGZtM7azqW9cOZjlBr98ovc/zYMUZZePb5Hyycqkn5UsnJSI1aXsOD+enXsqMzK
	 SSUWARkuOH6enF2cK74MXFqJbp1t7dTmbuRF5MjmXd5SXVcW1BRJlUy4g279e/phKJ
	 1rQYLgj+QQ+og==
Date: Tue, 3 Mar 2026 17:47:43 -0500
From: Sasha Levin <sashal@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: torvalds@linuxfoundation.org, akpm@linux-foundation.org,
	geert@linux-m68k.org, konstantin@linuxfoundation.org,
	ksummit@lists.linux.dev, laurent.pinchart@ideasonboard.com,
	linux@leemhuis.info, richard@nod.at, rostedt@goodmis.org,
	users@kernel.org
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
Message-ID: <aadlD1KrCqquinJT@laps>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
 <1d3c74ca-d2de-4655-b4c1-a1dc120f38aa@gmx.de>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1d3c74ca-d2de-4655-b4c1-a1dc120f38aa@gmx.de>
X-Rspamd-Queue-Id: 76EFF1F823C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de];
	TAGGED_FROM(0.00)[bounces-2885-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,localhost:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:44:27PM +0100, Helge Deller wrote:
>On 3/2/26 21:28, Sasha Levin wrote:
>>Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
>>lookup table in the kernel image so stack traces directly print source
>>file and line number information:
>>
>>   root@localhost:~# echo c > /proc/sysrq-trigger
>>   [   11.201987] sysrq: Trigger a crash
>>   [   11.202831] Kernel panic - not syncing: sysrq triggered crash
>>   [   11.206218] Call Trace:
>>   [   11.206501]  <TASK>
>>   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>
>Thanks Sasha!
>That's exactly what I often needed.
>I've just tested it on the parisc architecture and it works nicely.

That's great! Thanks for testing it!

>So, I'd appreciate if it would be included in the upstream kernel
>(with the memory optimizations others already suggested).

I've sent[1] a more formal patch series that both adds support for modules
which didn't exist in the RFC as well as the suggested memory optimizaions.


[1] https://lore.kernel.org/all/20260303182103.3523438-1-sashal@kernel.org/T/#mc834c81dfc8cfef2eaabc0da231d313049a2dcec

-- 
Thanks,
Sasha

