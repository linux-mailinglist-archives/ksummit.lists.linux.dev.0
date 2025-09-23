Return-Path: <ksummit+bounces-2425-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D302BB96E67
	for <lists@lfdr.de>; Tue, 23 Sep 2025 19:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D296E7AD223
	for <lists@lfdr.de>; Tue, 23 Sep 2025 17:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BE82571BC;
	Tue, 23 Sep 2025 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JGHhAVvW"
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DC914AD20
	for <ksummit@lists.linux.dev>; Tue, 23 Sep 2025 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758646963; cv=none; b=PtmS6uIMUaZkFGOo4ND+v9ovcuO+vaGXP/I7D079IHqNunuumugU3JJbLqVDrob6oM1BOkvfnvv/YDzCvBzp+LsOEg4oTV/Qqoj3Tr5SahW9keJc/NegaAEfw+GAbZEhxxL6nxCxy7D/uNOLbWY6/bUtvs85R0wxgaTZHpGNueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758646963; c=relaxed/simple;
	bh=ErDxKmvlNrKC0TzNCSRtc3l2E1g8L7ODD3MLlvTODgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fJF4M7npmtA+bZ8sH0ILXbLhbiYgm4HJXxJGBY4uJ2PK3jG8pnw0/D6NX3EAHWgdoc1kFXm6PtDHPpMDJN8sklD3JRGUXwK8zujwtuDAJOYeHMvQyQGWYMMQbX43MLbHuxmksN9Api+Bu834LhDE1ouY4brXL2MZiyLhn+4Ru6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JGHhAVvW; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-8936326129eso180311339f.2
        for <ksummit@lists.linux.dev>; Tue, 23 Sep 2025 10:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758646960; x=1759251760; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QrvQRe7BNvdNh8MHY9kSGS0YhbUBpaaHXLq7VMbiJ+Y=;
        b=JGHhAVvWNLvUsYOL4oXle/zc15tmUwMyjAlG88QqeUdTvKZ7On6s7kUWKS4QzLe7hu
         b6qaWbzVE849/NCobOXsDREZ3YNpgBur3RpdxMUtqRiCLFFp3M59JDzxrGO0Uk8Tu3Jf
         RKionq1ifUfRV+hUzq4/RmVb+vmWiq8K/bvGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758646960; x=1759251760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrvQRe7BNvdNh8MHY9kSGS0YhbUBpaaHXLq7VMbiJ+Y=;
        b=szd2VBIE2qtPBBzKfhnp3r5+7DErZbEw60ywBAFI3hNVz/SmlQKdm98ibWyoOKwD82
         z1JiCznIO90d+mfW/qsTvg1FfWLS9uG1M50eKp0nlx6+Cx8R1ucQPiLZmMMcnKx0UHcA
         LYsCLrO1q9TIo+gqfoTJ191sIVtKkfwZRTrFLswaM4dgDQno2VDQPGdHhkkf6dVJq/UC
         If8S7ZtpvwX81MKoU2FrBpGAegYWNTcJtBnZVV8cCoA3t7VHb1SVmgV68XiaCGqFfmXw
         U9UJ6lgyHR0UHWon1SMpxcioDSEmxIGEoLTYF7iW3lMTrvDwKfjZUHhPQsTw3TwOT3DJ
         pyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiHmmi2O2GD5pJXHmV/09QmCMxlGUvJBCm4yYvwSt2ptBa6oB74aWmjGXO4ZnlFHczsStuyTsW@lists.linux.dev
X-Gm-Message-State: AOJu0YzqO1whA6ZGzI9tcU1iQ+GIj/h62ZfyGfhFEa3SVhZmA5xNeH7Y
	WB8fBwtFjO21BQo70gQ1M424wdZPTzanNw2Q0tlJFKHWHrcyjucq8ElyjZXqFCK1NXA=
X-Gm-Gg: ASbGncsI38BqUXHBbX5Gqq7vXrORrAdkzGbFtkLUf1vp3xnrsmyKNF44j+4VaCe5B2v
	70/bVJouvw0f8Jk0sXSTpND4t4OVqPX0uaWrUJO+WaaprOcX5+ZgV3OctQ8cdL8m53BD3hZFZh2
	VeiR4FyJEmzhxfaGzTOQdtqdp0sU48Kw1X6WhCF2ozn0VMREXbkToYBuTEwjHe52K6oZJ2AybEy
	YpszH0EVbc7enwbsYtfw2I8/oroC48KAZBFotVO4AymVo3GhnJJoeoMfpUww4pV6txXYjWJkYd9
	gulbrM/PcikO8ij3LhdatrG5nNIXn/b+lDKNa1cuzI8z2LlF6hNKAyNtMLe/ypdP4fMdVboEHu/
	mydc3h2xlG55bllaRywtP5xiHeQfHcgoJvaI=
X-Google-Smtp-Source: AGHT+IHlQsWqcuOxxf5Gyb8HJtJ8nHbNiwda9+TX9ILF1I2O7TXL3TvxWr+fVfklaMIjCrV7sfr78g==
X-Received: by 2002:a92:cdac:0:b0:424:6fe:43c1 with SMTP id e9e14a558f8ab-42581ea5068mr44646985ab.19.1758646959510;
        Tue, 23 Sep 2025 10:02:39 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-55bbf14c47esm3019115173.41.2025.09.23.10.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 10:02:38 -0700 (PDT)
Message-ID: <b8e61cae-4074-4abc-a60c-cc76f599d160@linuxfoundation.org>
Date: Tue, 23 Sep 2025 11:02:37 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINER SUMMIT] resources for promoting healthy communities
To: dan.j.williams@intel.com,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 ksummit@lists.linux.dev
References: <572009db624de21099e08f28604f4b8e6a472cf2.camel@HansenPartnership.com>
 <68d1f6173b299_1c79100e6@dwillia2-mobl4.notmuch>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <68d1f6173b299_1c79100e6@dwillia2-mobl4.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/25 19:21, dan.j.williams@intel.com wrote:
> James Bottomley wrote:
>> We talk a lot about community health and maintainer burn out but what
>> struck me watching Hans' talk about this:
>>
>> https://www.youtube.com/watch?v=O8Q8nIzEG6c
>>
>> was that he relied on his employer to help him thorough his burnout
>> problems.  While this reflects very creditably on Red Hat it struck me
>> that quite a few of us probably have employers who would be less
>> sympathetic to the idea that issues caused by being an open source
>> maintainer should become their problem, especially if they were
>> spilling over into internal job functions.  So I went looking for
>> community resources that could be called on and found, rather
>> distressingly given the amount that people talk about this, that there
>> are none.  The best I can find was the session that happened in the
>> Kernel Summit track:
>>
>> https://lpc.events/event/17/contributions/1574/
>>
>> But that was a one-off rather than a resource that anyone can call on
>> at any time.
> 
> That was indeed a useful session, thanks to Shuah for organizing. I took
> advantage of the offer for a follow-up session with Dr. Chance.
> 
>> So the topic I'd like to raise is what should we as a
>> community actually be providing to help people through burn out and
>> other community health issues?  We could just continue on as we are now
>> which is pretty much nothing official but various community members
>> will be happy to help (although good luck finding them listed
>> anywhere).
> 
> Speaking for myself, it is not clear that a list makes the problem
> better. If the number of community members willing to help is larger
> than the number of folks willing to be explicitly listed, does that
> injure scaling?
> 
> That said, if you are having a hard time, do reach out to peers, do not
> wait for a list.
> 
>> We could make the self help support more official by providing a
>> mailing list and possibly a wiki of volunteers specifically for the
>> purpose.
> 
> Steven has talked about this, and I am supportive.
> 
> Additionally, one of the developments since that Plumbers session that I
> believe helps with burnout and conflict is more offlist collaboration.
> For example, subsystem specific conference calls, subsystem chat
> channels, and if you are lucky enough to live near a critical mass of
> developers, occasional gatherings for drinks and catching up, helps
> relieve pressure and build community.
> 
>> Or, we could even decide that this is a serious enough problem to ask
>> the LF if it would be amenable to providing us with some resources to
>> help, thinks like organizing regular sessions like the plumbers one
>> above and perhaps offering 1:1 video counseling and other resources.
> 
> I do think aspects of this topic are in scope for Shuah's Mentorship
> Series, for more opportunities to share what works and what does not
> work in navigating a Linux career.
> 
> https://events.linuxfoundation.org/lf-live-mentorship-series/

I agree - I can plan upon including navigating Linux career in 2026
content. LPC is a good place to recruit people to host them.

> 
> There are also training and development resources that many folks have
> access to through $employer.

This is a good option.

> 
> I do wonder what the uptake was on the sponsored sessions with Dr.
> Chance to inform if this is a resource Linux community needs access to
> on a regular basis. Is this problem is getting worse, better, or staying
> the same over time?
> 

Good to have this data for planning the series and determining the level
of help.

thanks,
-- Shuah



