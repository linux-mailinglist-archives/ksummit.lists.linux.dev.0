Return-Path: <ksummit+bounces-2238-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CCEB3B694
	for <lists@lfdr.de>; Fri, 29 Aug 2025 11:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C358E7AD636
	for <lists@lfdr.de>; Fri, 29 Aug 2025 08:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8F82E3713;
	Fri, 29 Aug 2025 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTUJTYG6"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906192E36E8
	for <ksummit@lists.linux.dev>; Fri, 29 Aug 2025 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458046; cv=none; b=mktSZqYOIHzo+YcjLnDEw3bJsxjZ+FskSlTK8Mx2qdSL3Pq+8nC850ILoIe4nA7/DKeMf0CHidmAJ9cwNToX6e1+YeoWg1M4ivzSJgjUxKjvi2ZNnLVf4HBx7dAYHg9UMnTH/pD1Kj1+c82bVA0XqzWOpvtyBa1gm1/ozqzxmU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458046; c=relaxed/simple;
	bh=YkLgKeR0ud23g0kwm1nGP78rzqmDSGjPuAQVOSsswUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBgxDj02iK600oK0SOVV4yoL9dXVdolIw7s3/1JilDYOFOq7w664MThjIJBUUXb8tJw2b83gCCfK+Rk4p5LzGOf8RkSS9X1MzbcmJxgPDOxkJpl4q+KnfJjdL/7A8N7u6PXDTG0BnSBvdvHNmatPUfY5zM8FhqD/j+er9TXHPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTUJTYG6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F36FC4CEF0;
	Fri, 29 Aug 2025 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458046;
	bh=YkLgKeR0ud23g0kwm1nGP78rzqmDSGjPuAQVOSsswUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pTUJTYG6IpK5yUq/vwhUYCuAYK/dS36NzbswmfKzTU5nFYTu0Zgqvac72tYGO7peL
	 w9z1DxtcN2NUweB7BkvGCaqqP4f2Ktn7Vx8OR4abBRx03AA9NOW41GVyGfxig+muB6
	 W6BuMwW7XtqsHVcgabvgU6RoxZzhYZmn/fI8/4XEnvjxjFR7VuAnh+8YDEBqd1rx1r
	 a0czcCoLvasIO/mtGUkw0tdlqjQ+YipL0U8yn3uyBAeG3kUCPR3yFT+hs13pIkqR12
	 9tgXKzf4RuwPOjvpwb5v5oMpLsC5a1jPGSIna2C0jdOiZFxr7PCrIpPqKROZtoUL1G
	 diEpQVwcEIMwA==
Message-ID: <1fa9e347-99c8-4548-816e-ccef0e51999c@kernel.org>
Date: Fri, 29 Aug 2025 11:00:43 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: ksummit@lists.linux.dev
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
 <CACMJSet5r0PDFsYRcNWKQH_jfimqpQWZ2nL2YKoc-+QisNNykA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CACMJSet5r0PDFsYRcNWKQH_jfimqpQWZ2nL2YKoc-+QisNNykA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2025 16:47, Bartosz Golaszewski wrote:
> On Tue, 26 Aug 2025 at 22:12, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Tue, 26 Aug 2025 at 12:58, Bartosz Golaszewski
>> <bartosz.golaszewski@linaro.org> wrote:
>>>
> 
> [snip]
> 
>>> 4. Make build bots detect it.
>>
>> Fine, but doesn't solve anything.
>>
> 
> How so? The developer gets an email telling them they used a legacy
> API, the maintainer sees a build bot report and knows to ignore the
> patch. That's already better than what we (don't) have currently.

I think build-time warnings or emails from LKP about using deprecated
API do solve the problem, in the very long term. Why? We do remove old
platforms, so even if we do not convert in-tree users from deprecated
API, these warnings would reduce amount of new code coming to the
kernel. Eventually at some point we just drop old architectures, old
platforms or drivers and that might be the last user of the deprecated API.


> 
>>> I would like to propose a discussion on how to enforce API deprecation
>>> in a way that supports efforts to reduce technical debt, without being
>>> hampered by developers and maintainers who mean no harm but simply
>>> don’t know any better.
>>
>> Here's the only thing that works: if you change the API, you have to
>> fix up all existing users.
>>
>> If you are not willing to fix up all existing users, and you introduce
>> a parallel API, then you are the one that maintains both the old and
>> the new API forever.

Sure, I don't think anyone questions that part. So imagine we maintain
both APIs, but we do not want the old one to grow?

>>
>> Or at least until somebody else did the work that you weren't willing to do.
>>
> 
> That sounds great in theory but in practice, one may be willing to do
> the work and it will still take years (as is the case with GPIO) where
> there were thousands of calls to the legacy API and - due to the
> nature of the differences between the old and new one - the
> conversions are far from trivial.
> 
> I'm not advocating a policy change, I'm trying to bring up the subject
> of making the effort easier for those who participate in the tree-wide
> refactoring.

How about sparse attributes for the old API as deprecated and in the
same time all existing users as "ignore-that-sparse-warning"? We already
have a few drivers doing:
	#ifdef __CHECKER__
to avoid many false positives (e.g. handling inlines). Also few for
skipping locking (drivers/scsi/qla2xxx/qla_nx.c), but this feels rather
like anti-pattern.

We also have cases of:
	#ifdef CONFIG_CC_IS_GCC
	#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
	#endif


Best regards,
Krzysztof

