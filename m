Return-Path: <ksummit+bounces-1399-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48989930B39
	for <lists@lfdr.de>; Sun, 14 Jul 2024 20:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5E20B20E05
	for <lists@lfdr.de>; Sun, 14 Jul 2024 18:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232C213C8F6;
	Sun, 14 Jul 2024 18:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erJDS6ev"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12EE11CB8
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720982339; cv=none; b=jcxDISwlUB1Izkc/MCfh4uYo/hxT8BrAkhanWydW9djkyv+sK/MUY6gHKxqcfeBIYvHeCfJJyJZPi8RRz5j0MTus63/V39p+Hx7bc2R3LjQ4DNkHjJEe8BUSj2GEt8FCpYt23rblC39ueZe0w/g0p4v/msTqO9M3trOSzmkkiOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720982339; c=relaxed/simple;
	bh=aSi9ppgUjjQhV+o1eFizePVYxLqfnoB6VVmrQNvhMiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNNOa+gHliNJYS/6litNhPs8eVDnaosnPoO7v20uhaSWeeIOVxrctVmcyc4GFF+JqUatMZOBXeZQZWGY6JUoZdCh9fn5Ss8Q6d6WZ1tj5V6R8LRQEuanvgAoTpNnOyicJfN1EJLK2zA8CnNoYeHzAYuXoVVe6tV48Md4B89Pl/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erJDS6ev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3C2C116B1;
	Sun, 14 Jul 2024 18:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720982339;
	bh=aSi9ppgUjjQhV+o1eFizePVYxLqfnoB6VVmrQNvhMiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erJDS6ev5mB4tCTfX/NQx5OeKS/oj8il7aUwYul1pp7VJHi34eVzfr+WiMYjabj7r
	 YI+oofMWZUhqHLm2COjYExwkujdR3S8TQr7g4Ps1idqgG47HV4ggi1BYhrrNIFefyX
	 JRd0IBWpmPPDIPkIZc+wfkuUcsBrYGppwq6hC26ECCYCSiUMtalnzGHrb7Chl3l8RM
	 0IoTieX1jsq1BZ7nzG2DuhV5lVYNA0oOoC50Ahw/fppSov1etaVopDQIu3/BsVNsCv
	 azEA0GvNig7BAv/a4bhSAeen8cNyyokZ04rrPa+SZAwNO3R7G7pEg3VEoiJCxS8zkV
	 fGSgiCisdN7rQ==
Date: Sun, 14 Jul 2024 14:38:57 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <ZpQbQa-_8GkoiPhE@sashalap>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>

On Sun, Jul 14, 2024 at 09:35:26AM -0400, James Bottomley wrote:
>On Sun, 2024-07-14 at 08:31 -0400, Sasha Levin wrote:
>> Hi folks,
>>
>> The Linux kernel community relies heavily on commit tags to identify
>> and manage patches destined for stable kernel branches. Currently, we
>> use a "Stable tag" (cc: stable@kernel.org) to indicate that a patch
>> should be included in stable kernel branches, and a "Fixes tag"
>> (Fixes: 012345678901 ("commit subject")) to point to an older commit
>> that the new commit fixes or improves. However, this scheme has led
>> to some unintended consequences.
>>
>> One of the main issues is that most Fixes-tagged commits (>80%) end
>> up in a stable tree, leading some authors to omit the Stable tag
>> altogether. This means we may not be trying hard enough to include
>> critical commits in stable kernel branches. On the other hand, some
>> authors are unhappy when commits without a Stable tag end up in a
>> stable kernel branch. To address these shortcomings, I propose
>> introducing an "Improves tag" (Improves: 012345678901 ("commit
>> subject")) and altering the meaning of the Fixes tag.
>
>I've got to say this looks like a bad idea: your complaint is we're not
>being clear enough about the cc:stable and fixes semantics, so the
>proposal is to introduce a tag with even less clear semantics in the
>hope that it will somehow improve the situation. Why not simply be much
>more crisp about the meaning of Fixes and no cc:stable? If everyone

What does it mean exactly? What should we be doing now that wasn't
happening before?

All our documentation explicitly says that a stable tag is a *must*,
we've been nagging folks to add it when they haven't, and we give them
the spiel whenever we're asked why a certain fixes-only commit didn't
make it into the stable trees.

>realised that Fixes without cc:stable meant the patch wouldn't be
>included in a stable tree that surely gives all the semantics you need
>without having to get everyone to try do differentiate between a fix
>and an improvement?

By your logic folks already have to do it now, right? The decision
around whether to add a stable tag or not means that there needs to be a
decision around whether something is a fix or an improvement each time a
Fixes tag is added.

>One of the big reasons patches get Fixes without cc:stable is simply
>that it's an -rc fix for a merge window regression (so no released
>kernel has it in and therefore no stable kernel needs it), so you'd
>also need to explain that case in the improve docs (because it's a
>genuine fix, just not a stable candidate).

This is a fairly common misconception around what happens in the -rc
cycles.

The statistic is that about 70% of commits that have a stable tag but no
fixes tag actually fix something in the previous releases rather than
something that was introduced in the current merge window.

When you couple that with commits that are stable tagged, nearly 85% of
commits in each -rc release actually address something that happened
prior to the merge window.

>
>So the clear rules look like they should be
>
>   1. every patch fixing something should have a fixes tag pointing to
>      the fixed commit
>   2. Only patches with cc:stable should go automatically in to stable
>      trees and as far back as the fixes tag allows
>   3. if a patch without cc:stable is later discovered to be a required
>      fix, people can ask for it to be backported.

These were the rules for a while, and the issue was that there were so
many commits without a stable tag that needed to be backported that the
model of "later discovered" simply overwhelmed the process.

We can't go back to that again.

-- 
Thanks,
Sasha

