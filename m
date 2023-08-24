Return-Path: <ksummit+bounces-1059-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAEA7869D6
	for <lists@lfdr.de>; Thu, 24 Aug 2023 10:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A426B1C20E81
	for <lists@lfdr.de>; Thu, 24 Aug 2023 08:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3609FAD4A;
	Thu, 24 Aug 2023 08:16:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A1B5388
	for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 08:16:44 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d743a5fe05aso5715570276.2
        for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 01:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692865004; x=1693469804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udVU9Cr8nXYnW5ei5jjOt/+2nKzu3rMHWbQTSvUVhHo=;
        b=AmN4WELFdKK/XisOLfW9hLLeJPjfp+mvlYMKRqFEM+v6RTAw9yeCMMtIAaa2oba868
         XWx9D/QtXfwxiVRNFt5tcJWdDascyFIcc1szZSYEKnjqnt6btDLnTZMKE6ZeHEj5FolF
         tlJUSwCIE061Lf7GMlx45TGaeYwhEZxSPd5tpmli61ZgDUQL5QlxSW0bygfCqlbFpD/J
         ZFsq9gSSUIiO8rL6KQT7NUZSMHd7Sgl0aCAUbg5nN/ZbuhO+zl09pmn09fcx1+NP5glB
         X7dLunFb3RUx7RuARrlakG4X4K7o5cDRI6/O8ArKd1FhyV4x+lwcFM29wTm3X/1X3VsV
         Wo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692865004; x=1693469804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udVU9Cr8nXYnW5ei5jjOt/+2nKzu3rMHWbQTSvUVhHo=;
        b=L6N8kFQd8PTW6LWLXrECMNWBYr+UMoBTBzajrbwWxUsmFWT23zJAOqkmaBTR/bKuFs
         j5xBa+8LavVop/HKfPDtfmor6bDhFMBb5Lu3WxTKJr3F9rqFgPyPA1DR8axrRcdYA8bx
         kKqE2utWykTudDXMdKI32YnEkw3HJUGabaaWqwR1QjVMApE6t33INsL8bn9ptgu/7EHJ
         BrJXUBda+0I1qn2CwzRlqFYJuhhAcAMm0D5G1Ysd2cwVp3QZbRpSnum9xm3GuWP5f2bW
         XdU9Z0S9Mpx0X/iDnGTKYMzeY2BjMaM1CYsGJ9gf/yeJW3TpG7frziW+mSda+UVx6caX
         /uuA==
X-Gm-Message-State: AOJu0YypHhzpBxreF+8Juqg+hrwRoS3pLCMPNRm+3Jpv7ZZmnSq5I9Un
	n/uVwa3fpqW67xxbMzWKMhTM35mivuobQIWTNZsyOA==
X-Google-Smtp-Source: AGHT+IGwgkaZjRf+qt5U1KgdIGDVT6LqupZgIO8JM4/kkM5yxmK2IAKYRPu99iC0CZSyfzzCVa9YP5M1dMFjpWTCMY8=
X-Received: by 2002:a25:9e8c:0:b0:d77:e338:1b6b with SMTP id
 p12-20020a259e8c000000b00d77e3381b6bmr2742361ybq.14.1692865003601; Thu, 24
 Aug 2023 01:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <2023082250-replace-rectangle-1d47@gregkh> <20230822142913.GB14596@pendragon.ideasonboard.com>
 <ZOaofrS7/lErEYB5@nvidia.com>
In-Reply-To: <ZOaofrS7/lErEYB5@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Aug 2023 10:16:31 +0200
Message-ID: <CACRpkdbt-GxDgGbpETJTjBXz6qH2yLFgTR8BVVU9EU1uj7tJ+Q@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing expectations...
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 2:47=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
> On Tue, Aug 22, 2023 at 05:29:13PM +0300, Laurent Pinchart wrote:

> > In some (many ?) cases, the lowest effort path is to try and sneak it i=
n
> > without us noticing rather than "fighting it out" or "designing it out"
> > among themselves. There are cases where this behaviour is even the
> > consensus among vendors, as they collectively prefer keeping the design
> > effort low and get drivers and whole new subsystems upstream without
> > taking the community interests into account at all.
>
> I've begun to have the opinion that the old incentive structure in the
> industry has fallen apart.
(...)
> Now we have single entities that are OEM/(Largest) Customer/OS vendor
> and sometimes even Chip designer all rolled into one opaque box. They
> run, and only care about, a completely proprietary stack in userspace.

I have a more optimistic view.

Maybe it depends where you look.

When Android appeared in 2007 and especially after Nexus One in 2010
the Linux handset industry was running to catch up with Apple iPhone,
and they didn't focus much about working upstream, at times implying
the Linux kernel was even interchangeable to them.

Since then they come a long way, after a few generations of lost
hardware that the kernel never supported properly, Android is
pushing the Generic Kernel Image and being more restrictive about
proprietary extensions every day. It's going the right way.
Todd Kjos at Google and Greg Kroah-Hartman from the community
have been instrumental here.

For deeply embedded silicon even in datacenters, companies like
Red Hat have pushed the vendors to work upstream because they
don't want to carry any custom patches. Jon Masters has been
instrumental here, requiring upstream drivers and ACPI support for
server silicon.

Qualcomm is working with a strong upstream focus. I think this is driven
by both handset Android and laptop ChromeOS work. They do a great
job minimizing their upstream gap.

There are problematic areas, I would point to any firmware that talks
directly to userspace such as sensor hubs (Android still isn't using the
IIO subsystem...)

> As a vendor, if your biggest customers are not interested in
> standards, you are not going to try to make them. As a huge customer
> you don't want to make standards because that would only help your
> competition. Just enough commonality to lower the cost and grind the
> vendors.

But Google and Red Hat acted as responsible "big customers" in a
sense, those put requirements on hardware vendors wanting to run
their userspace with full support from the vendor.

> > The drivers/accel/ story is a fairly good example of the conflict
> > between vendors who want to disclose as little as possible and ship
> > closed-source userpace, and a community that insists on having fully
> > open stacks.
>
> We've never had a clear consensus on what userspace threshold exists
> for getting something into the kernel.

If you want to push it, Alyssa showed only two days ago what *can* be
done: fully conformant OpenGL ES 3.1 with open drivers is *possible*
to do using just open tools. If Alyssa can do it for her driver, why can't
nVidia, Intel, AMD...
https://rosenzweig.io/blog/first-conformant-m1-gpu-driver.html

For drivers/accel I was under the impression that since LF is backing
PyTorch that would be the default userspace, but I don't know how they
stand with that as it seems CUDA-centric for accelerators, and
admittedly I don't know what conformance would mean in that case.
What is even the backend API for an accelerator userspace?
CUDA and OpenCL?
Or something new I haven't even heard of yet?

> In practice I think we've made it far too hard to get rid of stuff
> that didn't work out for whatever reason. Once you are in, you are in
> forever. That puts a lot of pressure on the maintainers to get it
> right the first time, whatever "right" means. Also alot of incentive
> to get "in" at any cost because once you are "in" you are golden.

I guess you are referring to the uAPI and userspace exercise tools.

For GPIO (admittedly a smaller problem than GPU) we simply made
a new uAPI to supercede the old one when it didn't work out.
It's the usual: always plan to throw the first version away.
The first one wasn't useless, it was useful to see what was needed
for the second version. We will get rid of the first version eventually,
just like Video4Linux is now replaced with V4L2. Maybe it is a bit
un-elegant to carry two uAPIs for a time, but I think it is simply
normal for our business to end up with that.

For in-kernel APIs we are doing this so often it isn't even funny,
such as network devices "napi" (new API), or the block layer mq
(multiqueue) that gradually but eventually completely replace the
old APIs.

> For instance, I recently tried to remove some totally dead and
> unusable code exposing a uAPI. It clearly was snuck in only to support
> some kind of out of tree patchset and proprietary userspace. I got
> pushback, and left it alone.

That's depressing. I recently ran into that as well, but it didn't seem
impossible, instead I was asked to begin with marking it broken:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D8f0adae1cb1a3cf83e38dd435831baa38dd84b4c

Can you try that approach? When it's been broken for a while and
nobody cared to fix it, certainly it can be deleted.

Yours,
Linus Walleij

