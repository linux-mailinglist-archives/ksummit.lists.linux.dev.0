Return-Path: <ksummit+bounces-164-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A336BC60
	for <lists@lfdr.de>; Tue, 27 Apr 2021 01:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CBD331C0DED
	for <lists@lfdr.de>; Mon, 26 Apr 2021 23:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603912FA9;
	Mon, 26 Apr 2021 23:51:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042AD2FA4
	for <ksummit@lists.linux.dev>; Mon, 26 Apr 2021 23:51:03 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id x7so57556882wrw.10
        for <ksummit@lists.linux.dev>; Mon, 26 Apr 2021 16:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zy8lWToUipVMvn0XiQVQIZoTcmvgQu3I7mE833hMYwM=;
        b=ToCV30oNB2ztVsxGgHjZKgWGYHygxvwZYJztsJgiQVka/AYfXPgtqAsCkbKrXUcYSJ
         Dbk+uYILcXP0AmrWGpJKW+GOr5w6g3RRb6n3pOWgoz6AdCeDYN3X9nv8wwYOMFoCHmXi
         zXTzcnWvUYUS761p3724CQJUtEHjzKCcj4/s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zy8lWToUipVMvn0XiQVQIZoTcmvgQu3I7mE833hMYwM=;
        b=VYZYtSkT856qwrmD/FXa0C43+EkBmH4EIbyFm2Wh7X4tpW/dDQ4iH4ZKjBbvdbEQAz
         Pbgj5YEndyxpVqNNQXHctVKUObkPHghj9M9KXvfjasYkxPoXPss8pDzClye5rmw28YGB
         nurq3e/puKSXzXI1hxSABTdgS2k4r+GI/n/gW/LrPDDl+Tjz8nownbIHn7PvfrucTZGa
         C7+6Y9/+DKo1w9ocEjP6FM3ITS/CxibB4newAXeU3e4iQ1h07law7BhnYsFiF4rZ7rqC
         htH2XasK7W0J//PmBqoMx0+8RJe9Q6tpl0rQKocR+ivEL+0dqQCBSZsN+UXLULvImLMw
         gJOg==
X-Gm-Message-State: AOAM5318E7iYy8G2u05+LQdW0KWyfm2Rho4UIK//mdEKr4Owc3a2Vfwk
	neKeJrWtPvIXOYvUrsUlIFlc0TH19/yhIjBcuUsYPw==
X-Google-Smtp-Source: ABdhPJxF32ubQrQ4uMZYbdySNXoobqubGy9cvy/FSDol/Pn1ZTkMzxRMY7W4c++5/sLSKJId0rQ9C+kqf8fEIlSU5dg=
X-Received: by 2002:adf:e647:: with SMTP id b7mr25328443wrn.43.1619481062390;
 Mon, 26 Apr 2021 16:51:02 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YID5xhy2vv45fnOv@unreal> <20210422112001.22c64fe9@coco.lan>
 <YIFfXTVMDmHwVmSR@unreal> <20210422092916.556e5e50@gandalf.local.home>
 <CAL_JsqKS-=shqkLhzKeLHqNPhosGJw5X-fOi+dy1rT3Q_LfBZg@mail.gmail.com>
 <20210423080454.78f4f662@coco.lan> <6c221d801c5a6834168207b5ccadc76ac432c766.camel@perches.com>
 <20210423091320.4f2381b2@coco.lan> <CAD=FV=Xi6TL05M2bYKNgNB-ePY40CvonPzJYeMhXMPGgYKA5_Q@mail.gmail.com>
 <20210423160310.GD5507@sirena.org.uk> <YIMAAFCe5N7ORNRX@unreal>
In-Reply-To: <YIMAAFCe5N7ORNRX@unreal>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 27 Apr 2021 09:50:51 +1000
Message-ID: <CAPnjgZ2iiv-M3M8MaVFxQzHrT5jhL+YhPv+COxRMjCVU_OAS9w@mail.gmail.com>
Subject: Re: Better tools for sending patches (was: Re: [MAINTAINER SUMMIT]
 Rethinking the acceptance policy for "trivial" patches)
To: Leon Romanovsky <leon@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Joe Perches <joe@perches.com>, 
	Rob Herring <robherring2@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The docs are on github also :
https://github.com/siemens/u-boot/blob/master/tools/patman/README

I find it relatively easy to update each patch with a little change
log as I change it. Then I know that when I type 'patman send' it will
do the right thing.

If people have workflows that would benefit from patman's help, but
need it to do an extra thing, I certainly accept patches to the tool.

Regards,
Simon

On Sat, 24 Apr 2021 at 03:12, Leon Romanovsky <leon@kernel.org> wrote:
>
> On Fri, Apr 23, 2021 at 05:03:10PM +0100, Mark Brown wrote:
> > On Fri, Apr 23, 2021 at 07:52:30AM -0700, Doug Anderson wrote:
> >
> > > I know it's nearly impossible to get people to change their workflows,
> > > but if you're open to it I definitely suggest giving it a try. Simon
> > > Glass (the original author) is also quite receptive to improvements.
> >
> > I have something broadly similar (much more simplistic and overall less
> > capable) which I wrote myself - the things I have that this doesn't have
> > are:
> >
> >  - Attesting the outgoing patches with b4.
> >  - Tagging the published series in git.
>
> I have something similar too, which actually wrapper over git format-patch
> that properly set target (net-next, rdma-next, iproute2, rdma-core, mlx5-next
> e.t.c) and changes "To;" based on target.
>
> Thanks

