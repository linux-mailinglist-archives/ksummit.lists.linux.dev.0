Return-Path: <ksummit+bounces-1027-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 017957811FA
	for <lists@lfdr.de>; Fri, 18 Aug 2023 19:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE6A22824DF
	for <lists@lfdr.de>; Fri, 18 Aug 2023 17:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C461AA77;
	Fri, 18 Aug 2023 17:26:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A314693
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 17:26:34 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99d90ffed68so480401566b.0
        for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692379592; x=1692984392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9YPHO+rRGt7JCtuvWtFL8mwoltMJaRR2MGLX89JYgQ=;
        b=U/I9ASv3eBdAwKyIn8jINyE/0Z0HpSw+bFkXWzeORxkoDtgxLzqj80D59drE4yzYa6
         GmSfmHu9WfHtywY6naIDJ7822VQOq1vv6Y89trzpUa8MwTpH0Ely3hHk3Y/qqS6WkBCY
         SAOyUWZBbl6jSXLE5Wxf1FPoQEHKLS4zLWQJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692379592; x=1692984392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9YPHO+rRGt7JCtuvWtFL8mwoltMJaRR2MGLX89JYgQ=;
        b=kRe+vP4vVOntMasxOKgpv1A9YY901vvCGHnZyAQYfJpHfplbJuuFoD/ehJzlAdXr5G
         W1tgyzrMHdFaJlU99mhykWUs2dtL1eViZkTQBESqVLywFzirZh34PIRHVJwRxtBsD4i4
         LtLsoDAD8d8lQbWP0eXnI5B8a4YnE0649Q+My0RXhQ55h2EDvEZsxI8OyqOIJiaMQ50K
         S7PaS2Rx/04GtKc8M58OUKGrrsHH+z0RDlk2mjEuB2N7ivcgN7w3ardyD0GUdeBGECGX
         JXJQNyveC6unAjReTQ6PXIzOTXEDPEXKm/UzjtNWi2QhzKeNl46yM8oucp+Eu8cWCh/v
         /Hdg==
X-Gm-Message-State: AOJu0Yww2hS58o+aEfAlWaPqcc8G/bElVw0KMvbPqdTBrSHPWMFcgkTD
	j9P3Q8GA5KVhCZXSK8Gte+hp8Uq3gihAo3m8dvANfD98
X-Google-Smtp-Source: AGHT+IFXMnwY5axB8peC9MDjIKWHloSD+AG/55l4u2vLFy9jkf1/iZ3rd8MU9wyxXME9rvbXD6x+aA==
X-Received: by 2002:a17:907:2710:b0:98e:370c:be69 with SMTP id w16-20020a170907271000b0098e370cbe69mr3474730ejk.6.1692379592570;
        Fri, 18 Aug 2023 10:26:32 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id bs9-20020a170906d1c900b0099bcd1fa5b0sm1415139ejb.192.2023.08.18.10.26.31
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 10:26:31 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99d90ffed68so480396166b.0
        for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 10:26:31 -0700 (PDT)
X-Received: by 2002:a17:907:b12:b0:99d:e417:d6fb with SMTP id
 h18-20020a1709070b1200b0099de417d6fbmr3579367ejl.25.1692379591187; Fri, 18
 Aug 2023 10:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZN9ZfUVHrRhd+btc@shikoro>
In-Reply-To: <ZN9ZfUVHrRhd+btc@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Aug 2023 19:26:14 +0200
X-Gmail-Original-Message-ID: <CAHk-=wgQKBvXaSNVxy-2Q3KYeTbv-CGSTf3LSV3=O5howAPifA@mail.gmail.com>
Message-ID: <CAHk-=wgQKBvXaSNVxy-2Q3KYeTbv-CGSTf3LSV3=O5howAPifA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Transparency when rejecting patches without
 technical reason
To: Wolfram Sang <wsa@kernel.org>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Aug 2023 at 13:44, Wolfram Sang <wsa@kernel.org> wrote:
>>
> this obviously aims at the rejection of networking patches from Baikal
> Electronics in March. I only got to know about this yesterday when
> reading comments about Debian now supporting the LoongArch architecture.
>
> I admit I thought we accept / reject patches purely because of technical
> reasons.

Honestly, technical reasons are a "minimum requirement".

But there are clearly other reasons, and always have been. Including
simply the fact that we have to trust the source of the patch. Things
like "will you support this going forward".

Maintainers have to be comfortable with the source of the code. And
not all maintainers can work with all people. That has always been
true.

This wasn't even remotely a gray area.  It's not worth discussing.

                Linus

