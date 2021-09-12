Return-Path: <ksummit+bounces-547-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69386408248
	for <lists@lfdr.de>; Mon, 13 Sep 2021 01:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8794A1C0FAE
	for <lists@lfdr.de>; Sun, 12 Sep 2021 23:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850A43FD7;
	Sun, 12 Sep 2021 23:15:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27473FC4
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 23:15:18 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id h9so16935303ejs.4
        for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 16:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2N2k1ZowX0tTAsEZqcGRXPJ3pZWCVHPMWLioSri6Z4U=;
        b=QReNiXa0zoiQXttcIDAjAcWAOgq1oIpNKICUZBCsr1kpr1/G9DGJBGEkgK4T98B1WZ
         Wt4yVvyw5xt7a8VLW3nVGWc/ZPIxaVeRVNjm0pjQ4+ChC9qQ8sizHb3ODxluIP5jpQMf
         YMl1iFzKb3FuroE0H+rCamXx4WfnHVGhbXkb5gaQm5CrjOpy+hqbtgG1sX4hIYyPTXWd
         0z9Y3UzDT6HliSegoFZ26NQwtEVhG6kLL/jEMiZCEWAvNZg/yu1R144gtpQZ7ylZP4Tf
         XmrSSxHL4rdgA/yhSFKD6PkAKznueVGoStcdijDecOxR6Nzc/lvLnzy5dWYtF+vXjuSd
         Zy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2N2k1ZowX0tTAsEZqcGRXPJ3pZWCVHPMWLioSri6Z4U=;
        b=tbGVsg+JWoDroy7ATobTVAvdIXl8EATc/DpyjG84+cnjxlUSJyQkzvOfJNfqnf52A5
         3z1/TYfilti/+YWeG0AmJlRbtTHTkJKuOni15Ull+JTpdnsPftVtkwUWJUXqkxr6pqR4
         sDieXb9z1JECfkRBkYlI5KaQEupTJH27ts2Ru555C2/po7IFTWFl52Bs8O/DYyH5SAxD
         H3uOA7HSIGmw1HyKbu8dy81GRpNi0+97lbFFSthhYC7gsS/Gn2fuM9WpJQapu7JIH666
         H8DVu9gxWL07mwSYM+jtJC972EgD+QDgFyNu3f0hIk/kDYFarnV6XsRM2yM2T6/fGBuC
         8M1Q==
X-Gm-Message-State: AOAM533gntYuyMTMpzrpHHnUaoEAPT7xyW6Ip64ZyY6R+FyJHk2hZc3h
	eCF4OUJaAyF72zfK11HQZaoHYMukHmLAYuKamhg=
X-Google-Smtp-Source: ABdhPJzLmY22ZVVj15QmenTCSReVNAFGQG4MWqqLUKbKkhfYZZTtct59Mk3dtmeuTGANOe2fGFcaf/C8zlEuBOVOQfk=
X-Received: by 2002:a17:906:31d7:: with SMTP id f23mr9402781ejf.190.1631488517270;
 Sun, 12 Sep 2021 16:15:17 -0700 (PDT)
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
 <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com> <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
In-Reply-To: <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Sep 2021 09:15:05 +1000
Message-ID: <CAPM=9txX_f2iRPTGEeqbHqbPxZ2X-e4RStGXO-rz3KC2n4yyiw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Greg KH <greg@kroah.com>, 
	Leon Romanovsky <leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, 
	dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Sept 2021 at 08:52, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Sep 12, 2021 at 11:13 PM Dave Airlie <airlied@gmail.com> wrote:
>
> > For userspace components as well these communities of experts need to
> > exist for each domain, and we need to encourage upstream first
> > processes across the board for these split kernel/userspace stacks.
> >
> > The habanalabs compiler backend is an LLVM fork, I'd like to see the
> > effort to upstream that LLVM backend into LLVM proper.
>
> I couldn't agree more.
>
> A big part of the problem with inference engines / NPU:s is that of no
> standardized userspace. Several of the machine learning initiatives
> from some years back now have stale git repositories and are
> visibly unmaintained, c.f. Caffe https://github.com/BVLC/caffe
> last commit 2 years ago.
>
> In a discussion thread at LWN I raised Apache TVM as a currently
> quite obviously alive and kicking community, and these people have
> the ambition to provide "an open source machine learning compiler
> framework for CPUs, GPUs, and machine learning accelerators".
> https://tvm.apache.org/
> At least they have all relevant companies logotypes on their homepage,
> so there is some kind of commitment.
> You can find for example from Arm an RFC for real HW accelerator code
> support using (out of tree) Linux kernel drivers with Apache TVM:
> https://discuss.tvm.apache.org/t/rfc-ethosn-arm-ethos-n-integration/6680
>
> Then there is Google's TensorFlow. How open is that for a random
> HW vendor who want to integrate their accelerator and how open is
> it to working with the kernel community? Then there is PyTorch.
> All of these apparently active. Well CPU vendors often support
> two different compilers so I guess they could very well support
> three machine learning userspaces, why not.
>
> What confuses me is what kind of time horizon and longevity these
> projects have, and what level of commitment is involved and
> what ambition. Especially to what extent they would care about
> working with the Linux kernel community. (TVM have a mail
> address so I added them on CC.)
>
> Habanalabs propose an LLVM fork as compiler, yet the Intel
> logo is on the Apache TVM website, and no sign of integrating with
> that project. They claim to support also TensorFlow.
>
> The way I percieve it is that there simply isn't any GCC/LLVM or
> Gallium 3D of NPU:s, these people haven't yet decided that "here
> is that userspace we are all going to use". Or have they?
>
> LLVM? TVM? TensorFlow? PyTorch? Some other one?

Yeah I've been doing the same research, and there is also the Glow
project I think to add to the list.

The thing is control, everyone wants to run it, when it comes to Linux
nearly all the vendors have realised they've lost their control and
learned to live with it, but the second they are into userspace, it's
like hey we need to be in charge of every single piece of this, thus
losing the Linux kernel advantage of pooling engineering expertise
cross-vendor.

I certainly don't want to be the distro packager having to package 30
forks of LLVM for 20 different vendor accelerators with 20 runtime
APIs and 20 forks of TVM/Tensorflow/pytorch.

Enabling that behaviour by just merging kernel drivers and washing our
hands to me seems like a large misstep for the future of
maintainability of the kernel, esp as these devices start interacting
with GPUs or RDMA and we get locked into unmovable interfaces that we
can't even analyse for deadlocks etc.

Dave.

