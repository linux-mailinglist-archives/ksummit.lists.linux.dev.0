Return-Path: <ksummit+bounces-1631-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F189AD440
	for <lists@lfdr.de>; Wed, 23 Oct 2024 20:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 596D31C212F0
	for <lists@lfdr.de>; Wed, 23 Oct 2024 18:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B44B1D0483;
	Wed, 23 Oct 2024 18:50:25 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C167015EFA0
	for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 18:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729709425; cv=none; b=gAxoVIdQyhgYw0RcUw1JkaWnTnQKqeUHh9XPu6tDlvMMe5UiBWsT9dKLy8ckuR4J/Y5B9sSMgCzYGyYaT2AuvTsIFh4IYyIEiA5vpriVSOXvizVtlPwd+rYGQEXGVsFNq9qKM+1vlFE4M/USl2BJvJlyueIxcRe8zyGK50A6MSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729709425; c=relaxed/simple;
	bh=nM4GHTAct824hgNQTffHgJkZKx3+nDD1iyj7MpKVlF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSFptsej4kLQYHV7CgevKpYCno0tP6FJMuaJSqceVaRT9ynk5R5ZHQnkN54oXCLnCXJmuwmYQJQxRV5JjvCRYv2XGZcKyd23H+jHFQGvVN6w89PHAR60Wz/qPIpoFHGcmsKbAWCMfNeQejFlFgPmuodmq9A2CiB9H99E6LG52Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e28fe3b02ffso128217276.3
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 11:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729709421; x=1730314221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tx5iw+dXV5zNGB9sz5cE4SmDR17PiRyOqtTpREu4aVE=;
        b=NhdF6qlfCfFjqqKr+IDq4VtPw2/0cDE2M5bMv/yXxdaR/HgS5CHMQ+7pqSlV0QUMPA
         KXp9Yv1k9MfkRPv8DhOTwvE7vI2HOcRnO5nueFHwG+fFBTJAJXu7tPaYoR97u/e5ELyl
         FyVqFiGiaWtdDdQpBWJQe0Y68AR1uDhHPjKfRYYWb/IzOiDEJQK5d7qb0+3pZACVpB7l
         pjXIedEkw1Byddo6IC8QvYexHsDqifrRdJA6++uE+ReM5UphHHRpk5Gf+kB4KFo8nWzi
         7LV5v0YsawXOc6k8288EhOyvBRGNdgBX3bMEmdhHnIQBB3eI5XxttLJhW5TLbsflpdGA
         dVeg==
X-Forwarded-Encrypted: i=1; AJvYcCWcAl207e+mCAdNpL4t1O8Eo7PD85yoNdB4GRkmlXDV+pieQhQaxxkj6njG24sdLdrplavw+xdJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwYMRzA+YDdUAXXnaSnQLB9hjkuq7CY2A/s/UJxVs3Q6ANYYCaw
	fCl/zyY9/2ileDg+Efo+eu18ElQRxVf+NbixFWXYCU2e+ey499S5MYYEMjZe
X-Google-Smtp-Source: AGHT+IH234ga3nTHKd27yXUn5kgjGfj0zmO2dCiPtjfdbPs/+MGRWKA9C+8FPJ8EctUwOzPGIfRvOQ==
X-Received: by 2002:a05:6902:919:b0:e28:a4f9:c2ff with SMTP id 3f1490d57ef6-e2e3a6e5cdbmr2977446276.55.1729709421411;
        Wed, 23 Oct 2024 11:50:21 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdc96ab58sm1578746276.5.2024.10.23.11.50.21
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 11:50:21 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e3d97b8274so705037b3.1
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 11:50:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLSKKp6hzK3o0PNt3JKyR/ANfMw1+ydeBXqt3H2/lAGgY56PXDVMGbkImzogeWHu65tnEdxmn/@lists.linux.dev
X-Received: by 2002:a05:690c:3145:b0:6e2:985:f4df with SMTP id
 00721157ae682-6e7f0ffc91cmr32597547b3.44.1729709420902; Wed, 23 Oct 2024
 11:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxZ8MStt4e8JXeJb@sashalap> <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org> <ZxdyYjzxSktk34Zz@sashalap>
 <ZxiOjBRdO6EMAY4H@infradead.org> <10b0cb74-2068-4819-ac91-fcf98ca8d96c@paulmck-laptop>
 <61e62ab7-50d4-40a3-8230-9c5e6814829a@roeck-us.net> <CAHk-=wh1j+yj6X9vaj6i+oy+CtwnUvK+2J9LkheLjHtKAFYrjg@mail.gmail.com>
In-Reply-To: <CAHk-=wh1j+yj6X9vaj6i+oy+CtwnUvK+2J9LkheLjHtKAFYrjg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 20:50:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMtr5jvPcn2KQvWFCRC1nhcdci_jzXh=M1a12XJTQmKA@mail.gmail.com>
Message-ID: <CAMuHMdWMtr5jvPcn2KQvWFCRC1nhcdci_jzXh=M1a12XJTQmKA@mail.gmail.com>
Subject: Re: linus-next: improving functional testing for to-be-merged pull requests
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, paulmck@kernel.org, 
	Christoph Hellwig <hch@infradead.org>, Sasha Levin <sashal@kernel.org>, Kees Cook <kees@kernel.org>, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, Oct 23, 2024 at 8:10=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, 23 Oct 2024 at 11:05, Guenter Roeck <linux@roeck-us.net> wrote:
> > And that is a good day. Sometimes dozens of builds and hundreds
> > of boot tests fail. Analyzing those failures would be a full-time job.
> > Who do you expect would or should do that ?
>
> Yeah, this is the problem. I think it's only useful if some automation
> (not humans! That would make people burn out immediately) can actually
> pinpoint the trees that introduced the failures.
>
> And I think that would be absolutely lovely. But I suspect the testing
> requirements then have latencies long enough that getting to that
> point might not be entirely realistic.

At least for the build failures, zero day does a good job, and does
inform the author and appropriate maintainer.
Unfortunately maintainers can still ignore any reported issues...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

