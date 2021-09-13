Return-Path: <ksummit+bounces-557-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 457EB409F71
	for <lists@lfdr.de>; Tue, 14 Sep 2021 00:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1701D1C0FAE
	for <lists@lfdr.de>; Mon, 13 Sep 2021 22:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563EF3FD8;
	Mon, 13 Sep 2021 22:05:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464283FC4
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 22:05:14 +0000 (UTC)
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MnpwC-1mj3XX1Blq-00pMw8 for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021
 00:05:13 +0200
Received: by mail-wr1-f45.google.com with SMTP id u15so10844626wru.6
        for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 15:05:13 -0700 (PDT)
X-Gm-Message-State: AOAM5305WiIPkdJxwWno4qVJ+qM+XuIuzIMHOJg1k7BMSl93ipaalO3t
	g8jsj4IlUjDetZLKSiSd6rZ4DAlu/TPQcVIfKlQ=
X-Google-Smtp-Source: ABdhPJxG6/h73753Hs6+4qHJpM9RaF0r6KlYOQf9PfguuYgU0OJ8yGtEkrP9z2mdMGcgwYxKCiiHSdquhaYk0FXUn3M=
X-Received: by 2002:adf:914e:: with SMTP id j72mr15167909wrj.428.1631570712850;
 Mon, 13 Sep 2021 15:05:12 -0700 (PDT)
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
 <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com>
 <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
 <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com> <CAKMK7uFrOpH9NG3XB1dT889r4HrUHaotte1D4Nh2=5tjD9VEpg@mail.gmail.com>
In-Reply-To: <CAKMK7uFrOpH9NG3XB1dT889r4HrUHaotte1D4Nh2=5tjD9VEpg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 00:04:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2pvCwuSic9yevW0xmMy0-F1FEgfQ-_Rc7wWDs7PJEf_w@mail.gmail.com>
Message-ID: <CAK8P3a2pvCwuSic9yevW0xmMy0-F1FEgfQ-_Rc7wWDs7PJEf_w@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Dave Airlie <airlied@gmail.com>, Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Josh Triplett <josh@joshtriplett.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev, dev@tvm.apache.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:I/zF3E3iOqednxniysmOidlEMjSkbhM/SfUKbu42G+WFbaevMTd
 BkkHiCtXeWcxKORF4a1UCWBq4A/MLNifcvhTyeg1zWiH+L1jNy7KSw4bgUk9YXF25vuiduU
 axA7+oKmI7LGIjKUXdBpKHqfoVj2geTRcnbJXsIpzIyz8QjooNXxCW8pE/nFt9fHsZsnOfA
 gJy6km35k/Oc+1UmNJzxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:miXeeXrCENc=:sIpMr5j4GEszAugoCHXlZn
 b8YFeltEpfeVBBipWOJvbZk2ewAjVXpxugbDlpjaaB6d1Z7i8iIK4Wq7+hTpDDDYGlWidd+AO
 2djzdW3S1S+ihFqn6aGd8pEihy5YpYZicc0v5zJDOjhM79l66yQIFvoAW9NRIZIlhhgqI9Y+q
 MywxT513NplSZxS1odN0Y+uymxHWN5IbSwWhRUhdgUdMU1uZ9RlsVRknp0iF9o8ILqKEp6kHO
 mwfktDHg28VIMVAD+Wc6iAo9d0AWkxM9idhCWNZBIEU64KNtNz1fu6g3MnetWUeALjhosYJ8H
 FDY/xXaYpVIyfc2JwjIiHc36faAjDSLJrJLEGGOFJ/NAPhAz7fuSbYc34JPqTk4WWKtPCUOax
 6fGa1/b+ApT/rO9OKj/ks+kcWIt/0AldHC1jYd4lGFdnqp2NyJkEYFdUjqJXn5KSZnM7FmKUY
 pMovoKagY/Akeg6Ik1rNKHFedJqSwsxH60Ce8aeweCCAOdPUR/ClwDRXymWh4XWe5q392xdyI
 ntn3rTuMJz8iCMcGNQe2qij9dUYHSamMLPRgQOe6APzsVG7Lb75WXidt3JI7W5CTYMMPUcZCE
 eWPUAq1Od6WACePewe6mqqUSOpZHyvgp/JuQ1oioqeH7GkxcPCoJ6iX2vIQ7FkU38pIduh4J6
 FOS/orVnXJeonVf1LMaP7bheeIV6DI9+quJE6giUVgmJJCBt3PBnveXPOcNw+qU9WJT6eMguC
 7LktHMmL7w10g+S6v9lmejSudcKtXJtrYJpPZLOV1q+2ixO557U04Y4MtvS1mXt0ktMS1YCF0
 qd+QwJ93LlRl9Tu6qoFd4xNbSdGEM6U+jL5/wJrqXG+l+3Jh/uoSkC31LcKtseUJmY0IyyNcR
 M9Y3UqResp0W4gSeJD8w==

>n Mon, Sep 13, 2021 at 3:54 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> > One straightforward hardware independent low-level API would
> > be the traditional BLAS GEMM call[1] for matrix multiplication
> > and its variants (integer, float, bfloat16, ...).  Most of the frameworks
> > are able to use SGEMM to do the actual calculation since that
> > has optimized versions for most CPUs and GPUs, and most
> > hardware accelerators should be able to provide an
> > implementation of this that doesn't completely suck. This
> > can be used for both inferencing and training.
>
> I think BLAS are too high-level for these. Sure fore perfect speed the
> vendor probably wants to have their own BLAS thing, their own NN
> optmizer and a heap of other things, but for the low-level userspace
> we're talking about here that pretty much doesn't matter.

I suppose high-level vs low-level is not the correct distinction here,
it's more like fixed-function vs programmable.

As a fixed-function interface, something like GEMM is probably as
low-level as you would want to get, as it's big enough to make sense
as a single atomic command, but small enough to be able to build on
top of it.

> I think a really good example of this is the compute stack Intel is building:
> - level0 is the absolute bare-bones low level driver. For this
> discussion here that's enough of a userspace to make at least Dave&me
> happy. In 3d this would be vulkan. In AI/NN space, there's nothing
> here, at least nothing cross-vendor.
> - Then there's the entire OneApi ecosystem on top. Lots of this is
> open, some of it is closed, but from the pov of an accel stack it's
> all looking like applications, not like driver code. BLAS is sitting
> here. For AI/NN this is pytorch, tensorflow and all these higher-level
> frameworks (which often have quite sophisticated optimizers of their
> won)

Looking at OneAPI, I see a BLAS implementation (oneMKL) next to
somewhat higher-level abstraction (oneDNN). Which of the two are
the generic frameworks (pytorch/tensorflow/...) built on top of?

The oneDNN interface looks like it could be implemented not only on
top of level0 but also layered above some BLAS library or as a thin
wrapper above a fixed-function kernel interface that provides similar
high-level abstractions. Is that a correct understanding? It also seems
like this is similar in purpose to Apple's BNNS library.

> Especially BLAS isn't the most impressive, since largely it's fused
> multiple-add benchmark and not much else. Ok, enormous amounts of
> tuning to perfectly exploit the execution bw and interconnect/cache
> hierarchy of your chip, whatever it is. That's often something vendors
> don't like sharing (intel's math kernels are still closed afaik)
> because it leaks a bit much about actual implementation details of the
> chip as opposed to how it's programmed. Also not something I really
> care about with my maintainer hat on.

It's not /just/ benchmarks, it's actually being used directly underneath
the high-level frameworks precisely because it is simple, portable and
well optimized. If there is a higher-level interface like oneDNN that
is usable by the common frameworks, using a subset of that as a
fixed-function interface for the kernel may be a good alternative
(or at least complementary) to a fully programmable interface.

I realize that fixed-function is not fashionable on GPUs, but they
are widely used in other areas (video codecs, crypto, ...) even when
you are running precompiled code on the accelerator hardware.
This would of course replace the question of open source user space
with the question of open-source firmware, as the user side would
become mostly while the accelerator goes from dynamically created
to a firmware blob.

       Arnd

