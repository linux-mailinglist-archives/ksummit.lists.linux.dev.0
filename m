Return-Path: <ksummit+bounces-2509-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AABBD5F87
	for <lists@lfdr.de>; Mon, 13 Oct 2025 21:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 959874073BB
	for <lists@lfdr.de>; Mon, 13 Oct 2025 19:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6F62D9EDF;
	Mon, 13 Oct 2025 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="U95+9Tgf"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA342D877E
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760384290; cv=none; b=lVhiYyXcWD5wniem7wBeB0H2dlkd6XHKUhYDDQAZZKpn0cHwZ2K3oiaXPsKPJFiL/8UfS29P+1n5wKSjapLpUWyZldJ52qbuLzqPv2LIYKNHI8ibjPWveTtOeHkV/VF49oe/D8lUQ0+cuqcZSDOuz6cJ6H4hc719LP+mIs7nlrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760384290; c=relaxed/simple;
	bh=lPNCayBApDatacv7OrJasty5I8QcL5SUqYQ8Ye88LEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kqHS/8J/GhCdZ3yy1ZqP/tJXF3s0Lh9qBp5WTSFrli2lzns9696k+dmMvBqVhRKETfkMKj9Qjo5QmCTwZdwQ3SAzKMlANffuZln2zKqs0uaCEWkL3fbDvzzhJWZaagLTRN9hVh8wvv3Z/rozynrTxWQfDqhTeXIWXHmnRixUfvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=fail (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=U95+9Tgf reason="signature verification failed"; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [IPV6:2601:646:8081:9484:201e:bc0f:a7c6:ca8d] ([IPv6:2601:646:8081:9484:201e:bc0f:a7c6:ca8d])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 59DJbqj61439536
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 13 Oct 2025 12:37:53 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 59DJbqj61439536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025092201; t=1760384274;
	bh=YjUaZoEYHM2jc2/Oc1+MW9y4dzKjp3GSffZYaMARZgw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U95+9TgfIKCkCqgrTj3g+0J3nnAKQGsZm/ljQe6QTQ2NL3SFIEjxqbV1X5qyGLAQg
	 HfX7D6SrMl0IGjCRtpv1xaRB9vPhrszXgJo/iRc1TjDRkX5B+/QhUrMLrrw+8zn+Go
	 LsknhpzcP37WZby2+USfotq5ZNmRYSAbbIM1qnrh/3Yy5txK1YYxxr4p5t4O24bUar
	 6/4G+lbhtRS7JgnQPTALxomRrs67EV1xyT03lT4Zw/F+ibNrIxhvzQY6+afA9YDi+Z
	 oe9OT6kXnupQ0ODY4EhilKHDSMTSDp0sUA0H1oWwsj2/fZlcKEUjlhmI2J4jY23K1k
	 b1qzUwSWz+C8Q==
Message-ID: <1b4e7a82-faf8-46ee-93ef-329f8e441b3e@zytor.com>
Date: Mon, 13 Oct 2025 12:37:47 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Steven Rostedt <rostedt@goodmis.org>,
        Doug Anderson <dianders@chromium.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home>
 <20251013175031.GJ354523@mit.edu>
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
 <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
 <55be8de371d73948bcd309caf6ec56efc8f12689.camel@HansenPartnership.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <55be8de371d73948bcd309caf6ec56efc8f12689.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-13 12:35, James Bottomley wrote:
>>
>> Because I still believe that "if you use tools, then 'b4 dig' is
>> better than *any* pointless tag that just is entirely redundant and
>> only cuts down on the available information".
> 
> I think we could possibly get the best of both worlds.  Once b4 dig
> works well enough, it should be possible to do that server side as well
> as client side, so we could get lore to do the server side stuff and
> have a lore link that produces the output taking a message-id as input
> like the link: tags do now (say https://lore.kernel.org/dig/<msgid>)
> 
> That way the tooling that uses msgid would still work (with a bit of
> tweaking) and there is a clickable link that hopefully provides more
> useful information.
> 

See my other reply. This might work *strictly* in a Linux kernel context, but
the goal should be git-universal tooling, and the Message-ID simply does not
contain enough information.

	-hpa


