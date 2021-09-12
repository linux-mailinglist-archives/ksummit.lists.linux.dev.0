Return-Path: <ksummit+bounces-542-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4040818C
	for <lists@lfdr.de>; Sun, 12 Sep 2021 22:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id F30AF3E103B
	for <lists@lfdr.de>; Sun, 12 Sep 2021 20:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBC73FD8;
	Sun, 12 Sep 2021 20:35:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD193FD3
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 20:35:23 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id jg16so16412750ejc.1
        for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KftEffNg7oK1S+3tRLbuIG5rRYQqaJD92IFS7QqiZ7I=;
        b=K5LjE954ICO6efZGn6ysvpmiqijdPsS6KNXniwoKAEWS5GEcNHnJCM+shEa15EARSq
         cAxt4g9Sxuw1eeBY5bh9tLKhllrwDVo4qzJ7oHUI0WhYrzBWqM8mrYUtU3RSKmyGNwjx
         nSije6fbjwKpEDYMHvLwZON0WKreCSwPsjh9yr6KrCMxYKbQHyrggV8RWJDYZ+KeDgs8
         zO/MsXoLBLp0DfuVPlFA0XuFnsNjdTaLHGtuOj4ZRlINEicQXAbChspiv/n/y9K+IY5D
         Ir5zqdYPMuFfCEGDH8PQELa/Swg/pi39yt9Cgj3sEww8khzn5oDvbA5ZOYecAe/5kAXy
         B8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KftEffNg7oK1S+3tRLbuIG5rRYQqaJD92IFS7QqiZ7I=;
        b=JfLrYPVAQv1EAQUHWt4SOR4sxxVMzTxKFfJN8tzaeRWRurNL6PECYC2YdACphNl+yL
         akurRyYkSBaz+CuGpn9JXtQy35aXraKFE4fcNpT1LWyBdjIl7jf8+Qiroi+mh8y7+47V
         QNrKpEbSpwVjIpbY170feSXMDt2WP9xOXmj3MT3ujqUlgItjuShqI7E2KyqmUeWCTCQY
         gLrTvpOUkqSMzOpLsRfNIZ6YOzN09gIzEBjKlbsUN3wiLnN2uTByLn4vKF4G0F9jm8PH
         FA7HnlvNWXL6QblZleOPwIlsoPl9ncLt00wf3t0d35Hb0y/iftTBwWemTJRx6xHVJqaX
         Hf3w==
X-Gm-Message-State: AOAM533YhD3WavDV0aDSU91DMN/t3pXdkN28NvngcT0RiMepneOBNiRH
	+Zs60oo7GSC00DP7rvfuiz4pgQOPaXFN0hgxX4A=
X-Google-Smtp-Source: ABdhPJxvaXF6XTAZTFj+pd696EV/0aqk4MuUlbtsA1IBVjAUdWlwi26d+hRe/RmcWqV/CdXdrZWXcpNhUZ9jGlXoKKw=
X-Received: by 2002:a17:906:c1c9:: with SMTP id bw9mr9050744ejb.3.1631478921787;
 Sun, 12 Sep 2021 13:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87ilz8c7ff.ffs@tglx> <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com> <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com> <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com> <YT26ebT6xXWsnVMw@unreal> <YT3/5kJuhw/QVqrw@kroah.com>
 <YT4LgkK+ejUWljEh@unreal> <YT4QCHwnqZL/rl0z@kroah.com>
In-Reply-To: <YT4QCHwnqZL/rl0z@kroah.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Sep 2021 06:35:10 +1000
Message-ID: <CAPM=9tynnfnM2D+6ySJceiXwX4rEKDy+v=grBdZgWCMVXRJZGw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> So should we be forcing everyone to follow the IBM standard for
> accelerator drivers because they were in the kernel first all those
> years ago?  Or what other standard do we pick?
>
> And why are we dictating new industry standards here?  Who are we to do
> that?  Who is going to take that responsibility on?

There is no sane kernel API standards here, the standards that control
these devices live out in userspace, far away from the world you want
to inhabit. Responsible kernel maintainership should come with
knowledge of the entire ecosystem and where it's going. If people are
trying to merge kernel drivers and you don't have enough
info/knowledge about the ecosystem, then say No.

> >
> > Because dma-buf API has specific semantics and was designed with very
> > specific usage model in mind.
>
> So will the IB patches usage be re-reviewed?
>
> Anyway, we have apis that are used throughout the kernel all the time
> that don't end up on the various subsystem mailing list because people
> forget, or just do not know.  That's normal and something we have dealt
> with for forever.  As an example, I didn't realise that just using the
> dma-buf api required such a review.
>
> Can we put that in the MAINTAINERS file somehow for apis?

We have had MAINTAINERS rules matching on the dma-buf includes

78baee8d3b976a6a6a2c208e3a36d3f1e6297e6c
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed Dec 4 22:51:05 2019 +0100

    MAINTAINERS: Match on dma_buf|fence|resv anywhere
and a later followup to clean it up a bit.

> That is a great question and I do not have the answer to that.  Should
> we have done that after the first one went into the kernel all those
> years ago?  Maybe, but I seem to recal the answer being "our hardware
> works much differently, so our user api will be much different", and
> that's a valid answer.

Every GPU driver has a different user API, all of them there is no
standard. We still merge them but we require userspace. Maybe if you
could sign up to follow the same rules it might be less onerous on
you.

>
> It's a hard line to draw, and for some reason, I seem to be the one
> having to review these types of drivers every kernel release.  If people
> wish to help me out, please do so, all the patches are on the lists.

We do help out, we've said No. I've no idea why you go ahead and merge
things sometimes.

Creating a trash pile in your neighbourhood and then complaining when
more people continue to dump more trash on it seems a little
disingenuous to me.

We need to take more responsibility for the way these things are used,
and making sure there are frameworks for them.

We got things where they were by saying upstream first a lot without
thinking of the consequences of success. Now we have that success we
should start thinking of the responsibilities that come with it.
Distros like RHEL/Centos are why these vendors are pushing stuff
upstream, the want to be included. However once they do that they no
longer gain the benefits of the Linux development model and just run
off and spawn 20 userspace projects that they can maintain control
over. Companies love control, they hate not having ultimate say over
their kernel drivers, and they won't willingly create userspace
projects where that happens either, not unless we work together for
the good of the ecosystem, not just the good of the kernel.

Dave.

