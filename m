Return-Path: <ksummit+bounces-1076-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDEA794396
	for <lists@lfdr.de>; Wed,  6 Sep 2023 21:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626B41C20B27
	for <lists@lfdr.de>; Wed,  6 Sep 2023 19:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536CF111AC;
	Wed,  6 Sep 2023 19:10:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561436AB1
	for <ksummit@lists.linux.dev>; Wed,  6 Sep 2023 19:10:06 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58dfe2d5b9aso1454157b3.1
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 12:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694027405; x=1694632205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkX+J5EM5enh7df0o5MYGhhqFKI4D2hwIpC2ueReZ28=;
        b=hOy4pkKblaGXmJkHx3rW+e61QVEGwhq4DK+hBEuvEwkNFZ9k7SlNJDzr8DcxGqTif4
         1mkdeQW9bztstu5RY3cv8Z/csf+ybDl31OFOJ6Bn0wzf5s8Dl3mIxsS4pbErBAUuqE4u
         QzhHrSulJQgdOkusB1tevqiwTOe0/NcjHSgttgG0FnWf0ux+8+I5H44caYcCdlBxbjGq
         vVFC+hLqjHAkfSeRtb6A+DdS0ruwp561GUMdxmbtceRiFmH7x3lVE8O7jpt2cU00VgEu
         kXqBEri75qo2R5A+L1s7Gh4zLhxp//qAdrbgltQ9LnCDFlFTPvtgK8NsLnKBT8GvQwOS
         bN2A==
X-Gm-Message-State: AOJu0YzaGim+1bcnaPs+pvsyKySz/p5fh7nE2AQ1aRInM7+2hA/EyTbd
	cpAYYRvOrkQzAN2srxHkxLhBO6KmMvsVNg==
X-Google-Smtp-Source: AGHT+IEjUJeUCBhw2OEFgqIT23jzrq3WTJSDROAV3E4J1Vwi6JxV6lp+MNvuUQnOEw6YNp93tYF2MA==
X-Received: by 2002:a0d:e689:0:b0:579:e6e4:a165 with SMTP id p131-20020a0de689000000b00579e6e4a165mr474923ywe.10.1694027405031;
        Wed, 06 Sep 2023 12:10:05 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id c3-20020a81df03000000b0058038e6609csm3897779ywn.74.2023.09.06.12.10.04
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 12:10:04 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d7766072ba4so1788865276.1
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 12:10:04 -0700 (PDT)
X-Received: by 2002:a25:2601:0:b0:d71:6f6f:73da with SMTP id
 m1-20020a252601000000b00d716f6f73damr497667ybm.6.1694027404176; Wed, 06 Sep
 2023 12:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO9NK0FchtYjOuIH@infradead.org> <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org> <ZPffYYnVMIkuCK9x@dread.disaster.area>
 <20230906-wildhasen-vorkehrungen-6ecb4ee012f1@brauner>
In-Reply-To: <20230906-wildhasen-vorkehrungen-6ecb4ee012f1@brauner>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Sep 2023 21:09:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxigtcGS23Ppwc-Wh6hyiPPwbb4R_iZV56OnD46EdMjg@mail.gmail.com>
Message-ID: <CAMuHMdWxigtcGS23Ppwc-Wh6hyiPPwbb4R_iZV56OnD46EdMjg@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Christian Brauner <brauner@kernel.org>
Cc: Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>, 
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Wed, Sep 6, 2023 at 5:06=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> util-linux has already implemented X-mount.auto-fstypes which we
> requested. For example, X-mount.auto-fstypes=3D"ext4,xfs" accepts only
> ext4 and xfs, and X-mount.auto-fstypes=3D"novfat,reiserfs" accepts all

I hope that should be achieved using "novfat,noreiserfs"?

And let's hope we don't get any future file system named no<something> ;-)

> filesystems except vfat and reiserfs.
>
> https://github.com/util-linux/util-linux/commit/1592425a0a1472db3168cd924=
7f001d7c5dd84b6
>
> IOW,
>         mount -t X-mount.auto-fstypes=3D"ext4,xfs,btrfs,erofs" /dev/bla /=
mnt
> would only mount these for filesystems and refuse the rest.

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

