Return-Path: <ksummit+bounces-544-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AAC4081AB
	for <lists@lfdr.de>; Sun, 12 Sep 2021 22:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 09F6F3E102B
	for <lists@lfdr.de>; Sun, 12 Sep 2021 20:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0815D3FD8;
	Sun, 12 Sep 2021 20:49:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6E3FD3
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 20:49:31 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso10584229otu.0
        for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 13:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5Uk9e9qSnClwWld6wXoUpWUgDOMxIYg7RSB/Icu4fo=;
        b=K26u6q/yrgGGtJCW+LS+zdG3fLj6zGMCyBNcJdWQAE0F6Y/JPNf5n/wJ+rK93rSqJi
         vXihbnAZSrVzNILvZjTqDHqvKxEJAjyImGxpkU0DGZZ6E3uVRnRF52/y7mTqRxLeKIGs
         Dz09GHPSaz3NRT2CPBLkdaqTHXX5HKdC4Sh/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5Uk9e9qSnClwWld6wXoUpWUgDOMxIYg7RSB/Icu4fo=;
        b=SDwbehS5aMQsNp0S02TBPLYQ+2emFAwu+S+1zN7kmyl1cSWQEiLjmzsxORSWYmYoqh
         pVKGTNIwJMZTCWtQrb1yyULf1+KzPVtqeODa79w9WMHpeXjDUgDqhq5q2IOVc7Pyj7Bd
         o/rghGROH9SxQ8zeyzvrvG8x8YTYzFQFnKy/eEcy0T7dAy2A8FH1yH7n3Nu7Ny4sM3Hs
         88JE0K9gjD9Fv9nNFZT2+eNbypCw22ycJbqITHE2iBJhi/LpnzE4LGsj8D/fY16lifA6
         Ys1f0ujYQmGGd5acUY5+LESW/yn5oSSloTi9ZLfc98TL/7DVb3VKfbHhfjskcWte3u7T
         825A==
X-Gm-Message-State: AOAM531uFsLiwk+AtyyabUvhzYvfxj24x1PewsN22KdWPJu4ZXyQoOb+
	mDFw/8UPd5zxfBLHSwX8Y8pXK5MmVRZJYb+aEYEe5A==
X-Google-Smtp-Source: ABdhPJzsJ3DZTBSxWLMhvLnngXDHrpZmZWJLnYBw8XOClLfU3WXDTfVv0BCRcahhdZNP0sL6G3MOkx99Zg2KdrdCWcg=
X-Received: by 2002:a9d:724a:: with SMTP id a10mr6926730otk.323.1631479770952;
 Sun, 12 Sep 2021 13:49:30 -0700 (PDT)
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
 <YT4LgkK+ejUWljEh@unreal> <YT4QCHwnqZL/rl0z@kroah.com> <CAPM=9twpxAP13fEv8BxsSkd4Xcqxu989F3biiPFFDgKRADL0KQ@mail.gmail.com>
In-Reply-To: <CAPM=9twpxAP13fEv8BxsSkd4Xcqxu989F3biiPFFDgKRADL0KQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sun, 12 Sep 2021 22:49:20 +0200
Message-ID: <CAKMK7uHQw8=GKpayxzOJUs4BnwoVDS08Y9bynp6=VH+eW35Pgw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Dave Airlie <airlied@gmail.com>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Josh Triplett <josh@joshtriplett.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 12, 2021 at 10:41 PM Dave Airlie <airlied@gmail.com> wrote:
> > So will the IB patches usage be re-reviewed?
>
> https://lore.kernel.org/linux-rdma/MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com/
>
> FYI it's a thread where GPU devs reviewing IB dma-buf patches, what's
> next cat and dogs living together?

And as you can see, the review has been long and involved a ton of
different dri-devel (and rdma ofc too) folks.

It's like there's an entire community of experts at hands who could
help out in reviewing these things, if only we'd not have a maintainer
who happily bypasses all that and invites all the dumpster fires into
drivers/misc. And then complains that no one helps with reviewing ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

