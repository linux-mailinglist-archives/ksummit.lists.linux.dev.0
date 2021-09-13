Return-Path: <ksummit+bounces-548-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838CB4082D6
	for <lists@lfdr.de>; Mon, 13 Sep 2021 04:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id F41EE3E102E
	for <lists@lfdr.de>; Mon, 13 Sep 2021 02:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5853FD8;
	Mon, 13 Sep 2021 02:27:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E693FD3
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 02:27:13 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id t6so10546558edi.9
        for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 19:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rwHuCkIobuWTd1ONStmrBaL+cVlW7AePd85FeK3wFrM=;
        b=mG4Gtv2UKV37rvYHLPCk9NjmFmjbiyPW6G5GRcF4MdyrhA3zb8zU8B/Voc8FGr/fpZ
         eRWmyyfXcmmZnEqroRlmWZbLzICHO0Lzhp06MIfMJeAHrqs1HfurWCwtOVQHMgMThey9
         ZHwOSltTRfyEVU0I+y1ZcEw71qvbV59i2kZTzMC1yc7yR9KijSG7gjl9Kdt8SkDmKZbp
         1iiai68jJoOwJ+npLs55BvdPzUr8XqJO722tyWLzeP1Iq4YS23qrT5JveAgPc5clQArS
         gMCfdKOogprABkMOYMBdtJJvlRqVrlSNgFUrRmKl+m8+4T2KTtQhByVRx+55wMw6/DRs
         Zwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rwHuCkIobuWTd1ONStmrBaL+cVlW7AePd85FeK3wFrM=;
        b=UZ355at3CamfLkhHfmcItRrduNGyR1H/+kmtTpnfYoPoWUrts9uMi6fYkFBlqQxsrm
         M+ruPLsl4VXLzHj6C3EfZc6hiL+xwB+w+xci2TsZ1nQ8A0iDYuMzA8enCGG6olfmKOAO
         qFQIeCCGDEwnymKOagexIQoUfNz0+8SFKMxRLeGatLLihRbdUzpvmjgbh7/iREChq0cM
         LY+iEzOxMQPfxf5LkQl7r5ULNuDk4ioEpd3zVu1OqUurShL8OZ/oZBUx2qmENvRME+QH
         Wc0lXkYw3jancUO3hZM552sM7TDwtIgKLVX981jn5ThsiEujNZvHMrryIvB2vmTOxqHw
         mhTw==
X-Gm-Message-State: AOAM533Rhhta2L7TUOJP/8WpL6QvLOHygBfRnag9iLSLehXXtE6Z3hdm
	uAM/sfN8F9c3H6CfY0x8AaHGfORcn/ulmnMXHdubBM5c+cI=
X-Google-Smtp-Source: ABdhPJxbS8OXCp7RXDsihWrgZDGyCJ0MnRCfQHQdqZqSlyG8QX+0/0E8Ze0e/NMnbHOO3TcqLGOPNwRWUgWra+da0pM=
X-Received: by 2002:a05:6402:2919:: with SMTP id ee25mr4997493edb.395.1631500031298;
 Sun, 12 Sep 2021 19:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <877dfop2lx.fsf@meer.lwn.net> <CAPM=9tx+wAUSuYm+8eyGX2Y7+J5qY9hZHB7JY_XO_TYEQYJk8g@mail.gmail.com>
 <YT5Zf/nq5WobZLyI@pendragon.ideasonboard.com>
In-Reply-To: <YT5Zf/nq5WobZLyI@pendragon.ideasonboard.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Sep 2021 12:26:59 +1000
Message-ID: <CAPM=9ty7qa3+Sd4GUb2GRbUHef406FCgvezvry+g-KqTT01QfA@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Sept 2021 at 05:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Mon, Sep 13, 2021 at 05:13:05AM +1000, Dave Airlie wrote:
> > On Sat, 11 Sept 2021 at 07:10, Jonathan Corbet <corbet@lwn.net> wrote:
> > >
> > > There has been a regular disagreement in recent years about whether
> > > drivers for accelerators (such as for the Habana Gaudi device) should be
> > > subject to the same requirements as GPU drivers when it comes to the
> > > availability of a free implementation of the user-space side.  It flared
> > > up again recently:
> > >
> > >    https://lwn.net/Articles/867168/
> > >
> > > Happily, the Habana situation in particular seems to be resolving
> > > itself:
> > >
> > >    https://lwn.net/ml/linux-kernel/CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com/
> > >
> > > But even there it is clear that the fundamental question has not yet
> > > been resolved.
> > >
> > > This seems like the sort of question that the maintainer summit exists
> > > to address.  Specifically, we could discuss:
> > >
> > >  - Under which circumstances should the kernel community require the
> > >    existence of freely licensed user-space code that exercises all
> > >    functionalities of a proposed kernel driver or feature?
> > >
> > >  - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
> > >    are only available to drivers with a free user-space implementation?
> > >    Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> > >
> > >  - What constitutes an acceptable user-space implementation in cases
> > >    where these restrictions apply?
> > >
> > > I suspect that more clarity (and fewer arguments) on these questions
> > > would be welcome both within and beyond the development community.
> > >
> > > Thanks,
> >
> > Can everyone take a read of:
> >
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> >
> > I think in order to clean the signal/noise ratio up in here, some
> > education effort might help people realise how non-trivial these
> > things are.
> >
> > 1. These drivers are not one or two ioctls that a few selftests and a
> > small test app can cover. It's like saying LTP is all we need to
> > define the uAPI for the kernel and if anyone does something LTP
> > doesn't cover the app is broken. These systems are generally complex,
> > multithreaded and multiuser uAPIs, involving command streams recorded
> > in userspace being submitted to the devices. They interact with memory
> > management and can cause unfindable deadlocks across the system if
> > designed incorrectly. Documentation or kselftests aren't going to cut
> > it here.
> >
> > 2. In my experience we don't build communities by merging everything,
> > we build them by saying No more and pushing back on companies with
> > education and cross-vendor cooperation. Responsible kernel maintenance
> > shouldn't end at the kernel boundaries. If you aren't the person to
> > help enforce a userspace for a driver you are being asked to merge,
> > then don't merge it, but try and engage the vendor with the
> > communities of interest in the kernel who already deal in those areas.
> >
> > 3. The pressures on these companies to merge things into Linux isn't
> > altruistic or even that they necessarily want to be in the Linux
> > kernel upstream. They are being told by Red Hat, Facebook, Google or
> > someone else that they need an upstream driver. They will generally
> > engage at a minimal level to get past that blockage and then
> > disengage. Having a clear set of rules (or a place to discuss those
> > rules, for new subsystems) and a gentle pushback helps develop
> > communities by unlocking funding within those larger areas. As Laurent
> > has said this isn't free, but just putting things into the kernel and
> > not caring about userspace hasn't built any Linux communities in the
> > accelerator areas.
> >
> > That said I started writing a cleaned up version of the above document
> > which is more generic that other subsystems could sign on to. I was
> > going to engage with a coalition of like-minded maintainers rather
> > than trying to gain consensus among a herd of cats to see if we can
> > draw clearer lines in the sand that cross more subsystems so the
> > experience of drivers/gpu doesn't go unwasted but also isn't just
> > bypassed by subsystem hunting.
> >
> > https://cgit.freedesktop.org/~airlied/linux/log/?h=wip-open-source-userspace
>
> Thank you for that effort. Could you add camera ISPs to the list with
> FPGAs, DSPs and ML accelerators ?

I'll add that to the next iteration, thanks.

>
> You mention Level0 in that document. I assume you don't mean the
> OpenStreetMap editor ?

https://spec.oneapi.io/level-zero/latest/core/INTRO.html

It's like a vulkan for OpenCL effort, they've already managed to put
things in the API that are close to impossible to make work on the
Linux kernel properly, again because Intel internally thought they had
better experts than the kernel, but we are trying to get that all
fixed up.

Dave.

