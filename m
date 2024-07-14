Return-Path: <ksummit+bounces-1407-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C1930C2B
	for <lists@lfdr.de>; Mon, 15 Jul 2024 01:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2DA1C20D79
	for <lists@lfdr.de>; Sun, 14 Jul 2024 23:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040DA13CA95;
	Sun, 14 Jul 2024 23:29:13 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D9F9474
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 23:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720999752; cv=none; b=ggwbyT6lVi5lGrNRG3258PBwXYF1BW9PFVG1dXsUIB8zPfVXoU/sSrCpMkD96Zu6Z2cVULgVHQK8Up8tQP7L2+acIyO/ZAaYsYXhepEpFpZoctWHno39qBn06O2CreboGfX9ye2V8RjPKTrXTmXyGKqZc53fp7vaidh5kl33bzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720999752; c=relaxed/simple;
	bh=PNYMlekDc75BeFUldBmFPdjFpBNutJTtwN/+FIni2G0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwJAEnpGp2mJTi7tarcPrxn3ECXwGkEOp+GH/6tgy7jCYgdheRHMc3ARoePSff62AIVe9C0rUt1IPqHlf7KjJ+zX7FoTgsXP5qeZckbtTi+It6c4G+oJWHgVIGuIc31lsYRHrM4zJm+WtgZ/tWj0ehrAMwTPVw8OzUxsT+zGhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBC4C116B1;
	Sun, 14 Jul 2024 23:29:11 +0000 (UTC)
Date: Sun, 14 Jul 2024 19:29:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ksummit@lists.linux.dev,
 Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <20240714192914.1e1d3448@gandalf.local.home>
In-Reply-To: <ZpQ0soWV6zIpgigf@sashalap>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	<CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
	<ZpQdJpKhIzmf3veU@sashalap>
	<CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
	<ZpQ0soWV6zIpgigf@sashalap>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 14 Jul 2024 16:27:30 -0400
Sasha Levin <sashal@kernel.org> wrote:

> If you think that anything with a Fixes tag should land in stable, then
> great, we can change the formal policy and get it over with.

I guess it comes down to what exactly do we consider a fix worthy of
stable? Most of my commits I tag with Fixes have Cc stable too. But there's
some cases where I made an improvement in logic, or restructured something
that helps with performance and tag that with a Fixes. So, in these cases
when I add "Fixes" without a Cc stable, it does mean "improvement" more
than fix. Or I think the code change may be too risky to consider stable
(as it may introduce a bug, as the code change is too big).

Basically, it comes down to that I add Cc stable for anything I think is
worthy to send to Linus in an -rc release. Perhaps all commits that go to
Linus during -rc must have a Fixes tag, and Cc stable if the fixed commit
happened in a previous kernel version? As Linus has been pointing out that
he only wants fixes after -rc1.

Sometimes I find a behavior bug, that's been there since the code was
written. Like a new feature that works "some of the time", but then I find
a corner case that doesn't work. I'll add Fixes but not "stable" when I fix
the corner case. As Linus once criticized one of these types of fixes as
it's not a fix. But I still label it a fix for those that want the feature
to work in all cases.

Recently this happened with an update to the user events. We found a case
that doesn't work as expected, and I sent the "fix" to Linus in the -rc
release, but Linus refused it. That was because it was more of an extension
of an existing feature. That is, it wasn't a regression. The behavior never
worked that way in previous kernels, so it's not something to be added as a
fix. I still tagged it as Fixes, as for us, the feature wasn't working in
all the cases we wanted it to.

Things like this is questionable for adding to a "stable" release. In that
corner case, if you tried to do that feature, it would just fail. This
would not break any existing code. But if you wanted that full feature to
work, you needed the fix. Should this be considered a "stable" backport?
For any distro that wanted the full feature, the answer was "yes". For those
that just want stable not to have regressions, the answer is "no".

-- Steve

