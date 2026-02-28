Return-Path: <ksummit+bounces-2849-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFJMNCAHo2mg9AQAu9opvQ
	(envelope-from <ksummit+bounces-2849-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 28 Feb 2026 16:17:52 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A1B1C3DBF
	for <lists@lfdr.de>; Sat, 28 Feb 2026 16:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 446CD305BBF3
	for <lists@lfdr.de>; Sat, 28 Feb 2026 15:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0294657F8;
	Sat, 28 Feb 2026 15:17:45 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C4845105D
	for <ksummit@lists.linux.dev>; Sat, 28 Feb 2026 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772291865; cv=none; b=F/6ISZVQcXw2ccgBfFa96Xx+YmlqRap/zm1w5x73hikxW1BCDphtfpcbdFKy+9v1lA4HIQXfv/dq4D8s7ME2Yd7vzoaIp5rsAO+HNW+ltOW/7w0qHKAfGg7vpSNYwDYIYPvUVLN4djaYfImgzD2fIU0MQFGRl+v6rF3bUhskKVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772291865; c=relaxed/simple;
	bh=c7c/WxcGJ7kXPf1qXt7zFZ9vnJpll4BTPp2vnFBehkg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=hM6M/qpZVx7tAnSs04ZZk81xLnN1H/4tXXzUzLYz3XIbREjH65QbZOWonpqcTpPgMCTX4gGZ/FTJIqglnrhwWvABijff4fKKWrpyGXPrDMVL737Rz4XDHmQT5x5wtMkok8PhUjfr5JjK7ze2aHDzFEwe4QS8TbXXYnhLWEolHvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5F906298599;
	Sat, 28 Feb 2026 16:17:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id GYji0fFCm_GW; Sat, 28 Feb 2026 16:17:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8AD1429859D;
	Sat, 28 Feb 2026 16:17:32 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id x6cC97hTCHkI; Sat, 28 Feb 2026 16:17:32 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 51EFD298599;
	Sat, 28 Feb 2026 16:17:32 +0100 (CET)
Date: Sat, 28 Feb 2026 16:17:31 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven Rostedt <rostedt@goodmis.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Message-ID: <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
In-Reply-To: <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
References: <20251209-roaring-hidden-alligator-068eea@lemur> <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info> <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org> <20260227101631.67756268@gandalf.local.home> <677258882.1999.1772206555300.JavaMail.zimbra@nod.at> <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com> <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at> <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
Subject: Re: slowly decommission bugzilla?
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF147 (Linux)/8.8.12_GA_3809)
Thread-Topic: slowly decommission bugzilla?
Thread-Index: eoo0beoEVns3jwFwFZGpc3+4n9VRgQ==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_FROM(0.00)[bounces-2849-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[nod.at];
	RCVD_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,leemhuis.info:email]
X-Rspamd-Queue-Id: 36A1B1C3DBF
X-Rspamd-Action: no action

----- Urspr=C3=BCngliche Mail -----
> Von: "Thorsten Leemhuis" <linux@leemhuis.info>
> Well, regular users reporting a bug usually don't deal with source files
> and might not even have an idea how to get from a module name to source
> files. For kernel developers it's obviously different, but those most
> likely have the source tree lying around already and thus can run
> scripts/get_maintainer.pl -f directly. So support for source files
> doesn't help that much, I'd say (but of course it would be "nice to
> have", too).
>=20
>> module name,
>=20
> This, on the other hand, would help quite a few people.
>=20
> Also, broad categories with optional, more fine-graded subcategories
> would be nice for some areas. Like mm, which has 18 entries in
> MAINTAINERS that start with "MEMORY MANAGEMENT - ", which confuses
> people that do not know "if in doubt, just use the entry for MEMORY
> MANAGEMENT"
>=20
>> heck even a stack trace or a BUG/WARN_ON/Oops
>=20
> This even more (but of course this is harder)

Let's break down the problem a bit more.
What we want is a lookup mechanism where users can enter:
a) subsystem names,
b) source files,
c) module names,
d) kernel errors

to find a suitable mailing list to complain about.

With the MAINTAINERS file we have a lookup table which maps kernel source f=
iles to mailing lists,
that's already a good start.
That's good enough for a) and b).

Case c) lookup by module name is a bit tricky since the MAINTAINERS file do=
es not really
know about modules.
What we could do is performing a allmodconfig build with CONFIG_DEBUG_INFO_=
DWARF5=3Dy
and then extract the DRAWF compilation unit names from all *.ko files.
This gives us a module name to source file mapping.

Finally, and IMHO the most important input, are d) kernel errors.
Kernel errors we and users care mostly about have one thing in common: a st=
ack trace.
stack traces are a list of symbols.
Extracting a stack trace from a random text (or log file) is not hard,
look for words of the from SYMNAME+0xNN/0xNN. Neither order nor duplicates
matter much.

What we need is a mapping between symbol names and source files.
That's also doable. e.g. by running "nm" on all *.ko files of a allmodconfi=
g build.

So, from a given set of symbols we can find the matching module names and
mailing lists.

The very same approach will also work for core code. Beside of scanning *.k=
o
files, scanning built-in.a and even *.o files for non-module gives the same
results.

At the end we have a database (sqlite?) which can be fully automatically ge=
nerated
from a kernel build and can be queried.
Nothing which can't be achieved with a few scripts.

>> and the interface gives an advice how to mail to which mailing list.
>> E.g. what information to include, how to send plain text mail, etc...
>=20
> Yeah. But unless somebody volunteers to realize this within a few weeks,
> I'd say: Let's finally first reduce the immediate problem (users
> reporting bugs to a place where they might not even reach the
> developers) by putting a new welcome page on bugzilla.kernel.org in place=
.

Sure.

Thanks,
//richard

