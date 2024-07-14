Return-Path: <ksummit+bounces-1403-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A24930B84
	for <lists@lfdr.de>; Sun, 14 Jul 2024 22:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F6DB1F226BD
	for <lists@lfdr.de>; Sun, 14 Jul 2024 20:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590A113AA2C;
	Sun, 14 Jul 2024 20:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+J9Y5yb"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E791CA81
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720988282; cv=none; b=hV7cEUvaXgOprzhDZekGa6yD3/VFuXSLSV3MJXOXLmHeLQGBwnDpBKP5oDi9RMtbuxO7yGXabN5UsB1L74P8raFcwlmzuuLd+oIKHYrf0ECWwkIx5bgW3VvpRfON+E9B2XYwhra1XrUtv6rKX61wqEG/fIhPEnfuXgsIoDIpUk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720988282; c=relaxed/simple;
	bh=aNNaFP8ehStp8Ytamu/39TCLaWSQwF+3mPupUtG7xAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dqo8eL7EZ6jdrPdUSbM2fOm0JG0zm2fKHtREhKzTAFVLJz3cnvsO2sTj/A9cXp8TENxCA5cu+AZ7E41axT9naA69WsH6/ykYzdnYvlpO8xZ20iCTnGtE+UZfEhSRiQbo9ANDtCwh/aYVnNEGADuIlcHpF8qZpuldVsyD32uI3GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+J9Y5yb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B81C116B1;
	Sun, 14 Jul 2024 20:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720988282;
	bh=aNNaFP8ehStp8Ytamu/39TCLaWSQwF+3mPupUtG7xAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+J9Y5ybHcbReb3vX0kF6I2qO5K6/MLcd2LfAmt1dQbMcOalGZnjEz0bLg31xX4kX
	 XBLkKErNWvCb0sSxMBQHFwK+lq/ns/4v2ZtNEVRJbgH/3RWXSlQ86RlSYHQ5wx2aVC
	 +NG7Pv/HcMHGUSIi5mjF5EuvWLPVskA4Vt1uSMIUxN3r4oYV+kHoFzhaZz4d3bryOy
	 aCmLckJ9uRIeYi5Vun5XDvMe7C20V1dJyxCCGZer2QLOQYWxr2pNmhliLyBXz//0Ai
	 ovPYiQuOQW5bvbhXzCrq/m6MmQX+YVc6/AYr9aSWSC9fzTtsl6XCX8I2E0//Ci25lb
	 9kIb2lv0xuBiw==
Date: Sun, 14 Jul 2024 16:18:00 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <ZpQyeLFJY1gJvRRA@sashalap>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>

On Sun, Jul 14, 2024 at 03:20:48PM -0400, James Bottomley wrote:
>On Sun, 2024-07-14 at 14:38 -0400, Sasha Levin wrote:
>> On Sun, Jul 14, 2024 at 09:35:26AM -0400, James Bottomley wrote:
>> > On Sun, 2024-07-14 at 08:31 -0400, Sasha Levin wrote:
>> > > Hi folks,
>> > >
>> > > The Linux kernel community relies heavily on commit tags to
>> > > identify and manage patches destined for stable kernel branches.
>> > > Currently, we use a "Stable tag" (cc: stable@kernel.org) to
>> > > indicate that a patch should be included in stable kernel
>> > > branches, and a "Fixes tag" (Fixes: 012345678901 ("commit
>> > > subject")) to point to an older commit that the new commit fixes
>> > > or improves. However, this scheme has led to some unintended
>> > > consequences.
>> > >
>> > > One of the main issues is that most Fixes-tagged commits (>80%)
>> > > end up in a stable tree, leading some authors to omit the Stable
>> > > tag altogether. This means we may not be trying hard enough to
>> > > include critical commits in stable kernel branches. On the other
>> > > hand, some authors are unhappy when commits without a Stable tag
>> > > end up in a stable kernel branch. To address these shortcomings,
>> > > I propose introducing an "Improves tag" (Improves: 012345678901
>> > > ("commit subject")) and altering the meaning of the Fixes tag.
>> >
>> > I've got to say this looks like a bad idea: your complaint is we're
>> > not being clear enough about the cc:stable and fixes semantics, so
>> > the proposal is to introduce a tag with even less clear semantics
>> > in the hope that it will somehow improve the situation. Why not
>> > simply be much more crisp about the meaning of Fixes and no
>> > cc:stable? If everyone
>>
>> What does it mean exactly? What should we be doing now that wasn't
>> happening before?
>
>I outlined it below and you replied.
>
>> All our documentation explicitly says that a stable tag is a *must*,
>> we've been nagging folks to add it when they haven't, and we give
>> them the spiel whenever we're asked why a certain fixes-only commit
>> didn't make it into the stable trees.
>
>Then you've muddied that by backporting a lot of stuff without
>cc:stable leading to somewhat mixed messages.  However, most of the
>trees I'm involved in are very fastidious about cc:stable which should
>prove getting people to assist here isn't impossible.

And we appreciate the help, and some of it is indeed what you've pointed
out here: folks are used to "Fixes:" meaning automatic backport to
-stable.

[snip]

>> The statistic is that about 70% of commits that have a stable tag but
>> no fixes tag actually fix something in the previous releases rather
>> than something that was introduced in the current merge window.
>
>Given the number for fairly trivial spelling and other non user visible
>fixes we get in the trees I look at that doesn't sound too surprising.
>So the big question is how many of those *should* actually have had a
>stable tag?

I'm going to argue that if you look at commits with only a Fixes tag in
any of the recent -rc cycles, you'll find that over half of them should
be backported.

It could be a fun experiment if you want to give it a go, we can both
look at v6.8-rc1..v6.8 and compare notes?

>> When you couple that with commits that are stable tagged, nearly 85%
>> of commits in each -rc release actually address something that
>> happened prior to the merge window.
>
>Here you seem to be assuming that every commit with a Fixes tag for a
>prior release should be in stable ... I don't think that's true at all.

I really weren't. All I said that most commits with a Fixes tag in the
-rc cycles of a release don't fix an issue introduced in the merge
window of that release.

>> > So the clear rules look like they should be
>> >
>> >   1. every patch fixing something should have a fixes tag pointing
>> > to the fixed commit
>> >   2. Only patches with cc:stable should go automatically in to
>> > stable trees and as far back as the fixes tag allows
>> >   3. if a patch without cc:stable is later discovered to be a
>> > required fix, people can ask for it to be backported.
>>
>> These were the rules for a while, and the issue was that there were
>> so many commits without a stable tag that needed to be backported
>> that the model of "later discovered" simply overwhelmed the process.
>
>How can it?  The cc:stable is automation driven, surely we could
>automate the discovered after process as well.  Our control systems via
>email has rather dramatically improved over the years, just look at
>regzbot.

Stable tag is, but we don't have a nice story around everything else
yet. Maybe regzbot is indeed the solution to a lot of these issues in
the future, but right now we're not even close.

 From my experience, most issues tracked by regzbot and fixed upstream
don't actually have a stable tag. Here's one I just looked at a few days
ago: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f451fd97dd2b78f286379203a47d9d295c467255

And I'm actually happy to point to that one as an example because the
ext4 folks are usually great about stable tags.

Should we have not taken that commit?

-- 
Thanks,
Sasha

