Return-Path: <ksummit+bounces-2848-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPx5Osnwomkm8QQAu9opvQ
	(envelope-from <ksummit+bounces-2848-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 28 Feb 2026 14:42:33 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 633AE1C34B4
	for <lists@lfdr.de>; Sat, 28 Feb 2026 14:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 982C03043AC0
	for <lists@lfdr.de>; Sat, 28 Feb 2026 13:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D874A2D1907;
	Sat, 28 Feb 2026 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EvD4wPQF"
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B211E98E3
	for <ksummit@lists.linux.dev>; Sat, 28 Feb 2026 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772286148; cv=none; b=AjaIaG8xnLHNlV2URkAFSugMY7QPh2COw+HxYln9r8EadKcAdThLa9Amovs7UNZDy3QWvrMhXcItnvRs2vTOl7dwyE9zJfZVA9FlRL42jgGiMDkkYDwPOiREazSSzTieXEJzOz/e20skm2DFCI+b1kZEao8B47gPzEkTDPwEDnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772286148; c=relaxed/simple;
	bh=CCDGjTQtgDycR5VwzaJB5UznSytDG8iY4vwkgYigKE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKU8wBHk7PkQEi1NuEB1X+vJesLRH6RV1dNImU+xjE8QNvdT+yj4gqqGEBJW97oYNkBfTHzONgYAfUP03fV1IjrZGanQ3KfiCLKWugNWHvq2ekH9nj/nf40Aa0LXsSk3qdwQLUAr6riScgaYG9HiioMPUglZofsZ3s/VcKfYEIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EvD4wPQF; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fNRDh3H2Nz3tKq;
	Sat, 28 Feb 2026 14:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772286084;
	bh=CCDGjTQtgDycR5VwzaJB5UznSytDG8iY4vwkgYigKE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EvD4wPQF5XdWCnl5cHF856hOzlfYiPjNwYTGpTPpMxsHhvkceruqaxKfQmBzldpq4
	 gPpaAWbZOrNuvtS4bmGBGwxPSrjD3kJOiGgl95Jk1Xhl2AeXLJG37yUFL+yjCjrVgH
	 GTFKSC3Tpm/DDzsoxwUmYuNitib+obHPBmUFCeyxKyxnEQ5OKz3p9TmG3Qrh8MD9E4
	 DUU7/owkWcQrIFvSVNnBIHkie8g6879XRsRCXSGHLSRDKzyLGRxyqcmC8OzxhvcA7v
	 nn7ziWDh9QnSykQ5kRKzGyblwkU59ix15ZvpfB360rTRJCKqmJFXY/RO1tzfcG3ICc
	 CmQh5YeeCLKPQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fNRDh2X2Rz3tJZ;
	Sat, 28 Feb 2026 14:41:24 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fNRDg3SxVz8svF;
	Sat, 28 Feb 2026 14:41:23 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5547F61741;
	Sat, 28 Feb 2026 14:41:22 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
Date: Sat, 28 Feb 2026 14:41:21 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: slowly decommission bugzilla?
To: Richard Weinberger <richard@nod.at>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org>
 <20260227101631.67756268@gandalf.local.home>
 <677258882.1999.1772206555300.JavaMail.zimbra@nod.at>
 <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
 <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177228608267.1179507.8244685339638036233@mxe9fb.netcup.net>
X-NC-CID: oVeGiF4+NIjtJ6ek9N6BhO0Zyxb9yqf9ndpWPfDpReXEcsizVL8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,get_maintainers.pl:url,leemhuis.info:mid,leemhuis.info:dkim];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	TAGGED_FROM(0.00)[bounces-2848-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[leemhuis.info];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[linux@leemhuis.info,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 633AE1C34B4
X-Rspamd-Action: no action

On 2/27/26 17:22, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Geert Uytterhoeven" <geert@linux-m68k.org>
>>>> I just told them to randomly modify the file, do a git diff and redirect it
>>>> into another file (making a random patch), and run get_maintainers.pl on
>>>> it. That's a big hack and having a better interface to point others too
>>>> would be useful.
>>>
>>> I'm pretty sure someone can vibe code us a neat webinterface which queries
>>> get_maintainers.pl in the background.
>>
>> ... including a big fat message wrapped in a <BLINK> tag, which suggests
>> to check manually if a few addresses should be dropped?
>>
>> Or perhaps this should be restricted to return mailing lists only?
> 
> Sure.
> What I have in mind is something like a web interface where you
> enter either the source file,

Well, regular users reporting a bug usually don't deal with source files
and might not even have an idea how to get from a module name to source
files. For kernel developers it's obviously different, but those most
likely have the source tree lying around already and thus can run
scripts/get_maintainer.pl -f directly. So support for source files
doesn't help that much, I'd say (but of course it would be "nice to
have", too).

> module name,

This, on the other hand, would help quite a few people.

Also, broad categories with optional, more fine-graded subcategories
would be nice for some areas. Like mm, which has 18 entries in
MAINTAINERS that start with "MEMORY MANAGEMENT - ", which confuses
people that do not know "if in doubt, just use the entry for MEMORY
MANAGEMENT"

> heck even a stack trace or a BUG/WARN_ON/Oops

This even more (but of course this is harder)

> and the interface gives an advice how to mail to which mailing list.
> E.g. what information to include, how to send plain text mail, etc...

Yeah. But unless somebody volunteers to realize this within a few weeks,
I'd say: Let's finally first reduce the immediate problem (users
reporting bugs to a place where they might not even reach the
developers) by putting a new welcome page on bugzilla.kernel.org in place.

Ciao, Thorsten

