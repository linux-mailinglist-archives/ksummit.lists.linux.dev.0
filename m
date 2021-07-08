Return-Path: <ksummit+bounces-337-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452D3C149C
	for <lists@lfdr.de>; Thu,  8 Jul 2021 15:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 12BC33E10C4
	for <lists@lfdr.de>; Thu,  8 Jul 2021 13:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22772FB2;
	Thu,  8 Jul 2021 13:43:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573812F80
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 13:43:41 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id h18so3623026vsj.2
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 06:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwGKbpcUBjpoM3IHkueopHdIb7O+St56thUzYhqkVW4=;
        b=aP08dInmlqKdrUlkqOWfKarQcE940UtYDEXInGfF6XCzqZ8e+6LZO+OLhaQ5JpKXmk
         A8HqZxYdSYo7Ahjeo+ocTK/zqmBKNrfVPTc4Ve3xI39mh1XkN2OIRyx9cHrzC5ALNlX7
         UFqK6XHBi428Hia3dXhzPXHFaZmirLyEyRov7G46GXt7Qhkwd+q0oQNdPHcuUCh4iXFJ
         DjhqfzwbZqcdS1hHSd94kDaMDIuRh9W9BNzvUOMYEdOAbXyCSXlOEDSrwhFR43HfhoAp
         cMXlluMMg9sPHbTEK5TgNKt4+NLV2CfQUjsLz4xcAGa4HrVmYVvOEZ+isQ45gVKvPf04
         LzIg==
X-Gm-Message-State: AOAM532Or7hBD7fRotZYKWjnHU53j8pzmxDdT2teJ+xDIPXToLAYUauq
	x2vORh3cx58bc9qX/RjWNNtHKAUYku0Ote3YpG0=
X-Google-Smtp-Source: ABdhPJykgtesHsVvZ69cwHhy915qkFTho6uAZDvoZ/lH0IYjQA0h8/d9vA6mABnoFIrLK3+GfiEnQQgzIxCbgFvi46I=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr3454916vsf.40.1625751820313;
 Thu, 08 Jul 2021 06:43:40 -0700 (PDT)
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
 <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com> <YOcApBj/puXe3Yig@google.com>
In-Reply-To: <YOcApBj/puXe3Yig@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jul 2021 15:43:28 +0200
Message-ID: <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Wedson,

On Thu, Jul 8, 2021 at 3:42 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:
> On Thu, Jul 08, 2021 at 09:20:25AM +0200, Geert Uytterhoeven wrote:
> > > Weak references need to upgraded to strong references before the underlying
> > > objects can be accessed; upgrading may fail if the strong count has gone to
> > > zero. It is, naturally, implemented as an increment that avoids going from 0 to
> > > 1. It is safe to try to do it because the memory is kept alive while there are
> > > weak references.
> >
> > What does "may fail" imply?
>
> Upgrading is essentially calling `refcount_inc_not_zero` on the strong count.
> It succeeds when the count is already non-zero, it fails when the count is zero.
>
> So "may fail" here means "your attempt to upgrade came too late, the object is
> gone". (The memory is still around so that attempts to upgrade don't cause UAF,
> but the object is gone.)

So what happens if this fails?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

