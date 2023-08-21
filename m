Return-Path: <ksummit+bounces-1033-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6EB7825CF
	for <lists@lfdr.de>; Mon, 21 Aug 2023 10:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D90280E7D
	for <lists@lfdr.de>; Mon, 21 Aug 2023 08:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5462113;
	Mon, 21 Aug 2023 08:50:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E4185B
	for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 08:50:17 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1bb3df62b34so413532fac.0
        for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 01:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1692607816; x=1693212616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zw3ucNFFFx+dFUDTWXFhkVtrf+x3S1lxU6Ziu0Dd2bw=;
        b=dJ4ubT7rAL5TNRo3uOXsD8q0j+GonpP1in9II7nNrhklAiW+DBJ9sBxED0ZDCTSQeG
         9uMtp9YOHvqlhyfYJ23BLBRS0iOPlZ2EYZOQgeyDE9vuy9vAXEm/nWrYzzFgJVCTedkv
         CsVwpehSmgb5JEETouSB8hnAi3gcjCK6vSWWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692607816; x=1693212616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zw3ucNFFFx+dFUDTWXFhkVtrf+x3S1lxU6Ziu0Dd2bw=;
        b=Pw52+ECG5V1VOOfISOzeAhS/ttnESJN0rzKW2wGdStPmPS4gH75+QTxUp9Ne3Pisi/
         OV1+9X4MTBYWgXJ60CXEvQcINcANt9bSCPiOhokiIZaCKwZtCFhph/hC8ESbS7mrRS8m
         PSuuKL9ze9FVYnt+2V+XMWQ3LTeHzkZOURveSliLOS2ZErzDbv9D+eQHbQqHLhW9kZZc
         NnRSs7SlWUunWc9z8rk1Obulxnu7pXptVHEVuUW17pldQ2HFK+6zAJ43LUvD9AAp6VsI
         ky1cNW1+G837rqQJ8zLvtSAb4FlUniuwFppZOsKUCJieKMhOKt6CF2H01wZXa3F3IDXV
         gk7Q==
X-Gm-Message-State: AOJu0YzKYA8qycJPTlw5M33BNX4AsQewZPUli71cEGbEF/CUdg5jWx5z
	UFv5qipENt6hcDC52ij4n1qFX3I/Vs27naqIGhnCqw==
X-Google-Smtp-Source: AGHT+IHDl5GwTdzs1UIZvp9EZiZvbMUzreg9QWV4hoe8OExme0SPlGEK6dS+uPV4WVg3jwkpeeRWVkKBbJGCJPDLDx0=
X-Received: by 2002:a05:6870:ecab:b0:1c8:bbd0:2fd5 with SMTP id
 eo43-20020a056870ecab00b001c8bbd02fd5mr7244312oab.4.1692607816107; Mon, 21
 Aug 2023 01:50:16 -0700 (PDT)
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
In-Reply-To: <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 21 Aug 2023 10:50:04 +0200
Message-ID: <CAKMK7uG68PV5MZLjZXNLxsfdweKVZwz2UW9fuG1vLBEi8600dg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Aug 2023 at 19:07, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 18 Aug 2023 at 17:10, Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > I was wondering last time if we can do a run of short sessions
> > where a few volunteers talk about their subsystems? Let's say
> > 10min talking about
> >  - current process subsystem uses
> >  - "realities" / day to day challenges / problems
> >  - how the subsystem is evolving the process
>
> I feel like we did exactly that a few years in a row, but it was
> probably back before covid times, and probably when it was still
> called the "kernel summit" rather than "maintainer summit".
>
> At that point it was mainly just the GPU and ARM people who were doing it.
>
> [ Goes back and looks at my old ksummit mails ]
>
> Heh. It seems we did it enough that during the 2018 discussion, we had
> Daniel Vetter say "We don't need another overview over group
> maintainership". I think most of this was 2016/17 or so, and then by
> 2018 we had that "not again.." situation.
>
> But I suspect that all predates the networking people starting to do
> the group maintainership (I think you started doing pull requests in
> 2020?), so I guess you never saw any of that.
>
> I do think the whole "how to spread the pain of being a maintainer" is
> very much the point of the maintainer summit, though, so I do think we
> should revisit.

I think hearing what the networking folks do would be rather
interesting, maybe in a split format with a presentation for the
entire lpc audience and then maintainer summit discussion with the
small group. There's a lot more maintainers and area leaders than the
30 or so who can participate in the maintainer summit.

For gpu not much really has changed in the process and approach, it
seems to hold up the test of time. The one thing that's been under
progress and might finally land is some CI integration with our
gitlab.freedesktop.org infrastructure. We have that for years for the
userspace side (including hw testing) and some kernel drivers, but not
yet for the entire gpu subsystem. Which is pain because it results in
a lot of duplicated work and stuff falling through cracks for no good
reasons. I'm hoping that this merge window will finally have the pull
with the initial thing (all contained in a dedicated directory so it's
easy to delete in case it all turns out to be a big mistake).

So there's really nothing to report from the GPU side, and I think my
quote from 2018 still holds :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

