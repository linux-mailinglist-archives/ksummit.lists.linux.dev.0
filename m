Return-Path: <ksummit+bounces-2882-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMWaKXwPp2k0cwAAu9opvQ
	(envelope-from <ksummit+bounces-2882-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 17:42:36 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 387A41F3FC8
	for <lists@lfdr.de>; Tue, 03 Mar 2026 17:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE18E30B5B76
	for <lists@lfdr.de>; Tue,  3 Mar 2026 16:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A4C4DC543;
	Tue,  3 Mar 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKyO6RHA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084B37CD59
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555728; cv=none; b=ZEi9ZVikMXHvDppHGA1r8MgHW18UKiBPhnVThh3gAPeQNA5iNZ4JLzD1A0RRppnx57luWlQ8eUOnfnH8kq5HXEeDoMs1IlB/1CHD5yFfAFsx6oN6jDqi7xBoS77gYJtDxGNOhL/BtJIcPz0Ba+93iakmedOLV1ezHf3hGpiUoI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555728; c=relaxed/simple;
	bh=p4xfyccFM3q0ei6+85+Mwud5TInQnxeNRA2N5pSBpXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZH/2XnKPAPf6NHUJh/CrO20frqbMIASRUBiSmDAJyRt0bMvd/z7jXv/PBpR+CKklrdFqLkxd3FceyqwjwAIaA/R1Z4XUBbcEO0yPBxThK4jLUjxMq0yFQXOfsh/ytO6KosoSgO/HOF6oJYWR8/nI2QlyEAHpAu0CmCxSrqY4n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKyO6RHA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2A7C116C6;
	Tue,  3 Mar 2026 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555727;
	bh=p4xfyccFM3q0ei6+85+Mwud5TInQnxeNRA2N5pSBpXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKyO6RHAgjATW8edMk9LkZEsFEB/5PMf7ANC/CwlXYTgyv8JlNQYIETx4PXAjN8yJ
	 Ck3+dqi2aK6FodvmWGF5zmGoraQKbqYruJ+H0AxY9an0mgwxiHyPhXxRO65zPS8sed
	 abA3RnImZLJTxXucM2iQsoX+Zbk0pju9eNprAbkbc5U9OTf9VnksfhFC1JUjhDSoqX
	 5xuJyVcJhyRuQDjnFqNZtBlMAB6l0b5GUtTbr32punG/ZnnK+rooBwQkOtkZZyPTGj
	 xz9opVI+8LEiGGCqMago+/VxgArUSYZPov4+JaMSCylaSrtrO1cxU3u9WuiMOQBnul
	 mRxLoT+Q84B2A==
Date: Tue, 3 Mar 2026 11:35:26 -0500
From: Sasha Levin <sashal@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, torvalds@linuxfoundation.org,
	akpm@linux-foundation.org, geert@linux-m68k.org,
	konstantin@linuxfoundation.org, ksummit@lists.linux.dev,
	laurent.pinchart@ideasonboard.com, linux@leemhuis.info,
	richard@nod.at, users@kernel.org
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
Message-ID: <aacNzgFsnpGvG4I0@laps>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
 <7e3ee6b2-62f9-4876-ae1a-d1473d126309@p183>
 <20260303081748.3d48c3f6@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260303081748.3d48c3f6@gandalf.local.home>
X-Rspamd-Queue-Id: 387A41F3FC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2882-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,linux-foundation.org,linux-m68k.org,lists.linux.dev,ideasonboard.com,leemhuis.info,nod.at,kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 08:17:48AM -0500, Steven Rostedt wrote:
>On Tue, 3 Mar 2026 08:39:36 +0300
>Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
>> On Mon, Mar 02, 2026 at 03:28:28PM -0500, Sasha Levin wrote:
>> >   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>>
>> This is super useful, thanks.
>>
>> Can the 0x prefix be dropped as well?
>
>And print in decimal? Without the 0x, it could be ambiguous that it's hex.
>
>> It is shorter to print in decimal up to 1 million.
>>
>> () are just character noise, I'd drop them
>
>I actually prefer them ;-)
>
>Anyway, this looks more like a feature that is for us kernel developers
>debugging our own kernels than something that should be added to a distro.
>decode_stacktrace.pl can be used for those because distro kernels always
>supply debug data that can be downloaded at any time.

You know, that's what I thought when I was writing that little "bug bot" you
saw yesterday: if I just construct the right prompts for each distro, the LLM
can go ahead and fetch debug symbols and translate those call traces for us.
What I've learned (and I might be mistaken, so corrections welcome!) is:

  - Debian is pretty good at it, but they don't store debug symbols for the
    security archive. As an example, my build machine is currently running
6.17.13+deb14-amd64, and for the life of me I can't dig up the debug symbols
even manually.

  - Fedora only provides the latest kernel. We can fish the older ones from
    Koji, but it's quite hard nailing down the correct ones.

  - Arch simply doesn't provide debug symbols.

  - Tumbleweed provides only 30 days of archives.

  - Gentoo (binary packages) doesn't provide them at all (though is planning to).

  - Ubuntu provides them for the lifetime of the release, but their forums are
    full of reports of missing symbols and server issues.

  - Rocky is similar to ubuntu
    (https://forums.rockylinux.org/t/rocky-9-4-still-missing-kernel-debuginfo-common/15169
for example).

-- 
Thanks,
Sasha

