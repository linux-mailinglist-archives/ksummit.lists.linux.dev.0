Return-Path: <ksummit+bounces-1401-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB7930B4E
	for <lists@lfdr.de>; Sun, 14 Jul 2024 21:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A34911F21CA9
	for <lists@lfdr.de>; Sun, 14 Jul 2024 19:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F64B13BC0C;
	Sun, 14 Jul 2024 19:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="D2ukUYER";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="D2ukUYER"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE61BDD3
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720984854; cv=none; b=Ozs/MpjwuujOz50VE98xgbbQ78+M/QBy44wkmUsmmfdi4Ttb49RxT3B6n0N7vIBpNknv6Up4jsupUL5h8xb95WiVg8+lGuLZ4jdK3YwoOVfgRIexKlEcKpDUbrbPWWnodh3SxNiQwcyts/NmV5Sy7HRQP9HWmttswR8pbufAhbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720984854; c=relaxed/simple;
	bh=RQOdEw3QAmpkrU3BZWZCUD37Gbo46nSV0wm7kfz1MB0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BpgjX/RCEZyJZlF2+zXMcmJsRasWdYZiZtCsnfUmeD4ZjZ22uhdbR0SKZtyMwF7b1tRo49+U/fZIi1e9yGmkPst51v7uXs5CCdtgcnK6VX5BXQ/BSbepDIMXl+gfNE9DWXpD9W4MbSUkqTCu7+vOsbVLM0X30CLDWkQtq50Bvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=D2ukUYER; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=D2ukUYER; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1720984851;
	bh=RQOdEw3QAmpkrU3BZWZCUD37Gbo46nSV0wm7kfz1MB0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=D2ukUYER284VTz1qOzm93JrwR+5+QNJ0Qx0W4aVW8o5CP4U+0NVmzKBjBopK8aCw2
	 tu1WBZC3vhxkAMPay4jMg8FBYDOMXn1jv0XQRaxP725HQJStCXmFaUKFGgkALqaX57
	 FFyZFwPJfjke5CCD0M9tz7qfyYtztSq7fXt0M77o=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 623B71286177;
	Sun, 14 Jul 2024 15:20:51 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Eyi2wmcOE1nv; Sun, 14 Jul 2024 15:20:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1720984851;
	bh=RQOdEw3QAmpkrU3BZWZCUD37Gbo46nSV0wm7kfz1MB0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=D2ukUYER284VTz1qOzm93JrwR+5+QNJ0Qx0W4aVW8o5CP4U+0NVmzKBjBopK8aCw2
	 tu1WBZC3vhxkAMPay4jMg8FBYDOMXn1jv0XQRaxP725HQJStCXmFaUKFGgkALqaX57
	 FFyZFwPJfjke5CCD0M9tz7qfyYtztSq7fXt0M77o=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id A666012860B6;
	Sun, 14 Jul 2024 15:20:49 -0400 (EDT)
Message-ID: <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 14 Jul 2024 15:20:48 -0400
In-Reply-To: <ZpQbQa-_8GkoiPhE@sashalap>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	 <ZpQbQa-_8GkoiPhE@sashalap>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 2024-07-14 at 14:38 -0400, Sasha Levin wrote:
> On Sun, Jul 14, 2024 at 09:35:26AM -0400, James Bottomley wrote:
> > On Sun, 2024-07-14 at 08:31 -0400, Sasha Levin wrote:
> > > Hi folks,
> > > 
> > > The Linux kernel community relies heavily on commit tags to
> > > identify and manage patches destined for stable kernel branches.
> > > Currently, we use a "Stable tag" (cc: stable@kernel.org) to
> > > indicate that a patch should be included in stable kernel
> > > branches, and a "Fixes tag" (Fixes: 012345678901 ("commit
> > > subject")) to point to an older commit that the new commit fixes
> > > or improves. However, this scheme has led to some unintended
> > > consequences.
> > > 
> > > One of the main issues is that most Fixes-tagged commits (>80%)
> > > end up in a stable tree, leading some authors to omit the Stable
> > > tag altogether. This means we may not be trying hard enough to
> > > include critical commits in stable kernel branches. On the other
> > > hand, some authors are unhappy when commits without a Stable tag
> > > end up in a stable kernel branch. To address these shortcomings,
> > > I propose introducing an "Improves tag" (Improves: 012345678901
> > > ("commit subject")) and altering the meaning of the Fixes tag.
> > 
> > I've got to say this looks like a bad idea: your complaint is we're
> > not being clear enough about the cc:stable and fixes semantics, so
> > the proposal is to introduce a tag with even less clear semantics
> > in the hope that it will somehow improve the situation. Why not
> > simply be much more crisp about the meaning of Fixes and no
> > cc:stable? If everyone
> 
> What does it mean exactly? What should we be doing now that wasn't
> happening before?

I outlined it below and you replied.

> All our documentation explicitly says that a stable tag is a *must*,
> we've been nagging folks to add it when they haven't, and we give
> them the spiel whenever we're asked why a certain fixes-only commit
> didn't make it into the stable trees.

Then you've muddied that by backporting a lot of stuff without
cc:stable leading to somewhat mixed messages.  However, most of the
trees I'm involved in are very fastidious about cc:stable which should
prove getting people to assist here isn't impossible.

> > realised that Fixes without cc:stable meant the patch wouldn't be
> > included in a stable tree that surely gives all the semantics you
> > need without having to get everyone to try do differentiate between
> > a fix and an improvement?
> 
> By your logic folks already have to do it now, right? The decision
> around whether to add a stable tag or not means that there needs to
> be a decision around whether something is a fix or an improvement
> each time a Fixes tag is added.

I believe most maintainers who haven't given up on the cc:stable
process do that, yes.

> > One of the big reasons patches get Fixes without cc:stable is
> > simply that it's an -rc fix for a merge window regression (so no
> > released kernel has it in and therefore no stable kernel needs it),
> > so you'd also need to explain that case in the improve docs
> > (because it's a genuine fix, just not a stable candidate).
> 
> This is a fairly common misconception around what happens in the -rc
> cycles.
> 
> The statistic is that about 70% of commits that have a stable tag but
> no fixes tag actually fix something in the previous releases rather
> than something that was introduced in the current merge window.

Given the number for fairly trivial spelling and other non user visible
fixes we get in the trees I look at that doesn't sound too surprising.
So the big question is how many of those *should* actually have had a
stable tag?

> When you couple that with commits that are stable tagged, nearly 85%
> of commits in each -rc release actually address something that
> happened prior to the merge window.

Here you seem to be assuming that every commit with a Fixes tag for a
prior release should be in stable ... I don't think that's true at all.

> > So the clear rules look like they should be
> > 
> >   1. every patch fixing something should have a fixes tag pointing
> > to the fixed commit
> >   2. Only patches with cc:stable should go automatically in to
> > stable trees and as far back as the fixes tag allows
> >   3. if a patch without cc:stable is later discovered to be a
> > required fix, people can ask for it to be backported.
> 
> These were the rules for a while, and the issue was that there were
> so many commits without a stable tag that needed to be backported
> that the model of "later discovered" simply overwhelmed the process.

How can it?  The cc:stable is automation driven, surely we could
automate the discovered after process as well.  Our control systems via
email has rather dramatically improved over the years, just look at
regzbot.

> We can't go back to that again.

Why?  I mean I'm assuming the actual number of patches would be the
same under a perfect cc:stable system as it would be under he cc:stable
but ask for backport if I got it wrong system, so it's really just a
question of using similar automation that drives the former for the
latter.  If you can't figure out how to automate it, I'm sure we can
lend a hand if that's all it takes.

Regards,

James


