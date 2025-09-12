Return-Path: <ksummit+bounces-2378-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129EAB54E51
	for <lists@lfdr.de>; Fri, 12 Sep 2025 14:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69D50A0278E
	for <lists@lfdr.de>; Fri, 12 Sep 2025 12:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70045304BBA;
	Fri, 12 Sep 2025 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BwXvQZ8N"
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE3B846F
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681208; cv=none; b=nqhd8j0O9oslJT2Gn5Ecu8kh3l2MBISsgmkAx5sChOKpDqUytJDLUEpWYbJwNvRQf6XSPUgXHkv2miqtlmyXGY8jvh4pxGI2Vh1+sZhugGo7MCZUcJVtlhmnIJIHHrbORgK1dj2xxGh0h90xtBWlHBlsiphnQyi4h+DEc9xema8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681208; c=relaxed/simple;
	bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZcLi2bj+scPy0P6iRrhBZ+4f6uQofGMf2xupl0CnMlWsihPAsOfwd+Of5Dd+ijfFK2b4PQW/y4WG6uM+E/dEr6s0HbZhud5bE9ztUr3T3vXBf2wBIEDTP2gj0FRHhODO0b8Gzv9sn7/qA2ODNUr3/D8H5MetokIO6miPAL0ysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BwXvQZ8N; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-336b071e806so17101291fa.1
        for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757681205; x=1758286005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=BwXvQZ8N6QbDOnvfjc4j+yGXPMWrnAHDdrpIRKbKG3nqCcTKFzygUDwEUZR1VovSm0
         iBnx+jdEHx3d+Q1MrSX9E6onFXV79x/W+62v6IzgGYybTGgfqtkj6rpuLmAM0C8UuPWN
         Fb3q60K2vb0KIasxyK63FgAftk8A1NNDWM3m52hlIa7t6muPoKlJirf40bbiOTWL+aqu
         FAyPemtGlQGRteFrnMgxSdrMGBQ4NZNEcRg+e48CDCuqLmPblvU5zrljiiamTZCsIjMW
         D8PjkT7vGH645Wp4xErCIo7wCU4DuF+1g/O85ZuSqTL1SDUjxqfeU830PXe/7K4I/CXa
         wCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757681205; x=1758286005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=OqK2ckmOeKAXzGhF19veBjLcV5797ZKoDlwuqJygadZh7XCtL+zWu9BAsmt/8CmuLl
         xHHv1NZFm+UcQRMjY1wioD8JUCa8Vrz+Hac5tOOR7qugwxKYUgT0xXEY3BM8Gyc3YpIN
         7+oUD5noddyxGVV7FollMZzwB17joRqgN6aT7unL3Nt/rOMjyAlqxdisF1BJlk9itU+f
         cGIeFre3JHOI7vNdAVdRQNayks946RPPgwnYSv+Yp8gm1wdp3DeEdb/RSOndYDc2YvcM
         4WF6Litbu4ohRJuVNmrwvYhRymwK1E6kZ4I3ghflFZ9McxWMf8t11C/i+O0/ZB+bhoFO
         6RJg==
X-Forwarded-Encrypted: i=1; AJvYcCVYdZ2XLjOhK2o6iAwl5CPRyqjISc0pGbHed9zIp7l14ksvAo4fFhmawN0X404mZCwlW0GCM8vs@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvycqx4CyT+xwV1BDZNyzub/Lbl4DSVd3So9BuzRNFtHLKd8l6
	JHwNC3883mm/w8EQSloSc18NHedRpTA5LNA2UDYC8dqpEENW1AQqjXDGORPE31wI0zOw67ucqLy
	riFb8Fg0rPXJcSMQFte8JmeloxtVtu9ylpV4u1w1rkg==
X-Gm-Gg: ASbGncsBd+Tx5DUctSf+9z/O/Yw1Re7mgP74Fv5D/rsdH/7bI0UyeJqqNgXPhvi6+IW
	JDliKwiongSps8Is20vbTzyu7NoKUoTgZi/hrOc38SDA7vnxKLsKQPRQlIYutViyuK9X6vi3lXF
	2wm4gL26nuZjAEieIZCwyBqhCHb3PJ7rh11Pvvfj0kPEBxzVSGFZazW3I9SjXsHIaOqg9mKMhA7
	uJbni8=
X-Google-Smtp-Source: AGHT+IFceSrS+iukkr/XkXsYJuXAC3/mzUt2kTyPUu5TFhzIuaRO7o+4f66lybawSyOyyY1O0N/R5wKHhfBQZAMqWCU=
X-Received: by 2002:a05:651c:23c5:20b0:339:1b54:b367 with SMTP id
 38308e7fff4ca-3513b296a39mr5927901fa.18.1757681205355; Fri, 12 Sep 2025
 05:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
 <640041197.22387.1757536385810.JavaMail.zimbra@nod.at> <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
In-Reply-To: <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:46:31 +0200
X-Gm-Features: Ac12FXysdXrp8ARxlqs--JPKzGSESzQlXQvRlkFB3ZYER3az5tDF4P1ySurKojc
Message-ID: <CACRpkdY9VS1H642wSUsLvwi91YOwXGkiePdq+JktDSeiWTon8w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Weinberger <richard@nod.at>, Dave Hansen <dave@sr71.net>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lucas Stach <l.stach@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Wed, Sep 10, 2025, at 22:33, Richard Weinberger wrote:
> > ----- Urspr=C3=BCngliche Mail -----
> >> Von: "Dave Hansen" <dave@sr71.net>
> >>> Even with a new memory split, which could utilize most of the
> >>> available memory, I expect there to be issues with various
> >>> applications and FPGA device drivers.
>
> I also remember driver problems on older Marvell NAS systems, which
> we never fully figured out, my best guess in retrospect is that these
> had devices with DMA address restrictions, and if lowmem is small
> enough it would always work, but any lowmem allocation above the
> hardware DMA address limit would cause data corruption.

This kind of mess is often also driver problems, in the Kirkwood MMC
driver there is some dated code traversing sglists iteratively
instead of using sg_miter() on !DMA which I think is not entirely
safe either.

I wanted to fix that driver but the hardware is in my NAS and
all the time someone is watching a movie from it :D

Yours,
Linus Walleij

