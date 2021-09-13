Return-Path: <ksummit+bounces-554-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C340911D
	for <lists@lfdr.de>; Mon, 13 Sep 2021 15:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 72FC01C0F4F
	for <lists@lfdr.de>; Mon, 13 Sep 2021 13:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF22D3FDA;
	Mon, 13 Sep 2021 13:57:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776023FC4
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 13:57:37 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso13421852otu.0
        for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q1gKaB1lBw/hHmnDxx2OAjAQfJZc8FXFBR2odacBPvI=;
        b=bR/GtL2Kx4fRKncM4+4DS4XMX14akxSbnuGjXjiT16pxeuYbYMwUImUgfnWcUDs8Mz
         JxKXVN0ag27AFPGgpARO65ylGXkQXw5q6oIoU6Via8sEfsiNzMbrbTpydRm0jV9pm6Xi
         Lp/YmvjaRLRsi+eKzPMIrAzgAOlVf9SHapNgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q1gKaB1lBw/hHmnDxx2OAjAQfJZc8FXFBR2odacBPvI=;
        b=DHzd8YPOk+m9zIQzDHRnc0A6uli7a4MFt4MkDXa2pZ/AkcOQmYn8so9nFWSeKhLDXQ
         /QlmzIL5JbTGaJGHdcUB+rIk3+vuRzkcJr09nDt8cy/3DkhFmH5Xh4lkIwAPOBWHUYUN
         avgdpN/AoPRo+AoH8Oz9I8vlC1Xi6gm25UFWJY7TjsvRtKn752AVL7slcHWnHbPA11q/
         VnKGXb6oIyAg/URsFpUcUIQ33g6pbSVUQQ5uE4uK9+cVpt8KkZyzSMLA+8o5+i1PrmM7
         MtcbvM93gmp+mYMAi8m23etuAp+SuiZoAGrz613mQVhmninWBWqGVPpaQxz4iGJYlifj
         uSjg==
X-Gm-Message-State: AOAM531ggyyOWNpoeYGhAwC/91mIqODUXA40dCNmvhzgadFHXRb4griG
	t2icd8UM6o2v6AJ/i7aoKh88u3GWYDQs/fbnsGkeGOokMPY=
X-Google-Smtp-Source: ABdhPJw6dJ+ZOfR4IuSuhnDOwI7KxOsJtWqa2XtmiHNWVvR6r4ZwG7Sp3aqYyQDS38kdTQidyOey3JOZWn8Y5bYBQh4=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr9689586otn.239.1631541456626;
 Mon, 13 Sep 2021 06:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <877dfop2lx.fsf@meer.lwn.net> <YTvPAMT9FRCUeWjR@localhost> <20210913135014.ydhk42ncnzakvvii@wittgenstein>
In-Reply-To: <20210913135014.ydhk42ncnzakvvii@wittgenstein>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 13 Sep 2021 15:57:25 +0200
Message-ID: <CAKMK7uFPxVosEvdwSOrfUvq7+W-dUo39ktEm2Yag_wvJ5YvZNg@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 3:50 PM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
> On Fri, Sep 10, 2021 at 02:32:48PM -0700, Josh Triplett wrote:
> > On Fri, Sep 10, 2021 at 03:00:58PM -0600, Jonathan Corbet wrote:
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
> >
> > I think it'd be reasonable to ask, as well: if we required this for
> > *all* kernel functionality, such that we never add any userspace
> > interface to the kernel unless there's *some* Open Source userspace that
> > needs/wants it, what problems would that cause if any?
> >
> > It appears that in this case the kernel pushing back has influenced the
> > release of Open Source userspace code. Having a kernel-wide policy here
> > seems like it'll *help* people within many companies to push for such
> > changes: "We're never going to be able to get our changes into the
> > upstream kernel if there's no userspace to drive them."
>
> I can certainly see why that discussion is needed for features that deal
> with hardware which requires an elaborate userspace component in order
> to work.
> But I'm not convinced this policy makes sense for all kernel features.
> For example, when we introduce a new general api in kernel core it will
> often be driven by requirements of other well-known open source
> projects. If such projects state that they will add support for it once
> a kernel supporting this feature is released that expression of their
> intent is often sufficient. We usually don't make such projects jump
> through the hoops of implementing the userspace side upfront to proof
> that they would use it. Although to the credit of a few open source
> projects that does also happen. But I'm hesitant to make this a general
> rule.

I agree it's an orthogonal discussion, but I think we've also had our
fair share of fully generic interface that turned out to miss the mark
in real-world usage. This is why the generic kernel
modesetting/display interface for drivers in drivers/gpu also needs
fully open implementation. Not because we really need that for
long-term maintainability - the interfaces are generally well-defined
enough that testcases + docs are sufficient for that, but because in
practices it just catches so many small gotchas that are otherwise
overlooked in good generic uapi design.

But I do think we should keep this apart from the discussions for hw
drivers, where 80+% of the driver that's absolutely needed to drive
the hardware is in userspace.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

