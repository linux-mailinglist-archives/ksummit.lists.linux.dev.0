Return-Path: <ksummit+bounces-990-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 725BF77D5BF
	for <lists@lfdr.de>; Wed, 16 Aug 2023 00:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5057F1C20E68
	for <lists@lfdr.de>; Tue, 15 Aug 2023 22:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEDD19899;
	Tue, 15 Aug 2023 22:04:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC98615AD7
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 22:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839F9C433C9;
	Tue, 15 Aug 2023 22:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692137065;
	bh=CzBgO8TpXVeEtgThNhJfSfEYqnVldtmsT1tDJ592TRs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AoG0UyzYci8644hpRrz4FzgLC12kRLjTN9DgbjB7ueHhOq20/9nvTrxNlZrBFZBbe
	 uVRcmJ2CLC41+c4VOV6HY7Emdc+5ji2vRHoJcbr4/rNz+rDUy77EASzely5M7LaRTv
	 uq2bbByRaftSsaRk7LpidJI267aJDUeAuuevxyx9BwMRS//yska5Cv+phd5rvxEw2U
	 wkztSMjp4tmTfD/fdtH36o8hunwaQMiSTTTp+/FY3zAh7DTzUBjEiJY/4AOx3VL0kM
	 HUAuOGJd5qk74lXIkCwg31gcnnosAXgF/TPZx8+vc0LvKT5+zvJSmEzvtU1RVSkoHp
	 dRsIdOLSSQuTw==
Date: Wed, 16 Aug 2023 00:04:22 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
cc: Steven Rostedt <rostedt@goodmis.org>, Greg KH <gregkh@linuxfoundation.org>, 
    Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
In-Reply-To: <47419913-2a5a-2bc1-ece9-cc371d4fefdf@iogearbox.net>
Message-ID: <nycvar.YFH.7.76.2308152358470.14207@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm> <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com> <2023081515-lake-spotty-6a3a@gregkh> <20230815084253.7091083e@gandalf.local.home> <47419913-2a5a-2bc1-ece9-cc371d4fefdf@iogearbox.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Aug 2023, Daniel Borkmann wrote:

> Not really answering your question, but the above is also a somewhat 
> misleading "assurance" for distros. Some security fixes might 
> potentially have come in via AUTOSEL, and some others might not have 
> been discussed at security@k.o in the first place. How would you 
> classify which ones of the whole set are relevant for distros and which 
> ones are not?
> 
> Imho, if distros decide to maintain their own trees outside of stable it 
> would still require manual triaging of the set of stable patches that 
> went into a minor release (and if in doubt, just cherry-pick the patch) 
> - that's just the cost to pay for maintaining non-stable base. It's the 
> same issue as discussed in [0].
> 
>   [0]
> https://kernel-recipes.org/en/2019/talks/cves-are-dead-long-live-the-cve/

Whith my kernel developer hat on, I fully agree. The whole CVE handling 
has been a disaster for many reasons, and it's sad that people still 
believe in it. Fixes are fixes, and you ideally want them all, right?

With my distro kernel person hat on, the linux-distros@ process helps us a 
lot with a first iteration of identifying the big set of things that we 
(well, our security team) should take a look into immediately, because 
they have been explicitly reported (and verified) to be security relevant.

It has been the case with pretty much every opensource/Linux-relevant 
project out there. Kernel has now removed itself from it. Again, from very 
good and understandable reasons for now, but I don't think that should 
mark the ultimate end of the story.

That doesn't mean that we don't have a process for evaluating what to 
merge/cherry-pick from other trees (including stable, of course). We 
absolutely do. We just can't relistically base on -stable, for multitude 
of reasons.

Thanks,

-- 
Jiri Kosina
SUSE Labs


