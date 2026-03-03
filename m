Return-Path: <ksummit+bounces-2876-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA5kAxfZpmnHWgAAu9opvQ
	(envelope-from <ksummit+bounces-2876-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 13:50:31 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7681EFB7E
	for <lists@lfdr.de>; Tue, 03 Mar 2026 13:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F08B7314128E
	for <lists@lfdr.de>; Tue,  3 Mar 2026 12:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDD634D911;
	Tue,  3 Mar 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+5K+esn"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02C3342CA2
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772541860; cv=none; b=Ta1Yz0A5Th9svLyisVpPAWXP3eN0xF564dcnVvm66q8TG2wfXXs9ktYTwQVvO7FSRYTOfdwyRbjk6vXRHsIPDU0y5U808NuFWytpiVCgmwijXEPQF57dLeO8pYuehMJvILLa3Thu1CtBjTqEVm+d1JzSgRK5RnJhzQV0YM2dXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772541860; c=relaxed/simple;
	bh=EeuuuXqPgNQ80Y6k3sed8vjchEc89e7iCxBcTFKljFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpsCOYoLydv+i9ctQeIIqmFlQ6XS7QikqIHfT4eiJ/TaLSTUI2Yd7y/YSfN4NTAYvBuv3tU8/aESJz81AEnQ87FiEBdSpSDwwTCjRnBzk5HefjyBizDbxwApYTbPULbHnZoCpfuWbCogW8GTF7bKoiOiSu+rNmYICscM7M6fISc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+5K+esn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C5AC116C6;
	Tue,  3 Mar 2026 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772541860;
	bh=EeuuuXqPgNQ80Y6k3sed8vjchEc89e7iCxBcTFKljFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+5K+esnVYQyGKrYZ9iRexr4W7+Mx42ZWx8YUIY+s0nIoSYV8KE0bvDWrwJ0HOYPt
	 zw/0UtTBFJJMsbWCPELsW1F1rU0GSel9MQzIqXvYhIHyzxJrI96oVnemyDTtaOC+J1
	 Se0jbyEi7c9UJqzVWBZWlh+3Oz8srdXptnghBg7pQ7Vp3j+le20dbdxzaSPZRm1mh4
	 ljKstehi2KEh8YW0NIwMpZkN9KXGIAv6O6x/1mPUoe93x6vLzHtt39csCj7bjeYH1C
	 PSOplxJ5/fEdM+z/vFZuffvKYltNz9UXcwLU8JpvdE9g6mfgfJXdVAdNRDYk6wmbEm
	 zA9drr6TiUdfQ==
Date: Tue, 3 Mar 2026 07:44:19 -0500
From: Sasha Levin <sashal@kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: torvalds@linuxfoundation.org, akpm@linux-foundation.org,
	geert@linux-m68k.org, konstantin@linuxfoundation.org,
	ksummit@lists.linux.dev, laurent.pinchart@ideasonboard.com,
	linux@leemhuis.info, richard@nod.at, rostedt@goodmis.org,
	users@kernel.org
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
Message-ID: <aabXo2XYUmtlRT6f@laps>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
 <7e3ee6b2-62f9-4876-ae1a-d1473d126309@p183>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7e3ee6b2-62f9-4876-ae1a-d1473d126309@p183>
X-Rspamd-Queue-Id: 8C7681EFB7E
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
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-2876-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 08:39:36AM +0300, Alexey Dobriyan wrote:
>On Mon, Mar 02, 2026 at 03:28:28PM -0500, Sasha Levin wrote:
>>   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>
>This is super useful, thanks.
>
>Can the 0x prefix be dropped as well?
>It is shorter to print in decimal up to 1 million.
>
>() are just character noise, I'd drop them

Possibly, but I don't think it's related to this work :)

-- 
Thanks,
Sasha

