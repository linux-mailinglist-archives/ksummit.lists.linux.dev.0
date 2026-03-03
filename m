Return-Path: <ksummit+bounces-2873-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GYFF5WYpmltRgAAu9opvQ
	(envelope-from <ksummit+bounces-2873-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 09:15:17 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3E1EAA79
	for <lists@lfdr.de>; Tue, 03 Mar 2026 09:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C3E6301AD37
	for <lists@lfdr.de>; Tue,  3 Mar 2026 08:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009BD386C3B;
	Tue,  3 Mar 2026 08:11:51 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF138759C
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525510; cv=none; b=JPR8WDy+bLW2P90Wb/NZKKwG4BIIvwQBLtmPoVm6S4NEKSu3t4mMLE0auPk2GD1B5BYTF+Dfc4cwv2ompi7AJApeOSDkVnU5WMwt6uijkCr1IkFcV7DPlyK/tDgzqRwfdHNrB3yAt2QACLRlsZd/sJvdXIGIyBbbum8c0t25EEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525510; c=relaxed/simple;
	bh=3JoDeyBoJVpLYrI4ajf77Q/w0qY9xt5MxXT8HkPt+Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTocVxKpll05rrMF1wMkfkjP1lh19YlZdOAgfmacfieH8j8xw0ZaXS9BqPQnmmrNX/IYmQFP0hniyog2+OLuAk5ksWShisvxI9FkCcac1e3Z/6Mwesrzad0Ki9l/h2qvhHJ3mhGiXcvvaIDBAT2A5nPF4YDK5cCuq5V4tzQyKko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5688c221fd3so2329508e0c.2
        for <ksummit@lists.linux.dev>; Tue, 03 Mar 2026 00:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525508; x=1773130308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J81dyWPSWRFts6yN2Egf3TRzvh+leODONCpIj0YkkKM=;
        b=iOlTPGvChIoe5hbSWfmOB31B4VDZPoWCM4CuOQNMU+Xa+z/j1s9PNMjpHRmpALpNB/
         FZdspl1KpkyqUBHSsJsu31TS3rb652DqFJT1ykjRrVgFLUQyZM6QEyo1AIip+gOMzeaL
         wGRco9B+1ECt0MBUSSOEMBnUrGcKIY3xCn48zWe7KnP2lfGwfhs4NdBUhcDP8rEV9Eu5
         muzcblzDVjfc5o2i7KCeNubqOTTwOEO4EejbJj4rZ6oHpE7ZJvfcrDRlwapL/N2NTFVy
         IjjL91bpPDAvwOvVqvQ9TNAjCIJdS1Mt6YCCgMDqBccfMueotVjRdetmmL3xgHwSCWCJ
         jhbA==
X-Forwarded-Encrypted: i=1; AJvYcCXEfIYf9JcB68DIJ5AFEgfBlhACQmNiJxPE+aABTNW0Fc3pszozX7X/KMh1cCQg+bzlnoUK6cRv@lists.linux.dev
X-Gm-Message-State: AOJu0YwarR4uZUy1R6AUBYwfd5G11CAKVp2sj2pvFfLqaYpe0vbTHvBG
	jvHhkAHlqQalICPCVNsegi9gvzgSDGjtWyrY4zLf7nBjKHINPlw7KhL478cGuBMK
X-Gm-Gg: ATEYQzw0CKmV1FQ4RJJp+Gf77um46G7lcM0t3s/QuwYPasObFZPSUoxEv0/FKFOEsD3
	AHtxO6woGTrQ1ArNRq6v2iBPY2MoyBWjQoYOgWLSVwJ3sLlxClo45BwY+iD9DZo9lSaBetEtnMn
	q/Hr2aLGEu9WE2XXBuLhAUuNSVFje/y+D9r5TpzHFmVbB+1oGNM7peDc77hYX4AfFF9XfAXtvGr
	ZvpLWTPBeJmOPWLuYphEVTXas6JTU/kNY/mLu0G55idn/nh+6wLdu8uCfYVMgzmNNZTih9YH/mk
	ajg4mqDsGQAAWn1sCPBBcUXz+gigd2w3HMCiSyS43GLsgWXX1N2CidRXosA6aYTbgos/mCgbxOq
	xpPMqv65AqH8CaVfRFXO474GYwJxp6YgQiAhF4pH4Eh4OpioNZzk6dMiQjlmhoQ73MeZGLkxl3B
	cGnlzaEhkNIqiYcLpm/0iohcNx2FJvlFCN3Ex3QDXFBu61gsDx9dS7R1wC2Fx/
X-Received: by 2002:a05:6122:3220:b0:567:d87:e152 with SMTP id 71dfb90a1353d-56aa0a98ad6mr6743011e0c.18.1772525508435;
        Tue, 03 Mar 2026 00:11:48 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df63d6695sm14311376241.1.2026.03.03.00.11.47
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 00:11:48 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94abd52b274so1445478241.3
        for <ksummit@lists.linux.dev>; Tue, 03 Mar 2026 00:11:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQAwZyhlksMLkNX04F6/Hdfim2NWdq1zXq3ILhCtFy+QnWwBmKHEk909On7PF1de8EWRouWA6B@lists.linux.dev
X-Received: by 2002:a05:6102:d8f:b0:5fe:13bc:f13a with SMTP id
 ada2fe7eead31-5ff32597916mr5759429137.36.1772525507185; Tue, 03 Mar 2026
 00:11:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org> <91334269.1714.1772519173246.JavaMail.zimbra@nod.at>
In-Reply-To: <91334269.1714.1772519173246.JavaMail.zimbra@nod.at>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 09:11:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXevwo-dgURJimDJrrfgt108v9TR=P1fq6N5P36egz4tA@mail.gmail.com>
X-Gm-Features: AaiRm50zAMQyuOqOMShC7p8QBddRSQtjgcFA3eqIr4s2RLLOJFiABlken0Mbi5E
Message-ID: <CAMuHMdXevwo-dgURJimDJrrfgt108v9TR=P1fq6N5P36egz4tA@mail.gmail.com>
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack traces
To: Richard Weinberger <richard@nod.at>
Cc: Sasha Levin <sashal@kernel.org>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, ksummit <ksummit@lists.linux.dev>, 
	laurent pinchart <laurent.pinchart@ideasonboard.com>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Steven Rostedt <rostedt@goodmis.org>, users <users@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CCA3E1EAA79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-0.804];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2873-lists=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nod.at:email]
X-Rspamd-Action: no action

On Tue, 3 Mar 2026 at 07:26, Richard Weinberger <richard@nod.at> wrote:
> > Von: "Sasha Levin" <sashal@kernel.org>
> > Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
> > lookup table in the kernel image so stack traces directly print source
> > file and line number information:

> > Memory footprint measured with a simple KVM guest x86_64 config:
> >
> >  Table: 4,597,583 entries from 4,841 source files
> >    lineinfo_addrs[]     4,597,583 x u32  = 17.5 MiB
> >    lineinfo_file_ids[]  4,597,583 x u16  =  8.8 MiB
> >    lineinfo_lines[]     4,597,583 x u32  = 17.5 MiB
> >    file_offsets + filenames              ~  0.1 MiB
> >    Total .rodata increase:              ~ 44.0 MiB
> >
> >  vmlinux (stripped):  529 MiB -> 573 MiB  (+44 MiB / +8.3%)
>
> Hm, that's a significant increase.

Other random idea: this data is only needed in case of a crash.
Perhaps it can be stored compressed, and only be decompressed
when needed, or even during look-up?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

