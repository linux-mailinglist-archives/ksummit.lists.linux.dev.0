Return-Path: <ksummit+bounces-2845-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePmrHsTEoWkVwQQAu9opvQ
	(envelope-from <ksummit+bounces-2845-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 27 Feb 2026 17:22:28 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F961BAC13
	for <lists@lfdr.de>; Fri, 27 Feb 2026 17:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 425CE301BDD8
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65BA42E007;
	Fri, 27 Feb 2026 16:22:23 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA6C43E9DF
	for <ksummit@lists.linux.dev>; Fri, 27 Feb 2026 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772209343; cv=none; b=erllpWCAk2jMPjVHy5yVet96d3CsFBghj0IaN+GOQehrjlX8TFRLdsqKvO/VXUkqwspJjjTagxOf95h/IczQIi9nLz7BLiB3kDKZrIZ51K4CHvgX9peLMAomDRlIsebv//Y7+T+H17aatK5CckLvhcjSBPjZwtvBl90kpVoDxVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772209343; c=relaxed/simple;
	bh=J9lH0VrroKOLYhyTClG/V9Fpfls/zYsSotlwSxx7XH0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ITTEL1WsHJosz2HMo+YraiSm72f9egWjz4zup6ze9buBoZc98U+yUDPwwG5T42B/pMr39bgBawa3nCaMXb7f9T1A5ENc0XwgJDqygczckNOai5cHVkjB6IZU+JVfFkA7KVbDF4uRBsKTJLpDEb5LZOXqDZ8bafBz/DaZgJKt62Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C1A59298599;
	Fri, 27 Feb 2026 17:22:19 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id t2eJT85eN0Oi; Fri, 27 Feb 2026 17:22:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E0E8429859D;
	Fri, 27 Feb 2026 17:22:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kGguvjIe1LuU; Fri, 27 Feb 2026 17:22:18 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C0481298599;
	Fri, 27 Feb 2026 17:22:18 +0100 (CET)
Date: Fri, 27 Feb 2026 17:22:18 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Message-ID: <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
In-Reply-To: <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
References: <20251209-roaring-hidden-alligator-068eea@lemur> <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info> <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org> <20260227101631.67756268@gandalf.local.home> <677258882.1999.1772206555300.JavaMail.zimbra@nod.at> <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF147 (Linux)/8.8.12_GA_3809)
Thread-Topic: slowly decommission bugzilla? (was: Re: kernel.org tooling update)
Thread-Index: qIV4IaWyd6aVoOYWIzsFBUk5jNx7lA==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_FROM(0.00)[bounces-2845-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[nod.at];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,get_maintainers.pl:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 09F961BAC13
X-Rspamd-Action: no action

----- Urspr=C3=BCngliche Mail -----
> Von: "Geert Uytterhoeven" <geert@linux-m68k.org>
>> > I just told them to randomly modify the file, do a git diff and redire=
ct it
>> > into another file (making a random patch), and run get_maintainers.pl =
on
>> > it. That's a big hack and having a better interface to point others to=
o
>> > would be useful.
>>
>> I'm pretty sure someone can vibe code us a neat webinterface which queri=
es
>> get_maintainers.pl in the background.
>=20
> ... including a big fat message wrapped in a <BLINK> tag, which suggests
> to check manually if a few addresses should be dropped?
>=20
> Or perhaps this should be restricted to return mailing lists only?

Sure.
What I have in mind is something like a web interface where you
enter either the source file, module name, heck even a stack trace or a BUG=
/WARN_ON/Oops
and the interface gives an advice how to mail to which mailing list.
E.g. what information to include, how to send plain text mail, etc...

Thanks,
//richard

