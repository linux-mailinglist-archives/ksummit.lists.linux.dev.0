Return-Path: <ksummit+bounces-1331-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0D2910180
	for <lists@lfdr.de>; Thu, 20 Jun 2024 12:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28191B2173A
	for <lists@lfdr.de>; Thu, 20 Jun 2024 10:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C931A8C3B;
	Thu, 20 Jun 2024 10:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="rUthm8tq"
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF12594
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718879577; cv=none; b=cg4q/VRQXRiceehVhhMRtGoIyoRJtDIQSE/qcIld3qORU5SmZz4TUJhUKpqlFC5zkf3vNDpE1DemZx7caxppraD5OjHFD+6zlZKIUSKa5ae6hl+LWYXSuaw4SBOxOZoJrvx3KzITIALqvOAIYfiRaRpNC4VAGnGMSNQDE62ECXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718879577; c=relaxed/simple;
	bh=wiQIrmCM8wkRhdyOPRYExABGoBhLB7vWhDLBUx38i/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iyqm2qix2v1i+aEWShDbhhtK9ow+wZa7qKhol672tEwTsvTb2g//hFrQJfwPgIt0h0+4WjgIFD9gRMvnQ6ObZweXZHpfwTb70F/pkBcCjXzltnoDi8OTCncvSacEJgzcM9k9smXkTVuilumy55WsdCZrBuWjxEzmGgs+QIcL+Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=rUthm8tq; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=SZ4zIO0Wnqwzfn2s91TO2o3K+OKD0EDWC5Nd0dnE0nY=; t=1718879574;
	x=1719311574; b=rUthm8tqsG40Snb6cHsYzs1XxLD7UBNI+NUjZA0SvDWrXK0hLUt6qr14jm6Wo
	/OuP9UOKbqzAy5lt2xPUChQpoogNwr/kJZH/ZOiMX0YAedyjP2mPlofizEEDvDB0kiozLaRjRYdWD
	kP1BYqQf5j2SQ3+Ic9M+hy6DLxL81qfH0aGcNKqgi4oJSLZh9nDSGO9PgSEpZFv2tNGupuBlDgIxl
	ywkNYgojDxooDB2hWZIrwu0shGgClUIQjLBOShQtB9eRStaMWGl+CY57ZPO6/7T+w58yrNZh0MCtN
	OG/xe9HugNzmnhzQimoYnrHDKcH2ftyqADRqls+cuf9M2TR9sQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sKF63-0006Xr-UA; Thu, 20 Jun 2024 12:32:51 +0200
Message-ID: <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
Date: Thu, 20 Jun 2024 12:32:51 +0200
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
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1718879574;986f8c74;
X-HE-SMSGID: 1sKF63-0006Xr-UA

On 18.06.24 16:43, James Bottomley wrote:
> On Thu, 2024-06-13 at 10:22 +0200, Thorsten Leemhuis wrote:
>> Lo! I prepared four proposals for the maintainers summit regarding
>> regressions I'll send in reply to this mail. They are somewhat
>> related and address different aspects of one scenario I see
>> frequently in different variations; so instead of repeating that
>> scenario in slightly modified form in each of the proposals, I'm
>> putting it out here once:
> 
> I think you're missing a piece here about how we actually find
> regressions.  A lot, it is true, come from test suites running on the
> mainline.

Sure.

> However, for obscure drivers and even some more complex
> dependencies, the regression sometimes isn't discovered until it gets
> into the hands of the wider pool of testers, often via stable.
> 
> This is important, because it emphasizes that zero regressions in
> stable is impossible (and thus preventing backporting patches that
> cause regressions is also impossible) if stable is the vehicle by which
> some regressions are discovered.

Of course "Zero regressions in stable is impossible" as we are dealing
with software. ;) And of course even with delayed backport for
non-urgent fixes some problems would make it through.

But right now users testing mainline sometimes hardly have a chance to
test and report problems with mainline in time to prevent a backport.
Take Linux 6.7.2 (released 2024-01-25 23:58 UTC) with its 640 changes
for example, where users had only 4 days to do so, as almost all of its
changes had been merged for 6.8-rc1 (2024-01-21 22:23 UTC). FWIW: 200 of
those changes were committed to some subsystem git tree during January,
363 during December, 70 during November, and 7 during October.

So if those 440 fixes could wait some time to be mainlined and were not
important enough to get into 6.7 (2024-01-07 20:29 UTC) in the first
place, why the rush backporting them to 6.7.y so quickly after the merge
window?

All that leads to the related question "How many of those changes maybe
should have gone into 6.7?". And maybe even "Should we somehow try to
motivate more people to try -next?". But those are different problems.
And the situation regarding the first already got somewhat better from
what I can see -- among others afaics due to me prodding people when the
queue fixes for recent regression for the -next merge window.

>  Plus it also means that a backport
> delay or cadence would actually delay discovery of some regressions
> because the patches that cause them won't be seen by the configs that
> run into them until they get put into stable.

And why is that a problem?

> [...]
> 
> The other thing I think would help is better tooling and advice to help
> reporters find regressions in stable.  What we do a lot upstream is ask
> if they can reproduce it in mainline.  However, not everyone is
> equipped to test out mainline kernels, so we could do with helping them
> bisect it in stable

FWIW Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst /
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html
covers this: users that notice a regression in a stable tree will bisect
that tree. But before...

> (note this can be time dependent: older stable
> trees more naturally give rise to the question "has this been fixed
> upstream" making mainline testing more of an imperative).

...it does so, but tells users to try mainline for two reasons:
* It might be fixed there already.
* When Greg receives a regression report for stable he'll usually ask
"is mainline also affected" anyway to figure out if this is something he
or somebody else has to look into. And some of the mainline developer
will ask this, too.

Ciao, Thorsten

