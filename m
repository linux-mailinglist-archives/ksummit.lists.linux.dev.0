Return-Path: <ksummit+bounces-2105-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70EAB1CD81
	for <lists@lfdr.de>; Wed,  6 Aug 2025 22:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53E40721EF8
	for <lists@lfdr.de>; Wed,  6 Aug 2025 20:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7735A21C9E5;
	Wed,  6 Aug 2025 20:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t25QNfnz"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06261D7E31
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754512583; cv=none; b=rcCdEpjZiRnfi2Q7pgoH24yyawQhZj2nI40osB11fucdY8xATAuIghH+oVYEFYwYdnoNw1z/qac2zSLhKFmVskph/twFOjf0nZQ3AlHUuyevZUB/siDjtnM2elTzhJPw/Or06dktsYkjpXV19wWlM1TcnEgCwIICUScH0Qxee5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754512583; c=relaxed/simple;
	bh=zlUzA5jUAHMovMibUcSH7j/0eZPNakGAwT4+I1mMwhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNZqqpwZYXWcf16T9/lxMotXfi7hP2xjfPYYE6eNDaCyPdZrAUcH+6ZfS92TPlBHluTm+hUdNhsO4gK0r9asyuGqpOPZzocFsbhsHU4qQRYQzV+3nrCA6WMlYTRbPEjtdcNbLzvo2isNFwFpvSkEaaDetghcXieniMeoOnwz4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t25QNfnz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78868C4CEE7;
	Wed,  6 Aug 2025 20:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754512582;
	bh=zlUzA5jUAHMovMibUcSH7j/0eZPNakGAwT4+I1mMwhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t25QNfnzrn9U1V9oUhwQOoPcLDlK6bnKKnMzeVvRsUKDLC/vWiYFqgKElbzAHETHz
	 mQPtmtfQfGYVJReTM5whb87ivoR5xr2pMgzacFewvdrgriaUMY2tjPssaSFY2j0H5D
	 wHohJgN296mhtRFsva6pOvAkB5u6FlAiian4h4VpfPgHjegywKltdGMrdtBBMSoioE
	 vBlS06eFwLAi/VT8c5T6FBbpMRGeF+vmMg/+PwokCtTKq3w725DdQwxkuZU2MEXNGK
	 8ur3eZi3tWXJCRJHai6+WJ029zf1WXNHYh9Zt98Yaz9hbzbQoMfOGjRqXUXUPg/Rfa
	 nH61sNLARDhPw==
Date: Wed, 6 Aug 2025 16:36:20 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <aJO8xMmoN0DDByCD@lappy>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
 <aJJP2BM658FYJdJv@lappy>
 <aJLUMuEhFsSxHgPM@p183>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aJLUMuEhFsSxHgPM@p183>

On Wed, Aug 06, 2025 at 07:04:02AM +0300, Alexey Dobriyan wrote:
>On Tue, Aug 05, 2025 at 02:39:20PM -0400, Sasha Levin wrote:
>> I don't think we should expect a bar for AI that is higher than the one
>> we set for humans.
>
>We absolutely should.
>
>There is a thing with computers is that they are perfect. They are so
>infinitely perfect compared to humans that anything downgrading computers
>levels of perfection to humans level of perfection must be rejected
>because it can't be scaled back and thus will be permanent loss.
>
>Would you install calculator application which you know reports wrong
>results 1% of the time?

Let's look at the last release and see :)

$ git log --oneline --no-merges -i --grep ^fixes: --grep cc:.*stable v6.15..v6.16 | wc -l
2734
$ git log --oneline --no-merges v6.15..v6.16 | wc -l
14639

So at least ~20% of the commits that go in are fixes for issues - one
can make the argument that 20% of the kernel is "broken" :)

In your calculator example, if the calculator is making an error 1% of
the time doing simple addition, I would not buy it. If it's making an
error 1% of the time in an edgecase of something I probably would never
use? Sure, I'd happily take the calculator.

>Would you uninstall calculator after realizing it has 1% bug rate?

I'm assuming we both agree that the kernel has over 1% "bug rate"
throughout all of the various usecases it's being used in, why haven't
you uninstalled it yet?

-- 
Thanks,
Sasha

