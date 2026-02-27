Return-Path: <ksummit+bounces-2844-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG5fIJfCoWkVwQQAu9opvQ
	(envelope-from <ksummit+bounces-2844-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 27 Feb 2026 17:13:11 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BBD1BA9F3
	for <lists@lfdr.de>; Fri, 27 Feb 2026 17:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A70B3093D65
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A845B44B68E;
	Fri, 27 Feb 2026 16:00:31 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C282644B689
	for <ksummit@lists.linux.dev>; Fri, 27 Feb 2026 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208031; cv=none; b=esUXHxluW9TZkx81yer4CHua3zNB4oaBBUqKvs0UNmY+eo5Djj2NFQb0qGiHZ/3uy76zp2Yg/toxlOgb4zJgLTPQODZ0r17lCITCOdBehPg/9OODobRUjI73q7+wUUIzFUaEyqMCqafVNaZN4f4jZM6nHyxdrwpv3rrDz294W+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208031; c=relaxed/simple;
	bh=C6ij9Pv+KthNFd+u0NLmqyeRVvbXuWCGZRJE3yZykUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXSr0jYOQipYZIbF7NqDInMe6ryYtFDMNR7L8SchxZcjXjRJ2LgYRyVTOD7riSMjzFWvVWN+aEOtzB8Uf5sdLpUncnZxNtMkrK2OMSQaiB1zsvsP9jCwM+IxCfJMoO8GTrTXJ9Q8LITOMYqBeLV8WYA846lQniMavssxA2tDflw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a8dce7235so757502e0c.1
        for <ksummit@lists.linux.dev>; Fri, 27 Feb 2026 08:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772208029; x=1772812829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYj66+1FdQ5QV3PBY3JUSzuGMNGXMDOS0Gs97hvScLg=;
        b=o0xFPYpq6gniTXfsbBZiBgDByF38s3nl5oKn2lN7orCCO3iK5wZmKX7KEeh01JoCDo
         AhYaXA+Wt7W3l+EuOLl2J3Mk32Mpfslc4UBJRcJ/JESQLijUrRaQBbW6i01vMp/lrZzG
         1gNq5oJhzm4J4Fo03QLjf1kXZwlR4mxeiYn+73kXkRmLhIEahoYU39ckcrfkMndxDmRw
         cNe0j0TcsgmvmxKLCmaT7Md4LvHVrKkvvduHkV986bg055nOhB9/opNGnksm9PcEU12R
         /yqypl9iSvkgo3rXjc/BCKL8/dnNuzNT2Y5rGPTb5fAOeEOtX/+B5kQvAFb+Q8VVt+0l
         lCSg==
X-Forwarded-Encrypted: i=1; AJvYcCUO7I6n+N/v2psHyvdFW1PS0jM8qJI/GF+QDCDccFtsQLLTMbTFMo2IR92TLTUWigvVzz48mT0S@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2aR7818RGjX7Adm2MHxXOY8khUlGXtYkkjWKOC5faVDnRWYSH
	pLSBdYXufiodPjVg99ozCOFDf3QyA17ASjO396zIbz+bLCSAc9MTjtcsWNsckUOa
X-Gm-Gg: ATEYQzxpr5teOdqS1CxQVa2B63LxMHaLmDKrdEt4U7MPjenp1teHC+IqqF+C+RhB81q
	pyQ1cOFXNJ6HtiqCXKOwQjNJ8it9ABsqckXHnH0s0y01gc/oQqU96ecHYU0B3WUHpH+CA32ZINf
	+aV2hPVUF1cSQC00Ol7W6FUylDLgrzb2emhLLuPrQuEusflKorb+Zc/dySlvBuIxUk9vVhPn+KL
	e3Oiunn1TKpU3WCngR3JCqR7UppG6m86GYBmHfAD1EHm7pQgFOw67/L1xUMSxWcSnF3QOLjJdl+
	jE0Blrzwjfk3v0xhRM5oI/vRGGM1bYvFIrOvZw4eXlLpdljfsb/EtQbyuj2dU/AncG0jheW99sq
	sO7NLTcHyBfW8ou9hyUWuPuY8qEbl9602uWRRujtDbmShU3PYiocJqOddr7hakf7ny4hgSAp4I7
	yaVD7wK/zzmkoQIWTTf9euv4BlnqYYDKJxZOtogJpXCzIHR5vI7721Mh2dkZyZ
X-Received: by 2002:a05:6123:a9:b0:567:4722:66a3 with SMTP id 71dfb90a1353d-56aa0a4c4femr1648591e0c.8.1772208028452;
        Fri, 27 Feb 2026 08:00:28 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df644d593sm4932648241.7.2026.02.27.08.00.23
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 08:00:24 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94acf3fa688so620512241.0
        for <ksummit@lists.linux.dev>; Fri, 27 Feb 2026 08:00:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeLH7ku+QM2EGYlVJ2fO/pTWAUEaUgzC0TZJ2zzJsDCvYyAX2ihl6rhKOeWkimw5xdgrQjGb+P@lists.linux.dev
X-Received: by 2002:a05:6102:3746:b0:5fe:49f:e89d with SMTP id
 ada2fe7eead31-5ff3256fd36mr1678278137.36.1772208023630; Fri, 27 Feb 2026
 08:00:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info> <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org>
 <20260227101631.67756268@gandalf.local.home> <677258882.1999.1772206555300.JavaMail.zimbra@nod.at>
In-Reply-To: <677258882.1999.1772206555300.JavaMail.zimbra@nod.at>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 17:00:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
X-Gm-Features: AaiRm50zknxRFcAk5K4X5W3iXuJC4dJtPMsUf5iySci-V0lJ7jy7n2JzmTzUzsg
Message-ID: <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling update)
To: Richard Weinberger <richard@nod.at>
Cc: Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2844-lists=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	SUBJECT_HAS_QUESTION(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,get_maintainers.pl:url,goodmis.org:email]
X-Rspamd-Queue-Id: 96BBD1BA9F3
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 at 16:44, Richard Weinberger <richard@nod.at> wrote:
> > Von: "Steven Rostedt" <rostedt@goodmis.org>
> >> Or heck, add a front-end to get_maintainer right here in this web page.
> >> People paste in a pathname and it spits back a bunch of email
> >> addresses.
> >
> > This actually sounds like a good idea. Someone just told me that they found
> > a bug in a driver and I asked them if they notified upstream about it. They
> > said no, because they didn't know how.
> >
> > I just told them to randomly modify the file, do a git diff and redirect it
> > into another file (making a random patch), and run get_maintainers.pl on
> > it. That's a big hack and having a better interface to point others too
> > would be useful.
>
> I'm pretty sure someone can vibe code us a neat webinterface which queries
> get_maintainers.pl in the background.

... including a big fat message wrapped in a <BLINK> tag, which suggests
to check manually if a few addresses should be dropped?

Or perhaps this should be restricted to return mailing lists only?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

