Return-Path: <ksummit+bounces-1627-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8159AD391
	for <lists@lfdr.de>; Wed, 23 Oct 2024 20:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CEFE28577D
	for <lists@lfdr.de>; Wed, 23 Oct 2024 18:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325CB1D0B82;
	Wed, 23 Oct 2024 18:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VliEQZDg"
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4831D07B8
	for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 18:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729706753; cv=none; b=NDxbIoqqav8Ah+fd6pjelQi69PQkEtVkRe8ZsBTf10msNpOA7xmQkzI7NxvRPT1ls2XtEUMLiuvCXGoGAhsnT+YinXnUKeZahT42Wv/dA6ZT4MVryvj/PwYi4acUbZfiprL3HT+2ArixhsPNZww3lAzrSEaSz8Fz7pnEVahl+fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729706753; c=relaxed/simple;
	bh=iv81/gVlU3Pwcme0jCF07sIMduMsxx8TzcbF+GONcI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSDIZXQI0RVch8uEblM0OWpwumlEZxS668k8Oh+xGZb4jz6VncM3m08ZJHuRtdwoKwc7AxqFpqb6RdHuoNZ11+cqUgazoydS86NPeP/QRFP6jTtNklDzQAunaft24O0VYjKXi5Nm5t7nXimZIsYvPAW7XOt1Amc+WkA3UHJ0qmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VliEQZDg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e5130832aso84462b3a.0
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 11:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729706751; x=1730311551; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Pguu9bHtWeV4r7UU0Od61TvXafrRUvz/ojusml9TlXo=;
        b=VliEQZDgu4G6c4XCZ2CbLVco9cWu0f8VOu/xWKA5soKV3UaDPZFXe7Y7T/NR5NayR4
         xlfGM6BE3PFfwOnr0KDufIgj1i7lfY0O+Erom22blKI9aGmP6wyH1fIeQHo/NyZvn5Vc
         1g0auQA3gGUUEOrvuWsbpM/3DAOrVhV4qQSQlM/B09fYlJJIzoONhQmMc8YmMDBLG1iK
         t5X7XNa+8mYYU85CGzf+tFa1QdFXk1vWXnJ+hnIT6YsuRUyVTH6Z2ttqcmHCUX+yK3Qk
         dUYHSIOg/bs5PK0030uSI/h02zq/jL+1NtuItaYt2fMnB3vCBiofQPfb8gJpMksOJIpi
         2lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729706751; x=1730311551;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pguu9bHtWeV4r7UU0Od61TvXafrRUvz/ojusml9TlXo=;
        b=trnA++3t9IqfS3rNZBU5XKFwcSItXPer1nP7qTNpWivypae4Hn7yM0hphkXTVWAexK
         huAY7MResrP9ZuvgLjqP6qgrjqfyDOl+fXIVucDnvA/3+hMbnQRD6OXxeNuKaVw/3BgO
         D3JaRpke+6L0VTLwgkymHkHgz9yy6HCTGOjbkFCW42+TL+dcEKWIWYX7fdoxk9PHBSrD
         6qW1fmoxda1XvfMUf52zHTqCn6HMloGeD/781VAr2ZXDjc9rmzYJoIRdxEwu0QAhdu92
         NMzyUIUIH4sKS1ZBFE34GhaS49iQJNMOSFDxBYk7O0jeYwOKk891YNjn6cfa4D68MYQ6
         Jamw==
X-Forwarded-Encrypted: i=1; AJvYcCWLcFH8oJ2S/EA5hj6UR6xDEGj9ZP7UEwaMjo1jh+jf9CzdWpAA2kFDG9CaivmgCgPhGBihnJoM@lists.linux.dev
X-Gm-Message-State: AOJu0YxU3JjPPahc4llMgts+qI419hMvg5Jpk1plmPfeoPJOppOHmJor
	ULBn3H3U0AvW4loUSdkDPiIRs/pCdctFIKCH45ZMbCokw/x7tf03fv8zTQ==
X-Google-Smtp-Source: AGHT+IE07/nfovCvQOLy9COzBuouQYyfDUdSDToJfg8PcvW3A/wT7GChpTSNqogA5n1+xF73M05Ofw==
X-Received: by 2002:a05:6a20:c996:b0:1d9:266e:8206 with SMTP id adf61e73a8af0-1d978b3a183mr3543862637.25.1729706751303;
        Wed, 23 Oct 2024 11:05:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312e20sm6624604b3a.8.2024.10.23.11.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 11:05:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <61e62ab7-50d4-40a3-8230-9c5e6814829a@roeck-us.net>
Date: Wed, 23 Oct 2024 11:05:48 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linus-next: improving functional testing for to-be-merged pull
 requests
To: paulmck@kernel.org, Christoph Hellwig <hch@infradead.org>
Cc: Sasha Levin <sashal@kernel.org>, Kees Cook <kees@kernel.org>,
 torvalds@linux-foundation.org, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <ZxZ8MStt4e8JXeJb@sashalap>
 <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org> <ZxdyYjzxSktk34Zz@sashalap>
 <ZxiOjBRdO6EMAY4H@infradead.org>
 <10b0cb74-2068-4819-ac91-fcf98ca8d96c@paulmck-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <10b0cb74-2068-4819-ac91-fcf98ca8d96c@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/24 10:47, Paul E. McKenney wrote:
> On Tue, Oct 22, 2024 at 10:50:04PM -0700, Christoph Hellwig wrote:
>> On Tue, Oct 22, 2024 at 05:37:38AM -0400, Sasha Levin wrote:
>>> We could add a report for the above, but:
>>>
>>> 1. Linus consistently pulls patches that haven't seen the light of day.
>>> 2. Linus explicitly objected to making a linux-next a must have.
>>>
>>> So unless these results would be actually used, what's the point in
>>> writing all of that?
>>
>> Yes, without Linus caring we're not going to get our process worked out.
>> Not sure how a tree that probably won't have much better latency than
>> linux-next is going to fix that, though.
> 
> If I recall correctly, one thing Linus asked us to do earlier this year
> (ARM Summit) is to CC him on -next failures.  I have been failing to do
> this, so I will post myself a note or something to remind me.
> 
> After all, if Linus doesn't know of a problem with a set of commits,
> how does he know not to pull it?
> 

As of right now:

Build results:
	total: 158 pass: 144 fail: 14
Failed builds:
	arm:axm55xx_defconfig
	csky:defconfig
	i386:allyesconfig
	i386:allmodconfig
	microblaze:defconfig
	mips:allmodconfig
	mips:mtx1_defconfig
	mips:db1xxx_defconfig
	openrisc:allmodconfig
	parisc:allmodconfig
	parisc64:generic-64bit_defconfig
	sh:defconfig
	sh:shx3_defconfig
	xtensa:allmodconfig
Qemu test results:
	total: 556 pass: 528 fail: 28
Unit test results:
	pass: 463943 fail: 0

And that is a good day. Sometimes dozens of builds and hundreds
of boot tests fail. Analyzing those failures would be a full-time job.
Who do you expect would or should do that ?

Guenter


