Return-Path: <ksummit+bounces-454-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9C33D54AB
	for <lists@lfdr.de>; Mon, 26 Jul 2021 09:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 336571C071A
	for <lists@lfdr.de>; Mon, 26 Jul 2021 07:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C18C2FB2;
	Mon, 26 Jul 2021 07:53:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F8D70
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 07:53:50 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id o10so3240038uaj.0
        for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 00:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJlphi2DJPiFMCSec4ZDlBNTGAOLhh1VY1qXF/r2VtM=;
        b=HjGtPB35L0lAfJ4FrgFDXYh8pACFGf5n17fbTXBDPf+U/Euk5dlcq68rK7EqlFl0YU
         YbBUsPl+7j4NGtw37wqfbAETYuhVU/8T9+orOlvkO+KMULSqT7RlQxY8A+iEwXBjP0Xe
         lve+gkLQzbIzvOMAYOm+X4o4g06IakHCV8/2+1NeUwX/xT/pk8NlPzIswscgFUiVYjJW
         OItrb5P6Xh4OZCJqLxWnv2dIxIOmlSXL87niOnHCx8P7gscLyWVdPcmxxJJp1bOg2TGG
         F80KHNVGRW2i2jW2YpNGRP11OtAQR0QLRoIrFWnH+ukd9znD8aIQCzLWNFXKGqfz4bRc
         h5+A==
X-Gm-Message-State: AOAM5334ItBepWhxdC5ghRCZXo+ahwaSJAB6NxwOn/M9FLvY4orquOgM
	xPEABgXDc1m7bcpP99Wf7+acFe2N665RwNdUYzM=
X-Google-Smtp-Source: ABdhPJw8QKchs1Q88WpqCNg0e2MXNHiagHE8gm77cXpJYTIs6V6UwwPQ1ZRJHjjq0qzIHWI3FFlYpEwk3s0t8XYAsCk=
X-Received: by 2002:a9f:3f0d:: with SMTP id h13mr11764616uaj.100.1627286029015;
 Mon, 26 Jul 2021 00:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com> <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
In-Reply-To: <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jul 2021 09:53:37 +0200
Message-ID: <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: Arnd Bergmann <arnd@arndb.de>
Cc: NeilBrown <neilb@suse.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, Jul 26, 2021 at 9:26 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de> wrote:
> > On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> > > > To make it work well, you need to know if frob() and/or the current
> > > > function return an error code or not.  While you can use some heuristics
> > > > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > > > indicate if a function returns an error code, or an error pointer?
> > >
> > > https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
> > >
> > > I think it would be useful, if not for the tools, at least for
> > > developers.
> >
> > Agreed.  I added some code to smatch so that I could annotate pointers to
> > say if they are allowed to be NULL.  The implementation isn't perfect,
> > but I love having that extra documentation about when I do or don't have
> > to check for NULL.
>
> I can think of four different annotations that limit what a pointer return from
> a function can be:
>
> a) either a valid pointer or NULL, but never an error pointer,
> b) either a valid pointer or an error pointer, but not NULL,
> c) always a valid pointer, never NULL or an error,
> d) always NULL, but callers are expected to check for error pointers.

e) either a valid pointer, NULL, or an error pointer

The last pattern is seen with the various *get*_optional() functions.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

