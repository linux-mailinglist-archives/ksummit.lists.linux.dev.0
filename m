Return-Path: <ksummit+bounces-456-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D31A3D55BF
	for <lists@lfdr.de>; Mon, 26 Jul 2021 10:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 016A41C09FF
	for <lists@lfdr.de>; Mon, 26 Jul 2021 08:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E202FB2;
	Mon, 26 Jul 2021 08:39:45 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86A72
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 08:39:43 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id o8so4816082vss.4
        for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 01:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p6lkPdyRYjYnH9eMNHWQk7DIhB2bdskron98kni3+DA=;
        b=iVwFqGWBgHKW1oQRUgOTI9p2occOiTxHb4F6RcXRJjf9dEtOzJ6gjf0XPD4+EhV7gR
         nmVqMW1mDKhbr/xfhbV/nyCNnGC5o6Wj51ALpKa0B5teJAsyXvkHh49Jqz86GVkN7cXK
         Fqb7GD7eSKsvNi7JNRlmIeNqjJsYlxi7pZ9x0gZYPj14q0PPqKd3I/sOLrV8jeHCjS0n
         l9SE4p3iOQVV0YtAyAQ2VhujGJSTRODgcUm01BgG6l3Ttqi74FQJQ4Rp2yKXNxSIvRGY
         PzSduWIpwVTHSy9EJOGBajekbHEir8DX/FSC95i7v6KfmL4oQknhPguMXkUWNc6tskv5
         TGjg==
X-Gm-Message-State: AOAM530Fg2Qf9FBf3NwAETNYz7n2catBTwlKTFPcm4ma8Rqs3fxXA0hH
	LIU7Y9ogAIjK5Z5UBpOcpaS+9sVOvpmxkF7H/0Y=
X-Google-Smtp-Source: ABdhPJwntdQgZcantD9FYLbGCyWQp6vpujZRoEQsFNF3y+h0IGpLLAWg+uc9XpJ857MtPgKahq4mcxCnqhD7wQuO1pw=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr11190211vsf.40.1627288782578;
 Mon, 26 Jul 2021 01:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com> <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com> <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
In-Reply-To: <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jul 2021 10:39:31 +0200
Message-ID: <CAMuHMdX1Le1JLjOCGt_sB34Fdz_LJXsmKZJ4PUytaeJMU4vJCg@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: Arnd Bergmann <arnd@arndb.de>
Cc: NeilBrown <neilb@suse.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, Jul 26, 2021 at 10:21 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jul 26, 2021 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Jul 26, 2021 at 9:26 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de> wrote:
> > > > On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> > > > > > To make it work well, you need to know if frob() and/or the current
> > > > > > function return an error code or not.  While you can use some heuristics
> > > > > > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > > > > > indicate if a function returns an error code, or an error pointer?
> > > > >
> > > > > https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
> > > > >
> > > > > I think it would be useful, if not for the tools, at least for
> > > > > developers.
> > > >
> > > > Agreed.  I added some code to smatch so that I could annotate pointers to
> > > > say if they are allowed to be NULL.  The implementation isn't perfect,
> > > > but I love having that extra documentation about when I do or don't have
> > > > to check for NULL.
> > >
> > > I can think of four different annotations that limit what a pointer return from
> > > a function can be:
> > >
> > > a) either a valid pointer or NULL, but never an error pointer,
> > > b) either a valid pointer or an error pointer, but not NULL,
> > > c) always a valid pointer, never NULL or an error,
> > > d) always NULL, but callers are expected to check for error pointers.
> >
> > e) either a valid pointer, NULL, or an error pointer
> >
> > The last pattern is seen with the various *get*_optional() functions.
>
> I would always consider those the exact bug that I meant with "because
> everyone gets those wrong". I think the idea of the "optional" functions is
> that you have two implementations b) and d) and pick one of them
> at compile time. To the caller this means either an error pointer or
> success, but checking for NULL is a bug in the caller, while conditionally
> returning NULL or ERR_PTR() would be a bug in the interface.

e) is not for optional kernel features, but for optional hardware
functionality.  So it is not known at compile time, but depends on
e.g. the DTB.  See e.g. devm_clk_get_optional().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

