Return-Path: <ksummit+bounces-757-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B3858EDA7
	for <lists@lfdr.de>; Wed, 10 Aug 2022 15:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B110E1C20971
	for <lists@lfdr.de>; Wed, 10 Aug 2022 13:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21EC28F1;
	Wed, 10 Aug 2022 13:55:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531B17EC
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 13:55:12 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id t64so1443173vkb.12
        for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=iFFlawpLd8dEyo8k6ua2cFPnndIHYumAR+E1F60vFyo=;
        b=YIEwVZAthBhevZc9B4rShDQgMTC00W2mE356tvnPWPDDCk2lcsgCj/9VvonDYZq57X
         EuGyMu0iyd7hf/E9Jpa4FCA5P9Fllpg4SaTwvDsAL+3su10nnzbMUZwYCwdijtgr30KD
         eGPltHDfVY3j/01erkG45BDairyfjh8II8mspgegqXnK1LyAKYbfaj3KZiLRzwNLaTDD
         ONSRgUzDNbwH87CgIxyql7QvTvAqjvtkoFEzorFC57flnHqQ9KjjfQK06MiNGKBXhBqB
         xv0gZcNC/ZDVgN7rKvh+HNQTYV9Tf/8ubmEbcq/FNr0MdPgGv0sYU7x+uln6lFx/pffJ
         Q9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=iFFlawpLd8dEyo8k6ua2cFPnndIHYumAR+E1F60vFyo=;
        b=asSc3PMK6XCQ2SgqSiZcRG6yywZwilUwNATXJ23l1RSo2jxxZuIUq9TTpwg0bxFCfn
         cBIVruUDnkGdVXd8vw+4Ci4VdSmr5S4WsvzHO2wFNJUxIuKMv9dYlPqcAZElC+OVBmM3
         LFO2246y2+cNO0KfzxO4IyC9u0k4ecjB2yGb8BwwziNTx5P0MnDxi3FDwUhTA5MccO2Z
         vEPT+81K11hS6uoPK3G8/S7GMrpdfnZTsQgaV4MXZ4UrD6xWt+WU3T9uUZFTIPQVolXZ
         vo2cGjdn/C8bFWNE0WrmPH5NOxzajYifYfkOgTUB7d8J5QYmsJfxGJCGQQuZXsK+erTM
         xL0Q==
X-Gm-Message-State: ACgBeo0GvrCPEUr+PFzleZI+OHK4HNSJwPR6CMPPj/MWU9IMX9l+Ycdt
	RebQuXZOLVSsnCgp7nt/+6wqcFiB2D/unTDiPw==
X-Google-Smtp-Source: AA6agR6rLA8900BmeBq0UStvLZAe4TJ5yezEHkJ8SsVk1WLopdF88qOsLH91TGz+rc6YdtSArI3ltg+Jd79tdRoZ0BA=
X-Received: by 2002:a1f:ecc4:0:b0:377:8f7c:8873 with SMTP id
 k187-20020a1fecc4000000b003778f7c8873mr11704900vkh.14.1660139710996; Wed, 10
 Aug 2022 06:55:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220809171316.1d6ce319@hermes.local> <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com> <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
 <YvObmmmLiX6z8eA3@google.com> <20220810120450.GT3460@kadam>
 <YvOpfQAUFqjeMGWH@sirena.org.uk> <YvOxs+0qw+gr+cjE@google.com>
In-Reply-To: <YvOxs+0qw+gr+cjE@google.com>
From: Rob Herring <robherring2@gmail.com>
Date: Wed, 10 Aug 2022 07:54:59 -0600
Message-ID: <CAL_JsqJf4Foih7Z8xXjfdeONwH5wCMRYSU8Fzta_F49q+Bp4MA@mail.gmail.com>
Subject: Re: Validating MAINTAINERS entries?
To: Lee Jones <lee@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Lee Jones <lee.jones@linaro.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 7:25 AM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 10 Aug 2022, Mark Brown wrote:
>
> > On Wed, Aug 10, 2022 at 03:04:50PM +0300, Dan Carpenter wrote:
> > > On Wed, Aug 10, 2022 at 12:50:50PM +0100, Lee Jones wrote:
> >
> > > > I am presently plagued with reviews for lots of files that I've
> > > > touched over the years.  Even if the changes were trivial.

After your W=1 and kerneldoc fixes, you're screwed. ;)

> >
> > > > Or is this just an education point?
> >
> > > Education is not the answer.

Yes. I'm convinced there is no way to solve these problems on the
sender side. I see plenty of cases of not running get_maintainers.pl.
You've got to filter out what you want on your end. And lei is great
for that.

> > > We've got thousands of devs and no one can keep track of everyone and
> > > their motives.
> >
> > I think the issue there is more that if someone sent a drive by patch to
> > some driver they'll start showing up in the git history and often get
> > CCed on future changes going forwards, which can then result in getting
> > copied into further postings done by copying from prior postings.  That
> > does feel somewhat tractable to education, at least in the early stages.
>
> How about default tooling values, get_maintainer.pl in this case?
>
> I tend to over-ride this default to 75% to avoid the aforementioned:
>
>   --git-min-percent => minimum percentage of commits required (default: 5)
>
> 5 is not a lot of percent for seldomly touched source files.

Send a patch. I would also bump --git-min-signatures from 1.

Rob

