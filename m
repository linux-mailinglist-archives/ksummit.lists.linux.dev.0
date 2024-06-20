Return-Path: <ksummit+bounces-1341-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA651910DE7
	for <lists@lfdr.de>; Thu, 20 Jun 2024 19:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 966102810A3
	for <lists@lfdr.de>; Thu, 20 Jun 2024 17:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74C21B47A5;
	Thu, 20 Jun 2024 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YvwwlD9u"
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0BC1B47A0
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902801; cv=none; b=kIFDBw6BMu+qWXn7iQkVznkGO/wdLqeQDZp0WWkCAzGmZThiV94hC5eN188qgA851+Uhi1OevDxMou1l+RalbHuk8zw2U/6ZRLeW/BkPnRxcfIDbUzITprmB/dSjJkVRmHZBfahvXyAaW9ARoCVtppinLyf4pRmphPktekni808=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902801; c=relaxed/simple;
	bh=21xyG/Tm4jzQv30RYvSnvIqswIk2nOJWZBd0ffjJGoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GikLdNQQDPwMK8ywQkI1j4O4ru7E5KHH+9X2IV/eK0VgZeZ32rTdC0uEIpM3MH3D/oh4poKAYFqtkpnGU1MZwGVXXvYRb8Gn7ZkBufvQEDm2NqUifctbqJ1U1Zb/cJPvcSMwyWIIOFia6WWb7hVylVC3z/GdFaRB4FKYkbbcH0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YvwwlD9u; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=hjI0wTDUkBBZPRbe6+a++Zpyzn+dzGQGqjOLyNGvguo=; t=1718902799;
	x=1719334799; b=YvwwlD9uT5UrqyOIcZdVSIkd5jceTNv1Yucfnbjw9DpVeuXbcrRiX3HicIcco
	rdIPUWpOGsCGsfuZoW9cu+r25jssNW69idLw4NHPOtw2HQbZIWlrrcUXVF2UWobsGXNxN5ofROtys
	wS84iyNd6f/85JuqTffkLnGMqxwvrL4MHkWDRK4lSsVde9ds4lDW39NvjwEPW+jhXDMaf9Ts5bLEX
	4IpImeISzNcHpWIiDeSApudA5g6OpSeCY5kfaH30TPeXFSfXmiMCwmxh3fptKSNqOUfPxINMVgsu4
	sN+IDjreqHYXHcGtqV6EtI74+7TZkEwwZHxL7lvF7zpx8gx6tQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sKL8e-0002Xg-SO; Thu, 20 Jun 2024 18:59:56 +0200
Message-ID: <b4b3b24d-09a2-4abc-b806-47a6057caaaa@leemhuis.info>
Date: Thu, 20 Jun 2024 18:59:56 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1718902799;e530fba0;
X-HE-SMSGID: 1sKL8e-0002Xg-SO

On 20.06.24 14:57, James Bottomley wrote:
> On Thu, 2024-06-20 at 12:32 +0200, Thorsten Leemhuis wrote:
>> On 18.06.24 16:43, James Bottomley wrote:
>>> On Thu, 2024-06-13 at 10:22 +0200, Thorsten Leemhuis wrote:
>
>>> However, for obscure drivers and even some more complex
>>> dependencies, the regression sometimes isn't discovered until it
>>> gets into the hands of the wider pool of testers, often via stable.
>>>
>>> This is important, because it emphasizes that zero regressions in
>>> stable is impossible (and thus preventing backporting patches that
>>> cause regressions is also impossible) if stable is the vehicle by
>>> which some regressions are discovered.
>>
>> Of course "Zero regressions in stable is impossible" as we are
>> dealing with software. ;) And of course even with delayed backport
>> for non-urgent fixes some problems would make it through.
>>
>> But right now users testing mainline sometimes hardly have a chance
>> to test and report problems with mainline in time to prevent a
>> backport. Take Linux 6.7.2 (released 2024-01-25 23:58 UTC) with its
>> 640 changes for example, where users had only 4 days to do so, as
>> almost all of its changes had been merged for 6.8-rc1 (2024-01-21
>> 22:23 UTC). FWIW: 200 of those changes were committed to some
>> subsystem git tree during January, 363 during December, 70 during
>> November, and 7 during October.
> 
> I did make this point here:
> 
> https://lore.kernel.org/all/7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com/
> 
> That merge window fixes should be delayed.  Not because I think a
> longer soak in main would allow us to find many more bugs, simply
> because it was causing reports in the merge window that weren't handled
> because people had other things to do.  The reply was that they're
> already doing it

Only for changes picked by autosel afaics, which are delayed for a while
already, yes (not sure, I think that was in place even before the 6.7 days).

But I'm pretty sure it was not autosel that resulted in most of those
backports that went into 6.7.2 due to the lack of "patch autosel"
messags for those changes.

Those changes afaics were mainly patches with a stable tag (about 94
from a quick check) or a Fixes: tag (630); some had both. And those tags
(and not autosel) afaics were the reason for the backports.

> and when I looked, they actually started doing it for
> the 6.9 merge window (so your 6.7 example is probably out of date).

Yes, things looked differently for those releases iirc. We would need to
ask Greg why; but from what I saw it looks a lot like "Greg was on
vacation and/or busy with other stuff" that slightly mixed things up.

>>  But those are different problems.
>> And the situation regarding the first already got somewhat better
>> from what I can see -- among others afaics due to me prodding people
>> when the queue fixes for recent regression for the -next merge
>> window.
> Yes, that's why I was asking for stats on 6.9 and 6.10 where this delay
> policy was apparently in place.

v6.9.2..v6.9.3: 427 changes, all from the 6.10 merge window. From a
rough check if seems 41 of them have a stable tag and 407 a fixes tag
(some both).

6.9.3 was released on "2024-05-30  7:58 UTC", so not even four days
after 6.10-rc1 went out on "2024-05-26 22:31 UTC".

IOW: less patches then in the 6.7.2 case, but eben less time for users
to test mainline, bisect, and report regression to prevent a backport in
time.

Ciao, Thorsten (who prays he did not do something stupid while
generating those numbers)

