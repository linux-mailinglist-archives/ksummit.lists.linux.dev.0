Return-Path: <ksummit+bounces-2870-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFg5LRZ/pmnhQQAAu9opvQ
	(envelope-from <ksummit+bounces-2870-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 07:26:30 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 596121E99A6
	for <lists@lfdr.de>; Tue, 03 Mar 2026 07:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 810413021B84
	for <lists@lfdr.de>; Tue,  3 Mar 2026 06:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31ABA383C90;
	Tue,  3 Mar 2026 06:26:26 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D0433507E
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 06:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772519185; cv=none; b=sH9o2Y4AlSUoAwgoi4S9/oUoy//xQ3yTmZvMM8ZWAxC88d6nOjkkJ7mjmStlmSNPUDggnPkBKbJr1N+PM/DdDSxJdj2gdpAiiJ9Z7HA44v/TcVNjiF1efONEU4+qiAE8JuyRuZ2gyiOq+R3fQhd/FncDxNyP/0wHWWCxNsvzb+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772519185; c=relaxed/simple;
	bh=CdrNtsOkOF1cezCjq8/2Pn73wWO2alcsP4kPyJp3fj4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=uNzhYh+RA5977z9kD20f+PPfhjeb0knmL6GCpIy8tCdFI8LALwcjL2saXroTUFL4NOB2fl/PlX2pmXzIF+ln+aye3NIAlwqC69WMaZy8aQUQ/l8AxAAPznPQn/sMMGMszE5PojI5tN2OevCMqVQiT3nunuAq8oy0nbQsYT00H7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7F63E298599;
	Tue,  3 Mar 2026 07:26:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vCd9kAbPBQUM; Tue,  3 Mar 2026 07:26:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D0CC52918DC;
	Tue,  3 Mar 2026 07:26:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CKdzJ7JVcpOW; Tue,  3 Mar 2026 07:26:13 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8E3FB29ABCA;
	Tue,  3 Mar 2026 07:26:13 +0100 (CET)
Date: Tue, 3 Mar 2026 07:26:13 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Sasha Levin <sashal@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	ksummit <ksummit@lists.linux.dev>, 
	laurent pinchart <laurent.pinchart@ideasonboard.com>, 
	Thorsten Leemhuis <linux@leemhuis.info>, 
	Steven Rostedt <rostedt@goodmis.org>, users <users@kernel.org>
Message-ID: <91334269.1714.1772519173246.JavaMail.zimbra@nod.at>
In-Reply-To: <20260302202828.2722037-1-sashal@kernel.org>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com> <20260302202828.2722037-1-sashal@kernel.org>
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF147 (Linux)/8.8.12_GA_3809)
Thread-Topic: kallsyms: embed source file:line info in kernel stack traces
Thread-Index: BKkw+nNLVZTCDCazNF7hJcps8miqEQ==
X-Rspamd-Queue-Id: 596121E99A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nod.at:mid,localhost:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	DMARC_NA(0.00)[nod.at];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2870-lists=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

----- Urspr=C3=BCngliche Mail -----
> Von: "Sasha Levin" <sashal@kernel.org>
> Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
> lookup table in the kernel image so stack traces directly print source
> file and line number information:
>=20
>  root@localhost:~# echo c > /proc/sysrq-trigger
>  [   11.201987] sysrq: Trigger a crash
>  [   11.202831] Kernel panic - not syncing: sysrq triggered crash
>  [   11.206218] Call Trace:
>  [   11.206501]  <TASK>
>  [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>  [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
>  [   11.208565]  ? __lock_acquire+0x465/0x2240 (kernel/locking/lockdep.c:=
4674)
>  [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
>  [   11.211873]  ? find_held_lock+0x2b/0x80 (kernel/locking/lockdep.c:535=
0)
>  [   11.212597]  ? lock_release+0xd3/0x300 (kernel/locking/lockdep.c:5535=
)
>  [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154)
>  [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:611)
>  [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:1221)
>  [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
>  [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
>  [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
>  [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c:63=
)
>  [   11.223942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  (arch/x86/entry/entry_64.S:121)

Seems useful. :-)
=20
> At build time, a new host tool (scripts/gen_lineinfo) reads DWARF
> .debug_line from vmlinux using libdw (elfutils), extracts all
> address-to-file:line mappings, and generates an assembly file with
> sorted parallel arrays (offsets from _text, file IDs, and line
> numbers). These are linked into vmlinux as .rodata.
>=20
> At runtime, kallsyms_lookup_lineinfo() does a binary search on the
> table and __sprint_symbol() appends "(file:line)" to each stack frame.
> The lookup uses offsets from _text so it works with KASLR, requires no
> locks or allocations, and is safe in any context including panic.
>=20
> The feature requires CONFIG_DEBUG_INFO (for DWARF data) and
> elfutils (libdw-dev) on the build host.
>=20
> Memory footprint measured with a simple KVM guest x86_64 config:
>=20
>  Table: 4,597,583 entries from 4,841 source files
>    lineinfo_addrs[]     4,597,583 x u32  =3D 17.5 MiB
>    lineinfo_file_ids[]  4,597,583 x u16  =3D  8.8 MiB
>    lineinfo_lines[]     4,597,583 x u32  =3D 17.5 MiB
>    file_offsets + filenames              ~  0.1 MiB
>    Total .rodata increase:              ~ 44.0 MiB
>=20
>  vmlinux (stripped):  529 MiB -> 573 MiB  (+44 MiB / +8.3%)

Hm, that's a significant increase.

Thanks,
//richard

