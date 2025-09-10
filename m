Return-Path: <ksummit+bounces-2316-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B2B517A5
	for <lists@lfdr.de>; Wed, 10 Sep 2025 15:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 105DD4433C9
	for <lists@lfdr.de>; Wed, 10 Sep 2025 13:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3E431A070;
	Wed, 10 Sep 2025 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tniTCycE"
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197A431079B
	for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509823; cv=none; b=oNxEqIHKZdsQRPudZwd6L4m2AdVamL7zxcKPPR/eXlU4s2+1CppumCxWvmLB0gp7T2OcVyXp+AAcxC+gY41gPx5SNUdeMVBDNgETHRnx2W9NPBR+jqNRPIDFoMHeIAEjCodxMo4cBKChDrixXJT9K+b+sU1LEB7TBsIDkI2O4xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509823; c=relaxed/simple;
	bh=tARB5u1V/RXYwm+IlZJX6Sogx9fWVBBiWrlM/q73HGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t8+0q5X05FUWtcS+1q5T+JSg6F8ekL8s5pPMN+bNU8rQSPXIElRmrqv2hfmg2ZXziFApudaZRHApdRapFGCGhijHlRubu4RBKb0MWNlpNqnnUQO2qNF9VjrzX7DogBJQGnr+fOeqgPzXCd8+tc/sIFkc2dE9FkfpHAONTPzdH4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tniTCycE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so4351876e87.1
        for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757509819; x=1758114619; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=;
        b=tniTCycEYjPV+vGLQeFa4mgWykGzxW6oX1zc5MxqD9q8dW8j2YW5DCl6rfQKg7j/Wj
         0wIjxX6J4DUEXj0+S61RUVvppchS8iOY4nGLoa54H6Vei3u00oDb7XU03vfYLMAWUPkE
         RfpvXGy54Hm3s+aAvgOx5xatLC18I2kBrkviYbVs2ttRUEHetZxTMPArftZJXvbX72k6
         MA8mCWeaVReYs8QpSFhMq3/WIGs+GEOa7FY0OhMFhDSUViCxriOYpWtKFh/Dch0ArLGb
         thUIg53YPjhPXO5RJn8TsH+GI2OoHYub1qGU10veHxCCGyD2thURPZCcVpSs68hjBkYL
         p1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509819; x=1758114619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=;
        b=AyaJtlvq1SQlls5Pisiir0DMwe+cmOBegXC/6g1JxZ5X0U7cEAAfJ0z+fZnFe/hwAc
         Lpr9V/yUIdwfSNb3r31ZbzAlif6zaeT64MwqApgu4Hieob8pMclkiahIaY7N0/RbvFrE
         jQkvT35RS8VSqKJArNKpRuFNWAcCFwsXChZGyD31ScyY5p1rVGKoSOLP0CRRu4yqUh6V
         lswCpaCMKpUUuZlUel8PugKuce/qa8GXiICk3HoA/5Pk5SfxI40UyNGJjwBYkvQjpreD
         tKG4AVW2yI+t/tD1uiqvWO+Fx9TUTCaQ2hvTyGk/9JrfYmt5WHAsB4cnZgOHRJGNgOo2
         XzTw==
X-Gm-Message-State: AOJu0YwlYbtBm+xL6WZLTSEllEf4+rkQuK+uO32/GGjeTYX5/aR7qhsC
	p9EI98H6ndG+r60ZDY4zzxWLwM0G6zqSZ2Xu9hEMe5KX3K28sVKFQIi6WiDCVddwZr5huimEBvW
	qaagbV3W73H4wQZFL6fT1K3OT/CAonSoIBYJTtwo6EA==
X-Gm-Gg: ASbGncujO8o4rYfQmZv6KDl37GQnkUJwmgN7HV96MztY8B4+koVStbFh302I88UiZQV
	BQqF5P5ZE/De/ZJEQ5TsgH4eTqVPjsvpv2plshgpAwNqJWtp3njKuAFg1ZnNEZnUgrhO/BhXObC
	b89ifK4xzSFFS6whTD6DdlKrdu7bML0P51vu/o/rF65xJ21LcauRH3lzWwWvsLe90izB7SFID5V
	eJjLio=
X-Google-Smtp-Source: AGHT+IGgInBj1Ic/f5mZf9DHaSimxT6oABg1gWpLpcYCM/ousRHHwwGjp7S7ZCbmXiMiFXeqAGANnBbsml0uYfwnmj8=
X-Received: by 2002:a05:6512:39cc:b0:55f:47a9:7d33 with SMTP id
 2adb3069b0e04-5626425ccd6mr5952206e87.44.1757509818943; Wed, 10 Sep 2025
 06:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 15:10:05 +0200
X-Gm-Features: Ac12FXx4fqtngzlb3aPI-q1c6xVbomqK3jaNECwBf_yyF7AQZ2ofNJeHmlxFUVw
Message-ID: <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 11:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> - ARMv7 machines with 4GB and more exist and keep getting
>   kernel upgrades, but to my knowledge are not in production any
>   more. These are mainly 2010-2015 era chips based on rare
>   out-of-order cores like A15, A17 or PJ4 that were designed for
>   low-end servers, chromebooks and network equipment but replaced
>   with 64-bit chips shortly after. We had planned to bring a
>   CONFIG_VMSPLIT_4G_4G option to ARMv7VE to keep supporting the full
>   memory at a performance penalty, but currently have no plan to
>   finish this (volunteers welcome).

I'll fill in on the details on that, because I tried, to the best of my
ability to prototype this but I failed, so far.

Here is what I managed to do:

1. Building on another rough prototype by Afzal Mohammed, I managed
to compile the ARM32 kernel into the VMALLOC area, this works
fine and here are the patches:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git=
/log/?h=3Dkernel-in-vmalloc-v6.10-rc1

This is is done so that we can unmap *most* of the kernel
memory but *keep* the VMALLOC area, so that e.g. exceptions
can still execute and save to stack when they occur, and we can
call into the kernel to execute said exceptions.

This in practice means the area 0xf1000000-0xffffffff
which also includes the high exception vectors that must for
natural reasons also be kept in the mapping.
What we have mapped today (all of the time) is
0xc0000000-0xffffffff.

A minimal 256 MB mapping from 0xf0000000-0xffffffff
should be able to cover this.

So when we are talking about a 4G/4G split we are talking
about (4G-256MB)/(4GB-256MB) split to be exact,
we would keep the bottom 256 MB.

2. On top of this I tried to decouple kernelspace and userspace
allocations, in essence making anything outside vmalloc invisible to
userspace by unmapping it using the fact that ARM32 (LPAE) has
two separate translation table base registers: one for kernelspace
and one for userspace.

Step 2 makes sense because we know the reverse can work:
PAN (privileged access never) makes userspace memory
inaccessible from kernelspace unless explicitly requested and
that works fine already, and we implemented it for LPAE
with similar trickery, see commit 7af5b901e847.

It's harder than it looks though and I never got it to fly, but
maybe I will try again. My patches is a mess but I am a bit
smarter now due to reoccurring MM-related work.

Yours,
Linus Walleij

