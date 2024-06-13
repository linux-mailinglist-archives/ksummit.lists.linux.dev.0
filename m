Return-Path: <ksummit+bounces-1245-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F69073AC
	for <lists@lfdr.de>; Thu, 13 Jun 2024 15:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3AC61C2499C
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DA914430E;
	Thu, 13 Jun 2024 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3+agUlM"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4580143C40
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718285275; cv=none; b=VDwpdgnUr3gRsKTlePW3qQ5aOl9vyUlzZbzQiWGyWkL6dWfbd4AKwjvgr8dc+K1+h68MYAkzB/vLc25CmeTGg4cYthhC6Bx9L4nt/CRrbX3WOAdvMn7wa6TgqCJFxvuzh6tT4a9/BykqYwKRWBUe6FA0Fd4YLp0P4nuCi2cZjhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718285275; c=relaxed/simple;
	bh=MSZd7PqDTfBtArLx3vfrNGRtjyn0ohKADT0UGFhnEf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAE+dVY4HJPHzTuJs+EdTc7Mt8TGD5dClzMKLDk+O502A5M6zvB6JbwZvWLinuJt4aZlkB9ZvD8B9lbNSoFjtlIjHfE+Dno5f5IoVXiGCRjusGXsu6pa9MhtKd5K7NpkwcYWbNMnR79xwaaFjjk8lUPp7h+91EPxnt0HJfb1YBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3+agUlM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3461AC4AF49;
	Thu, 13 Jun 2024 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718285275;
	bh=MSZd7PqDTfBtArLx3vfrNGRtjyn0ohKADT0UGFhnEf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3+agUlMt3ir6yfAKMkKLX8c4jmLN6NjPArEIRbaSQJg4wylJ4l2YItflCVUecGZ6
	 dfXQZ88bShy4K218brgADScug621IvAj1GW0BV7uBZH+vsxAd4TLpNh2+gu2IIoDj6
	 kuI/wdfSJX1xuMAPN5oWFQZSW5QOzmWsbWjKJqfOntooeQXMjgZlABbDE/nsw7Y6il
	 K85PwBW454u3w88k24zZaMjVcYFCoOP8rU9n2KjwbbbQ8OKg8GAXfBDofEzjKD9TFY
	 7ksa56MpGi/S8FLbRA1duKyzsAN3Ar4V707LvKcbDogs/vyJiWvLLIVnWw5p71bRXk
	 1S+4BTegVWA+g==
Date: Thu, 13 Jun 2024 09:06:54 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <ZmruqWDTG2PK-rbu@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>

On Thu, Jun 13, 2024 at 07:58:58AM -0400, James Bottomley wrote:
>On Thu, 2024-06-13 at 10:42 +0200, Thorsten Leemhuis wrote:
>> The scenario shown at the start of the thread illustrates a problem I
>> see frequently: commits with a Fixes: tag end up in new to stable
>> series releases just days after being mainlined and cause regressions
>> -- just like they do in mainline, which just was not known yet at the
>> time of backporting. This happens extremely often right after merge
>> windows when huge piles of changes are backported to the stable trees
>> each cycle shortly after -rc1 is out (which even some kernel
>> developers apparently are somewhat afraid to test from what I've
>> seen).
>
>I haven't really observed this for curated fixes.  For most subsystems,
>patches with Fixes tags that are cc'd to stable tend to go steadily
>outside the merge window.  Obviously a few arrive within it, but
>usually at roughly the rate they arrive outside it.
>
>What I observe in the merge window is huge piles of patches go into
>stable *without* a cc:stable tag from the autosel machinery (and quite
>a few even without fixes: tags).

Could you provide a concrete example? This shouldn't happen.

>So this does beg a couple of questions:
>
>Since you have the figures, what's the proportion of regressions caused
>by backports to stable without cc:stable tags?

This question came up two years ago and we had statistics around this.
Autosel patches didn't cause more (actually, it was *less*) regressions
than stable tagged ones.

>Could we fix a lot of this by delaying autosel?  It tends to ramp up in
>the merge window when everyone is concentrating on other things, so any
>regressions it causes naturally get ignored for a couple of weeks.

autosel is currently delayed about 3-4 weeks, sometimes more.

-- 
Thanks,
Sasha

