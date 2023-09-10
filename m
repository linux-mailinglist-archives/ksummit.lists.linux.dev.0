Return-Path: <ksummit+bounces-1115-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B2799F15
	for <lists@lfdr.de>; Sun, 10 Sep 2023 19:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 318A42810E5
	for <lists@lfdr.de>; Sun, 10 Sep 2023 17:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE8C847C;
	Sun, 10 Sep 2023 17:26:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD12568
	for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 17:26:44 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59b50b4556eso26060937b3.1
        for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 10:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694366803; x=1694971603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+d/Au1fHXa75PgVco+gMMH+imp/hCis9khLj99DfGd4=;
        b=Yin+UjRGeE64WK1Gzfy3bGFx7v/it3iBvxmsmSMtEiV5Flkqh8g9jvAXXyophGN/2u
         TZIuJezyPo7/tYVrumZvtuy5dDvMSJ4xHWXuIdv39oopEgLLU7VbKsFXzIJ2T0O8chax
         iEux9Ux8+SMePqQ9EEUZEYNK/oCpTjAkmmQW/9pGpzwvSas6tsJoCcz0tYMU+Rn+hwUY
         +NYlXNUtR/V5p8CfgbPAdLCQ+0uVYmArW/8W57XJ5V3BaJds+/Ygc3tQH/E+Sie4CVjv
         U8exo6pLbt3FdyZeHFNOlBkAvNZTm9SZhRz8/uVFXwIke6T6UNkTRlWtqRT5T0W4/xzV
         atng==
X-Gm-Message-State: AOJu0YxKlugKie/mzllewSHIaoklKchCxHI8EZclifeu3OqZAKqI0IJw
	f4xtJ3yjmuExO7vwvVJMMppqz+Ng8h1VGA==
X-Google-Smtp-Source: AGHT+IEnx3pmJerKv1n+/iwE/r7aOzra9L9o2x2FS8xHE79jki1u3ShOqfKpHt2anb8lElHwUcZ2eg==
X-Received: by 2002:a0d:e248:0:b0:591:4f2b:7eea with SMTP id l69-20020a0de248000000b005914f2b7eeamr7917914ywe.18.1694366803165;
        Sun, 10 Sep 2023 10:26:43 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id v8-20020a814808000000b005845e6f9b50sm1510424ywa.113.2023.09.10.10.26.42
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 10:26:42 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d7b8d2631fdso3467361276.3
        for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 10:26:42 -0700 (PDT)
X-Received: by 2002:a25:2488:0:b0:d74:6c9f:e734 with SMTP id
 k130-20020a252488000000b00d746c9fe734mr7321441ybk.47.1694366801859; Sun, 10
 Sep 2023 10:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO9NK0FchtYjOuIH@infradead.org> <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org> <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <20230909224230.3hm4rqln33qspmma@moria.home.lan> <CAMuHMdW3waT489ZyUPn-Qp_Nvq_E-N0uimV=iw5Nex+=Tc++xA@mail.gmail.com>
 <20230910163533.ysbcztauujywrbk4@moria.home.lan>
In-Reply-To: <20230910163533.ysbcztauujywrbk4@moria.home.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 10 Sep 2023 19:26:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0VLMKdZbZnWbs8CrO_h-1bx6HW25bnN6Agq+N3PYatQ@mail.gmail.com>
Message-ID: <CAMuHMdV0VLMKdZbZnWbs8CrO_h-1bx6HW25bnN6Agq+N3PYatQ@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Matthew Wilcox <willy@infradead.org>, Dave Chinner <david@fromorbit.com>, 
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 10, 2023 at 6:35=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
> On Sun, Sep 10, 2023 at 10:19:30AM +0200, Geert Uytterhoeven wrote:
> > On Sun, Sep 10, 2023 at 12:42=E2=80=AFAM Kent Overstreet
> > <kent.overstreet@linux.dev> wrote:
> > > On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:
> > > > So why can't we figure out that easier way? What's wrong with tryin=
g to
> > > > figure out if we can do some sort of helper or library set that ass=
ists
> > > > supporting and porting older filesystems. If we can do that it will=
 not
> > > > only make the job of an old fs maintainer a lot easier, but it migh=
t
> > > > just provide the stepping stones we need to encourage more people c=
limb
> > > > up into the modern VFS world.
> > >
> > > What if we could run our existing filesystem code in userspace?
> > >
> > > bcachefs has a shim layer (like xfs, but more extensive) to run nearl=
y
> > > the entire filesystem - about 90% by loc - in userspace.
> > >
> > > Right now this is used for e.g. userspace fsck, but one of my goals i=
s
> > > to have the entire filesystem available as a FUSE filesystem. I'd bee=
n
> > > planning on doing the fuse port as a straight fuse implementation, bu=
t
> > > OTOH if we attempted a sh vfs iops/aops/etc. -> fuse shim, then we wo=
uld
> > > have pretty much everything we need to run any existing fs (e.g.
> > > reiserfs) as a fuse filesystem.
> > >
> > > It'd be a nontrivial project with some open questions (e.g. do we hav=
e
> > > to lift all of bufferheads to userspace?) but it seems worth
> > > investigating.
> >
> >   1. https://xkcd.com/1200/ (not an exact match, but you should get the=
 idea),
> >   2. Once a file system is removed from the kernel, would the user spac=
e
> >      implementation be maintained better?
>
> This would be for the filesystems that aren't getting maintained and
> tested, to eliminate accidental breakage from in-kernel refactoring and
> changing of APIs.
>
> Getting that code out of the kernel would also greatly help with
> security concerns.

OK, xkcd 1200 it is...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

