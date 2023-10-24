Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB07D46C3
	for <lists@lfdr.de>; Tue, 24 Oct 2023 06:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17136B20C89
	for <lists@lfdr.de>; Tue, 24 Oct 2023 04:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E69B63AC;
	Tue, 24 Oct 2023 04:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RnPDW1si"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA641FA5;
	Tue, 24 Oct 2023 04:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA02C433C9;
	Tue, 24 Oct 2023 04:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1698123520;
	bh=S0th/boKiLGnON1ey4xgB1axQfKN7ZcEoC6cvI93OcE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RnPDW1siSvlCPsUSHk597l638SSjLM2QWIipVZs1SgG57Rarx31q9qNDW1OMd6Q0l
	 Mm5IflxyJqx2G7+/sElQ3byl4BYkuxrMhIMpqYpPCpzQhpXO4C3Q555zqxt1IwmbOL
	 J23zsElqOKpozrj0K/TdG8UZIelcHpsFkQ47kGF0=
Date: Mon, 23 Oct 2023 21:58:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-Id: <20231023215839.bb712e78fec6a6e0c3e6b62f@linux-foundation.org>
In-Reply-To: <20231023-righteous-peridot-parakeet-1bbda0@meerkat>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	<20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
	<CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
	<20231023-righteous-peridot-parakeet-1bbda0@meerkat>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Oct 2023 15:41:48 -0400 Konstantin Ryabitsev <mricon@kernel.org> wrote:

> On Mon, Oct 23, 2023 at 08:55:56AM -1000, Linus Torvalds wrote:
> > > Well here's a task: write a bot which follows the mailing lists and
> > > sends people nastygrams if one of their emails is more than 95%(?)
> > > quoted text.
> > 
> > I think that might be better off as a spam filter rule.
> > 
> > Don't make it some after-the-fact "trawl the lists". Just make it a
> > bounce with a "you quoted too much". Same as the html avoidance.
> 
> I know people aren't being very serious, but automating this away either
> aggressively (reject as spam) or passive-agressively (whine at poster) will
> run into rare but valid corner cases. For example, we have no way of
> distinguishing between "this person quoted too much from previous message" and
> "this person posted a large but relevant quote from docs or another
> conversation," and so we will likely punish/annoy the innocent.

Rejecting a legtimate email would be bad.

So we choose "whine at poster".  If it's a false positive then they'll
somehow survive the experience.   And, most importantly, the mail
will get through.

> It's better to treat this as a mentoring opportunity and send an off-list
> reply with "please trim your quotes" and maybe a link to
> https://people.kernel.org/tglx/notes-about-netiquette

I'm tiring of sending off-list emails.  This task could be automated. 
Which is what I'm suggesting!

> If it helps, I can add a mailing list etiquette page on subspace.kernel.org,
> so it's easier to find.

Great, link to that in the whiney emails.

