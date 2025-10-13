Return-Path: <ksummit+bounces-2508-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D72BD5F66
	for <lists@lfdr.de>; Mon, 13 Oct 2025 21:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C403BA7B1
	for <lists@lfdr.de>; Mon, 13 Oct 2025 19:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB472C21E8;
	Mon, 13 Oct 2025 19:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="a1K59qDx"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57428285C84
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760384185; cv=none; b=sd0MKewy3avdgU1QWF6Q6iUubZBBnXCjYIzw+IZOOHvvOeTWTLzgpk6btcnUuxqM/sVBVr1fRXVCl7SCmh5pqjrVadh/2KnkZcEkayhPkGcxqWEHwjGoOHR4OgBjFGykRrG9Rmg37lm+/SQsXdIhVJjYCY4mRl4W28tRSwReM+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760384185; c=relaxed/simple;
	bh=oVuzmLmc5stGDoMGXHSFjhNgpZtUAmp/I70jog/+pls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qf3efLs6bDgwfke1eQTO6nN3xE7qwzyDdou9FH48lBNxM/93yc0AfSx2JvTilV2pJvX+MaszjEcU8mvjZtQp/NveTb/u5ajzUCmOxO+uDrsxNbEsyI6HCi+trLyb+hRehZd1jRl2IMB52+hqjFH+Vnrhxr0cySEQf7Ba286kKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=fail (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=a1K59qDx reason="signature verification failed"; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [IPV6:2601:646:8081:9484:201e:bc0f:a7c6:ca8d] ([IPv6:2601:646:8081:9484:201e:bc0f:a7c6:ca8d])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 59DJaIVE1439393
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 13 Oct 2025 12:36:18 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 59DJaIVE1439393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025092201; t=1760384179;
	bh=u3YcXghwZQJJ9c8uOF03nviutGIQJoEAwSWWcds+noo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a1K59qDxNUYKDPtrhAPUIa1E5FFMge+fPbuhKkDgnYZDxoOBWIFu5WEpwlgqTZaT3
	 JfVkEzJ8U/SJuVyuE49Hdp3854h12s9fTe3A7zJbgUfda/0Q3TcZM4/AGWtmQHX8Js
	 HD7E5stf83hh498i6c30aZ3CPYASeGizTl10PW+Cj0I0UXs2z3BunF0JEiGAuNA8tE
	 hK88iT+TM5HsTrDh4+c8xa2NQVytlUlD2T2o+yrqa67FdtKzjmtXOECgz6BwNrrBsM
	 k2BVrZwDOrcxMM9cV90mFL1vtea16DFWJGseWdTga3wkzXcJsRp6UXFrr4owLuKhUk
	 0N0X4PGd7vbeg==
Message-ID: <aaae3f22-ae59-4005-8f9e-a9823f05d0b7@zytor.com>
Date: Mon, 13 Oct 2025 12:36:13 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Steven Rostedt <rostedt@goodmis.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Doug Anderson <dianders@chromium.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home>
 <20251013175031.GJ354523@mit.edu>
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
 <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-13 12:20, Linus Torvalds wrote:
> On Mon, 13 Oct 2025 at 12:07, H. Peter Anvin <hpa@zytor.com> wrote:
>>
>> This was the *original* definition that I proposed, which was vetoed by Linus because it didn't provide a clickable experience.
> 
> Yeah., I still don't believe that Message-ID is any better than a link.
> 
> And the only believable argument *for* this all is the "one-click experience".
> 
> Because I still believe that "if you use tools, then 'b4 dig' is
> better than *any* pointless tag that just is entirely redundant and
> only cuts down on the available information".
> 
> So the one-click argument actually resonates with me, even if that is
> very obviously not the workflow I use. At least I *understand* that
> argument.
> 
> All the other arguments seem just disingenuous in that they literally
> give less useful information than "b4 dig" does.
> 
> "more noise for less information" is not a good argument in my book.
> 

And I very much agree with you -- see my other reply.

	-hpa


