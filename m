Return-Path: <ksummit+bounces-541-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D5407FCE
	for <lists@lfdr.de>; Sun, 12 Sep 2021 21:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B9A271C0782
	for <lists@lfdr.de>; Sun, 12 Sep 2021 19:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321073FD8;
	Sun, 12 Sep 2021 19:53:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE543FC3
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 19:53:09 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id x11so16316803ejv.0
        for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 12:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SrwzCBaBozKMLMmTj5Gu73miS6KNduUeAwMpbmGlYVE=;
        b=cm7eUenEA72ufEhr0t3Ox+bLNBpXSGo4qfeJbSP6PuPiTJfwxzwfygJ78xS4QOLv0p
         K2CkPHDzxYlQ4/Ire8+stuQnF3Lmu28PTgatKc8mmfnbiEvZZ2HwpfdyKNsanq0uHYTc
         3QyMCTyu5rfw5C8NlhbufZVO9Bwr8UlgLuFAo8NMX8mkUfFvR8bB0ncIgGPRuesZFVml
         +UtKm1Och8tQSkoGV8rNfpBUcH2yy95Yj95cL0yCVWqJRCs5uHBeQHjz3srO5Jc6HCkS
         GKiE3HLxQMKHhm27SRuGKgh6Apj8R5XAMwQYYPWWVp650t8xSso7GYYREq8BVL25GGGL
         W+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SrwzCBaBozKMLMmTj5Gu73miS6KNduUeAwMpbmGlYVE=;
        b=L+0GCKqXlSMhu5U/bPK+l0dU14XdsF+kyB62kQtQdMvucGTbj7C16rgv0FGe2PjXWM
         FYG8lyrnFuAlqoVBJZs9MSQ9Auq3KJ98mnO89hwgV89Fx++XmYJRBZKUtXDeq9XT61uF
         Q4XSALH37Yjz73M9ZwhDh0xmHkl9dWbnwLpdpS9deG6H/GVpV+C0+0NjYNp4KpT9BsRt
         ne7I3NdckwAqLvYbp07l6O8GM2/g1XV7zfGEYvH2oFNEiTAUAJT0hG0vSIJM6aEAwA6r
         p8RcaeD3+7T+nYXvaAotMIwkwxKVcsxCbfDoUXq54OfkDQsFN+9fOP1aqNOB9Mv365em
         XyFg==
X-Gm-Message-State: AOAM532wwUAvLB09VBC+Yy4E4qCAYlycFp0RpTMAeHB++SnOGBTdlQVW
	S39OPOwfH4STScv3lxuhHl3lZZwCUlwVa3Mpw2E=
X-Google-Smtp-Source: ABdhPJzfiQYs5OBRYK738aby5l7pJDuN7Fp3mZzTc2cVuYPlm46zc945XGumiJwvNUxog7p/IHpHIIaytYKpDYQJFag=
X-Received: by 2002:a17:906:6d55:: with SMTP id a21mr8927702ejt.509.1631476387894;
 Sun, 12 Sep 2021 12:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <877dfop2lx.fsf@meer.lwn.net> <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost> <87ilz8c7ff.ffs@tglx> <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com> <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com> <YT2By1+yuo7rcu2D@unreal> <YT2rwbBR6ilHmwSZ@kroah.com>
In-Reply-To: <YT2rwbBR6ilHmwSZ@kroah.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Sep 2021 05:52:56 +1000
Message-ID: <CAPM=9tw1RsVw7j8d=Zt13C6YpetZB-3UGJ8n6E3h363N6yWS8Q@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Outside of all this, I disagree on distros being the target at all.
However distros are probably a good thing to have involved.

It's much easier for a distro to package one project than one
per-vendor project, esp if that one project has a release cycle.

If every company forks an LLVM backend for example distros will never
be able to ship things, getting the LLVM backends upstream into LLVM
means the distro get it for "free" on the next LLVM release. Creating
kernel-like communities for userspace should be the goal, why do we
want to forget the benefits the kernel ecosystem has given us as soon
as we exit a syscall handler?

> >
> > 1. Niche devices - continue to do as they do it now, by supplying
> > out-of-tree solutions for their customers. Such devices and companies
> > rarely need upstream linux kernel support, because the burden to
> > upstream it is very high. We don't want them in the tree either, because
> > once they upstream it, the maintenance burden will be on us.
>
> {sigh}
>
> No, that is NOT our rule at all.
>
> These devices and companies need to be upstream more than anything else
> as that way they become part of our community and are responsible for
> maintaining their code in the tree.  To force them to remain outside is
> to go against everything that many of us have been saying for _decades_
> now.

Name one group that has actively become part of the community via this
advice, (I'll wait).

From my view most of the communities have been created with more
push-back by kernel maintainers, gpus, rdma, media, alsa vs misc (X
accel drivers with no home or common cause).



> > And AI/ML is no different here, someone just need to start build such
> > stack. Otherwise, we will continue to see more free riders like HabanaLabs
> > which don't have any real benefit to the community.
>
> Everyone contributes to Linux in a selfish manner, that's just how the
> community works.  The work that companies like habanalabs is NOT being a
> "free rider" at all, they have worked with us and done the hard work of
> actually getting their code merged into the tree and their userspace
> code released under an open source license (unlike _ALL_ other AI/ML
> companies, including Intel).  It would have been much cheaper and
> quicker of them to just ignore upstream entirely, but that would have
> meant that the community would not have any idea of what exactly these
> use-case models were nor what the problems were that they were trying to
> get Linux to do.

These companies don't get to ignore upstream entirely. They aren't
here because they want to be, at least initially, they are here
because RHEL, Amazon, Facebook, Google whoever told them they would
buy their hw if it had upstream drivers in a contract and they have to
do the minimal amount of work to get past Greg to merge stuff and
satisfy that agreement. The community is very well aware of the needs
of these groups, it's not like we don't have lots of GPUs being using
for AI/ML. The habanalabs hardware is just a VLIW multithreaded
processor almost like taking an AMD evergreen and shaving off the
texture engines and other GPU specific bits. There is nothing new or
exciting here that hasn't been solved.

>
> Linux benefits overall by having everyone participate, do NOT make
> arbitrary rules to somehow prevent one company/group from being allowed
> to upstream their code vs. another.  That is NOT how we have worked in
> the past, and would only cause us to slowly die and become irrelevant.

The Linux Foundation might benefit, Linux doesn't. Linux benefits and
stays maintainable by having responsible maintainers guide the
direction of the kernel design, and creating upstream communities to
sustain that.

Dave.

