Return-Path: <ksummit+bounces-2054-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827CB1B98C
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45D1117588C
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC09323C8A4;
	Tue,  5 Aug 2025 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZBV6Dwn"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676601F8EEC
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754415783; cv=none; b=u71U5bV4+i0+HH95NpTOM7Bil9X6dUo6nxlqER2VcqUGt/jhH4PxblcWwwquJkUFsD9mXqEZBD5VVoW8rSsvp3na0m4mnSrQE2WZJWSO+pQlRcKiM7pUmY1i3TIwxe+bRniJnRlKKBCmos3hGaM6jUtOGI0wO3+P7ydl9A/iZ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754415783; c=relaxed/simple;
	bh=RNyF3c1cHOcdXzrTgmjBjPhzlReDWmRjmVh+QqYDyCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qh5IRmcUzSq//YpmytsV2DXdAr5Q8iRy9unsNidBNTugMiVeYzMv7uBJjlqpmbvfNQhvqaqQiucGOTtx0Bg9i8FlcRTURo/ktmd79TYXHwDGjluVxx4BrGBZSM/aEgAJSLruJxRd5AWrk++mUa+gbJuc4JWmwoBp/tny2/WEHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZBV6Dwn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8744C4CEF0;
	Tue,  5 Aug 2025 17:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754415783;
	bh=RNyF3c1cHOcdXzrTgmjBjPhzlReDWmRjmVh+QqYDyCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZBV6Dwnamj8SDeHuLMmPsFnOi7Gk9Au8n0KsZ0bEhRw7rEiSP41zLTxokZV7/eq4
	 OWD0hl19pIvXBJHMa7VKxliiLMmLlMUOy87SYUgPXMnOYyuWrfgArfIngih77NP9/Z
	 QACMMFO/OjN6V1h3F/cHWvipR6F3zDstb8NoBXpH6tMqXOKVKeeyeiBhuhGmNW8mgb
	 pJpDlfmrijiVo3pfuFbUbScmJP92O6ok/wxacZUKLgB6t6KdzgCwT7yUeWeFBO7prg
	 mb0B0tfmsy/wHp4wYxmF4+95DxbJ8TwKMEDIx1WFDA6mLSlOHrpgPKXCjWq5Muo23j
	 wPbqpPiPK9ZSQ==
Date: Tue, 5 Aug 2025 13:43:00 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mark Brown <broonie@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <aJJCpFPuhIy_BKFa@lappy>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <ad8ea0a6-ca53-47f8-92ec-17e970184019@sirena.org.uk>
 <e9902e53cd5c8ad444d6c62942e790b7ba5d756a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e9902e53cd5c8ad444d6c62942e790b7ba5d756a.camel@HansenPartnership.com>

On Tue, Aug 05, 2025 at 01:23:18PM -0400, James Bottomley wrote:
>On Tue, 2025-08-05 at 18:11 +0100, Mark Brown wrote:
>> On Tue, Aug 05, 2025 at 12:43:38PM -0400, James Bottomley wrote:
>> > On Tue, 2025-08-05 at 17:03 +0100, Lorenzo Stoakes wrote:
>>
>> > > * On the other hand, there are use cases which are useful - test
>> > > data/code generation, summarisation, smart auto-complete - so
>> > > it'd perhaps be foolish to entirely dismiss AI.
>>
>> > Patch backporting is another such nice use.
>>
>> Patch backporting sounds pretty scary to me, it's the sort of thing
>> where extra context that needs to be accounted for is very likely to
>> come up (eg, assumptions you can make about existing state or
>> santisation).
>
>If you think about it, the git history contains the exact patch path
>between where the patch was applied and where you want to apply it.
>That's a finite data set which LLMs can be trained to work nicely with.

Most of the patches that fail to backport and get a "FAILED:" mail as a
result are really just either a trivial context conflict ar a missing
dependency.

Resolving those is within the realm of a "junior engineer" which I
suspect AI would tackle fairly well.

The other ~10-20% are indeed something more complex due to things like a
major rewrite/refactor/etc of a subsystem, where I wouldn't trust the
current state of the art AI to tackle. But mayble a few years from now?

-- 
Thanks,
Sasha

