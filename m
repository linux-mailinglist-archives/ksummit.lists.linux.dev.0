Return-Path: <ksummit+bounces-1112-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE06799D08
	for <lists@lfdr.de>; Sun, 10 Sep 2023 10:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C8351C208E1
	for <lists@lfdr.de>; Sun, 10 Sep 2023 08:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1668420EB;
	Sun, 10 Sep 2023 08:19:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196941FBC
	for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 08:19:47 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5922b96c5fcso32115317b3.0
        for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 01:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694333987; x=1694938787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQDVEYR0NkrDO5D5DNG/VELdAd044MCaEh/R0RnIJkc=;
        b=TWt4IhvX2EQx096jFTnPLigElj46WGcoqHGaRbMQzy+/ZTRoH/x3LSn6zxEXONP6it
         8hS9PoLAgGxgpEtz5YUTuGxiCXCYfDRdT2OfzuJOmATsOZChC6B3RqH/LEbIteGL3IxT
         IneccxtGz5TTYmv8EiOW8dYUyo5EIBUOSWIv89/G/Y7kQmSg+Yxe10ti4YsR4dKcKrz5
         z5+0K73y+oESYJoKyipM7h0RicZRraR+Dvmp2izdAhcCO456aYSkEDr2V3m/xXEdg31Y
         KQteGCaMuMoGyZD7mVBxPh0QOSH87K4NUliieZCvv0hUoP9NHv2CCJntPplhiBmeB1dP
         66MA==
X-Gm-Message-State: AOJu0YxqaFOGKGIAt/kbJzqgRkR+Ue03a7EWxFNS10UG4vWuGL4vVbb8
	dOX6i2PfwfWFB/WmhlSTByw9wWxfuJQVRg==
X-Google-Smtp-Source: AGHT+IHxMfSmo7z1AoqMQWHfWQyHjTPMiowLMYsh3+NalLwc6KKDX1rLL+YPPyemLGNoRi9IRhhJ2g==
X-Received: by 2002:a81:4987:0:b0:592:9433:d2f5 with SMTP id w129-20020a814987000000b005929433d2f5mr6772911ywa.5.1694333986746;
        Sun, 10 Sep 2023 01:19:46 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id o186-20020a0de5c3000000b0055a07e36659sm1311138ywe.145.2023.09.10.01.19.45
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 01:19:45 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d7eccc1b8c6so3257545276.0
        for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 01:19:45 -0700 (PDT)
X-Received: by 2002:a25:ab8d:0:b0:d53:f98f:8018 with SMTP id
 v13-20020a25ab8d000000b00d53f98f8018mr6592647ybi.65.1694333985224; Sun, 10
 Sep 2023 01:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO9NK0FchtYjOuIH@infradead.org> <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org> <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <20230909224230.3hm4rqln33qspmma@moria.home.lan>
In-Reply-To: <20230909224230.3hm4rqln33qspmma@moria.home.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 10 Sep 2023 10:19:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3waT489ZyUPn-Qp_Nvq_E-N0uimV=iw5Nex+=Tc++xA@mail.gmail.com>
Message-ID: <CAMuHMdW3waT489ZyUPn-Qp_Nvq_E-N0uimV=iw5Nex+=Tc++xA@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Matthew Wilcox <willy@infradead.org>, Dave Chinner <david@fromorbit.com>, 
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kent,

On Sun, Sep 10, 2023 at 12:42=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
> On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:
> > So why can't we figure out that easier way? What's wrong with trying to
> > figure out if we can do some sort of helper or library set that assists
> > supporting and porting older filesystems. If we can do that it will not
> > only make the job of an old fs maintainer a lot easier, but it might
> > just provide the stepping stones we need to encourage more people climb
> > up into the modern VFS world.
>
> What if we could run our existing filesystem code in userspace?
>
> bcachefs has a shim layer (like xfs, but more extensive) to run nearly
> the entire filesystem - about 90% by loc - in userspace.
>
> Right now this is used for e.g. userspace fsck, but one of my goals is
> to have the entire filesystem available as a FUSE filesystem. I'd been
> planning on doing the fuse port as a straight fuse implementation, but
> OTOH if we attempted a sh vfs iops/aops/etc. -> fuse shim, then we would
> have pretty much everything we need to run any existing fs (e.g.
> reiserfs) as a fuse filesystem.
>
> It'd be a nontrivial project with some open questions (e.g. do we have
> to lift all of bufferheads to userspace?) but it seems worth
> investigating.

  1. https://xkcd.com/1200/ (not an exact match, but you should get the ide=
a),
  2. Once a file system is removed from the kernel, would the user space
     implementation be maintained better?

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

