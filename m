Return-Path: <ksummit+bounces-1345-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE8911BD3
	for <lists@lfdr.de>; Fri, 21 Jun 2024 08:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 264361F2173A
	for <lists@lfdr.de>; Fri, 21 Jun 2024 06:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B137D152500;
	Fri, 21 Jun 2024 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ZsOamAA0"
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD939FD0
	for <ksummit@lists.linux.dev>; Fri, 21 Jun 2024 06:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951606; cv=none; b=uKRXgbXwETrozTBSodrAxL8TzMtP7s/u760AmZ8Ng5Q6g6/5OUWMeauMa+tK4V5dtJ0Mf0CJn7xxS3c2WOipulw4HsHbrKIit5jSByigPI0mjz3KCKh1QiM2csIPBogtWygExd5hGtN33wTPhql0/sM/UFQ0YWszRPJtfTfytz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951606; c=relaxed/simple;
	bh=vWW/TM5SU9dInkOVwGOGM85nF0Wh5959jnTjz1eSaoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOxUuxGlC+aIXI/wVqGYH0Utb5FzAb+OQCq7LwgQ4YpraR3uh16996jYMLsBEIgqtEWhdSMdenQXJPj6bqKv1qXjWc+JTRr6E1WYrHkSAgjm+h/jSz1tms+gLfWiqFP6ZpqFiSrVwWMRp5/9ttbhCHCg6hl0DyQyFzVaOMePfKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ZsOamAA0; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=nqyBNoLHcEXvvd1W5+Ss4yOXKVi+YiMkNh7ozkxFnUA=; t=1718951604;
	x=1719383604; b=ZsOamAA0Bg9d/jhmC7m5vlO/tb/SnYypYwQBOxgD/SHFNQ2wb2ilkrkFTZinN
	JGtB98Ob7K6AYWddFhWv/kgJg5SJGa3q9nqjGIemD/sTIGWQOD7ajJlumzWGw++yTUFRwSdKd0ZKP
	ozqj25EMqQIalSliHmn6p0WHUfKofxj+mLGYDRGY4ov4BliHb8cJVYpU4t7mH9Vl2JfplsTfloMA9
	2BamnfbtW8fltIAMXY2JSXASSsrHjvC2tgP0vtD0wDe7zJf7ZXF/QcHZj3nmOU9L/FmDaqVXkMc5l
	4dhAie0yb5k00ZfzfTh3S5SlAtTa0smXFBU+TWdWJC58Cpax8g==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sKXpp-0004qD-AB; Fri, 21 Jun 2024 08:33:21 +0200
Message-ID: <0350b3ca-df25-4c2c-930e-7839253c39c5@leemhuis.info>
Date: Fri, 21 Jun 2024 08:33:20 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
To: Sasha Levin <sashal@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mark Brown <broonie@kernel.org>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
 <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
 <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
 <710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
 <32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>
 <ZnS6V3mZhSH7t-_v@sashalap>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <ZnS6V3mZhSH7t-_v@sashalap>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1718951604;c80b6160;
X-HE-SMSGID: 1sKXpp-0004qD-AB

On 21.06.24 01:25, Sasha Levin wrote:
> On Thu, Jun 20, 2024 at 12:02:21PM -0400, James Bottomley wrote:
>> Right, but the point I'm making is that even that wider pool doesn't
>> have the app use or hardware breadth of the pool who try out stable.  I
>> also agree the stable users would rather not be testers but given that
>> they are, it's not impossible we could sell them on the idea of testing
>> out .0 to find bugs they would otherwise be finding in .n.
>>
>> After all, given that stable is now delaying backports in the merge
>> window, there should be at least a 2 week period where .0 is it
>> (although it's also the two week period where we're not paying
>> attention ...)
> 
> We also keep the prior kernel alive for a few weeks *after* a merge
> window.
> 
> We understand that X.Y.Z for Z<~5 kernels receive many changes and need
> additional testing, and so users have the option of staying on the Y-1
> kernel for a few weeks until issues with X.Y are settled.
> 
> So yes, users should have "at least two", but really "at least five"
> weeks to find out issues in a post-merge-window release.

Hmmm. Is it really "at least five"? 6.8.12 was the last 6.8.y release
and it came out on 2024-05-30  7:59 UTC in parallel to the 6.9.3 release
I mentioned in another mail yesterday -- and thus also just three and a
half days after 6.10-rc1 was out. And from what I see it also contained
384 patches from the 6.10 merge window where I wonder how much testing
they have seen during that short time-frame.

FWIW, the above and other things I said yesterday may sound like I'm
complaining about the way the stable maintainers work. But to be clear:
Given the circumstances I understand why things are as they are. But to
reduce the risk of regressions in stable trees I wonder if we can
improve the circumstances somewhat, so that the non-urgent patches among
those 384 changes never would have made it to 6.8.y in the first place
-- and only make it to 6.9.y (and earlier longterm series) once they saw
more testing in mainline. Like at least 50 among those 384 changes that
were committed to some subsystem tree during February and March and
therefore took weeks to get mainlined -- and thus are unlikely to be
urgent or crucial (or should have been mainlined way earlier in the
first place). I guess the same applies to many or all of the 189 changes
committed to some tree during April, too. For those from may it's harder
to say without a way to mark the non-urgent ones.

Or do something entirely different. Like "only backport changes quickly
that have a stable tag; everything that has a Fixes: tag is only
backported after it has been in at least three -rc (IOW: two week),
unless someone asked for a quicker backport". But that way we risk that
some urgent fixes lacking a stable tag take too long to get backported.
That sounds like a worse idea to me. #sigh

Ciao, Thorsten

