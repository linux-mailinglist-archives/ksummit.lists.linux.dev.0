Return-Path: <ksummit+bounces-2851-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKRKOftJo2nW/AQAu9opvQ
	(envelope-from <ksummit+bounces-2851-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 28 Feb 2026 21:03:07 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4555A1C7D35
	for <lists@lfdr.de>; Sat, 28 Feb 2026 21:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 703DE375C5E4
	for <lists@lfdr.de>; Sat, 28 Feb 2026 19:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FB53B4487;
	Sat, 28 Feb 2026 18:29:31 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69443B4466
	for <ksummit@lists.linux.dev>; Sat, 28 Feb 2026 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772303371; cv=none; b=nqyX6kXx6a+vgVS87527Vj6r7u2uT+hUkkx+KMKwr2zNi8DjYUD0S8nabmW0OadZQyvcAkP6rVtGUdeWuf1Ya8xSJqTz6XeWo78QRl3YiB7KCJPu6JCTZ7qbYHSpwH9g0nNuJZaiz59CRA1mYE2u0ZYBtIy2inCZGttl1WV+zLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772303371; c=relaxed/simple;
	bh=S3fYIeR0q60xPsUbziMg237RBitRQNoWSl0QqK2K0uE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=JNCkzVnMZqTIaYNhS+OFPWSU8s6NDqtwOT8z3ZI63A/kLVTDKbKvuHDN3neXXzwEojerb6aSrrL7vJ6uc0INS1M93Cx7PYGuNwPaq5xehnKrmM9o4VDa7PX5hicU7T+GDwJWt+h51HFb0bCoyCpK0IQ+hD3Q8YDo7OF7ZWf6IyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6C2CD298599;
	Sat, 28 Feb 2026 19:29:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id h-mZZ2SFV67M; Sat, 28 Feb 2026 19:29:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A11C429859D;
	Sat, 28 Feb 2026 19:29:24 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lgptJB0b4_Ms; Sat, 28 Feb 2026 19:29:24 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 69B92298599;
	Sat, 28 Feb 2026 19:29:24 +0100 (CET)
Date: Sat, 28 Feb 2026 19:29:24 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven Rostedt <rostedt@goodmis.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Message-ID: <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
In-Reply-To: <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
References: <20251209-roaring-hidden-alligator-068eea@lemur> <20260227101631.67756268@gandalf.local.home> <677258882.1999.1772206555300.JavaMail.zimbra@nod.at> <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com> <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at> <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info> <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at> <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
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
Thread-Index: VrqZRRVhfTIPqy5nnXVwQG13dHrWzQ==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_FROM(0.00)[bounces-2851-lists=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 4555A1C7D35
X-Rspamd-Action: no action

----- Urspr=C3=BCngliche Mail -----
> Von: "Linus Torvalds" <torvalds@linuxfoundation.org>
>> What we need is a mapping between symbol names and source files.
>> That's also doable. e.g. by running "nm" on all *.ko files of a allmodco=
nfig
>> build.
>=20
> For stack traces, what you actually want is
>=20
> (a) a debug-info build
>=20
> (b) run scripts/decode_stacktrace.sh
>=20
> on the stacktrace.
>=20
> That gives you not just source files and module names, but line
> numbers and inlining information too, which is really realy convenient
> for more complicated stack traces.
>=20
> Apparently not enough people know about this.
>=20
> For a recent example of this script output, see
>=20
>   https://lore.kernel.org/all/a8baf6415463d2ad20cf556c8148432e17b211e6@li=
nux.dev/
>=20
> and notice how it not only disassembles the code line, but it changes
> a trace like
>=20
>  uart_write+0x1ec/0x240
>  handle_tx+0x9a/0x1a0
>  caif_xmit+0x61/0x70
>  dev_hard_start_xmit+0xa6/0x1e0
>=20
> into
>=20
>  uart_write (drivers/tty/serial/serial_core.c:72
> drivers/tty/serial/serial_core.c:598)
>  handle_tx (drivers/net/caif/caif_serial.c:237)
>  caif_xmit (drivers/net/caif/caif_serial.c:284)
>  dev_hard_start_xmit (./include/linux/netdevice.h:4833
> ./include/linux/netdevice.h:4847 net/core/dev.c:3601
> net/core/dev.c:3617)
>=20
> which is really a lot easier for people to figure out where things happen=
ed.

Of course. But I had a different use case in mind.
I thought about pasting whatever stack trace a user finds in dmesg/syslog
into a web interface to find the most suitable mailing list to report to.

*If* debuginfo and tooling is available to the user, of course they should
include the decoded stack trace to the report.
How to do that should be included in the instructions on how to report
the issue by mail.

Thanks,
//richard

