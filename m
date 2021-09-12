Return-Path: <ksummit+bounces-546-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9840821B
	for <lists@lfdr.de>; Mon, 13 Sep 2021 00:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8B1761C0F84
	for <lists@lfdr.de>; Sun, 12 Sep 2021 22:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313C43FD7;
	Sun, 12 Sep 2021 22:52:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2D73FC4
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 22:52:12 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id k4so16956844lfj.7
        for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 15:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LIu27xKp8TfkfV4vWXbDp5Bpgj+yEW1yUDNsMngyfEw=;
        b=s2c55g15tLWUMNAXBG0ngbla+oGTqJmFqHYaaiJdhzCewsE2S1/FEYqwiQ19t9I8wI
         mybk7+4rz+MeQ6Np8LEGJVf1fGIUH1Wb45o9ZC20C0iLrRiA2NRIdvbKVrM4amkUZ6UH
         M2+dxENQTZaMmOlYXaeSn7q3brQ/kQhSLRzof7MaO1I7PgN7Ov47+OvYrez9DXYSc26E
         3UEO/Dh3Paz0OF6dHBoxssttk6AG9GTkoryGM7i1X91iEERO3myClTBxHcLQdyRnGRkp
         3qd3pQ7YNpoiHVaXk5H+cfqnx9KQJRid1LSXHT+Xy9MPqnSrLzAByjUnFSrr/P8XD2ra
         n9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LIu27xKp8TfkfV4vWXbDp5Bpgj+yEW1yUDNsMngyfEw=;
        b=JXkq5XDC9BBEfQGYtL1HHSmNfdK+gfahe9IMLtsKwiIljReDOpb3j57mUE1I91Wx9A
         bGlgcPPLiv6RXjpQFPIaAYt80DiFn7S2o2u15yRI8tNYMAUcy9EEgaKhL80kQgqaCfLG
         Lj/I1g+RvtKF4ycTtzXEJCCgV2+4S5XBsGJrNlqt7I5m/wDLyVi1rM37hLnTjANG9ZJW
         Q5ciRchrShH8RUQhIM4FCyku9hIprdzaqBcMdZQ8DdZocopTO92Ov0MycgUNPxwGepJT
         b1odJvrI8ibbn3tN7Y7eabXMZKjmwAgHvUw8tU+nF+O4pGqVibms+xX4QlSy1bgge4VA
         eDtQ==
X-Gm-Message-State: AOAM532DM7NwSPZsFroG6iaBO2+HKg01jSYhdNrAqGbo/SPymIFhz86/
	2EKocC3YHA9gwP0t3VxyKLKV3qYCv8+1yIACkLMRhw==
X-Google-Smtp-Source: ABdhPJwezlxvkY4U865Sm/9GBLuZAGU+h7azlqrSwaN/+Bb2RmHcCetJsvw/THKarRw/NfDGGIVtYfDenZYGM3wn8zI=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr6732602lfu.291.1631487130655;
 Sun, 12 Sep 2021 15:52:10 -0700 (PDT)
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
 <CAKMK7uHQw8=GKpayxzOJUs4BnwoVDS08Y9bynp6=VH+eW35Pgw@mail.gmail.com> <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com>
In-Reply-To: <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Sep 2021 00:51:59 +0200
Message-ID: <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Greg KH <greg@kroah.com>, 
	Leon Romanovsky <leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, 
	dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 12, 2021 at 11:13 PM Dave Airlie <airlied@gmail.com> wrote:

> For userspace components as well these communities of experts need to
> exist for each domain, and we need to encourage upstream first
> processes across the board for these split kernel/userspace stacks.
>
> The habanalabs compiler backend is an LLVM fork, I'd like to see the
> effort to upstream that LLVM backend into LLVM proper.

I couldn't agree more.

A big part of the problem with inference engines / NPU:s is that of no
standardized userspace. Several of the machine learning initiatives
from some years back now have stale git repositories and are
visibly unmaintained, c.f. Caffe https://github.com/BVLC/caffe
last commit 2 years ago.

In a discussion thread at LWN I raised Apache TVM as a currently
quite obviously alive and kicking community, and these people have
the ambition to provide "an open source machine learning compiler
framework for CPUs, GPUs, and machine learning accelerators".
https://tvm.apache.org/
At least they have all relevant companies logotypes on their homepage,
so there is some kind of commitment.
You can find for example from Arm an RFC for real HW accelerator code
support using (out of tree) Linux kernel drivers with Apache TVM:
https://discuss.tvm.apache.org/t/rfc-ethosn-arm-ethos-n-integration/6680

Then there is Google's TensorFlow. How open is that for a random
HW vendor who want to integrate their accelerator and how open is
it to working with the kernel community? Then there is PyTorch.
All of these apparently active. Well CPU vendors often support
two different compilers so I guess they could very well support
three machine learning userspaces, why not.

What confuses me is what kind of time horizon and longevity these
projects have, and what level of commitment is involved and
what ambition. Especially to what extent they would care about
working with the Linux kernel community. (TVM have a mail
address so I added them on CC.)

Habanalabs propose an LLVM fork as compiler, yet the Intel
logo is on the Apache TVM website, and no sign of integrating with
that project. They claim to support also TensorFlow.

The way I percieve it is that there simply isn't any GCC/LLVM or
Gallium 3D of NPU:s, these people haven't yet decided that "here
is that userspace we are all going to use". Or have they?

LLVM? TVM? TensorFlow? PyTorch? Some other one?

What worries me is that I don't see one single developer being
able to say "this one definately, and they will work with the kernel
community", and that is what we need to hear.

Yours,
Linus Walleij

