Return-Path: <ksummit+bounces-341-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id D48E93C14FC
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CF1B91C0EEB
	for <lists@lfdr.de>; Thu,  8 Jul 2021 14:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7932F80;
	Thu,  8 Jul 2021 14:17:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D6E168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 14:17:06 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id y47so2260696uad.6
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 07:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m84hQBBNf6mlTv8M7yN1cjTJyCobxw6wgvLqvXoKPOg=;
        b=pVetg7nEBtpvwJSGzGG+q3XkBS5vCnFmtEwqsc4Z4E5Dy2tTxhC8SOTm6y3GmbyKo8
         SW2iDgekILmWs773YSC4unbyno3Jezd6vg09Ni6stjdUMn/uXGKqFytRvqDE/S650Z96
         Zgt0GLBF3nWoqfw7MnrrAddMJYNM2IRPFTWmTXjUaBIioH0BBR1vN7kzBz3Ig5dZXvh4
         fjhDf4SOwrBafBbAMKNmZp+gVHuQmxVjbnlDTgzFxkB44CUndisRug2QeXTob1zy6Miz
         RVLo5Kfhj25vstMKYmIHLYu49QZaWwEeRepleWZP20bAqrJr+YGTuOvSxNcYoBLoS2bz
         mpzQ==
X-Gm-Message-State: AOAM533WuOysmUKBgAamwB7wR1SG6H2WlCoRDLhxa4Q2ay7j/YLp5uuF
	0Se4lPqh+O77phg/lsUBJk++L3hoRnIZpcebO3o=
X-Google-Smtp-Source: ABdhPJz+ejugGuUnWDkR5dm3/vXjxtNYZBS22eE7uFri+B+n9M4c+FotvxUOyk+Z9GpMoG9Aa5khqOm0OrSHNKokpmg=
X-Received: by 2002:a9f:3f0d:: with SMTP id h13mr26245587uaj.100.1625753825867;
 Thu, 08 Jul 2021 07:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
 <YOcApBj/puXe3Yig@google.com> <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
 <YOcDnczZnF4helYJ@google.com>
In-Reply-To: <YOcDnczZnF4helYJ@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jul 2021 16:16:54 +0200
Message-ID: <CAMuHMdULCT3P6emoD08pEAt8ZZz0-FFwEOEuYXhcstisM==ZLQ@mail.gmail.com>
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

On Thu, Jul 8, 2021 at 3:54 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:
> On Thu, Jul 08, 2021 at 03:43:28PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Jul 8, 2021 at 3:42 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:
> > > On Thu, Jul 08, 2021 at 09:20:25AM +0200, Geert Uytterhoeven wrote:
> > > > > Weak references need to upgraded to strong references before the underlying
> > > > > objects can be accessed; upgrading may fail if the strong count has gone to
> > > > > zero. It is, naturally, implemented as an increment that avoids going from 0 to
> > > > > 1. It is safe to try to do it because the memory is kept alive while there are
> > > > > weak references.
> > > >
> > > > What does "may fail" imply?
> > >
> > > Upgrading is essentially calling `refcount_inc_not_zero` on the strong count.
> > > It succeeds when the count is already non-zero, it fails when the count is zero.
> > >
> > > So "may fail" here means "your attempt to upgrade came too late, the object is
> > > gone". (The memory is still around so that attempts to upgrade don't cause UAF,
> > > but the object is gone.)
> >
> > So what happens if this fails?
>
> You move on the next element in your data structure. This one doesn't really
> exist anymore; once you release it lock, the cleanup code will likely come and
> remove it.

I'm confused. Which next element?
What happens if I have a weak reference to an object that cannot be
upgraded to a strong reference, and I try to access the object?
E.g. read from or write to a member of the object?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

