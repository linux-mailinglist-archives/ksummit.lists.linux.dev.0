Return-Path: <ksummit+bounces-345-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C63C1539
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id D889B3E1061
	for <lists@lfdr.de>; Thu,  8 Jul 2021 14:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B042F80;
	Thu,  8 Jul 2021 14:34:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5015472
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 14:34:00 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id h18so3719447vsj.2
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 07:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Aw6+wOSpEBTOQmf2v8zIVoHZ9gWqXZZDgzXue8OGdo=;
        b=bY5iXz2I7UHdWZihN4weOJQUBwcgL+pTrdI9uIS1x57ksLdiQ1AZUEJPclD7QfnjRk
         r9TJoP1LkxTFjFx/48kfty+wwKjBXOCcqqO77n3k2It1xJNYkcXyLZ8bueZ0PwKvrTZg
         mzaLnpjhkqlMD22ASjYDzZq2GgQnXquG2Y9/LmZqK2GbQBqnggc7Y/uS0F9Qz43FtUd0
         DQcdJvaYjGcrj26Nlv8e0MkWgfbbehuWpxACQdOsBf0xBvnF8DqVAuXNa9Hi+rHkoNve
         FOouXGGGUoe0NIQgpmYHjmVJbmM3Chi2RGtY1ALTfMPhBihR3Z4FTyw5q+UDuXcxvVpL
         ugSQ==
X-Gm-Message-State: AOAM532UbhzHiFbzOQsEkW1YdIGHppyAyHph3w9JHxx66f4sOHyW7P63
	i7JprE2V7SJhi4dnjc+s4WuwNQY7qB8bwUuM+NA=
X-Google-Smtp-Source: ABdhPJzacLYftKFNpqsApc/xcMBjcopP2t0lmRE/Wv7pkbZRqiaHGaWbWB19CL7PRhwzBNOFG6rfxJ89N5Z4XxBT4Zk=
X-Received: by 2002:a67:d012:: with SMTP id r18mr20760051vsi.3.1625754839423;
 Thu, 08 Jul 2021 07:33:59 -0700 (PDT)
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
 <CAMuHMdXcL6iYzcL+W9NLkhk+bHXddHna6XYE_Wu6Wun9XKxm2A@mail.gmail.com> <CANiq72kGBz=ohqS_YbTGc_CuRGxd-xmim-RT=pHHjMzi=39gSw@mail.gmail.com>
In-Reply-To: <CANiq72kGBz=ohqS_YbTGc_CuRGxd-xmim-RT=pHHjMzi=39gSw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jul 2021 16:33:48 +0200
Message-ID: <CAMuHMdVeFtRp5tUbErqqyUXz2Mrz8kCc7XbYs4Y6vr8n50A_jA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Miguel,

On Thu, Jul 8, 2021 at 4:28 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Thu, Jul 8, 2021 at 4:18 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Let's assume the caller access a member of the object regardless.
> > What happens?
>
> That is the key: they cannot access it to begin with because the
> returned `Option` is empty, so there is not even an object you can
> "access", thus asking "what happens?" does not have a meaning.
>
> In code:
>
>     pub fn f(weak: Weak<i32>) {
>         let strong = weak.upgrade();
>
>         if let Some(content) = strong {
>             println!("{}", content);
>         }
>
>         // There is no `content` here, so you cannot do anything with it

What if I would ignore that? I.e.

    let Some(content) = strong;
    println!("{}", content);

?

Please forgive my silly questions, I'm a Rust newbie ;-)

>     }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

