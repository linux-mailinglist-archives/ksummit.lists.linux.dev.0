Return-Path: <ksummit+bounces-2871-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPHGM1SEpmlQQwAAu9opvQ
	(envelope-from <ksummit+bounces-2871-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 07:48:52 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 492631E9C7C
	for <lists@lfdr.de>; Tue, 03 Mar 2026 07:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE9213020EAB
	for <lists@lfdr.de>; Tue,  3 Mar 2026 06:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BFE3859D1;
	Tue,  3 Mar 2026 06:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbnP4bJb"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51080373C02
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 06:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772520526; cv=pass; b=Ayv+uSC0XrI3r0oUIyzUoobSJWQwedxWjX4Vdmi2SDvVBoFQUGMqOcjxY7wEH3jgAK4doZhOA8pDxyfgRLV7TB9AAw+syo2dnJAeBrm3kwRHMNEkr1h1jXJakx6Xbh70LpJMgQASvysRppatw5TxDp/HEqXiDzKGNxAhEucITNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772520526; c=relaxed/simple;
	bh=ysin9WclZu33kTi15WzoBURIAuB6v4WoHRJJ+nbjxFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8YXMzuPNDav6ve/7fm7wKWI7hjydBHGMoqH7DqY2eXBRa0t7+oFCvDOPbhwo2XwwStkkJf8xUt8EcEI+lNS//2d+WSUhP+ZgRtWX/9ymTt6Xu0AZ3F/VThRePl/q/Krdn5jltRyVXxl0HJYocxeWn5aER/reQgD9Jtjdrd4DLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbnP4bJb; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-389e4330e32so77979871fa.0
        for <ksummit@lists.linux.dev>; Mon, 02 Mar 2026 22:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772520521; cv=none;
        d=google.com; s=arc-20240605;
        b=cL/xQcbdKtmMue4q1QQBcxFOc0FLiwWcrjb3AI8aXdNN7sopSmHl0K6BHRF9KBWIGB
         De82nqD1+DYWsGzoQ1vZg9FGzKvGWRsrezKawzHz1cm+wF3pA63w+msaNqk2DnFZcRxb
         sfkmyHobbIjZGobQinzt4eCAbTiZnI6URyqXjkcRqtWaieoD40OMZX7IvLzjfpXhjBV4
         Zsmo16ufj548hcG0+N5/7W8Hxf6B4y/2g8xjRDsDDZficHLKWo9SdHCj0K8ZihCDdCVM
         WGrELLs9iMKTQo/Sw2GertnAh8nkN80ni0ZArDQx/0pNcLhcUKZtCRfK3SkBvgmDoSpD
         t/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e4r9NiqapdataqYW+GWjKBXqEkaAhpgCIJaUuYhnEXw=;
        fh=EVnznJ6AGZHr3nSVQzo6xX1zFGSlQjUwJx3U/M54MCw=;
        b=MVJGnjiIZLlblVvwmPPBqDV8E4TFQ/vhC37AzBk3MZK56BEAyn4mQVL3gAcOhA19d4
         /rnKjPSotR3PBzG1zjDbAhbF3rXPzTG+bINHTsZv7cAsWthFqoFbRNIcxqtLumVnrxMR
         fKjGxYmYH5T6jLlMZIuTXvC8Uk3oT2VeWD3ItwzZRjmzerNNByOisikAMGbyykwgYB6i
         v+du0lajrxSjSk/VB2BeKSNqTz3cyFNxQgmT5hrC3cJHhRbVxlVO8i6N/UXapzFjzsT3
         uGvDmGhpaZ5hoa8RXYCRwxhJecg/G7vWfLZnUCi3FaDCZnZTrrZibGF8Il3KXdRTQIBt
         zDxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772520521; x=1773125321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4r9NiqapdataqYW+GWjKBXqEkaAhpgCIJaUuYhnEXw=;
        b=gbnP4bJbSyZUXA09khRXdbhwiBL8qCtqfwW2TrdeP2xYvmlt4KGFY3fwyAYLNch6nt
         pdSOrd3TpK7hu2e3g8CVCo+/7uMK9WZcYx2/qw7C6WzFn5z64S9hnL8myCs4pNZDKr98
         x27Ib6boEI+mSN1z4JLkuDsH8hiINqYnqBzS9NgKBl9qQnBcEcjnZ8LqS/QmhZif7Idh
         Rvv2gRs3NTcSMDFviNRv47XdD2iU9PQU5ypXTPLIbVjTJdQz+S8LTNwrSOxcYD/rYA7p
         14NFGW7RyCzwpXJVdfjnksnuvuYCCieiVUAOCVV84DRkRhHrCJdf11l1QTU1DRF0raRP
         HjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772520521; x=1773125321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4r9NiqapdataqYW+GWjKBXqEkaAhpgCIJaUuYhnEXw=;
        b=A1wT4172mFI+s9+qnsEFNb+IzWccKWHZUQWKtUKJlcdEMZx+CfN7FzC1GPQtN3VBA7
         etkbDVlGKqYCvCXN67rUXUABrBovL/IXwHDn8a9e/QF0wx84U39PpjhcayAyfTSMzTVN
         9kJGMcAc93jEjik1io0V4zTQ0Y0oB8gG6NqdZH0Uq4NigGCOedB+wUvbkVp5y3XcmgiD
         gwwBBY1tlZmm4EIK5aOlAx7uy8tNTav1RpG3chT6Do52zFEJzKL1IaFc50JszOYAr3L0
         LeCsMSEN1IvskyU085RX7ua1ZJOW1de5TpFqjiiT/QM7DBY1RRqUlrJuje6YScvg2rCZ
         UOoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWebyo748S1Xc8Xe69AjVvfGKu1HqzO0NHMyJXklgO06Mt3yWaUQhyvobixCHLuWKWYVF33AIkO@lists.linux.dev
X-Gm-Message-State: AOJu0YxD2PUtNdhmcWoPCRl/Lptx6+rOp6B1qiDLHQnKW9CIPKwizzLA
	e842A6BVghuPqF/UonmItWbqUIEv/O6nDEcMsfI6+D8Jwq389oj8VwEfjYzmneE1BxjLqZNkUW2
	wAQRLVvjt0RmAJATF+F1d/lM579nmOu4=
X-Gm-Gg: ATEYQzxWGjSorWJlOqsm/jUIy4Pr7FJUt/NIfutxuHNE7eshLuptoXuVZEoRTpvWnzl
	PlCtvXYJYJzBpTU8GYikPdQkINqxHq1SIQk3nwfyelLcCWs4Vc7ajdbgum04sIXDD8J4zT5AAbz
	Q4ShTwgMkLqtr3DQKEQVt/2CL3JfZh7/j/Clarf/PrLTq07cGyBMTLualGH1gRGCEptRniz6nyD
	OAj5A00MZrGkAXlr84swZXQXfH4mJ/pCfa2c8GFZMskeVEvzWrZ/tczz4VuQTiP6qV4e0YU/jpp
	RTgB5YyeAuOWiwXKTrgKSTgzugXACOCpmmswoQ==
X-Received: by 2002:a2e:914d:0:b0:389:fb69:9e65 with SMTP id
 38308e7fff4ca-389ff356058mr70020021fa.31.1772520521120; Mon, 02 Mar 2026
 22:48:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org> <91334269.1714.1772519173246.JavaMail.zimbra@nod.at>
In-Reply-To: <91334269.1714.1772519173246.JavaMail.zimbra@nod.at>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Tue, 3 Mar 2026 15:48:24 +0900
X-Gm-Features: AaiRm515A78fV6ehLYmN-5kVo3dQa1BIq-2xs7lzaoF5HL6FZd4D5fMSSbt-UJo
Message-ID: <CA+Ln22Giw4_RL-BCGot9hsgQU5LA3HeFM3bppyz0XW6py=UwoQ@mail.gmail.com>
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack traces
To: Richard Weinberger <richard@nod.at>
Cc: Sasha Levin <sashal@kernel.org>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, ksummit <ksummit@lists.linux.dev>, 
	laurent pinchart <laurent.pinchart@ideasonboard.com>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Steven Rostedt <rostedt@goodmis.org>, users <users@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 492631E9C7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2871-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszfiga@gmail.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,localhost:email,mail.gmail.com:mid,nod.at:email]
X-Rspamd-Action: no action

2026=E5=B9=B43=E6=9C=883=E6=97=A5(=E7=81=AB) 15:26 Richard Weinberger <rich=
ard@nod.at>:
>
> ----- Urspr=C3=BCngliche Mail -----
> > Von: "Sasha Levin" <sashal@kernel.org>
> > Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
> > lookup table in the kernel image so stack traces directly print source
> > file and line number information:
> >
> >  root@localhost:~# echo c > /proc/sysrq-trigger
> >  [   11.201987] sysrq: Trigger a crash
> >  [   11.202831] Kernel panic - not syncing: sysrq triggered crash
> >  [   11.206218] Call Trace:
> >  [   11.206501]  <TASK>
> >  [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
> >  [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
> >  [   11.208565]  ? __lock_acquire+0x465/0x2240 (kernel/locking/lockdep.=
c:4674)
> >  [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
> >  [   11.211873]  ? find_held_lock+0x2b/0x80 (kernel/locking/lockdep.c:5=
350)
> >  [   11.212597]  ? lock_release+0xd3/0x300 (kernel/locking/lockdep.c:55=
35)
> >  [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154)
> >  [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:61=
1)
> >  [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:122=
1)
> >  [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
> >  [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
> >  [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
> >  [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c:=
63)
> >  [   11.223942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >  (arch/x86/entry/entry_64.S:121)
>
> Seems useful. :-)
>
> > At build time, a new host tool (scripts/gen_lineinfo) reads DWARF
> > .debug_line from vmlinux using libdw (elfutils), extracts all
> > address-to-file:line mappings, and generates an assembly file with
> > sorted parallel arrays (offsets from _text, file IDs, and line
> > numbers). These are linked into vmlinux as .rodata.
> >
> > At runtime, kallsyms_lookup_lineinfo() does a binary search on the
> > table and __sprint_symbol() appends "(file:line)" to each stack frame.
> > The lookup uses offsets from _text so it works with KASLR, requires no
> > locks or allocations, and is safe in any context including panic.
> >
> > The feature requires CONFIG_DEBUG_INFO (for DWARF data) and
> > elfutils (libdw-dev) on the build host.
> >
> > Memory footprint measured with a simple KVM guest x86_64 config:
> >
> >  Table: 4,597,583 entries from 4,841 source files
> >    lineinfo_addrs[]     4,597,583 x u32  =3D 17.5 MiB
> >    lineinfo_file_ids[]  4,597,583 x u16  =3D  8.8 MiB
> >    lineinfo_lines[]     4,597,583 x u32  =3D 17.5 MiB
> >    file_offsets + filenames              ~  0.1 MiB
> >    Total .rodata increase:              ~ 44.0 MiB
> >
> >  vmlinux (stripped):  529 MiB -> 573 MiB  (+44 MiB / +8.3%)
>
> Hm, that's a significant increase.

Random idea: Could this additional information (and I guess the code
that uses it too) be moved out to a loadable module?

The obvious limitation would be that the user would need to have the
module loaded for the decoding to work, but that could be worked
around by marking it for autoload when a crash is noticed the first
time and then getting a better report the second time.

Best,
Tomasz

