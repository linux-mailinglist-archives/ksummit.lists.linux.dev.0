Return-Path: <ksummit+bounces-453-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E853D5445
	for <lists@lfdr.de>; Mon, 26 Jul 2021 09:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 4113E3E0E4E
	for <lists@lfdr.de>; Mon, 26 Jul 2021 07:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D67E2FB2;
	Mon, 26 Jul 2021 07:31:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8243570
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 07:31:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M2fDl-1m4Lxb1Hqx-004EqH for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021
 09:26:04 +0200
Received: by mail-wr1-f41.google.com with SMTP id p5so4717544wro.7
        for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 00:26:04 -0700 (PDT)
X-Gm-Message-State: AOAM530HEx/UjOjluAhxatu/W9M9pzQySEZWSroePwOGAmQqoS7gEoZ4
	UjJxHtB5umUEVnd/bNelW1hTtCIbxzihagkFDus=
X-Google-Smtp-Source: ABdhPJy+3PmaAXbv4qyGlkvAOaNVQGkFNpRfUL9aBan5qQuGPdH2zqQX1WC6EBqFAwMHtz5WxbiAM+lkKeResq0IQj0=
X-Received: by 2002:adf:e107:: with SMTP id t7mr17615692wrz.165.1627284363927;
 Mon, 26 Jul 2021 00:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com> <162717033769.3676.6942299974175827854@noble.neil.brown.name>
In-Reply-To: <162717033769.3676.6942299974175827854@noble.neil.brown.name>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 26 Jul 2021 09:25:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
Message-ID: <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: NeilBrown <neilb@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dQNG+FYDW2BQOIQXHUCOt897vPNkOwLo37LTCiuyHrBJSpOznYA
 2tIOZp0hJHTOshCScqv/i9jJyPNW7VpJQ6i9SZ/f0Flme8EZyaQOA9NcEB57tvlImcm7jwb
 Id0uNt1KtYq9f1CVMdnL5xNGwa0wenxjQQ5tRw1pBvP0c8HNnEhHCyjJVeqInukza3X7cBq
 BAosJP0m8muUzKeCWEDSw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:26w5wUh1tV0=:ph+r8PN/3PWqbDEVKv4IK3
 vIWSiL1lpYwXFortpl/d6gKyxzhbP9IIcdEAE+957gy9sD9OJovWAR1CltG4UM0am0MEJa+PF
 lUFuOrjH9E6DUXZLmu69WiMEXHmOjtYBr01mmOZcVk4JhQoEG2AuB0mce54yCrdF6+9MYm7fu
 jEBUyR14JcPBlc0loyXvSb/469viezARwbZzis6IgK9ygyz2WrGvV16iiPSAjYtenbk8hOqgb
 H572LAXpIgP4IygObYoDsf3zRf3rgIsmJYFsZm8CO8wjEUjt7QqlqsLSZhjCbuOP39AnbjmAm
 IuX4SUAuWtB8tJjwCaCF2YiLMjFh10vsIHWG6PaX0Z1uiAG8BnKLOCPUpypgvQepGjFsJvS7D
 Hr1moJJu1bTlYJgc2tV0eXO22WjTp3Im8nAE4GU+rcuW5FK1H/UIBqpWgLxPOUw/j5O5uCeEE
 dSwrmWcAj3zTtCj8chhZQa0mEnNqj/RgLed2rjPU7k6IMZZKRUNO+C37hBYjONibe0XZCvsZY
 JyFwGtX6NHQRsC6khXGMAjhna+wBZuR9UyRux8W0WmWoyqvN8DfMnoISqvWciGiIOpiGU/A1r
 MKJqZ+bsLMA0hTtU/v1DTp1PH2GTL74LoJJtTPc0GnvLD1TMpvT6dbwBR1DpDEYzowFZ5vdE/
 ZMg84iMIt/v98MeCbg7qj0lykLSnFtPOXrJ+2yI/myRBGw2rR78I0FB3DKZCzLcwFIJooFeyG
 2tYxxKAXuUMxDWv/FUAwLkt394Hyugz4SK+tUBKcCMpjIOvzo3KNh2XpYykurd5YOUOw5pG4T
 ompI46IT+fSGk5HA/Qu/GrUtKvo+qykjuGPGJLgsOgIsOy6Q9ys/pHO9/JDMApD13Yt04Mo

On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de> wrote:
> On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> > >
> > > To make it work well, you need to know if frob() and/or the current
> > > function return an error code or not.  While you can use some heuristics
> > > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > > indicate if a function returns an error code, or an error pointer?
> >
> > https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
> >
> > I think it would be useful, if not for the tools, at least for
> > developers.
>
> Agreed.  I added some code to smatch so that I could annotate pointers to
> say if they are allowed to be NULL.  The implementation isn't perfect,
> but I love having that extra documentation about when I do or don't have
> to check for NULL.

I can think of four different annotations that limit what a pointer return from
a function can be:

a) either a valid pointer or NULL, but never an error pointer,
b) either a valid pointer or an error pointer, but not NULL,
c) always a valid pointer, never NULL or an error,
d) always NULL, but callers are expected to check for error pointers.

The last one is the tricky bit because there are a couple of subsystems
that intentionally return an opaque NULL pointer to indicate success
when the subsystem is compile-time disabled, and expect callers to not
dereference that pointer but instead pass it into other stubbed-out
interfaces. I think this one is rather specific to the kernel, but also really
useful to have in a static checker because everyone gets those wrong.

        Arnd

