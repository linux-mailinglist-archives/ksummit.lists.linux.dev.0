Return-Path: <ksummit+bounces-1702-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0549A3C22A
	for <lists@lfdr.de>; Wed, 19 Feb 2025 15:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1107B7A64A9
	for <lists@lfdr.de>; Wed, 19 Feb 2025 14:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D1E1F37BA;
	Wed, 19 Feb 2025 14:31:09 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49EA1EFFA4
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975469; cv=none; b=LGV8yQDjHlTQ4C3aHMDXvA5GjqVROqqRXuWv0w5JAXOEneLw5D2d6IumnR/UpFl18ivTUj+IG6VxSl6taXWEL3btWMi5gc4YnK5YfWwrbQe3WVb0g1/hGN+E+hEQUWgRN+zGFavNranxCQAq1vj6gbF82c16VjdLfHAxyoynHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975469; c=relaxed/simple;
	bh=xfKXXLwRuUlkoia2+3OnSbJipVII2jZrBsMVFyp8nVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVINu7Wr+fvzJOp64D8Ie9a6/z+3D17JSRJqnhvRUD+ZDCxKasG2zKO34s/ctcN5500kOh+TOqHZBiIuUhu4joGWehLe2UwJl4njcMtEncQHWvLJ9jGBRutxxaTle8iWB8Kte4az12YpbN58w8jpvnizGcz+7W8rIqswBjt69NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4bd35d4407aso1523956137.0
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 06:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739975465; x=1740580265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+U1Ccue1bhBxPmApsgmqMneskFCST8/Za4NkTSJezM=;
        b=DAJSKpRJAiTFmfoC38UJw2Q8plFX9TO9DV+g+RwHu3HY1PTlDK0WKhBYFuywFIynTa
         A7caCpisbsmDR7g/dSqxqmtfoUFuLN2LxmopKK2Jk0t/CMcvUjUacab3R8kbHYSpGS9X
         LR2YaPaezb4qhiOCleCNXeMVyKwGbhjwtP4vKxyRGKxrQ9WC2UcOOUI4TiBlzOhRlZ9R
         a8jQD+DLWCArMjz2e+u2FPDe3uhKLS9waVNil2QUCIJzd48rsEHLpUqldZN003bPf+On
         LzIkWROPqXAWJmwkr10HwXSImbbo6DO+zYye7AxOmSVLPYeiI6wtNRpGCjD4wNx5BArl
         GYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMC+HNr8ZaKFYrXO5JD0rUpKRxzVZks6Jv93UM+25SsMBDt1PQPMwzdX/vZzSwaZO0UOfrVPin@lists.linux.dev
X-Gm-Message-State: AOJu0YyTRV+c5SRNsklE2jqqHOVrzW1oV0Z4S61CABFjEIS+cltZ2/m9
	vyh4bJQopFqZuAEgQhdrzbpjd1aHdz1pjXNKMRLXOf1bG7mgkfm5nIy3prRf
X-Gm-Gg: ASbGncuyYFkMWIs9qtfejLW3LW2V/Acko70f2LNRqsd5YADbRrXdEdzeMmEhOAGdaOC
	Bs16dOXTM2YqSCjnujXuBGQiUIjMqR97XjROV/S7iz5JXAwS7uHLy3Zi0oQc6iJq8xNX6+njfbL
	zSqBAQyIajL7BgYot47B/Or+pzkaN3Jbe573srv+nHkRMzORzKCstaU8vaou/w6VsrRyTklhLHq
	adJczlzy6V8qbYbgBlweJf7Lg5XoEpPZkccyvXJleLF1hWRswfSjNFGx0WJ0OX8LQqTorV7ApV6
	hiz7vZph/7Xc2egIq8lPBkYBuJb5moJSLCvVXjnMhWGHViMByzaqHw==
X-Google-Smtp-Source: AGHT+IGNnGIjl4TlQoh1CishvXY+dPoZNZzxij5MYHtq2I7Hp4mNrZ6UDTYT2s5snoyI20h1l+zWQA==
X-Received: by 2002:a05:6102:d94:b0:4bb:c76d:39ec with SMTP id ada2fe7eead31-4bd3fe466d6mr8999917137.21.1739975464875;
        Wed, 19 Feb 2025 06:31:04 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be638f00b9sm1429949137.12.2025.02.19.06.31.04
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 06:31:04 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4be4d72bceaso1097002137.1
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 06:31:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULv9gvdFBOLs0meUwzz0u7IeQfKykMB1eorX1+pBA8SeKDPJ+PR2wgSMinKHrqmNHSkBW3OLr3@lists.linux.dev
X-Received: by 2002:a05:6102:3fa8:b0:4bb:e6bc:e164 with SMTP id
 ada2fe7eead31-4bd3fe8d0d1mr10493845137.25.1739975464222; Wed, 19 Feb 2025
 06:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <b7a3958e-7a0a-482e-823a-9d6efcb4b577@stanley.mountain>
 <2bcf7cb500403cb26ad04934e664f34b0beafd18.camel@HansenPartnership.com>
In-Reply-To: <2bcf7cb500403cb26ad04934e664f34b0beafd18.camel@HansenPartnership.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2025 15:30:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcBKpiCPE7b4UR9TdmqT_4D8_iptAczYX7XE0Xn7hr=w@mail.gmail.com>
X-Gm-Features: AWEUYZmdGuQ19HJ0giDqUtCD9bdUS5S-NFaDx72LYhzhau0l0yfW-E_DDpKNmz4
Message-ID: <CAMuHMdXcBKpiCPE7b4UR9TdmqT_4D8_iptAczYX7XE0Xn7hr=w@mail.gmail.com>
Subject: Re: Rust kernel policy
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Christoph Hellwig <hch@infradead.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi James,

On Wed, 19 Feb 2025 at 15:20, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Wed, 2025-02-19 at 11:05 +0300, Dan Carpenter wrote:
> > On Tue, Feb 18, 2025 at 08:08:18AM -0800, Christoph Hellwig wrote:
> > > But that also shows how core maintainers are put off by trivial
> > > things like checking for integer overflows or compiler enforced
> > > synchronization (as in the clang thread sanitizer).
> > > How are we're going to bridge the gap between a part of the kernel
> > > that is not even accepting relatively easy rules for improving
> > > safety vs another one that enforces even strong rules.
> >
> > Yeah.  It's an ironic thing...
> >
> >         unsigned long total = nr * size;
> >
> >         if (nr > ULONG_MAX / size)
> >                 return -EINVAL;
> >
> > In an ideal world, people who write code like that should receive a
> > permanent ban from promoting Rust.
>
> I look at most of the bugfixes flowing through subsystems I watch and a
> lot of them are in error legs.  Usually around kfree cockups (either
> forgetting or freeing to early).  Could we possibly fix a lot of this
> by adopting the _cleanup_ annotations[1]?  I've been working in systemd
> code recently and they seem to make great use of this for error leg
> simplification.

Sure!
https://elixir.bootlin.com/linux/v6.13.3/source/include/linux/cleanup.h

Unfortunately these may cause a new bunch of cockups, due to
forgetting to call no_free_ptr() when needed...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

