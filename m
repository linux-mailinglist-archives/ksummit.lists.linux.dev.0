Return-Path: <ksummit+bounces-462-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2A3D564A
	for <lists@lfdr.de>; Mon, 26 Jul 2021 11:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B6DFC1C0A08
	for <lists@lfdr.de>; Mon, 26 Jul 2021 09:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92F42FB2;
	Mon, 26 Jul 2021 09:16:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F0B72
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 09:16:14 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id c20so1867706vko.7
        for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 02:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8+u0AKq/sRiD0+z7/V/GLTB0g/o7bn5Ct0eepYvgo0=;
        b=B3V6w8qU8XAtjYUWWtcKWKSUcPDCJMDcdHAP1NNqwZkKtuWiLK81QrQs8P4RBaz+sT
         syn4lwSwLgkEJM7s1963Hg1opOjUoXhzdiRh4hl/aSjHzDz7WVWUCjkdvfGdc/0ol8eL
         Wd0CMfeyK1U+FMtbLNonhDsxt90LCvJI6HIZhX8qDicaj6iDBaoY8TEpMmsxBxZHX8ZC
         naiktP/wEKwRFRP73LrcEz41FZ9UHT3aGCBqYMAqsiZgDCSAJvky+6eEJGHDIG0ncmvp
         WAwebYiN4ategHi7O+nNJdRiS7Ghe9JFdSEMfPsY+pVOQeebukIc9dOI6nrEyn2KAf21
         GwDw==
X-Gm-Message-State: AOAM531pPEYCEpVKl3eXzGniZJti6OsGMB2oHEyB4UIYcrfMHqmf45S6
	o2FnrcoHXWjSUWI+K36yMthy03TMVC5gwZJUcmM=
X-Google-Smtp-Source: ABdhPJzxNaqTRfCs26YSG5VJNwCM7yf6GgKG74gchdNLwOohUURetRqxc5qX7/UI6OBE4sjHBwC6TqcAjFeiv1MIpE8=
X-Received: by 2002:a1f:2746:: with SMTP id n67mr9294466vkn.5.1627290973773;
 Mon, 26 Jul 2021 02:16:13 -0700 (PDT)
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
 <alpine.DEB.2.22.394.2107261025120.5982@hadrien> <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
In-Reply-To: <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jul 2021 11:16:02 +0200
Message-ID: <CAMuHMdUi6+9_TWNqk5=sebpzwbC0HHRzN5AHjySQgUCvmih9Tg@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: Hannes Reinecke <hare@suse.de>
Cc: Julia Lawall <julia.lawall@inria.fr>, Arnd Bergmann <arnd@arndb.de>, NeilBrown <neilb@suse.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Hannes,

On Mon, Jul 26, 2021 at 11:08 AM Hannes Reinecke <hare@suse.de> wrote:
> On 7/26/21 10:55 AM, Julia Lawall wrote:
> > On Mon, 26 Jul 2021, Arnd Bergmann wrote:
> >> On Mon, Jul 26, 2021 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>> On Mon, Jul 26, 2021 at 9:26 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >>>> On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de> wrote:
> >>>>> On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> >>>>>>> To make it work well, you need to know if frob() and/or the current
> >>>>>>> function return an error code or not.  While you can use some heuristics
> >>>>>>> (e.g. is there any return -Exxx), perhaps we can add an annotation to
> >>>>>>> indicate if a function returns an error code, or an error pointer?
> >>>>>>
> >>>>>> https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
> >>>>>>
> >>>>>> I think it would be useful, if not for the tools, at least for
> >>>>>> developers.
> >>>>>
> >>>>> Agreed.  I added some code to smatch so that I could annotate pointers to
> >>>>> say if they are allowed to be NULL.  The implementation isn't perfect,
> >>>>> but I love having that extra documentation about when I do or don't have
> >>>>> to check for NULL.
> >>>>
> >>>> I can think of four different annotations that limit what a pointer return from
> >>>> a function can be:
> >>>>
> >>>> a) either a valid pointer or NULL, but never an error pointer,
> >>>> b) either a valid pointer or an error pointer, but not NULL,
> >>>> c) always a valid pointer, never NULL or an error,
> >>>> d) always NULL, but callers are expected to check for error pointers.
> >>>
> >>> e) either a valid pointer, NULL, or an error pointer
> >>>
> >>> The last pattern is seen with the various *get*_optional() functions.
> >>
> >> I would always consider those the exact bug that I meant with "because
> >> everyone gets those wrong". I think the idea of the "optional" functions is
> >> that you have two implementations b) and d) and pick one of them
> >> at compile time. To the caller this means either an error pointer or
> >> success, but checking for NULL is a bug in the caller, while conditionally
> >> returning NULL or ERR_PTR() would be a bug in the interface.
> >
> > I'm not sure to understand the "bug in the caller" part.  Couldn't there
> > be two possible definitions of the called function, according to different
> > configuration options, and a single caller that calls both?
> >
> > Also, over 230 files contain functions that return both NULL and ERR_PTR.
> > A random example, chosen for conciseness, is the following from
> > fs/overlayfs/inode.c:
> >
> > struct inode *ovl_lookup_inode(struct super_block *sb, struct dentry *real,
> >                                 bool is_upper)
> > {
> >       struct inode *inode, *key = d_inode(real);
> >
> >          inode = ilookup5(sb, (unsigned long) key, ovl_inode_test, key);
> >       if (!inode)
> >                  return NULL;
> >
> >          if (!ovl_verify_inode(inode, is_upper ? NULL : real,
> >                                is_upper ? real : NULL, false)) {
> >                  iput(inode);
> >                  return ERR_PTR(-ESTALE);
> >          }
> >
> >          return inode;
> > }
> >
> And that I would consider a coding error.
> If a function is able to return an error pointer it should _always_
> return an error pointer; here it would be trivial to return -ENXIO
> instead of NULL in the first condition.
>
> Not doing so is just sloppy programming IMO.

In this case I agree.

For optional resources, the ability to return NULL (and for the caller
not having to care if the check should be for -ENOENT, -ENODEV,
or something else), and accept NULL for further operations greatly
simplifies the handling of optional resources like clocks, enable
gpios, resets, regulators, ...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

