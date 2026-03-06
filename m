Return-Path: <ksummit+bounces-2887-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKgQFPCwqmluVQEAu9opvQ
	(envelope-from <ksummit+bounces-2887-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 06 Mar 2026 11:48:16 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A05ED21F1B9
	for <lists@lfdr.de>; Fri, 06 Mar 2026 11:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58871307E25F
	for <lists@lfdr.de>; Fri,  6 Mar 2026 10:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A6737C91E;
	Fri,  6 Mar 2026 10:44:58 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E4E8479
	for <ksummit@lists.linux.dev>; Fri,  6 Mar 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793897; cv=none; b=Uhxnmo8Lpg4fK6AkunpNfj6+jz8oRiImmeEUXigY73hKz3dYGQRMnTJRTTgpzOx6REvSP8T2usE24dsWHnh6Bqknamgv7bA/BG7NCGIy9XLxbom8mYCtIlu9uTFijOMtsfiIc4jmvl0RgAoB/vsRT/WBEgu5lZtoDGQLzDm/IGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793897; c=relaxed/simple;
	bh=1zt/tGWfU6XSeiMUoSbPil/YdJEBmMMp7FvEAIcLXLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJw5Rt5rER4JF28DzFtIcyn1NqR2KsW2cUxuqOgvSZSd1e3Vs5bGDwcuH9M6pYcjICEsYaIkaRaSr4rnRsSOvr0YKfUYXz1LFOPNGwRu3ob47jzWTl7vQQeK+PaYDTkOduERCuS/H/TAvW8+YJBlQLxRIPpsOfELj/JeS0EM5GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56ae58f3fc6so2675810e0c.3
        for <ksummit@lists.linux.dev>; Fri, 06 Mar 2026 02:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793895; x=1773398695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYOh8z0OkMlPfgYM6lkc9gDq47Kxx4iNe9wNJJ9eqes=;
        b=lrirjQqv4CVzEEn6Si8onsSBsySE/DxYlDPf5zXZ08g/Xod+Ull7nM0aiy0kS5M8B7
         psPMDsWuwxt1vyk/tTAPG+uHAa5FIkbBfii/iGwDf4ALpjuwywxUsWYtMkFKSvi33DwH
         ZRcHPYVfIbmyB36sHo0PtBj1CT5MpRpEkcMs423Tsv2kKK/qKVvrVwfrfhrSKT3NxPIu
         HiqrfhLbXqRul+GSwbJo7scZtmOwW4t37Cx+JGCvk7xK6HhShekpDY7uK6NN+VqdmkzA
         K2pjdB/u3hfc+Y+3XpHTrqw4yY3Dwfmy/CimYEfB8+qqmwLu5kXuJCsIYbYWJffXH0QW
         Taxg==
X-Forwarded-Encrypted: i=1; AJvYcCWOOBuBhe7j6yXzL9HbL3nmkWnBqRc46RuzOszh7rKWxnrv3C7pMMzUNpdjze5bukA7iKK7x2xB@lists.linux.dev
X-Gm-Message-State: AOJu0YzmQBQ0EK5z0PxWOQTUB4//VeNFntHSefGykjrUG5WIHL/QfB9e
	P5OQQjniEAWh4AI8bGgcZwxb6OgxWf9ado0zh5vmYFg18+XEkjr6kxwGECc1Lc7Ql8w=
X-Gm-Gg: ATEYQzxgU1mAyEctESEzRtJJU+McrMNtjHRepdjP5lQ/u6GpLvW4wPo1oYqcA3xiEew
	IJtYxFGm9cBEKPmI/21ggzBUVxw5rFho++hyOknOoxpgSVXfp3Dd5K2aHI6Be5uonK93DcG90Em
	wNiSWOxbC2OsxbR2Dos4hZpeFpMPztRgrw+18zzULc5+T0XNA1RxmvH62swHBYw3SuGOD1kFbEH
	I1QM/qVJR2lcaspCcqew21/nEUGH7H/peIKzdvt2lzUpOjyhyeIW2rOx+7fb4PGRMK5WGJsMZQj
	3z2jvfMxa31Jozn2quB3q7Ncx6VEfigDRyYCSnoYwphuiEafRPebzE7YMjcg7k20XDvcPwt9JId
	4A7HEmeuctGm2cxiY8NO1lYvCw4DKEb1aJVpZN/m0abIUbyEGTQ2/AGixvhLy5AS3oAc+fBTpDd
	bkT8Pbo2CN0oN8VGfnp+DAJrDZVRt/ycaCMLzqKm0BO16jmwaWsK6RKeXJKtKI
X-Received: by 2002:a05:6122:2189:b0:56a:9f03:1719 with SMTP id 71dfb90a1353d-56b07d4ccfemr576412e0c.7.1772793895176;
        Fri, 06 Mar 2026 02:44:55 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b20d3bsm964977e0c.16.2026.03.06.02.44.54
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:44:55 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94acb3d6cceso5145438241.2
        for <ksummit@lists.linux.dev>; Fri, 06 Mar 2026 02:44:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+U4gdxT0GO86DRHpnYyMRJX5e3e1n1+vTSj3jpXbAcWQMdbGuNReltv6Jiw6wDYo5uXxRcrXK@lists.linux.dev
X-Received: by 2002:a05:6102:b10:b0:5ff:ae5c:c669 with SMTP id
 ada2fe7eead31-5ffe635a574mr560276137.37.1772793894808; Fri, 06 Mar 2026
 02:44:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org>
 <20260227101631.67756268@gandalf.local.home> <677258882.1999.1772206555300.JavaMail.zimbra@nod.at>
 <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
 <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at> <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at> <1617579485.3599.1772793456949.JavaMail.zimbra@nod.at>
In-Reply-To: <1617579485.3599.1772793456949.JavaMail.zimbra@nod.at>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 11:44:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUoDsZeewXFevLR4kw6iWXwrGRzdZ+N5BFzzLUuLu1Ww@mail.gmail.com>
X-Gm-Features: AaiRm51GV3FITmKr6r4A379PYK1Vx2QDMm6RfWcgMtb3QEWNHLegAv3GQ02mONw
Message-ID: <CAMuHMdVUoDsZeewXFevLR4kw6iWXwrGRzdZ+N5BFzzLUuLu1Ww@mail.gmail.com>
Subject: Re: slowly decommission bugzilla?
To: Richard Weinberger <richard@nod.at>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Steven Rostedt <rostedt@goodmis.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users <users@kernel.org>, 
	ksummit <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A05ED21F1B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2887-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,ksummit@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nod.at:email,infradead.org:url,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Richard,

On Fri, 6 Mar 2026 at 11:37, Richard Weinberger <richard@nod.at> wrote:
> > Von: "richard" <richard@nod.at>
> >> This, on the other hand, would help quite a few people.
> >>
> >> Also, broad categories with optional, more fine-graded subcategories
> >> would be nice for some areas. Like mm, which has 18 entries in
> >> MAINTAINERS that start with "MEMORY MANAGEMENT - ", which confuses
> >> people that do not know "if in doubt, just use the entry for MEMORY
> >> MANAGEMENT"
> >>
> >>> heck even a stack trace or a BUG/WARN_ON/Oops
> >>
> >> This even more (but of course this is harder)
>
> While traveling, I found some spare time to prototype my idea:
>
> https://git.infradead.org/~rw/kcontact/

[...]

> Currently, the lookup table is constructed from an x86_64 allmodconfig build.
> Having a combined table with other architectures is possible too.

Nice! I threw a few arm/arm64 crash logs I had lying around at it,
and the results looked good enough to be usable!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

