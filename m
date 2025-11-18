Return-Path: <ksummit+bounces-2626-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA4C6B674
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E0C74E8AC8
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCC22E6CCD;
	Tue, 18 Nov 2025 19:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="cwIkHT27"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D162848B2;
	Tue, 18 Nov 2025 19:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493355; cv=none; b=lP1PJU7GfC8cA69Gygy9sc5LdW5wVJhdOPqFPrx9EEAyhzBule3JPPa+kq8h7sZsjHFRlMrAun4ScilBea1qcYZnvINwKwjt7i7+aIGbqM7ajAQ08zL3W9tZlFmw3iubXeWnIeslpBi4BUgwR/zbCmaiyExPUnepYbJDk5A7aUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493355; c=relaxed/simple;
	bh=RiZdtAeAaXK7h7jsUMgBBtI3tLVMum4eEkpizdaAKYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPGxDvO7iIY0WL7PuzFCHS4n50BKfqmvnUaqisCLXsmyklTUlA9mYQAObeYDtPvYNPwrSegPPkaX9fP0GEIn0isOmgH1FlnondC2mS57ZWbvrUXttMv++Us+xiw1FsVkX00UUDk98GnXOW9r8mL2dxAJyO+JCw46Rw4QmE5vQ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=cwIkHT27; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [IPV6:2601:646:8081:9484:7ccc:663a:75c9:3b5f] ([IPv6:2601:646:8081:9484:7ccc:663a:75c9:3b5f])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5AIJFfL0993814
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 18 Nov 2025 11:15:43 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5AIJFfL0993814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025102301; t=1763493346;
	bh=YghyeYDxO/PiwVZ15tnjEfjSMuBJ4eowtONkMy5DCS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cwIkHT27gYCj67wPu5o9JQfXanpeLROWuSv/avdXEUeuzpsXHpZTXFxDVN7jStuos
	 gsC8fTWlIDyVb4qmaqT5xsM+XguiEv/8WxYKNJQq+2CHtpRD2afYhN4HQ8xILO5eYX
	 Srw+Xk2oC7MlYfAH4/ioV+NG2Pb/uKM1dqouoiQ/xKS2GaBpBlRabaPBssgtdOYMCc
	 ZiiVsEtvq9pdZpfu4I1V7EueZiG/JyGsdgJfSOQa5xzLJv3iBRzaHpzeifoYYBwx2N
	 m49rs7jK6a7oyuXurzVOgoN+F1uSq/Nz6ny5bvEKnD1ErPqEzWDN8/O2v0tk7PZ/3X
	 Bq3NkxSSBihAg==
Message-ID: <7e01e70c-4a6a-41f5-a059-1434331ecaae@zytor.com>
Date: Tue, 18 Nov 2025 11:15:35 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
To: Bart Van Assche <bvanassche@acm.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
 <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
 <82a250e0-de9e-467a-882e-7acefbfd7c24@acm.org>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <82a250e0-de9e-467a-882e-7acefbfd7c24@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-11-18 11:04, Bart Van Assche wrote:
> On 11/18/25 10:38 AM, Linus Torvalds wrote:
>> Now, we currently don't use __auto_type very much outside of macros
>> (and there we often use "typeof(x)" instead for historical compiler
>> reasons), but I suspect we probably should.  There's a patch floating
>> around that makes it more convenient with a
>>
>>     #define auto __auto_type
>>
>> because the historical C 'auto' keyword has been so completely and
>> utterly useless.
> 
> In a C++ style guide I found the following advice for type deduction:
> 
> "Use type deduction only if it makes the code clearer to readers who
> aren't familiar with the project, or if it makes the code safer. Do not
> use it merely to avoid the inconvenience of writing an explicit type."
> 
> However, I'm not sure whether this guidance also makes sense for C kernel
> code. See also
> https://google.github.io/styleguide/cppguide.html#Type_deduction
> 

The "makes code clearer or safer" seems like a good idea to me.

Notably the following constructs, mostly used in macros:

	typeof(x) _x = (x);
	typeof(z) _y = (typeof(z)) (y);

... are really quite dangerous because it is very easy to mistakenly put the
wrong variable inside the typeof().

	-hpa


