Return-Path: <ksummit+bounces-756-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C671E58ED19
	for <lists@lfdr.de>; Wed, 10 Aug 2022 15:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B09021C20971
	for <lists@lfdr.de>; Wed, 10 Aug 2022 13:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E181C17FF;
	Wed, 10 Aug 2022 13:25:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D9D17EC
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 13:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337CDC433C1;
	Wed, 10 Aug 2022 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660137913;
	bh=+wWVwNtB/xtMa20ABzCA1vibkhXNL1A5lhl7jprDL3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJs+WV22ivSyZrEwd5woFw9o6BqDUTvRX7SQwWGmPBz7kCncUPr3XaqM34uY+vUHQ
	 qSoNkL3ZX6TfjVE9r/bO8uEvA9uLSt15TuKz6M5V+53uSK6eLp/Ym8v9xk+3LJB+Sj
	 LkM/3yy3Wwi7hAkDShMDPY1l+NemQOGP6AQ3A+BD4si7PKqTWgxbDjkCaPyASQU1++
	 f/QtO01GXq+I2GR6ttvuTQBcdtX2QgZEBmHpdgqULud5idPNoEfLV3VYTO3xGMrgtJ
	 j5xm3+SvbjsSNwSjVEB8JA2kzcy/93khtnaBpDdeMPVKPnNJD5M52FCm+oHmkdHPE0
	 L1u0I0MOa7k+w==
Date: Wed, 10 Aug 2022 14:25:07 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Lee Jones <lee.jones@linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	ksummit@lists.linux.dev
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <YvOxs+0qw+gr+cjE@google.com>
References: <20220809171316.1d6ce319@hermes.local>
 <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com>
 <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
 <YvObmmmLiX6z8eA3@google.com>
 <20220810120450.GT3460@kadam>
 <YvOpfQAUFqjeMGWH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YvOpfQAUFqjeMGWH@sirena.org.uk>

On Wed, 10 Aug 2022, Mark Brown wrote:

> On Wed, Aug 10, 2022 at 03:04:50PM +0300, Dan Carpenter wrote:
> > On Wed, Aug 10, 2022 at 12:50:50PM +0100, Lee Jones wrote:
> 
> > > I am presently plagued with reviews for lots of files that I've
> > > touched over the years.  Even if the changes were trivial.
> 
> > > Or is this just an education point?
> 
> > Education is not the answer.
> 
> > We've got thousands of devs and no one can keep track of everyone and
> > their motives.
> 
> I think the issue there is more that if someone sent a drive by patch to
> some driver they'll start showing up in the git history and often get
> CCed on future changes going forwards, which can then result in getting
> copied into further postings done by copying from prior postings.  That
> does feel somewhat tractable to education, at least in the early stages.

How about default tooling values, get_maintainer.pl in this case?

I tend to over-ride this default to 75% to avoid the aforementioned:

  --git-min-percent => minimum percentage of commits required (default: 5)

5 is not a lot of percent for seldomly touched source files.

-- 
Lee Jones [李琼斯]

