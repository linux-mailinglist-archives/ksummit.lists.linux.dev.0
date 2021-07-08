Return-Path: <ksummit+bounces-344-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEF83C152B
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 29A411C0D51
	for <lists@lfdr.de>; Thu,  8 Jul 2021 14:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BF52F80;
	Thu,  8 Jul 2021 14:28:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4463C168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 14:28:36 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id q2so8336058iot.11
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 07:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mgBIinccgboj4I/S31NNfXN5g1fpE3DADylHYQTAphw=;
        b=KqYpo+KXeaGce3f1T7QfCKLD8EGwvKZYopuV6y3H5H/hoaJfOBN8ppxVh34amnBD8K
         spcDKV4nBmt2UEcmjE+95jETSJqRbgxjs8z/NbZprs1H5r4ycjUK10rdCDl8/O0ylR+u
         21bhhqyACPPmBCq8nvBACBTXcsmD98nhwylpJ61i1xu7LLr80n6AouM3Y5O8JZ3gDQjU
         MKFOFQrZl3/Ti2Gg54KvvqxED0qfftOsYdKkMsIFbro/DfHTbQv1bkWsncXYycCr6xVd
         ovFw0NzyUTYTtzsESglplsf2QdBRX4sRl7ADhEFwQQP9GcfyFRVrt/HpkakjeqeY5sB6
         t2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mgBIinccgboj4I/S31NNfXN5g1fpE3DADylHYQTAphw=;
        b=gXtQbC2JfRlv2xx+HUZU7lSA6UvlL/RHWebb2fr6bRIwe6Z0JqD0YG4bXlEHm5JBrL
         26j0WNaiKlVndTDaJ3NM7WJfFE2+MCpzltxomKq+kKzhQL4dR06Bw/CoYc5td/jvuiLU
         iwbrlRvNSuMoqOBt8zlFkUt3DNXnt74Rl36bRPAKlXkWZIrCvad4DZFiUlOm+xc5UV5H
         i43eD6+elSL1jpoP1Se+r75FWd9O6ktMPcDdc5OvecLi6uVOCVvnVUmzr5QpaTHtNl2+
         VYyI/ePHavC6TVWvdv/CtKQXSnJnn7YHYGxHK36xAj6dgcNotMA1oSODUFb04NWBVvHe
         T4ZA==
X-Gm-Message-State: AOAM533YcsZnhr4uBPbBPlhOGwWHzuOvhzEKVHBecvujDIBeMYxWjwMb
	tyRRQ4Br6hcJ05blqj2EfmR6CCD5QCIA/UYiBIQ=
X-Google-Smtp-Source: ABdhPJxoMICAwBdg9Eh1wA+cEiNpCJe+HZvMj2jiaSBdynXbPaozGBhBfgHm+S2YOOtQbh0wDbXccjeEPHzkK6wS/aU=
X-Received: by 2002:a5e:d512:: with SMTP id e18mr24165139iom.149.1625754515461;
 Thu, 08 Jul 2021 07:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
 <YOcApBj/puXe3Yig@google.com> <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
 <CANiq72mquf7oVc8hYntYvksuiLDwqUJKvtx7sri6XXgqAAVAsA@mail.gmail.com> <CAMuHMdXcL6iYzcL+W9NLkhk+bHXddHna6XYE_Wu6Wun9XKxm2A@mail.gmail.com>
In-Reply-To: <CAMuHMdXcL6iYzcL+W9NLkhk+bHXddHna6XYE_Wu6Wun9XKxm2A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 16:28:24 +0200
Message-ID: <CANiq72kGBz=ohqS_YbTGc_CuRGxd-xmim-RT=pHHjMzi=39gSw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 4:18 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Exactly.

I had a feeling... :)

> Let's assume the caller access a member of the object regardless.
> What happens?

That is the key: they cannot access it to begin with because the
returned `Option` is empty, so there is not even an object you can
"access", thus asking "what happens?" does not have a meaning.

In code:

    pub fn f(weak: Weak<i32>) {
        let strong = weak.upgrade();

        if let Some(content) = strong {
            println!("{}", content);
        }

        // There is no `content` here, so you cannot do anything with it
    }

Cheers,
Miguel

