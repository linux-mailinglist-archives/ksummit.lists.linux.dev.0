Return-Path: <ksummit+bounces-460-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105E3D563C
	for <lists@lfdr.de>; Mon, 26 Jul 2021 11:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 3D5043E0F00
	for <lists@lfdr.de>; Mon, 26 Jul 2021 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8869B2FB6;
	Mon, 26 Jul 2021 09:12:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636F72
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 09:12:02 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id o8so4852190vss.4
        for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 02:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eAC1cIppqhSudn1Qk+IDaqokWvablRIfmFguo3P7vxE=;
        b=YsREh3VHnNNJOU/wKWWZM76x7GKwacLz+8J4AA1EuyHBuJYVb4krWLumg06+etWA12
         88Gv6IxsxhE1GDgwdOJj+jBeIm7hpmjyJG0/PtyjMFPMutBkDD47b3CD3sEmgZesP9eU
         /OEy3miEAymNlaRQ3xN/0ZRdnr602mKdKXhbgJ9FImpMsEdh4jwf1NyhfCYb8QkmhW0T
         xGiBWzXd7sR/cKms/ED5/R6PoG9Yer+26b3J8POBMB2GEu2GW3uvh413MXqPBwXuqX22
         mgYffsuCxFj4YEnrR7sjNbMxiq33cXbOIM3zFyZWSlpSXweOUcBVnIFSPhmtFqrelDFQ
         5RTA==
X-Gm-Message-State: AOAM531NZ6nVapJju2rpxfZIIgpOwpf8lDXrmBFPTTlTWHgLIEU1zGkk
	aQrvkODfq4VTMjdXyDrQ7yD1nG56DQdYwnOTuPs=
X-Google-Smtp-Source: ABdhPJzXrhLTaMTWV+NAzvLvLT8vIMKA6/9LSXjszbOmqKXV/r3ryGooOJ0RwBvlNrxoePkTWIQe8x7w/E6jz9TCqWE=
X-Received: by 2002:a67:8702:: with SMTP id j2mr11178794vsd.3.1627290721484;
 Mon, 26 Jul 2021 02:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com> <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
 <CAMuHMdX1Le1JLjOCGt_sB34Fdz_LJXsmKZJ4PUytaeJMU4vJCg@mail.gmail.com> <CAK8P3a3bA2D6FXHEOdqaOCm=++0DudZmuPnR+GJvWpF0LmZtDQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3bA2D6FXHEOdqaOCm=++0DudZmuPnR+GJvWpF0LmZtDQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jul 2021 11:11:50 +0200
Message-ID: <CAMuHMdX8vC-U6O5GVrppiDPBnKb+7xOt-DNQF6C7KMc=8TWxUQ@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: Arnd Bergmann <arnd@arndb.de>
Cc: NeilBrown <neilb@suse.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, Jul 26, 2021 at 10:52 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jul 26, 2021 at 10:39 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Jul 26, 2021 at 10:21 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > e) either a valid pointer, NULL, or an error pointer
> > > >
> > > > The last pattern is seen with the various *get*_optional() functions.
> > >
> > > I would always consider those the exact bug that I meant with "because
> > > everyone gets those wrong". I think the idea of the "optional" functions is
> > > that you have two implementations b) and d) and pick one of them
> > > at compile time. To the caller this means either an error pointer or
> > > success, but checking for NULL is a bug in the caller, while conditionally
> > > returning NULL or ERR_PTR() would be a bug in the interface.
> >
> > e) is not for optional kernel features, but for optional hardware
> > functionality.  So it is not known at compile time, but depends on
> > e.g. the DTB.  See e.g. devm_clk_get_optional().
>
> Ah right, I forgot we had those as well. However, I suppose no amount
> of annotation is going to help with those, as far as the checker is concerned,
> I would just leave this as not annotated. At least with the clk API,
> the callers are not able to dereference the pointer because the definition
> of 'struct clk' is private to drivers/clk/clk.c.

And the clk API supports calling further clock ops with a NULL pointer,
which eases handling optional clocks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

