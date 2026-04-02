Return-Path: <ksummit+bounces-2902-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHGzCeVyzmnxngYAu9opvQ
	(envelope-from <ksummit+bounces-2902-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 02 Apr 2026 15:45:09 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4FA389F28
	for <lists@lfdr.de>; Thu, 02 Apr 2026 15:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADC753044238
	for <lists@lfdr.de>; Thu,  2 Apr 2026 13:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A2831B823;
	Thu,  2 Apr 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="BxZ9E6fl"
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6C729B228
	for <ksummit@lists.linux.dev>; Thu,  2 Apr 2026 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137398; cv=none; b=bZvlOcTeuYhMdzuxryNlYmqHiPt4g/4AP9RHYBf+Gc1vumkxRhnpclLHc9zbNhHvaw+rlu9JPYcsShs7/wQ5P8I4ICv3LGomu79iDZKaToIrWbpqvh6HqMPDF2/0Hm9m5ukRD3ox/bc5VrP+e74aJM9cwc17r163NYEah9z5ebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137398; c=relaxed/simple;
	bh=x9HbQwT5s2Q2aNpBbVxabLEM3ShixRf+JJwAARDb5jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaT8kHQbqtIhbxZU6R1P7kfUlpeeydKULHmLpov2TXBRfcBV2dY2N/jOvNwj1/u5pZvphPSVzsXNwvGpiqHTGxAsPAJFX6movEh7oHvzfYFjD8XEqaBiBUAamw/7PvKMxy1k0YQn7m0dpJp0LkuCSfd78vBKbabTNYu9++Kn1QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=BxZ9E6fl; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fmjjW6mlpz8Cqj;
	Thu,  2 Apr 2026 15:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1775137392;
	bh=x9HbQwT5s2Q2aNpBbVxabLEM3ShixRf+JJwAARDb5jw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BxZ9E6flMwb3kA8+IQG7GxaHqLZrgO6ZniiY50z5L/kR7e1ipG7mX1Ri+7jHterH5
	 RFloMHymmqquCcvQeY6qlJFTO5bAM4tdq602mnw/BuRcQ3P3ff2KSC0H/1NGSxaalO
	 GN5rC3+0s5l69Sa1tSrSEB6nL8ppu4mXN9YggPFcRV5v4cXNud2M/Rp7VrVbSwj4ul
	 l961QKiVknOpis4QqxktY8vc4QwHR7Ty6lmAaOra9PEOXgKGXnTe2IPRAdkR0+6kSz
	 g8bbNkzKaUSsrA65MOHoF1+jfbNFoqpLjOrRpwhq/s62iclsqokV4XcqEwqw/6hP2c
	 EkbqpyoDwL+9Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fmjhN0yKyz880R;
	Thu,  2 Apr 2026 15:42:12 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fmjhM4DP6z8svF;
	Thu,  2 Apr 2026 15:42:11 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C469C633E1;
	Thu,  2 Apr 2026 15:42:10 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ef874caf-5345-4c0d-8855-1338b5177d8b@leemhuis.info>
Date: Thu, 2 Apr 2026 15:42:04 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: slowly decommission bugzilla?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, ksummit@lists.linux.dev
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260402-expert-maroon-partridge-f77f94@lemur>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20260402-expert-maroon-partridge-f77f94@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177513733107.2991759.5298379634954390989@mxe9fb.netcup.net>
X-NC-CID: qdfuFQ4rAYC0+wducx7l35Z0YsOo4XEilgedlBVBAWlt71+tuF0=
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-2902-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[leemhuis.info];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,leemhuis.info:dkim,leemhuis.info:mid,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@leemhuis.info,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD4FA389F28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 06:59, Konstantin Ryabitsev wrote:
> On Thu, Feb 26, 2026 at 09:44:32AM +0100, Thorsten Leemhuis wrote:
>> Lo! I wonder if we should slowly and publicly start decommission
>> bugzilla in areas where it's not working well today. I have a few
>> reasons for that:
>>
>>> It may be time to kill bugzilla:
>>>
>>>     - despite periodic "we're not dead yet" emails, it doesn't appear very
>>>       active
>>>     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
>>>       5.2 development branch and continuing with 5.1
>>
>> * It looks like we will decommission Bugzilla anyway, and a replacement
>> is afaics likely quite a while (years?) away

Seems we'll get there faster. Thx Konstantin!

>> -- so what is there now will likely be kept running for a while.
> Thank you for starting the thread -- it's been burning a hole through my inbox
> and I honestly wasn't trying to ignore it. :)

No worries, I from social.kernel.org posts in March had noticed that you
were working on something, so I let things rest.

But this git-bug thing will take a while to get established. That makes
me wonder if we independent of that should do what was partly discussed
in this thread:

Change the front page text of bugzilla now to at least make people
better aware that it might be a bad place to file bug (which even some
kernel developers are not aware of).

> - anyone can go to a site like bugs.kernel.org, which will be a simple bug
>   entry form of the style:
> 
>   1. tell us what happened
>   2. attach any files you want to attach
>   3. tell us how we can contact you (with round-trip verification)
> 
> - the report then goes into a review queue that can be pre-processed by an LLM
>   to help immediately weed out non-actionable items: spam, reports for tainted
>   kernels, reports for distro kernels, etc. The agent can reply with
>   cookie-cutter answers to those with a suggested course of action:
>>   1. Please report this to your distro here: {url}
>   2. Sorry, we can't help you because you're running a binary-only driver
>   3. This report is for kernel 2.6, what is even happening?

If you ask me, that's the wrong way around. We IMHO want an LLM that
helps users to submit good reports directly. That is in the interest of
users, as then they won't waste time on submitting something that an LLM
later will reject quickly, which they'll rightfully find annoying. And I
guess it will be less work and thus cheaper for LLM, too.

The LLM, for example, could, at the start of the process, query (or ask)
"uname -r" and ask "Is it a bug with a graphics driver for AMD or Intel"
-- and depending on the outcome tell users, "You are at the wrong place,
you have a heavily patched and outdated kernel, your want to file that
at your distro" or "You are in the wrong place, you have to file that at
gitlab.freedesktop.org/drm/".

In fact I started looking into something like that two days ago (by
taking a closer look at Chris's review prompts and how sashiko uses them
-- and how something like that can be used for a LLM assisted bug
reporting process. But I need a few days to see if I get this to work well.

> - the agent can also try to figure out which subsystem this report is for
>   based on the details of the report; this is where various tools to extract
>   info from dumps would come in handy

Just wondering: what Richard posted in this thread (would you be willing
to host that?), or do you have something else in mind?

> -- though I expect final human-based
>   review will be required for this to be not waste people's time
Yeah, but that is always the case at some point -- whatever we do will
likely improve things for developers and users.

> [...]
> - the maintainers can their either handle this directly via email without
>   turning the report into a bug entry, or they can use the above described
>   tooling to manage the bug report's lifecycle via git-bug/b4 bugs

There will be a email on lore in the latter case, too? Sounds like it,
but I just want to be sure. Because it's already painful to search for
existing bugs, as one has to search lore, bugzilla, and in some cases
places like gitlab.freedesktop.org/drm/,
https://github.com/thesofproject/linux/issues,
https://github.com/AsahiLinux/linux/issues,
https://github.com/Rust-for-Linux/linux/issues,
https://github.com/multipath-tcp/mptcp_net-next/issues,
https://github.com/facebook/zstd/issues, etc. Would be good to lower
that number; in a ideal world we'd likely have a "bugs" mailing list
where all of those external issue tracker automatically forward all
newly submitted issues and later replies to.

> This is my "bird's eye view" proposal, and I'm happy to now refine this and
> find a solution that would be actually useful to maintainers.

All that sounds like I can continue with regzbot (which we soon
hopefully will rework to make it more useful for everyone) without
stepping on each others toes and solving the same or similar problems
twice? Because that would be a pity and a waste or rare ressources,
which I guess we'd all like to avoid.

But regzbot afaics (and definitively correct me if I'm wrong) handles
just a subset of bugs -- but does that in all the places (email, gitlab,
github), which git-bug won't be able to handle afaics.  I see some
overlap with bugspray (which seems to be still involved, am I right?),
but I guess we might find a way to work together there.

Ciao, Thorsten

