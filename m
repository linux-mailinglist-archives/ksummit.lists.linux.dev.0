Return-Path: <ksummit+bounces-369-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843D3C2331
	for <lists@lfdr.de>; Fri,  9 Jul 2021 13:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id C53FC3E107E
	for <lists@lfdr.de>; Fri,  9 Jul 2021 11:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427E92F80;
	Fri,  9 Jul 2021 11:56:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D29D72
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 11:56:05 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id i14so2122286vkd.1
        for <ksummit@lists.linux.dev>; Fri, 09 Jul 2021 04:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h6xFKCBJoaT/N6NByIjkVWeOrXn8HKosHhJ/fhRBKVc=;
        b=pNNnycleBc65YA1xWEcI1qQSnq5UGCYeZ3s+iLxh11adfUnEY6v0SBMHXq4y0LAiM5
         Oxm1jv0VSaAqj49ve5YPoAXMGFZYikv4L0+m+KPdWWRTnhLvhWR+rCyVbHq2PRE4RPSC
         6Q+Y9eZGSeoVN6vpyp0zqnGKjbs88m08Rj4W6mWGCw5ZsLtAaijv5tzHzUOP5usVq4GQ
         ZGxk6YDR0QZP/BpcJaD04OiXJHp/iUZA7VPmfEQ4bBIrv9OqEN3cQM0BzXw7IUVM9NwF
         Y6S/gjx2su6JD1gmsvHhiSOltcab+EFdmdzqWzGhRcU47W68aJYva1CR1EqB36Z34s17
         esPw==
X-Gm-Message-State: AOAM530Ed4SM7cbXezh4yt6NOJnVHbRIKkdK2QbWXESr3Qm1toP1rBYV
	Jy2q1weuHaJuHPzq6jnVQrsL5lF9fNKq2Tn3SeY=
X-Google-Smtp-Source: ABdhPJxAfwYqQPRJ15s3VBDum2pGL/2wTEY26/yOUxPAhDKDVYmxXTwQEMkZ+kLvTqJ2ntwkTVNxUCQxUgCj2l1iZNM=
X-Received: by 2002:a1f:1207:: with SMTP id 7mr14807241vks.1.1625831764920;
 Fri, 09 Jul 2021 04:56:04 -0700 (PDT)
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
 <CANiq72mquf7oVc8hYntYvksuiLDwqUJKvtx7sri6XXgqAAVAsA@mail.gmail.com>
 <CAMuHMdXcL6iYzcL+W9NLkhk+bHXddHna6XYE_Wu6Wun9XKxm2A@mail.gmail.com>
 <CANiq72kGBz=ohqS_YbTGc_CuRGxd-xmim-RT=pHHjMzi=39gSw@mail.gmail.com>
 <CAMuHMdVeFtRp5tUbErqqyUXz2Mrz8kCc7XbYs4Y6vr8n50A_jA@mail.gmail.com> <CANiq72mG42G1n7TB+FWyxFxQPaoKWZOq-uXQcLz_CRwny0Ho+g@mail.gmail.com>
In-Reply-To: <CANiq72mG42G1n7TB+FWyxFxQPaoKWZOq-uXQcLz_CRwny0Ho+g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jul 2021 13:55:53 +0200
Message-ID: <CAMuHMdUfX9tzUO9GGy4tFBkx1b1vfF0RQrm0PDyYdPkD=zqgyA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Miguel,

On Thu, Jul 8, 2021 at 4:36 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Thu, Jul 8, 2021 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > What if I would ignore that? I.e.
> >
> >     let Some(content) = strong;
> >     println!("{}", content);
> >
> > ?
>
> It does not compile :-)

Oh, so it's like __must_check and -Werrror on steroids ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

