Return-Path: <ksummit+bounces-2498-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10170BD3E61
	for <lists@lfdr.de>; Mon, 13 Oct 2025 17:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 85C614FE68B
	for <lists@lfdr.de>; Mon, 13 Oct 2025 15:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A00309EF7;
	Mon, 13 Oct 2025 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5gfpMa5"
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ABB24A06A
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367130; cv=none; b=nUOV+j6nYj5aEHtfLLmKDr1rz/asRb+XfWmttXEeshxEycnFZzxDG1i0AIOJIk+7zM1J1TQp+CCVIeIu4WmS7kexh5/pKLNegYkvmEi2kRGO45D6DEt2lVDqLj/Gycjo1rXgCfJRRMwyd44Pwn/HfMc49AyJF1BnQ5pcNl63cco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367130; c=relaxed/simple;
	bh=Y6ZoTQD5IuTv1mElbopD0KJ6sSKFwKrG3ZER62OcxsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ffg1U7AwpSsBR5ca9IrEQGyw4Ze3JAUJh/0iqYKJ9VrGzk6jSjOw4n08r/8b5232wP11Y+blYXTAYp4aV+ZW/hmlbLLZnXWvyORIYkLMeq7mdHlvUGnc0OTxatZyNHQMCRrHu1ADVE61HNGOsIl7qrb+f7z48eeKRedWHQEwsaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5gfpMa5; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b57bf560703so2766966a12.2
        for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760367128; x=1760971928; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eL2zS7jv33DJE6YJZ1C/GduxaEOatq8Q74xgfzBnDZM=;
        b=J5gfpMa5c7D+PW2qA5aycnoLENkFzAntqIr4lWGgkohZBQATO9JPl2hHBnnBU6jDdC
         8WgQPJmEWjQxCB6Jah8X1Od5X7MhYErxgHkxG21NXLt8M3/SqAOqGUr6y8SbWAtjC+Ar
         y/uf2v+pGgQtTHSDbbaJHozLG7Cl0EGzGqXGs37tsoYRdO4UEvJGjdbPqGgAH5KoOyUc
         h6heQofO75fvLo2pYXoPdakABAcebnokUWhj8pGJiEDN0QNXcSz0jc9NuL6JH6osNAaA
         wLYdnFqTQw2bvAjIx6HiDUc/yXyEr0RmCWuByZdN28wTuFVKNECiDkAUbjGpySO7SqlY
         liqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367128; x=1760971928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eL2zS7jv33DJE6YJZ1C/GduxaEOatq8Q74xgfzBnDZM=;
        b=iBfQM+YuQwgf0qGtMbSu8Qqj1lD2Vs6yUZZ6a3vGT6niUiO/GvH4FOFEecgKqGDvrC
         EwYMosFFd1SwVoaP4UtIWQwaDihOGJ+2NzxKHVc1bVmDPSfSg1Z7kinbhMAyHSPz9f5F
         FG8dcKV/Avyk1SyworfpEWXDheIWqt/opaQiiImGSHlhzDoHW4NlmEgiUft0A73GeSLY
         /Wcz9b7vSvPfDFK6kl0sLQiuT551K6QSdNZ3+2KwCHh1zxRfpxmD1ZzP4KXFdYBNhm2E
         P17XNsKeSTKoGK5m+e9O3jkbc2JvJFgNH1F9SUvNCbo2fNFXGJWmJAFzfRKtqp+aLiti
         h2qA==
X-Forwarded-Encrypted: i=1; AJvYcCWJXosFW4kzQaIJnSiwGD1eCA3m01sW4rG6fecUkN1s6b6SB9kdRm06NtBVRDYWY5ajcsiChJlk@lists.linux.dev
X-Gm-Message-State: AOJu0YwB5za+apxwXdrwP4suysWRXnsancZBMBZWet5DhrUn951yCcqI
	Z+u5ewlVaDgm1W2WywZ66mdIqJMFZfh758U+TRR1KxHGQZse2WaNwVzp
X-Gm-Gg: ASbGncsT+NrJSL8TpSBc8P0MZr3b+cXP9hhkPWq9aGMPjiToZWEPZzJidFMxnYHHJkr
	byUAtPDyTgkngfaEFpN7MizVO2EIOUNkq2mtCdNTfXt1V88iyIrCFsFzBUGL1elVCrBe6cw16Nk
	X0Kscc+sfPUcF2A8U8BHV5VgTDqPT3h14sbzC9TUkoGkmjY5292JZs/pTnSrAh405VDQfcv6W1I
	gYlwIs66ZZ7dT7qp+gi75VMxs4iBI7crfOwGPVKnxjeHkyLVPWk5ZdLUXGPObAwtABvRgjQn0ph
	wlsFYxDoraMZSB9rAoQRmn1Tm3Gq7TcFF7euB0sj5L9hEqlrTdIi5m01lVhRCvSL8LRgQJoCTyA
	ySx1piefqtWFPZS1Vet4qhF1v8usWQRj6rCjLqEvN/p+LYPkOfQQedutwvOxox+NCCyGsI3Xm7G
	Z3/AIfZi0T9LUm8Q==
X-Google-Smtp-Source: AGHT+IHOWYkGWIGoQgbiKUpR/1b6rF5ZXuTQzjg+0Do37ObAm2udMUeMRhy2GdI9VTqYlZXk1WwQ7A==
X-Received: by 2002:a17:903:1ac8:b0:269:4759:904b with SMTP id d9443c01a7336-2902741e435mr247206215ad.58.1760367128149;
        Mon, 13 Oct 2025 07:52:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f56c0fsm136710445ad.104.2025.10.13.07.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:52:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <25785f67-a31c-4db8-8d6c-bb9f061c5d43@roeck-us.net>
Date: Mon, 13 Oct 2025 07:52:06 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 05:25, Mathieu Desnoyers wrote:
> On 2025-10-13 07:53, James Bottomley wrote:
>> There has been a lot of discussion on the tooling list about how the
>> loss of link trailers has updated both tooling and triaging issues.
>> Konstantin has proposed a tool to get around this, but while that's in
>> development, I propose a discussion about making Link (or some
>> alternative tag) into the pointer that would work for everyone.
> 
> AFAIU. this use of Link trailer is used as a strategy to work around
> the lack of unique identifier in patch commit messages that identifies
> multiple revisions of a patch, for tracking by patch review tooling
> and facilitate digging through patch history.
> 
> I think it's important to spell out the problem this is trying to
> solve from the get go.
> 
> Based on prior email discussions I've seen, I don't think Linus is
> convinced that tagging commits with a unique identifier brings value,
> whereas people actively developing and using tools based on a
> workflow that relies on patch revision tracking see a lot of value
> in this.
> 
> Putting this in context may help listing the possible solutions that
> go beyond links and evaluate the best solution. For instance, gerrit
> uses change id tags such as:
> 
> Change-Id: I9bfbee7a3219c3f293cee2bafce7233ec34d3e84
> 
> to track the various revisions of a patch. Unlike "Link" tags, it is
> clear that it's only meant to be a unique identifier for the various
> revisions of a patch, and it's not meant to be used as a link.
> 

It also does not (necessarily) track patch revisions, and I would find
it confusing if it did. Gerrit supports tracking patch revisions. That
mechanism that would be defeated if a new revision would get a new
Change-Id.

Guenter


