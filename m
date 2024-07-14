Return-Path: <ksummit+bounces-1404-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C135930B9A
	for <lists@lfdr.de>; Sun, 14 Jul 2024 22:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDD5D1F229AD
	for <lists@lfdr.de>; Sun, 14 Jul 2024 20:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E7C13CFAA;
	Sun, 14 Jul 2024 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4nANAhs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A342572
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 20:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720988852; cv=none; b=nUp0XKenpiS542LsHkWqRZaZUyIWhJBu27QvRWmNSLgXKyhwWqfZbRfwjKNal7HN9jwUqNjC+4OEQYpNqIsRNbFYjKlzRHyDwBZgb8UodyJWSWXYHael/FeObuTtEUH5S3VV5VPgWgiNclen1I3mLadhtzGa+rCIDlbQsmAKGgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720988852; c=relaxed/simple;
	bh=pXapRYpY0fCG7rA9IthiOAPeAL0e9MCcN7inA7BClpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiKN9RHYhOB0koZIwfH/Vvs+N3GDwcgdSpV4pABpOzCA1tKGxzB86mDuFqltYdLcV86pUb0Ugg2TUnMq5x3tpFLlmr6MmrVTWycORxzGYbFKUzbq/oYs2F0xEVpZLs3JRN16Qcm2jEVCzdswa05mouZLIGu9+NnpJtcoj0d/sqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4nANAhs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11704C116B1;
	Sun, 14 Jul 2024 20:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720988852;
	bh=pXapRYpY0fCG7rA9IthiOAPeAL0e9MCcN7inA7BClpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4nANAhsFkK4OmTO2ZdRCor9sNvw1kWnNn5qEutpUtbZvafg6bFeXaVKeQd9e4iU2
	 u5wFTdQ/DOpACqOrDeeLiuPk2ddI48BdoB3MVzDXRyYbk+PVGNexbJSpzVel7//ZVz
	 RGaVNYkVqJQiJXzaAlazGcrA9EaOwG94zykeIKFrsFTAtMzlp3jXK6bbNam9P1RmdR
	 Wa6jODQNOaKxiu9cc28mBYpOiAKQTVafnBz0+rD0kVtFQpxkXOSUdvecxGyuSG9tbP
	 mCL6unG9dTyu3icw7xhb1EEXod/gjpVlhZSQE/Zi5ZVecIivbGUdQZN/N/CIpDBbux
	 Rcb+1py1bb3LQ==
Date: Sun, 14 Jul 2024 16:27:30 -0400
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <ZpQ0soWV6zIpgigf@sashalap>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
 <ZpQdJpKhIzmf3veU@sashalap>
 <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>

On Sun, Jul 14, 2024 at 12:27:55PM -0700, Linus Torvalds wrote:
>On Sun, 14 Jul 2024 at 11:47, Sasha Levin <sashal@kernel.org> wrote:
>>
>> I'm not trying to add an additional tag,
>
>What? You *literally* suggested exactly that - adding an "Improves:" tag.

I guess that in my mind I'm also taking away the cc:stable tag, so at
the end it's a net-zero :)

>I'm not going to use such an odd and pointless tag.

I'll jump into conclusions here and assume that since you weren't using
the stable tag, then it's also an odd and pointless tag, so here we are
trying to address the issue.

>I would hope that *all* commits improve on something. And if it's an
>actual fix to a previous commit, it should say so.
>
>If it's just a random improvement, it shouldn't refer to a previous
>commit at all.

This is *one* view. I've observed that both individuals and companies
started requiring a fixes tag unless they're writing a new feature.

Heck, back in Google you couldn't commit anything that is not a new
feature unless the commit message had a "Fixes:" tag to make the bot
happy.

>What you seem to want is some made-up distinction between "fix that
>wants backporting" and "fix that is not important for backporting".
>
>We have long been told that commits that have a "Fixes" tag don't need
>a "Cc: stable" because the stabl;e people already pick up on the
>fixes, so now you're complaining about the lack of stable tagging.

Who? Where?

This ended up happening because we couldn't get folks to consistently
add stable tags, so we've started pulling in more patches with just a
Fixes tag (and then introducing AUTOSEL for commits without a stable
tag).

I was looking to get away from that, as some maintainers would assume
what you did, and some would assume the exact opposite. I kept ending up
with people angry at me no matter which choice I'd make around the Fixes
tag policy.

If you think that anything with a Fixes tag should land in stable, then
great, we can change the formal policy and get it over with.

-- 
Thanks,
Sasha

