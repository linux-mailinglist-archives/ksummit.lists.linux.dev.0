Return-Path: <ksummit+bounces-1217-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D148FBECD
	for <lists@lfdr.de>; Wed,  5 Jun 2024 00:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E9C283891
	for <lists@lfdr.de>; Tue,  4 Jun 2024 22:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA946146599;
	Tue,  4 Jun 2024 22:21:38 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B0814B06B
	for <ksummit@lists.linux.dev>; Tue,  4 Jun 2024 22:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717539698; cv=none; b=BDA+OwTVeOum2aFrxiyGNPbSOAyT5kIQ4BkZJZoHxIJRK6ChsrfhNxeFGq7ccmIANjIqYl1ZqVbdho1/wnUD6EWJX1/PkXJ5MFhU90UuU/achsLj0iKkC4+T+UOtS3oKmrMwqIevSFes0fX4YAy4P7lDMwXe7CHLXGxF9DR1xkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717539698; c=relaxed/simple;
	bh=Xn31wFo9muvSf6/0bIn0I7aHzcwyzqtiD5pddvz0Wa4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yt/GVYPMfoTkx05EMDK66xJn2MZEUnn2ZpAFwjhbdR2eU+3zCavqTCzltfooUiCUq1O8rUgfJVwWNOaF7SrXoWXWbXnA00d+LoEZRWlbydBTZ9AV5mLgTBgKk7Sh/gPrn+HvidGCkcJBRIzROZDgCHMC05KfPdiGATzb63mTcwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB660C2BBFC;
	Tue,  4 Jun 2024 22:21:37 +0000 (UTC)
Date: Tue, 4 Jun 2024 18:21:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Merge tree too flat?
Message-ID: <20240604182137.2cfdc0b2@gandalf.local.home>
In-Reply-To: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Jun 2024 00:03:45 +0200 (CEST)
Jiri Kosina <jikos@kernel.org> wrote:

> On last year's maintainer summit, there was a session where Linus asked 
> the participants to bring up topics / questions [1].
> 
> I myself was the one raising the concern of the merge tree feeling a 
> little bit too flat, and there seemed to be general agreement on that.
> 
> Checking the git repository as of now, it seems like we have not changed 
> anything in that respect over the past year, and a lot of things are going 
> directly to Linus although they could be cascaded a little bit better, 
> contributing to better load-balancing on all maintainer levels (including 
> the top-level one, of course).

Note, the git tree may hide some hierarchy too. For example, I'm starting
to do pulls from Daniel Bristot for his rtla tooling. But since I have a
topic branch for his work, I just do a fetch from his pull request, and
then copy his pull request cover letter (with some tweaks) directly to Linus.

Although it may look like I'm pulling in Daniel's patches, I'm not. I
review them, but I'm more of a middle man between him and Linus.

> 
> I'd like to propose this as a proper discussion topic slot this year, by 
> e.g. looking at:
> 
> - the actual numbers and current merge graph

Now one thing I have started doing at Linus's request, is to make more
topic branches. This way if there's something that he doesn't like, he can
give it a line-item-veto, and I don't have to rebase everything.

This actually makes things easier to maintain. Perhaps maintainers should just
start splitting up their work? This may increase Linus's pull requests, but
it may also make it it easier for him to do those pulls. It is similar to
breaking up a change into many patches. Yes, there may be more patches to
review, but those patches are much easier to review than one big one. I
think the same can be said for pull requests.

The sad part is, the more topic branches you have, it will make the tree
look even flatter.

> 
> - is this really something that could improve maintainer load (on all 
>   levels) and throughput if done properly?

Topic branches.

> 
> - how could we motivate maintainers to change the process and delegate 
>   more into proper hierarchical sub-trees?

Now with more topic branches, it may be even easier to get others to take
over. Daniel does changes for rtla, and Masami Hiramatsu does all the probe
logic. Perhaps the first step is just to have maintainers split up their
work.

-- Steve

> 
> - potentially identify particular trees and changes that could be made in
>   the merge graph/path to improve the process
> 
> [1] https://lwn.net/Articles/952146/
> 

