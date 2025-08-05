Return-Path: <ksummit+bounces-2070-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDB6B1BA54
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EEBC7A1FFF
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1451C2989BF;
	Tue,  5 Aug 2025 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqBs+Sm+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C374295529
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754419163; cv=none; b=Wa4HRGmtmVISM+s5hG3i34xY7UnujI5Xuj/LsfUnh4VSH5CgI/QDfWnwn2KuxexkwDKRIh9lbwdaAaLGtLiMt5bAaiRMhdSYy80vxhrQL0G+mY1eS0XMCyEHMaJBjJURuhSmtJIR2ePtBEZJ3dW4lA2b2GumQQaG6Buv2wfk7ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754419163; c=relaxed/simple;
	bh=DmesYVe8MUtPTzFAH7BJGYpC1OKVeuoVcZPBoumItHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQmda8pUz2uE3FfHP87nORiA1THgXU88UOk9ddPdNw2ic0CUmi24TZ4FIMh+o8m2L8bw5ZKZMGCC0hGJgBG2c2QR6ASYHD19FAFMnY8NO37f0T8eIU+tuJwMq0rKdihRtcA8gqNbzfOOe5nqorKUo96FHgSiM/qUmudYdKM6SsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqBs+Sm+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9461C4CEF0;
	Tue,  5 Aug 2025 18:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754419163;
	bh=DmesYVe8MUtPTzFAH7BJGYpC1OKVeuoVcZPBoumItHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqBs+Sm+FeFh8P+wKgWnWnn9bZt7fdMXcSbNqxeyggKtgksVTTxXOJt7IUTmPSebB
	 s3oRQ8ENkErQHc6sdx5kL1OtlPIE6ByTGEnbmjNpWC3Y7iboOB1emo4EBU+6s/r4mU
	 CPe79bDzgnq+3CqPy4W/geBLQGeyG+WOBaZDkTjTLiplthtp5S5myJ65zLvj2fH9K0
	 8PsssuXbkgcm/yj6gDP9dc9BA8dSpNECvoJ1m8CkZeZXMnooot2UDC++PjsFaG2syc
	 oKLh++IDMw9DYHsTdLqU/w8eUfareUaZTdfgKvXy9PmaacV6AZaVxcfja5paKCw1fw
	 cmNiM4lBOIRoA==
Date: Tue, 5 Aug 2025 14:39:20 -0400
From: Sasha Levin <sashal@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <aJJP2BM658FYJdJv@lappy>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>

On Tue, Aug 05, 2025 at 06:55:29PM +0100, Lorenzo Stoakes wrote:
>On Tue, Aug 05, 2025 at 12:43:38PM -0400, James Bottomley wrote:
>> I think that's really overlooking the fact that if properly trained (a
>> somewhat big *if* depending on the model) AI should be very good at
>> writing safe code in unsafe languages.  However it takes C specific
>
>I fundamentally disagree.
>
>The consequences of even extremely small mistakes can be very serious in C,
>as the language does little to nothing for you.
>
>No matter how much data it absorbs it cannot span the entire space of all
>possible programs or even anywhere close.

Neither can a human :)

I think that this is where we see things differently: I don't think that
AI needs to be perfect, I just want it to be at the same lever (or
better) than a human.

Humans aren't great at writing C code. There's a reason we're looking at
using Rust for the kernel, and there's a reason that LTS trees exist -
they're living evidence of just how many mistakes humans make.

Look at the contents of LTS trees or the CVEs that get assigned: most of
them are fairly simple memory safety issues, off-by-one, use-after-free,
etc...

I don't think we should expect a bar for AI that is higher than the one
we set for humans.

-- 
Thanks,
Sasha

