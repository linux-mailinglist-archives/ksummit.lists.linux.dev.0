Return-Path: <ksummit+bounces-2416-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08251B8822C
	for <lists@lfdr.de>; Fri, 19 Sep 2025 09:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C937E173AC4
	for <lists@lfdr.de>; Fri, 19 Sep 2025 07:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43182C1599;
	Fri, 19 Sep 2025 07:17:56 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEABD277C95
	for <ksummit@lists.linux.dev>; Fri, 19 Sep 2025 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758266276; cv=none; b=Pc3smKp9heCICAiHaqTUlc8iJzUS2wOc1qmpB04cnsOZvFQzj2Z5G4ohETaed0j5H71swkiyQWsyM14VQBqJw+EyKafmVEqxsyQL/G2rHpC/Hfc4P8iQY6DSKRb6DclMyksqa+HsFKOtN4UsodeMec/pXW90izBRBkFi0oViqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758266276; c=relaxed/simple;
	bh=wb2qdIEva+9wMnDjLkyVGNO79u5HZMke8qdhK9b51SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dduFCNJTpKMD+mLTgvD+kuK/mC4qZJonR02QgBjYJ0P5KFd8pIYu9PA0zMzTGph4dewwwqAjyTswxQVQUuY/I/pzqGU7Gd20EWMnHpcbYY7gt9b2ovJgGSPWUdP6vulvYHReWZYUskyZt0qwfs0VhSPkQzIE2P6+IKrjB50qyco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54a86cc950dso160127e0c.2
        for <ksummit@lists.linux.dev>; Fri, 19 Sep 2025 00:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758266273; x=1758871073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jN8ls4Umh9EIXSEQoAkCyXxQ8L8mjN2Gdzzs4J/riyA=;
        b=eO0WlxF4nt37ZNiDCsSjQziJh+YbobmyAuwfkUIuIFgVxzEnKs7ul+/bzFWagIdR26
         hIqz/kqiO/us7nWbHZ5TlcFOpQDOc/HuYss61PLo5Rzg0c1LmYHGJHY8MqzxtM1peL8t
         arx0MIvcRkDCJvwwyNKI0ELGSn0FIzb7JBbX9mrQMoCEwTbEWkQAIGcaFC00SaiRWGGR
         fW5roTR6f3YIMgSOg2aZkMYBlGvMP+Ppj+CfMy/d1G4EQ+81vnUDvzKWigsrxcirWVO7
         G+xH6jE7eExgYJ+kOUn0jZCUuJ/5Q8Mt9QyOOpLC4tvfR0tQLJQAi+LGcVKfDmDH4oFj
         euag==
X-Forwarded-Encrypted: i=1; AJvYcCUuZus2lunjkQOXHfviMUmszAIkFO4blDbJ+Dgb67UeKoYCo5ObtfP6G5EJhr/vJoa+Y6YaCKBK@lists.linux.dev
X-Gm-Message-State: AOJu0YzbyOtnQsq3D8hmulYL0v0oqD5vlxM4sKbfr7ilMtXU8vdBvgIU
	F3a/QEeLkrXTOEFXfLyv84yeeSnMBtlFGez1FjpcARxB2GFxqgkgr3Ayclbek7Eb
X-Gm-Gg: ASbGnctQUijQbTKbOG1a/YQxBDT6ZzpUNSTTIxQS18Fh+eQUYK20SwvTiZrhxSxsZnf
	bxvZH9J4J/GIZjZYNumybYtQ3FEwqhbS+WNa58SgXQsPr5gV28+9qryQ4MDhjV+LPnSN0Il/Cp1
	3AifpujhMT8RL0n8j5l3/upJgtoFXKffbXARY72uIo3K5aEgcSPkDNguJhwE1k1nM+Vfe4ozpb9
	5w7Q691gNTeR9qOlGxXJTkeGK9rwOBAHKXZPYmg2tl8vxeZiWa9GO8kQeQXZ8yHWUBRa+VUPj4b
	JGuaGPZi9t67jJ5uFxwllyC8KVroJVw+U2zm7zOUVcCTncNGFPhkjPk5nuai0vPE+iJ0PnrEiw6
	SaSIMzx8wSVIeN/Wyf9mgE0HcZ7oIrY+jgHwIabURyd4yKSZG6G69rRyD/tHC
X-Google-Smtp-Source: AGHT+IHT4PzVt9Z+3vTUZrqI+UYZ3c8nRIevfQnvCbCRBcd1q/16pduyxMp/dv1vTaDwEmHeADBEYw==
X-Received: by 2002:a05:6122:2a14:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-54a837c4a75mr666108e0c.3.1758266273459;
        Fri, 19 Sep 2025 00:17:53 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a8076bc4bsm557988e0c.11.2025.09.19.00.17.52
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-890190c7912so439425241.2
        for <ksummit@lists.linux.dev>; Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNk+evTjM4h6jgb/X0VdMHEwzXdY5s/SZpW0Tpqb1VTTpa/7BsaDde+6i4XG+gvwssnAb72DdQ@lists.linux.dev
X-Received: by 2002:a05:6102:534c:b0:55d:b35e:7a58 with SMTP id
 ada2fe7eead31-588f3357b74mr639278137.23.1758266271934; Fri, 19 Sep 2025
 00:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com> <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 09:17:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
X-Gm-Features: AS18NWAI1tRNfDFQjIFUy24j2rmv5VjIZdZQpBy05JHeqlSMB-7iVf4odZQDlmM
Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
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

Hi Arnd,

On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
> > On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
> >
> >> I'm still collecting information about which of the remaining highmem
> >> users plan to keep updating their kernels and for what reason.
> >
> > On this topic of removing some parts of highmem, can we say goodbye to
> > kmap_high_get()? Only ARM uses it and only for
> > !cache_is_vipt_nonaliasing() systems.
>
> Good idea. I think we are almost there, just need to verify that
> there is actually no impact for existing users. I already knew
> that there is very little highmem usage on ARMv6 and earlier, but
> I tried to recheck all platforms that might be affected:

> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>   get kernel updates, and the only one I can think of with
>   DDR3 support, but seems to be limited to 256MB total memory.

Are they limited to DDR3?

IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
new variants of old SoCs, to accommodate the changing DDR landscape
and market.  So perhaps they also accept larger RAM sizes?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

