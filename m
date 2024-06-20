Return-Path: <ksummit+bounces-1343-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0204B9116A8
	for <lists@lfdr.de>; Fri, 21 Jun 2024 01:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E72191C22D0C
	for <lists@lfdr.de>; Thu, 20 Jun 2024 23:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E436814F121;
	Thu, 20 Jun 2024 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdaEXEhO"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6715414387F
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718925508; cv=none; b=mlIRJ8e7d/2Y0FuXrngCOkLiHdXm5+InLpCYPraHT0g/px/3+M+LUdKFIy0JyRPJU8rFmGS/9UaWG6gQf5vrrOuA9tHBaIZU0XkKXDvwLQmppuxgwpaPsM3qO2lcrBT6ocIjcBqeXIvv17WN9WcJgrMXSBIi/M61qKMc35Y7VDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718925508; c=relaxed/simple;
	bh=l2EZCuZI4ujtmPFMglUmqq0ocKPHcTGmG8jcA/FN084=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fb7Ct1YcsOk0wHYKTDqk6d1A//s4yzs3ApYhxB8c8EFIJs4Jcdd1al21P1rxCUAfwNebCI5UsMis/vuO4BGo23eKoo0h/pk4bB2jLiXabtLjs5KE2zBOkBtmNQ0rLsRx7Nb9kW1q6pDm3xY5rB3+zv1NDMmQqiRDTcuEN3NzDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdaEXEhO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCED2C32781;
	Thu, 20 Jun 2024 23:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718925507;
	bh=l2EZCuZI4ujtmPFMglUmqq0ocKPHcTGmG8jcA/FN084=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdaEXEhOJ4hpJ3bLeCKAU+j5uCl16jNdFL3R98Do+S1FaiSc8MdVOoPqqf5H0H1NJ
	 ZnPPGCRWU+XSw9A89Iwbsgzd+nDrVAZCFT304XfrB1im/MPslzioChWOCytZ2SbNgp
	 QU5Bjz1qdF84wiNA6RBVBawdHZ0jI9zeMIUQk6wBewN+EbkSpvvwUmKo5ZaHyuDBEi
	 o6piK2kvYRFb7gxzsRTq0Md/+2NV0sVPlzCqgb5KVMxPGjE7VMaMb2u8dDC4FP574d
	 mEs3X0yKID3cFQUIGAyF6vTv5KFqJGh11wJJjX0CSYrqqvgyAvsry/MNlMiO2GsOuS
	 1m/k1xoD2P8jg==
Date: Thu, 20 Jun 2024 19:18:26 -0400
From: Sasha Levin <sashal@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Message-ID: <ZnS4wqxpVZWasxm9@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
 <b4b3b24d-09a2-4abc-b806-47a6057caaaa@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b4b3b24d-09a2-4abc-b806-47a6057caaaa@leemhuis.info>

On Thu, Jun 20, 2024 at 06:59:56PM +0200, Thorsten Leemhuis wrote:
>On 20.06.24 14:57, James Bottomley wrote:
>> On Thu, 2024-06-20 at 12:32 +0200, Thorsten Leemhuis wrote:
>>> On 18.06.24 16:43, James Bottomley wrote:
>>>> On Thu, 2024-06-13 at 10:22 +0200, Thorsten Leemhuis wrote:
>>
>>>> However, for obscure drivers and even some more complex
>>>> dependencies, the regression sometimes isn't discovered until it
>>>> gets into the hands of the wider pool of testers, often via stable.
>>>>
>>>> This is important, because it emphasizes that zero regressions in
>>>> stable is impossible (and thus preventing backporting patches that
>>>> cause regressions is also impossible) if stable is the vehicle by
>>>> which some regressions are discovered.
>>>
>>> Of course "Zero regressions in stable is impossible" as we are
>>> dealing with software. ;) And of course even with delayed backport
>>> for non-urgent fixes some problems would make it through.
>>>
>>> But right now users testing mainline sometimes hardly have a chance
>>> to test and report problems with mainline in time to prevent a
>>> backport. Take Linux 6.7.2 (released 2024-01-25 23:58 UTC) with its
>>> 640 changes for example, where users had only 4 days to do so, as
>>> almost all of its changes had been merged for 6.8-rc1 (2024-01-21
>>> 22:23 UTC). FWIW: 200 of those changes were committed to some
>>> subsystem git tree during January, 363 during December, 70 during
>>> November, and 7 during October.
>>
>> I did make this point here:
>>
>> https://lore.kernel.org/all/7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com/
>>
>> That merge window fixes should be delayed.  Not because I think a
>> longer soak in main would allow us to find many more bugs, simply
>> because it was causing reports in the merge window that weren't handled
>> because people had other things to do.  The reply was that they're
>> already doing it
>
>Only for changes picked by autosel afaics, which are delayed for a while
>already, yes (not sure, I think that was in place even before the 6.7 days).

All merge window content deemed for -stable only makes it into -stable
once -rc1 is released. This isn't specific for autosel.

>But I'm pretty sure it was not autosel that resulted in most of those
>backports that went into 6.7.2 due to the lack of "patch autosel"
>messags for those changes.
>
>Those changes afaics were mainly patches with a stable tag (about 94
>from a quick check) or a Fixes: tag (630); some had both. And those tags
>(and not autosel) afaics were the reason for the backports.

Right, it was all commits with a stable/fixes tag.

autosel usually starts around ~.6.

>> and when I looked, they actually started doing it for
>> the 6.9 merge window (so your 6.7 example is probably out of date).
>
>Yes, things looked differently for those releases iirc. We would need to
>ask Greg why; but from what I saw it looks a lot like "Greg was on
>vacation and/or busy with other stuff" that slightly mixed things up.

Greg can probably give a more accurate response, but we usually target
stable tagged commits from the merge window after Linus cuts -rc1.

Sometimes it ends up being later because of vacation/overload/etc.

>>>  But those are different problems.
>>> And the situation regarding the first already got somewhat better
>>> from what I can see -- among others afaics due to me prodding people
>>> when the queue fixes for recent regression for the -next merge
>>> window.
>> Yes, that's why I was asking for stats on 6.9 and 6.10 where this delay
>> policy was apparently in place.
>
>v6.9.2..v6.9.3: 427 changes, all from the 6.10 merge window. From a
>rough check if seems 41 of them have a stable tag and 407 a fixes tag
>(some both).
>
>6.9.3 was released on "2024-05-30  7:58 UTC", so not even four days
>after 6.10-rc1 went out on "2024-05-26 22:31 UTC".
>
>IOW: less patches then in the 6.7.2 case, but eben less time for users
>to test mainline, bisect, and report regression to prevent a backport in
>time.

There's no "win" here: either our release cycles are short and we can
have relatively few commits in each release, or our release cycles are
longer and we end with thousands of commits each time.

 From experience, it's easier to work with smaller releases, both for us
as we compose and release these kernels, but also for testers since it's
way easier to spot issues in a smaller release.

-- 
Thanks,
Sasha

