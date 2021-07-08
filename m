Return-Path: <ksummit+bounces-331-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A23BF62B
	for <lists@lfdr.de>; Thu,  8 Jul 2021 09:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0ECF93E10AD
	for <lists@lfdr.de>; Thu,  8 Jul 2021 07:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E23F2F80;
	Thu,  8 Jul 2021 07:20:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D4168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 07:20:38 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id o12so3048394vsr.11
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 00:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o+QcMxGPSXzpBbdHqq5fXaAMWLESx8KuSuG9UjIEJEo=;
        b=OsHn8+UgTzZi7hHpRwA4t84cUE7p/ijlF3la9OdNhXHzPCzQ5sRJr0eKlljMDQzXNX
         5bK/4hFOhKw3F3LRtz8LKsEVtbd7LkQNo5PV9bt+aJCB+mXM0m8zi7syVETRfXDx66mn
         htoqb/nD8JSCTse6pBnknrP/GbUQJhKNA/YptMRiH6mljeogqvBWj1zuH08ZR638n+0+
         QsUKxkNUnuCMMkoMvktcSQRCkdqptImEevuKfjTaWavzi+ZPLdFFJu5ijIsq+qiMEmPz
         JNcquidr/Y/YOeR0rNNsj7up+A++Mg/KxNOG/fdboDY+32Szv74ShnzdZQ4sWhHot+MB
         HQug==
X-Gm-Message-State: AOAM533Vay218n2nnrw4a7iNkY5bp6f2kE74zYyHvJYPm2Z658GLGhwt
	xnP1dtCOKAK+9iXvBAX9DYb8NUYsYpz+PVSrfEc=
X-Google-Smtp-Source: ABdhPJy9s5uDaFJ1lPcqEHXzqDnnc15DX9FX24pN+jmmAqVViyDxTwWjA9zlxlmrX5w3ThNbibPwerXR7/Jd/mpVDn4=
X-Received: by 2002:a67:d012:: with SMTP id r18mr18630024vsi.3.1625728837731;
 Thu, 08 Jul 2021 00:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOVbsS9evoCx0isz@kroah.com> <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
In-Reply-To: <YOY0HLj5ld6zHJHU@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jul 2021 09:20:25 +0200
Message-ID: <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
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

On Thu, Jul 8, 2021 at 1:09 AM Wedson Almeida Filho <wedsonaf@google.com> wrote:
> On Wed, Jul 07, 2021 at 10:38:27PM +0200, Jan Kara wrote:
> > On Wed 07-07-21 20:19:19, Wedson Almeida Filho wrote:
> > > Where would a lock be needed in the examples above?
> >
> > So I think Greg speaks about a situation where you have multiple threads
> > and the refcounted object can be looked up through some structure all the
> > threads see. And the problem is that the shared data structure cannot hold
> > ref to the object it points to because you want to detect the situation
> > where the data structure is the only place pointing to the object and
> > reclaim the object in that case. Currently I don't see how to model this
> > idiom with Rust refs.
>
> The normal idiom in Rust for this is "weak" pointers. With it, each
> reference-counted object has two counts: strong and weak refs. Objects are
> "destroyed" when the strong count goes to zero and "freed" when the weak count
> goes to zero.
>
> Weak references need to upgraded to strong references before the underlying
> objects can be accessed; upgrading may fail if the strong count has gone to
> zero. It is, naturally, implemented as an increment that avoids going from 0 to
> 1. It is safe to try to do it because the memory is kept alive while there are
> weak references.

What does "may fail" imply?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

