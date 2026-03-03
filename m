Return-Path: <ksummit+bounces-2872-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE7DC/+XpmltRgAAu9opvQ
	(envelope-from <ksummit+bounces-2872-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 09:12:47 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC91EA9FD
	for <lists@lfdr.de>; Tue, 03 Mar 2026 09:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 420E4303EB6A
	for <lists@lfdr.de>; Tue,  3 Mar 2026 08:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFD238645B;
	Tue,  3 Mar 2026 08:10:12 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B2386C0A
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525412; cv=none; b=CZauEyHdrTPyGid07L2RCdRN5iIrG8757T57r2O7ELfp1FYvsw+eEef/sSuP3/WcnxFFxJHxTMjk8D0D3offImgI4C68ofKss8ftLEshjcAe3ufb2slPIWTCk86aTDCsvsTYMcco5vsNvNxKYXUXxfq62BZlytM2WqEg/2GGsYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525412; c=relaxed/simple;
	bh=fkVmcxKDFZtkS8/cxCfZUBEKzydQPEvATECo2Zp+5eU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhTnslv1fPMISUmPcjXFOxclKPi0WcbZB4KkPoVP4lbkuXW5wyNaHe0jZ+JWEiYR2o1kO7ADmLgeOvCQYOMsbTG2feo/CfvRmLNjOnQKXZa/l3waRO3SMUAOt8n6Tv9ColNjSCQi+60WbXbyGCeu5m5ccpgWGoiOH4Sa9oA6aBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso3021411241.2
        for <ksummit@lists.linux.dev>; Tue, 03 Mar 2026 00:10:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525408; x=1773130208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVJ7t98ZLZHLHTvaRQaZTmzP2m55NaOoDNjo4F3CJ4M=;
        b=FA4GPOnTCenHNut6eAh0H1MxbbPfg3QuYDDF4PvAp77cYXjk+cz749MM8ZaV0NBJNN
         q9RuDdc2rn1qIdZS/B+xpAsCyJWAIN5BTqd9ExXD/+PbjMyjERuar2kNY1IhdvhVNq7w
         Rsia/8Yl5INo/ezEJsoL80v+lUEv6byi60ywAT4wyZn0HhCXB3Si+7yl3/hYq5zJx5P0
         ydi/Uxdq8mLSaBPbwlVqnV9qq/bpkkxBn5QeBU1qrJb+MgqsO8QaUiRX7NR88sSPLCyS
         01p+pSMzVAiDOPFlswZ6DCj98xLvT9TIyclSekTKoBEambNWibpxj5Mjks+NMzaj5Kp7
         8lsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfYEtNFnDOZlxB0hYaxwkJkY8Dbm9o3ImUInBy9yCIxPoWOTUz6fNLxTPpGoSsZWvyfKQtnY1F@lists.linux.dev
X-Gm-Message-State: AOJu0Yxek9bTl750lSS2de6HMYWPlQRzURkM8D4DmgmYa9/WPz18HyiW
	Vv9kYa1lgqohaOR/SpmqLHwHxVaJaCOej0Pgw9yvZD4MVl+Xi6DJzxujBV1St/oE
X-Gm-Gg: ATEYQzzR7Q1QZ5JW9oaw+XYmHzA8AatsLxahlTNpfjd752WOvbaTGiLX50sTe/bZ/W4
	+kYnSMBz6WuTEwcAapdAkorOezs+HkbKUFmhu4L1Km0hy8RkIvmd/7YInTgQQVLuYCvQi8NnhPF
	y1jOl+CclOur0SMDMlFYecNlusnQ1APdA8DnEm0XHHfB1UH5NND4TDkbKRwoRjOFiBNISfBDU1y
	TJG4esvSAJpjIzIOkQJ+YPEKmI5fxhn5QiK+MGVmtrWrg7D6Oxf3Ha6H997lnTzUyAGBgwPoNTl
	DTkhx2XMJjsaNC7ZTVflHQHfXZqd+vGZxvNiAgkkAaDQR5xFHEkngzDrg0vv8zSKx6AtuN/38WF
	cbAOTN8h2gdHjS9upykE8YqsPuXzwhb6sHHTMFJ8pa8h/85RTbFI29rQS4gEMLuSqs6+jlt2EOQ
	OTW1KShaadX5/Z4E7tJmZVOoglZ5Y7JAKdpYi1FFxZIpMh5Xva3bOy2hKxC88k
X-Received: by 2002:a05:6102:1610:b0:5fe:f530:2ba3 with SMTP id ada2fe7eead31-5ff3250136cmr8826744137.28.1772525408161;
        Tue, 03 Mar 2026 00:10:08 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df641e133sm14320826241.5.2026.03.03.00.10.07
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 00:10:07 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so3346547241.0
        for <ksummit@lists.linux.dev>; Tue, 03 Mar 2026 00:10:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwZs9ls0eYJUeoHX9a+nc2DX0rMtP8YHLMPGFPdFZpGy9e+pdQpAxyd4StcGeQHwAo06tLwrsl@lists.linux.dev
X-Received: by 2002:a05:6102:390e:b0:5ef:a9fb:f1f3 with SMTP id
 ada2fe7eead31-5ff32310654mr7558098137.11.1772525406777; Tue, 03 Mar 2026
 00:10:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
In-Reply-To: <20260302202828.2722037-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 09:09:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVhfFQQtM3baH+47uf0iv+1zHDb9_DjFetQZjOLAzrDhg@mail.gmail.com>
X-Gm-Features: AaiRm53ppf7l64yZaK6IoBF9WrsF7WbxwJPlRL0SLVStGdjpAsOvqIQHUmMuwas
Message-ID: <CAMuHMdVhfFQQtM3baH+47uf0iv+1zHDb9_DjFetQZjOLAzrDhg@mail.gmail.com>
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack traces
To: Sasha Levin <sashal@kernel.org>
Cc: torvalds@linuxfoundation.org, akpm@linux-foundation.org, 
	konstantin@linuxfoundation.org, ksummit@lists.linux.dev, 
	laurent.pinchart@ideasonboard.com, linux@leemhuis.info, richard@nod.at, 
	rostedt@goodmis.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A0BC91EA9FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.809];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2872-lists=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,localhost:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Sasha,

On Mon, 2 Mar 2026 at 21:28, Sasha Levin <sashal@kernel.org> wrote:
> Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
> lookup table in the kernel image so stack traces directly print source
> file and line number information:
>
>   root@localhost:~# echo c > /proc/sysrq-trigger
>   [   11.201987] sysrq: Trigger a crash
>   [   11.202831] Kernel panic - not syncing: sysrq triggered crash
>   [   11.206218] Call Trace:
>   [   11.206501]  <TASK>
>   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>   [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
>   [   11.208565]  ? __lock_acquire+0x465/0x2240 (kernel/locking/lockdep.c:4674)
>   [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
>   [   11.211873]  ? find_held_lock+0x2b/0x80 (kernel/locking/lockdep.c:5350)
>   [   11.212597]  ? lock_release+0xd3/0x300 (kernel/locking/lockdep.c:5535)
>   [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154)
>   [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:611)
>   [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:1221)
>   [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
>   [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
>   [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
>   [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c:63)
>   [   11.223942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f (arch/x86/entry/entry_64.S:121)
>
> At build time, a new host tool (scripts/gen_lineinfo) reads DWARF
> .debug_line from vmlinux using libdw (elfutils), extracts all
> address-to-file:line mappings, and generates an assembly file with
> sorted parallel arrays (offsets from _text, file IDs, and line
> numbers). These are linked into vmlinux as .rodata.
>
> At runtime, kallsyms_lookup_lineinfo() does a binary search on the
> table and __sprint_symbol() appends "(file:line)" to each stack frame.
> The lookup uses offsets from _text so it works with KASLR, requires no
> locks or allocations, and is safe in any context including panic.
>
> The feature requires CONFIG_DEBUG_INFO (for DWARF data) and
> elfutils (libdw-dev) on the build host.
>
> Memory footprint measured with a simple KVM guest x86_64 config:
>
>   Table: 4,597,583 entries from 4,841 source files
>     lineinfo_addrs[]     4,597,583 x u32  = 17.5 MiB
>     lineinfo_file_ids[]  4,597,583 x u16  =  8.8 MiB
>     lineinfo_lines[]     4,597,583 x u32  = 17.5 MiB
>     file_offsets + filenames              ~  0.1 MiB
>     Total .rodata increase:              ~ 44.0 MiB
>
>   vmlinux (stripped):  529 MiB -> 573 MiB  (+44 MiB / +8.3%)
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks for your patch!

> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -467,6 +467,47 @@ static int append_buildid(char *buffer,   const char *modname,
>
>  #endif /* CONFIG_STACKTRACE_BUILD_ID */
>
> +#ifdef CONFIG_KALLSYMS_LINEINFO
> +bool kallsyms_lookup_lineinfo(unsigned long addr, const char **file,
> +                             unsigned int *line)
> +{
> +       unsigned int offset, low, high, mid, file_id;
> +
> +       if (!lineinfo_num_entries)
> +               return false;
> +
> +       /* Compute offset from _text */
> +       if (addr < (unsigned long)_text)
> +               return false;

So the passed address can be too low...

> +
> +       offset = (unsigned int)(addr - (unsigned long)_text);

... but can it also be too high? I.e. could the cast truncate a large
offset to 32-bit? Or will this function never be called in that case,
due to earlier checks in __sprint_symbol()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

