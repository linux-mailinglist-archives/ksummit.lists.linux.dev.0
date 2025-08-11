Return-Path: <ksummit+bounces-2110-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B881B21751
	for <lists@lfdr.de>; Mon, 11 Aug 2025 23:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D35B1744D9
	for <lists@lfdr.de>; Mon, 11 Aug 2025 21:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F902E3380;
	Mon, 11 Aug 2025 21:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBML8InJ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857C9214A78
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754947595; cv=none; b=VjU1vjKHVwf18bJWEicKqdLAla7TIawEnsOBtdmdBDTYuGVOGvmtikOMeeuavOJyOicTBRv+QAMgr0AX8rmPvB2i3evmBpZ/eoIqggJQEd5IsE8wncjmqfLMGldk0JFwH4WwHR64usEQJVNWbb1Pbbl9ZSM9f2qDb3/iGpyUSfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754947595; c=relaxed/simple;
	bh=B/pok8z74+td/tGOCmZFxBNuxeY7nUDVoZCXdEoQd3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmlTBHNQDeQ17piLaMdF2VC3p+ax7263b3KJLNyY6K2BmJcoCNaFBFRK60qs1B472+b3u/B4efXyzsWuaSXl3G7loyvNW/cT+GYMhXf12P+IUPW/g0XTeqJBs/uAsccaKmufAsEb2699D0rZAWxfh0HS6i5iXgaZZz/Yl8vfiUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBML8InJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5F7C4CEED;
	Mon, 11 Aug 2025 21:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754947595;
	bh=B/pok8z74+td/tGOCmZFxBNuxeY7nUDVoZCXdEoQd3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBML8InJ7pvZILQIFUPujL9CvaSO+Ha/RTfkEcanX7KXU3sm1N2rE8eKFLdyszXOP
	 jtp2OZw2YmY4c2Si8F395Y5KIIiQflE3NYwR/me+rVcjLccQcM6WKScyesjCn2IeXW
	 nhF4XHL/mrQC8HCM1ssqziSuWK6fmrXAXSVGt6XgNIA/o1Qo6yD/y5SleavUivEpwy
	 krhxZXYhs4dKuosMNAI1UpAbtKj1euUfZJrKlAWTF9lWCySGo48zYafhVNSWBRFl52
	 5dsA/8eormL47dlRp71YG0q2gk43Eq6Uq80EqJl3Dpu/FRkbm3SH9VZpfdZNBBavnt
	 WohsFIDoDmNjw==
Date: Mon, 11 Aug 2025 14:26:33 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mark Brown <broonie@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <aJpgCQYCnNR2HCO5@bombadil.infradead.org>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
 <aJJP2BM658FYJdJv@lappy>
 <1ced158f-b433-46ef-a70f-d035ec413a12@lucifer.local>
 <72ee0f61379054e327d502bbe77aae3d76966d17.camel@HansenPartnership.com>
 <a1bcdee4-344b-4717-bde0-fe80bea46d67@lucifer.local>
 <8b7daa48-0f79-4948-b0de-a09a7b456513@sirena.org.uk>
 <2e90677a-4a0b-40fb-9428-e80eacf034fd@lucifer.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e90677a-4a0b-40fb-9428-e80eacf034fd@lucifer.local>

On Thu, Aug 07, 2025 at 02:00:56PM +0100, Lorenzo Stoakes wrote:
> On Thu, Aug 07, 2025 at 01:25:23PM +0100, Mark Brown wrote:
> > On Wed, Aug 06, 2025 at 08:26:41PM +0100, Lorenzo Stoakes wrote:
> >
> > > - Was the commit message of this patch generated in large part by an LLM
> > >   (excluding non-native speakers using an LLM to simply assist writing it
> > >   in english)?
> >
> > Easiest way to say that is probably to say "written by" and "translated
> > by".  I think for all these things we should just talk about tooling
> > rather than specifically LLMs, as well as avoiding any rules lawyering
> > about how precisely a given tool is implemented it's probably useful to
> > know about tools whatever the technology.
> 
> That's a great idea!!
> 
> And agreed on language/rules lawyering, I think we have to have something
> _simple_ and robust at least to begin with.

I've been using for years the tag "Generated-by" starting wit Coccinelle:

git log --oneline --author="mcgrof" --grep "Generated-by"| wc -l
31

And it seems like I'm not the only one:

git log --oneline --grep "Generated-by"| wc -l
49

For other projects such as kdevops where I *only* use LLMs to write new
code now, we have been using:

Generated-by: ChatGPT Codex
Generated-by: Claude AI

We use this even if it was partially AI. I think that gives
maintainers sufficient information to make judgement calls.

Other than this practice, if we're to slowly and carefully welcome LLM
generated code on the kernel I'd recommend we evaluate a context
intialization file.  For Claude that's CLAUDE.md, you can look at
kdevops's file for an example [0]. Having one makes adoption easier, and you
can provide strict rules. The context is limited though, you want about
~40 KiB. However I'm not sure if a generic one may be so easily
agreeable, so fortunatley the bots can also look for your ~/CLAUDE.md.
But I can vouch for the fact that its proven useful for kdevops.

Other than this, another best pratice we've adopted on kdevops is to
to grade commits based on LLM prompts so to keep tabs on how well LLMs improve
overtime with example prompts, and to track them with full prompts, we have
PROMPTS.md [1]. These can help LLMs as well.

The grammatical evolution on kdevops is what makes LLMs adoption today
easily possible [2]. I don't think its as solid yet for kernel development in
agreement with recent findings [3], however its only getting better so
best is we prepare for it and learn from existing projects' use cases.

So for testing -- clearly its a win.  For other things, here's a few
things we can evaluate future success over time:

  * fix syzbot bugs
  * take on maintenance for orphaned drivers
  * help maintainers with patch review / testing

[0] https://github.com/linux-kdevops/kdevops/blob/main/CLAUDE.md
[1] https://github.com/linux-kdevops/kdevops/blob/main/PROMPTS.md
[2] https://github.com/linux-kdevops/kdevops?tab=readme-ov-file#generative-ai-usage-on-kdevops
[3] https://neurips.cc/virtual/2024/poster/97426

  Luis

