Return-Path: <ksummit+bounces-545-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF394081C3
	for <lists@lfdr.de>; Sun, 12 Sep 2021 23:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 199861C0AD1
	for <lists@lfdr.de>; Sun, 12 Sep 2021 21:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12D43FD8;
	Sun, 12 Sep 2021 21:13:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0B3FD3
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 21:13:02 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i6so11228821edu.1
        for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 14:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HGE/ztmqxPAMMdaU0wJ26aLoBnivxECwFW5W7+kR44c=;
        b=lIGBSs5CdFMRxeLtMNc+wq67N/1RWIO31mqkwc+5oBhsExCMkbJmX5ru0PA0SEon6p
         SM6fa5UFCG2oAXbjF8ZJTnxVgUXnRzk5/b88nEZiGvHRhlBDc1pISq9w0x77gKEW1IY5
         dLbms6d9c7PosFLAaUHV0yNuM6nd+B1xT+xGUI/5N4QlU/qsxsbYWDdT9nbLTNfPTLyt
         BhEAboJxoZfUrDA36PQJjlc0f6lRCA8U4rMLxxyZY+JutvTMxLS6uK2jpnzaJTqphCNw
         KEXo0judxICqcFkZ6UcrW0m6vFuYuilH03iE3lg66a6yThZEW8eTbrmEaWs92L30n86R
         0PUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HGE/ztmqxPAMMdaU0wJ26aLoBnivxECwFW5W7+kR44c=;
        b=ETzH2c+alcPgZA8gmuZU2QQk/XkgAN9tktRY1W6MYeFYC/LYaoXOji+VeR2K5qULcc
         23VowRMqLanfc9BGX6syflkOc+ykQv8J7vr0XyLsBrPEHTpsQCOG1RugidhuhqsDgA1z
         XUQ22jc/2oC1jodmf6QPi89DBy/59xmja0u5AFOBqGM9tTlX/r5ubkfKUc1QaHvO87mK
         kPp/4dReZnULJLuMGMq460GBXRDoFtCXi6FN2ER/jCbF3PrvP9GcuWKD3Nd8NTKE1iBH
         4cVEMMAWGotwPTlxQtvcdPuwASK01cN+ecsQQdT3KD6HHXKlGttk36q/Fvz8kR9bpUjP
         IBhg==
X-Gm-Message-State: AOAM5321u0l28GQ5He3BbRov9GWt8B3ll4qoV3S/J294diKpMtJz73Mq
	il/q+7Ovdi6Wk2aukHpQVZTsvC4e0o16rtGhhzA=
X-Google-Smtp-Source: ABdhPJytwXKU+iVIoZZsSzlEbYkvibtqCeuLpEnzYimjhSc1NN6Zrfy6DCOMXVM6tbnrfUwl+3i+ACrAhk2MOVSV6IM=
X-Received: by 2002:a50:f60a:: with SMTP id c10mr2329359edn.250.1631481180672;
 Sun, 12 Sep 2021 14:13:00 -0700 (PDT)
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
 <CAKMK7uHQw8=GKpayxzOJUs4BnwoVDS08Y9bynp6=VH+eW35Pgw@mail.gmail.com>
In-Reply-To: <CAKMK7uHQw8=GKpayxzOJUs4BnwoVDS08Y9bynp6=VH+eW35Pgw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Sep 2021 07:12:49 +1000
Message-ID: <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Josh Triplett <josh@joshtriplett.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Sept 2021 at 06:49, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Sun, Sep 12, 2021 at 10:41 PM Dave Airlie <airlied@gmail.com> wrote:
> > > So will the IB patches usage be re-reviewed?
> >
> > https://lore.kernel.org/linux-rdma/MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com/
> >
> > FYI it's a thread where GPU devs reviewing IB dma-buf patches, what's
> > next cat and dogs living together?
>
> And as you can see, the review has been long and involved a ton of
> different dri-devel (and rdma ofc too) folks.
>
> It's like there's an entire community of experts at hands who could
> help out in reviewing these things, if only we'd not have a maintainer
> who happily bypasses all that and invites all the dumpster fires into
> drivers/misc. And then complains that no one helps with reviewing ...
> -Daniel

Daniel makes a good point here about "communities of experts".

We need to foster those cross-vendor expert communities to sustain
Linux going forward.

For userspace components as well these communities of experts need to
exist for each domain, and we need to encourage upstream first
processes across the board for these split kernel/userspace stacks.

The habanalabs compiler backend is an LLVM fork, I'd like to see the
effort to upstream that LLVM backend into LLVM proper. When this sort
of thing happens it gets on the radar of the LLVM compiler experts,
instead of it just being the habanalabs experts. I've met so many
internal company experts who remain unchallenged internally but buckle
when introduced to true communities of expertise. If we want to keep
this thing growing and maintainable we need to tap into those existing
expertise groups. This is why it's important we foster userspace
groups. If you hear the myth that only our company understands our hw
enough to write code for it, it's been proven bullshit numerous times.
It's an excuse for retaining control.

Also if there was a shared runtime library repo with cross vendor
review, I'm betting they'd all learn a lot about how a userspace
should work and be maintained rather than assuming they knew it all
themselves.

Be more like spiderman, great maintainership + great responsibility.

Dave.

