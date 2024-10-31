Return-Path: <ksummit+bounces-1670-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907A9B8347
	for <lists@lfdr.de>; Thu, 31 Oct 2024 20:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D55101F21438
	for <lists@lfdr.de>; Thu, 31 Oct 2024 19:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178D11CB332;
	Thu, 31 Oct 2024 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I7zQLJkl"
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495431CB32A
	for <ksummit@lists.linux.dev>; Thu, 31 Oct 2024 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730402554; cv=none; b=OTPG4sjaiwJNATnvSPofkML7lC9j2H/ffmG3Tu5MrGKv4D90q8jtMdwbBGBJDpuIrkg+y7ArpBLjvjwRNzkfER3SvJpoRod6mMmVKf2I+HKnPyXk9G1eXKlUIZZVgxZO57hmVGrPcRsZnAird45x5aeeNidWVBJFG1HYl+i6dOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730402554; c=relaxed/simple;
	bh=USu9utoOUDjF9pGXsZgvak+zLkm8GncKJ4y8O8eezOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLE9ghuhdOKUTpZdXKTP+u55qvRn7AmG9n0KhSCdo/9GhPyXsYDoH+FI4yAB4EaBIOyTc9Fhgq/sHAFxpNUa6Xg1ZZW1rWh7Fzx0xQVriZ+kqsCTMYHtKOjunq7GRR08H5JyXcTYzKHUpeA5UMb2BMxgS2aOdAUg2VLtLsq6DRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I7zQLJkl; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-83a9be2c028so48225739f.1
        for <ksummit@lists.linux.dev>; Thu, 31 Oct 2024 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730402551; x=1731007351; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAP/bAcV3XycEinBatq5XdsCa8IJPkmp6YdIv9sxUp4=;
        b=I7zQLJklSb5myE570wuAWDy3JNqj5lN7cOT7FpkK3ibj3iv7e7i4yjFKlQ8FU/Dbsf
         626inSWEyA7boA0VgjDfxyBxvmI31+UxZHFLvDbOFYNmjD0BITxauEElYI0OGR8rl3rP
         HyNlkkFRs45TF3P2j3Ed4Ao0FNEdWrX8UEP8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730402551; x=1731007351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAP/bAcV3XycEinBatq5XdsCa8IJPkmp6YdIv9sxUp4=;
        b=iLFh1U06JQDkfg5WvTbUn8VwZNLIlBZdzQhM+zK5JWM68FKdSBB3DvVqrODOzXabiv
         eYnLmvUr91ZYOLmFuAOvV8ECxk9qj6hgP0mYzIBWTXMhSbzLCaL4gTsaXd0Eihq13OI5
         qy1DqHzvfrEghpr6aSyJr6M2kmhGBEqa+k/dAbUX6iM0cNr0l8Cx7CKF82NZ7c6PYy1v
         D7AjM/hbaPyCa3vBgJhYFeoaynhEvdg7WBqbhZFFGOgZ8bZwp7akLm8jlSjeAPSU0+o1
         9ALmzmxZPURY1VLdSLyO08KrfkKuP+94/ZztBvomEDlAnVUHdya+PWn0p725Vhop0MkQ
         /k8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDM7N9l/OMv1b0lsxcGY8JXrnNZWW6n8uL2JN2HsrZSB7f/ZsG+Vnd362vd4Gg/LO9jEyqNGty@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlh2YPrfXaCqsbogsBH34BCjAisD6JklQecNiEnaNEzzVWR4A9
	XBPSfm8uj2KHBekxlJncofXugqlJdRL4jMd7eggFbjIoWobbauL4YOJrZjasPB0=
X-Google-Smtp-Source: AGHT+IGHYwu7LubJxPhGnVJYDPgVe7Q8KaU4aEUk4n8hC7hyzO6sNgIWfF8p8HCYVRIjvyvx62mx6A==
X-Received: by 2002:a05:6602:1508:b0:83a:b33a:5e08 with SMTP id ca18e2360f4ac-83b719f3db1mr102629339f.10.1730402551341;
        Thu, 31 Oct 2024 12:22:31 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de04977a96sm399294173.110.2024.10.31.12.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 12:22:30 -0700 (PDT)
Message-ID: <3f71da6a-ab96-42c6-9c61-c73f2b6dceb0@linuxfoundation.org>
Date: Thu, 31 Oct 2024 13:22:30 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linus-next: improving functional testing for to-be-merged pull
 requests
To: Thorsten Leemhuis <linux@leemhuis.info>, Mark Brown <broonie@kernel.org>
Cc: torvalds@linux-foundation.org, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ZxZ8MStt4e8JXeJb@sashalap>
 <6dbbc85e-5a87-4605-8db6-92b191878d97@sirena.org.uk>
 <bae547a8-0a16-4173-9aa3-5c31e0a0b1e1@leemhuis.info>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <bae547a8-0a16-4173-9aa3-5c31e0a0b1e1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/24 03:10, Thorsten Leemhuis wrote:
> On 21.10.24 23:41, Mark Brown wrote:
>> On Mon, Oct 21, 2024 at 12:07:13PM -0400, Sasha Levin wrote:
>>
>>> In an attempt to address the concerns, we're trying out a new "linus-next"
>>> tree is being created and maintained with the following characteristics:
> 
> BTW, in case anyone cares: I fully agree with what Kees wrote earlier
> today elsewhere in this thread, e.g. things like "improve -next instead"
> and "pre-merge bot":
> http://lore.kernel.org/all/792F4759-EA33-48B8-9AD0-FA14FA69E86E%40kernel.org\

I am catching up on this thread. I agree with Kees and others on improve
next instead. Adding one more next-like-thing will add to the confusion.

> 
> Regarding that bot: a few of the CI folks and a developer or two told me
> they want regzbot to react to PRs for Linus as well, so it can send
> mails like "hey Linus, just so you know, this PR contains changes that
> cause the following regressions not yet fixed". I think I like the idea,
> but well, quite a few other improvements around regzbot and its use have
> a much higher priority currently.
> 
>>> 	4. Continuous tree (not daily tags like in linux-next),
>>> 	facilitating easier bisection
>>
>> Is this a pressing problem?  I routinely bisect -next, you have to base
>> things on Linus' tree (or pending-fixes) but otherwise it's not
>> especially problematic.
> 
> I wonder if part of this is a "don't know how to do that" aka "lack of
> documentation" problem. I've recently seen some good guide or mailing
> list post how to bisect -next somewhere, but I think it wasn't in our
> Documentation/ directory. I need to search where that was (Mark, I might
> misremember, but wasn't it you who posted it somewhere?) and could work
> towards upstreaming that or some other guide. And don't worry, due to
> the different target audience it would be much shorter text than other
> documents I contributed. ;-)
> 

Documentation could help. Tailoring the workflow to linux-next could help.
All my branches are in linux-next. I don't send my PRs without keeping
the content in linux-next for 3 days to week after rc1 - it is usually
longer for merge-window content.

This helps me find conflicts if any between all the tree selftest go
through and mine. It helps work out conflicts in linux-next prior to
sending pull request.

My vote is for improving next instead of re-inventing next-like-thing.

thanks,
-- Shuah


