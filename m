Return-Path: <ksummit+bounces-1016-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBC87801F6
	for <lists@lfdr.de>; Fri, 18 Aug 2023 01:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E6CE2821E3
	for <lists@lfdr.de>; Thu, 17 Aug 2023 23:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDE71C284;
	Thu, 17 Aug 2023 23:55:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10AD174CE
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 23:55:00 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b9a828c920so5424411fa.1
        for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692316498; x=1692921298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Tx0bcXPkb8O+18UBstVFEV0wSukkiYb3Zkuth5lFjg=;
        b=QM3+0ZugAE/v1mo8q8+gR9s/QoVZMZ5XxDZcLalTe5+Efg8tpSJaDrVyAnGiO5XLxA
         THbieuIO8ubAMm9/dr8LqKdGOOpgyb4vdhH/a4Y6rOhhWTcmxNTF++54JkwjvRP7/0k5
         mbaLWLA5q7XxdzTIyQkaa8eYUMrkXSRSgNm9U0mRw7ICZ6mJ4AwQhYHNvlNqjaoHkZW8
         DSHjhysmU+QM1IGs2PqEYpgOPLzjVNXvjwjTsOHRgngU+fEirP98+XyH/K4xlHyaDtjl
         BrX1N/HfoGFh04mfu6Fy7PLMEaXKOR5b8p/OBIC4UPd3gCfx6EnJheMI7qOAZvb2b8NE
         5b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316498; x=1692921298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Tx0bcXPkb8O+18UBstVFEV0wSukkiYb3Zkuth5lFjg=;
        b=BhQ4wisFpguvKTEEuhMD19/52UGMCSocL3FzQRU7m2QANaUR+KRJYEQ6uul5ESsgmR
         vXUbnezxf+aZiIAe7s5t+AyV1zJV8/qO7CSupYQZ+iIzMBpAlrwJgUAwSdtVPBmEB/as
         iB5HGadlqg2KkJ2OmHTJ+s0ZgsdtLt6rboZIkSb2TfXPKTvjTo/CNGHUA+W8jBApVAg/
         /NZzg3FuEe44pNliGCbwGfZGgYmzweDl+f7fvaYRkNwQWljpJpMYdAvsJd6nvRLxFxXP
         Oqc0FEI/vMossDg8eDWbcQt+HF+KsYLQZCZrF0b2wJtE4kbX1gJ3SrdUzLmbEArQtzVo
         l/SQ==
X-Gm-Message-State: AOJu0YxpI2khWxc0llksBaPw8PEERIAlfr/b7aElCKEFLaJVOX6Kloet
	dvy82LE/0s32h8809Q/hWAuvq9Zsp9oIF4uL6Zk=
X-Google-Smtp-Source: AGHT+IH8aV6UXT2E6WAwxlsKyxdXtcXyBH2MxUBCbKnnnLgfCGXqSkF4mDmm+U2Mv+hG/4yW07kfKqzgBCB9uuBiuLI=
X-Received: by 2002:a2e:9cc5:0:b0:2b6:a08d:e142 with SMTP id
 g5-20020a2e9cc5000000b002b6a08de142mr599404ljj.7.1692316498143; Thu, 17 Aug
 2023 16:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816180808.GB2919664@perftesting> <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com> <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
In-Reply-To: <20230817081957.1287b966@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 17 Aug 2023 16:54:46 -0700
Message-ID: <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 8:20=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 17 Aug 2023 14:36:31 +0200 Andrew Lunn wrote:
> > > > In so far as making it possible to get b) to help, my current excit=
ement
> > > > surrounds around what Song Liu mentioned to me at LSFMM and then
> > > > quickly demonstrated that the eBPF folks are doing with patchwork.
> > > > Get the patches to be tested automatically, and *immediately*
> > > > patch reviewers and maintainers can get feedback if something is no=
t even
> > > > worth reviewing.
> > >
> > > This is interesting, do you have any link to share to related resourc=
es
> > > ?
> >
> > I'm guessing, but i think that is referring to the "Checks" section in
> > a patchworks status page. Picking a couple of patches at random:
> >
> > https://patchwork.kernel.org/project/netdevbpf/patch/20230816210049.547=
33-9-saeed@kernel.org/
> >
> > https://patchwork.kernel.org/project/netdevbpf/patch/20230816210049.547=
33-2-saeed@kernel.org/
> >
> > Jakub can tell you more.
>
> FWIW BPF runs more stuff, they spin up VMs and run the actual selftests,
> so looking at a BPF patch will be more informative:
>
> https://patchwork.kernel.org/project/netdevbpf/patch/20230816045959.35805=
9-3-houtao@huaweicloud.com/
>
> Exact details are to my knowledge in flux, the system is constantly
> being improved.

Thanks for raising awareness of BPF CI.
I have to highlight that maintaining BPF CI is a full time job on its own.
We have engineers oncall who monitor failures in CI itself
(not failures in bpf selftests caused by new patches).
CI automation breaks often. Packages missing, VMs too slow, etc.

The link above is an example where bpf test_maps fails on s390 and
passes on arm64 and x86.
We've been trying to root cause it for a long time. So far it looks
to be an odd CPU virtualization artifact on that particular architecture.

There is a long list of CI features that we're working on.
CI framework is open sourced, of course.

I'd like to bring the thread back to Josef's point:

> This thread has sort of wandered off into the "how to do automation" weed=
s. > I think that automation is a good solution for a subset of the problem=
s that
> maintainers face, but it's not my main focus.

BPF has solid CI that helps a lot, but the maintainer burnout is acutely fe=
lt.
The main reason for burnout is patch flood.
The maintainer's day looks like non-stop code review.
The patch backlog just doesn't end.
We're trying to encourage active developers to be code reviewers as well
via positive/negative scores:
https://lore.kernel.org/bpf/ZJx8sBW%2FQPOBswNF@google.com/

It doesn't help much yet. All incoming kernel contributors assume
that it's a maintainer's job to do code reviews.
Developers just send patches and wait. It doesn't occur to them that
reviewing other patches will help them land their own.

To address maintainer burnout we need to change the culture of the communit=
y
and transform active developers to active code reviewers.
We're looking for ideas on how to do that.

