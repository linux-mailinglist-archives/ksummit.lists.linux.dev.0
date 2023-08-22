Return-Path: <ksummit+bounces-1041-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D47838BA
	for <lists@lfdr.de>; Tue, 22 Aug 2023 06:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7E751C20A3F
	for <lists@lfdr.de>; Tue, 22 Aug 2023 04:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBB61C07;
	Tue, 22 Aug 2023 04:07:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294D7F
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 04:07:44 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9a18a4136a9so276408366b.2
        for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 21:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692677263; x=1693282063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MFePXanh8vCsS1M3eVMD7srRtGzLE0Xp6c536InAD48=;
        b=mOEM0/duMFqLSRZgeLCvPMblqM75y/fgAitpXeXgsIgW1Xpx3vhRT6wiMMxAo47bpu
         xJI+ZtzeSmjKPew3ky+oO+pBqxCEmslKjL7/k6cm+EbB663hRIevemK9BGZf5SQNn2/g
         umnoYmTWrjVOjjpI0Ng3RGzr+SUjaajQCepG3UO4eAa6LXDmyF6RSzr4eCFjzdhPcDUg
         DvUsrBUGFVtdl6DelOqaKij9sQLJWQegmWKH3mvP+/9V3jsBf3TWjZvf+L54mKS7YCx3
         cjDN7Cd34LjDeBbdBh04LIGa3VbUfPL8FjXq74upKeq9aZuwFrktNoEO14yqBXsxQZ7G
         KEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692677263; x=1693282063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFePXanh8vCsS1M3eVMD7srRtGzLE0Xp6c536InAD48=;
        b=dkdEm4zXtGs5pHe53HkYHuCDFtF8uJA6m5ZWztyHdqLVjEgCjmh7zt9x2hXG7zzeqM
         dDCXEXpjNSIDfaGvBp9lith9z7MdfQy0yNriIEiJ/A3sHdygDR2cqaNt8HrEXvcGS4Th
         I2npYSMWTwBkfdRTp349115P1LJ8sIJBe7BEwYxvIpj6VsX1lNi49ap4L25OldhwXMQo
         7OZikA+Mcw1Ryax0W1xu1aq5k7Tk8fQTCub3bZBJ97rbYyH0sUty31hpWKZuPy3q1Fee
         HIHmbjskauQ6c4bqlFq9l1YmdGZuNeIo4Cz4VNZVQVk2jgRy7n6N72KgtqQqF7LopjLp
         kWyA==
X-Gm-Message-State: AOJu0YwTseQnAZSfE0cdUHtZbneceJp5UMvIqqN69DJI0uzT3GuYFteV
	na/+CmNdGKmD8Oc9ZMzNZSUSu5QrrqARZechsNpeygD0giw=
X-Google-Smtp-Source: AGHT+IHYW2+G7pO16S2uiRp4TKhExYRgOWeSY29a3zf8TY5n1VthfMV6N5CoHnaRjUrU/D3NKVB4296RQH7BorKxBwI=
X-Received: by 2002:a17:906:7388:b0:9a1:9284:11b with SMTP id
 f8-20020a170906738800b009a19284011bmr5354737ejl.7.1692677262995; Mon, 21 Aug
 2023 21:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816180808.GB2919664@perftesting> <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com> <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org> <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org> <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal> <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
In-Reply-To: <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 22 Aug 2023 14:07:31 +1000
Message-ID: <CAPM=9tww6H0TLPNFWU6D1g++XuGAEbX+2MgbQZgpHJHAOd1Y8A@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Leon Romanovsky <leon@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Aug 2023 at 05:24, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
>
> On 8/19/23 08:45, Leon Romanovsky wrote:
> > It is worth to try to get honest feedback from active developers/contributors/vendors
> > what is their "real" excuse for not doing code review.
> >
> > I saw in this thread about "have no time to do code review" answers and we
> > all can relate to it, but IMHO it is just an excuse and not the real reason.
> > Especially for a people who are employed by big corporations to do their
> > upstream work.
>
> Hi,
>
> For some drive-by or would-be reviewers, at least, I think part of the
> problem is perverse or misaligned incentives.
>
> If you write code and your patches are accepted in the kernel, it counts
> towards your commit count, which is a metric that people look at, for
> better or worse (probably worse).

You have to create some sort of market I suppose, where people have to
work in a community to get their own patches reviewed by other people
who aren't incentivised by their management to review patches.

I don't think there's a nice way to do it, anyone wanting patches
merged needs to review patches from others, and vice-versa, it's good
if you have multiple submissions of the same sort of driver features
at the same time which happens often, then they cross work.

The whole "hardware I don't have" thing is a misnomer, nobody expects
you or reviewers to know how to program the hardware, but they do
expect you to understand how to interface a driver to the kernel, know
what good code patterns to use and when a new submission does
something completely unexpected then senior maintainers need to get
involved to push back.

Dave.

