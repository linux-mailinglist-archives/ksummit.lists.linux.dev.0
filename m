Return-Path: <ksummit+bounces-1583-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71CC9A70E4
	for <lists@lfdr.de>; Mon, 21 Oct 2024 19:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62BE2281B53
	for <lists@lfdr.de>; Mon, 21 Oct 2024 17:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523FE1EBA1E;
	Mon, 21 Oct 2024 17:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhLATNHG"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEA81E9077;
	Mon, 21 Oct 2024 17:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729531122; cv=none; b=YBR59akbym10yR7Ah4B5wxQYHSAjB/gFMwhHAZSRwZxLdKM1+k94YD03YN44/o//pu9MaVCKwTT7MdgKftLo2maaiWI4wUtSOS5ahh/0+4Z2eORUZ6kVq9yeHk/YvXgfVelewf4kQmat5nfqVUaxawMKp2HeyHGy7zsKjcqFURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729531122; c=relaxed/simple;
	bh=iEW2Xt3WKhnH9cPRI2vcWhHXam6tOqb0R0Yv4gMNRKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5bvpvEi2HNkoF64FkUET03yTVLpxLbjdAF/dJSmfqLB5fp7giL/2QvAS55oes5r9yE0+my80IqO0URT+GxzE8d6uNFCxrJjVxYKtVccSmiS4t7tjZYx1KCjNRJMlPe8Qp+f+v45A01FkMlHL9G1x9/xlwvlv/fZh2L9hmhaA3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhLATNHG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3097AC4CEC3;
	Mon, 21 Oct 2024 17:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729531122;
	bh=iEW2Xt3WKhnH9cPRI2vcWhHXam6tOqb0R0Yv4gMNRKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hhLATNHGiGY1o8l1lzGTfiW0dVhXgdpV9p/siFokuBOWLxHUtXRm1GeFhKRoqaCKa
	 p4PM76BCGqknIrjwugK9GTrelBzfuj+3Z9IcwFy/ZHyZFdalVh6PEkeQQpvuPi1Fwa
	 PUURuoco48YS4cI/PRMQeXYAQka4MyCfx7MlzPpFvHs/wXmDcdOA4M/jUnQPLrvaVP
	 XgYs21/3pJ+V0Ktz7XbKGj+s4noQdPFC7qCwgha5D2fYESrWj0eGbKPR8f0kskPcDt
	 CrL9Yr1Gc4uzueSlHXb1tuRpRROvslFLbULDJNab5NaER1n4RQOJdPZJg7NT8/MCQq
	 +paNZ9nx4TO4g==
Message-ID: <e7bc3cfe-f7c0-4d8b-b89d-a2f260d34a76@kernel.org>
Date: Mon, 21 Oct 2024 19:18:38 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: linus-next: improving functional testing for to-be-merged pull
 requests
Content-Language: en-GB
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org
References: <ZxZ8MStt4e8JXeJb@sashalap>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <ZxZ8MStt4e8JXeJb@sashalap>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sasha,

On 21/10/2024 18:07, Sasha Levin wrote:

(...)

> In an attempt to address the concerns, we're trying out a new "linus-next"
> tree is being created and maintained with the following characteristics:
> 
>     1. Composed of pull requests sent directly to Linus
> 
>     2. Contains branches destined for imminent inclusion by Linus
> 
>     3. Higher code quality expectation (these are pull requests that
>     maintainers expect Linus to pull)

That's a good idea! Thank you for putting this in place!

If you don't mind, I have some questions below.

>     4. Continuous tree (not daily tags like in linux-next),
>     facilitating easier bisection

What will happen when a pull request is rejected?

(...)

> We also want to avoid altering the existing workflow. In particular:
> 
>     1. No increase in latency. If anything, the expectation is that
>     the cadence of merges would be improved given that Linus will
>     need to do less builds and tests.
> 
>     2. Require "sign up" for the tree like linux-next does. Instead,
>     pull requests are monitored and grabbed directly from the
>     mailing list.

Out of curiosity: is it done automatically? Will it email someone when a
conflict is found?

(...)

> Current testing:
>   - LKFT: https://qa-reports.linaro.org/lkft/sashal-linus-next/
>   - KernelCI: https://t.ly/KEW7F

That's great to have more tests being executed! Who is going to monitor
the results? This task can quickly take time if this person also has to
check for false positives and flaky tests.

Are the maintainers supposed to regularly monitor the results for the
tests they are responsible for? Or will they be (automatically?) emailed
when there is a regression?

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.


