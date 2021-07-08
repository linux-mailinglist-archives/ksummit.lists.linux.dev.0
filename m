Return-Path: <ksummit+bounces-342-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C353C1500
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B9CFB1C0F1E
	for <lists@lfdr.de>; Thu,  8 Jul 2021 14:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A042FB2;
	Thu,  8 Jul 2021 14:18:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CA12F80
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 14:18:31 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id j8so3708274vsd.0
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 07:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l11NGSYjTAbT8tEzMsBT3Wbi24GbM6gbgvI7f5BuBGQ=;
        b=TfdFIJTY0e4UuRNjv64mwheAsmMi6CrYeQYmzyyixXd0GpbSY/vMlTK+FP2ENpO1hN
         GDjglK9ZU3cLzzuA1GoKdgbVr05eQCPKetZ/9DIy0cbU+PpAVcsN3z/SV75W9EsvNcB2
         t4oalPXaIQ44ZRx4ewlfl6gL1NOMxw1OY92nU/kdwiMeepBsrGsG6Avua/55QN5LoY1G
         D13Zephm5pm2j7mO8vvLr4uwalvEo87bRzzf/RgwuOtrZK8zQt4drYCkv7X3H/BIffjH
         aiQ2EpPuMKqo1Boje3x0S3mbIyVAOfgXO2/69hcP6/K1jDQUQ2M+2t/rYn3ry6h70kjd
         UJXg==
X-Gm-Message-State: AOAM533sZtY9LpbtKcWRqr9CHuBuCSnHtaisSAwRx2f1TEccWtQR95s6
	X7nS4u7U4GTl9kFWogIDQhZx96jEv3tmNV25BlgJ5Jqi
X-Google-Smtp-Source: ABdhPJx+6a+dW9/po74K3DPYlPYnsJMbM82KOoqI9Pi7XJBjoCJ2+cQ80dnsLef2FBPES3/8Roh/tf43Rxy0E6RP0Os=
X-Received: by 2002:a67:f98c:: with SMTP id b12mr28613076vsq.40.1625753910157;
 Thu, 08 Jul 2021 07:18:30 -0700 (PDT)
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
In-Reply-To: <CANiq72mquf7oVc8hYntYvksuiLDwqUJKvtx7sri6XXgqAAVAsA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jul 2021 16:18:19 +0200
Message-ID: <CAMuHMdXcL6iYzcL+W9NLkhk+bHXddHna6XYE_Wu6Wun9XKxm2A@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Miguel,

On Thu, Jul 8, 2021 at 4:04 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Thu, Jul 8, 2021 at 3:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > So what happens if this fails?
>
> Just in case: are you asking out of concern for "Rust panics" etc.?

Exactly.

> The upgrade call does not need to panic, they can be fallible; e.g.
> the `Weak` types in the Rust standard library return an `Option`.
>
> Now, what the caller does if the upgrading fails depends on who the
> caller is, as usual.

Let's assume the caller access a member of the object regardless.
What happens?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

