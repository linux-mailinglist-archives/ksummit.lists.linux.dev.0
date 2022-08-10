Return-Path: <ksummit+bounces-762-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A758EF6F
	for <lists@lfdr.de>; Wed, 10 Aug 2022 17:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD07D280BF8
	for <lists@lfdr.de>; Wed, 10 Aug 2022 15:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B9D2CA7;
	Wed, 10 Aug 2022 15:29:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591F128F1
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 15:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1011BC433C1;
	Wed, 10 Aug 2022 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660145348;
	bh=2xjfF2n8CFommWrc+bzfS3LxLHZZI+lqO8OagBaapLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qiv4JHzEYivGawUvs1eKDSgpbDvAEqkaGYqgmH8oqsg6/Tzmy8wmAwsLX1IGg9a6i
	 r6GRXnLv3Op5Xs+8N4cZe32ikdDdI2haYmlPJTnRCjURJ63pOXuJaMlApL3xXhMBlF
	 4h0Des3IePywFvbilXSTNiCiMIhVVrlAO9lUdRxXEQtcQ/IhD8reU+BsjJ/DPe0psL
	 RHpzs4LIjDGN3JVHTuLXAOyxGAodkR5QgJDtvO3PHLcqkqygWvlXj4Gg8A2oB0hkE+
	 D7yEN6IXhb7qfxIXXsXhEMjJYEMP+mSUKvVfaqPUgaDlVIdPKmWnV2TqUusy+/KSA0
	 V2lPcB1+q0XzA==
Date: Wed, 10 Aug 2022 16:29:02 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Lee Jones <lee.jones@linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	ksummit@lists.linux.dev
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <YvPOvuEOgdyTnizZ@google.com>
References: <20220809171316.1d6ce319@hermes.local>
 <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com>
 <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
 <YvObmmmLiX6z8eA3@google.com>
 <20220810120450.GT3460@kadam>
 <YvOpfQAUFqjeMGWH@sirena.org.uk>
 <YvOxs+0qw+gr+cjE@google.com>
 <CAL_JsqJf4Foih7Z8xXjfdeONwH5wCMRYSU8Fzta_F49q+Bp4MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJf4Foih7Z8xXjfdeONwH5wCMRYSU8Fzta_F49q+Bp4MA@mail.gmail.com>

On Wed, 10 Aug 2022, Rob Herring wrote:

> On Wed, Aug 10, 2022 at 7:25 AM Lee Jones <lee@kernel.org> wrote:
> >
> > On Wed, 10 Aug 2022, Mark Brown wrote:
> >
> > > On Wed, Aug 10, 2022 at 03:04:50PM +0300, Dan Carpenter wrote:
> > > > On Wed, Aug 10, 2022 at 12:50:50PM +0100, Lee Jones wrote:
> > >
> > > > > I am presently plagued with reviews for lots of files that I've
> > > > > touched over the years.  Even if the changes were trivial.
> 
> After your W=1 and kerneldoc fixes, you're screwed. ;)

Yes, and the tragic thing is, I still have aspirations to go finish that!

> > > > > Or is this just an education point?
> > >
> > > > Education is not the answer.
> 
> Yes. I'm convinced there is no way to solve these problems on the
> sender side. I see plenty of cases of not running get_maintainers.pl.
> You've got to filter out what you want on your end. And lei is great
> for that.
> 
> > > > We've got thousands of devs and no one can keep track of everyone and
> > > > their motives.
> > >
> > > I think the issue there is more that if someone sent a drive by patch to
> > > some driver they'll start showing up in the git history and often get
> > > CCed on future changes going forwards, which can then result in getting
> > > copied into further postings done by copying from prior postings.  That
> > > does feel somewhat tractable to education, at least in the early stages.
> >
> > How about default tooling values, get_maintainer.pl in this case?
> >
> > I tend to over-ride this default to 75% to avoid the aforementioned:
> >
> >   --git-min-percent => minimum percentage of commits required (default: 5)
> >
> > 5 is not a lot of percent for seldomly touched source files.
> 
> Send a patch. I would also bump --git-min-signatures from 1.

I can do that.  Fair warning, it won't be until around mid-cycle.

-- 
Lee Jones [李琼斯]

