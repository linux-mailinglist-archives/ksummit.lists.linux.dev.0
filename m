Return-Path: <ksummit+bounces-1575-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E987297D3EA
	for <lists@lfdr.de>; Fri, 20 Sep 2024 11:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CECEC1C21450
	for <lists@lfdr.de>; Fri, 20 Sep 2024 09:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A93F13BADF;
	Fri, 20 Sep 2024 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="LGa9g4Me"
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965AB25776
	for <ksummit@lists.linux.dev>; Fri, 20 Sep 2024 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726826021; cv=none; b=UAPi5tEOthM1twMvZNKWLV7HRQBGW3WLbJZrz2fyNhbTEDCn8BqFr+SNefCPqVgKQOApUBYj5T3Nm9iqE1v62JMjJ9C+WAhT7Efh9hGC+1KklMz2iAyYEnwC8QAg85/IVdkBdgpk70lKIu67DyCcm8gJmyugHGHA8CcaNuJXk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726826021; c=relaxed/simple;
	bh=UY4nHmCGe/75E3DyOdS1ezcvDUtLdZBQ6ie9f175CEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AI3vPSDcrr88Guq7kOrL+9bJfFfaTG/taC/Ie6dzsxxLQCumkrLF4BPmfwhmWFb++nPhN1EqlvaWKlZ8ukoF9iP9cfPl7uLRqnbh5/BTxONcUpJ2YZBvb4iiXAZF9xFyKPPR+NzdxBFduoEuKEWRQzaUJI8X0B3VG+HD4FbNhZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=LGa9g4Me; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C2EFE000E;
	Fri, 20 Sep 2024 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1726826011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MY1eNaTCVD0UOtzS/KZipMP1fYo4DpW26zDqQg3c128=;
	b=LGa9g4Me4hSfvbjWTWEnARLuv21ngBLRsMhFC0ZjPe2MZ/XLYr5la3Ha301qSC4LUkDt4D
	trkY4NaxUesxYTsHqAxhAQ3spQinC3M7mAe76zY3YqnuZlGQBZFhgjYw/P6IwOH+4KVUv8
	Fa9qsEH/rM3XEhtIydGqUdC/7D+Qhop/L/HH1uLawX08+/3bwnZvpFiADX/Pf7bqi83Wr+
	s0opwj9Atx5CvD3UzzKwIOQm3rzyvchyJXWYTPiDdyxks5mp4W8MQwcWIV9/MCaGhIdMjy
	pz+S/1tV7fv9G8yYbqU5HNw4PGlfZ9Y258N0NJE0Lirl+a3+mRLiM06uWZesvg==
Message-ID: <8d006e61-9523-4004-8e37-4b6ed432bacb@arinc9.com>
Date: Fri, 20 Sep 2024 12:53:28 +0300
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files,
 and invitation request
To: Rob Herring <robherring2@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 ksummit@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
 <32400a92-23c0-4ec3-9e42-29074e6db1f5@arinc9.com>
 <0ebbade1dd90305b4abf1315a2735f7f7caa81bd.camel@infradead.org>
 <074766B4-C125-4514-B57D-043473819A0B@arinc9.com>
 <20240913-elective-barmaid-a15b56b5dab7@spud>
 <a4ba75e1-0a49-48eb-91b2-cb701b211710@arinc9.com>
 <CAL_Jsq+2882SR+kvSx9no2PYavEBRX2Sr+jFtH8U4F+_1ZMUUw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAL_Jsq+2882SR+kvSx9no2PYavEBRX2Sr+jFtH8U4F+_1ZMUUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

On 19/09/2024 17:55, Rob Herring wrote:
> On Sat, Sep 14, 2024 at 8:49 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> On 13/09/2024 19:13, Conor Dooley wrote:
>>> On Fri, Sep 13, 2024 at 05:38:44PM +0200, Arınç ÜNAL wrote:
>>>> On 13 September 2024 10:08:41 CEST, David Woodhouse <dwmw2@infradead.org> wrote:
>>>>> On Thu, 2024-09-12 at 15:57 +0300, Arınç ÜNAL wrote
>>>>>> Over the course of years, I've had maintainers resisting to or completely
>>>>>> blocking my changes on the device tree definitions because of Linux driver
>>>>>> related reasons. I couldn't have patches that fixed incorrect hardware
>>>>>> definitions to be applied, because the maintainer would demand a change on
>>>>>> Linux driver to happen beforehand. I've stumbled upon misconceptions such
>>>>>> as thinking that a Linux driver change could break ABI. In reality, that is
>>>>>> nonsense because a driver change represents the implementation being
>>>>>> changed, not the bindings. The implementation change can only be so that it
>>>>>> breaks compliance with the bindings.
>>>>>
>>>>>
>>>>> We should be careful here.
>>>>>
>>>>> The device-tree bindings are the definition of the ABI. But they are
>>>>> only words; what matters is the interface between the DT blob itself
>>>>> and the OS drivers which interpret them.
>>>>>
>>>>> If we want to *change* that ABI in a way which breaks users of it, then
>>>>> of *course* we have to consider a transition path for those users.
>>>>>
>>>>> That's true of *any* ABI, be it a command line, a library ABI, or the
>>>>> device-tree bindings.
>>>>
>>>> First, let's agree on the two cases of changing the ABI. You either add
>>>> new properties and rules (let's call them definitions) to describe the
>>>> hardware more in detail, or you change the existing definitions which
>>>> would break the ABI. As it's irrelevant to my point, I'll simplify the
>>>> valid reasons to break the ABI as: The existing definitions wouldn't allow
>>>> the hardware to be properly described.
>>>>
>>>>>
>>>>> So where you say, "blocking my changes on the device tree definitions
>>>>> because of Linux driver related reasons", that isn't necessarily wrong.
>>>>> A breaking change to an ABI *needs* to have a transition plan for how
>>>>> its users get from old to new without a flag day.
>>>>
>>>> This is a concern for the Linux kernel. If we demand the compliance of the
>>>> Linux kernel with the changed device tree definitions from the people that
>>>> made the change, then we can't talk about a complete autonomy of the
>>>> device tree development from the Linux kernel development. I should be
>>>> able to submit patches with the only goal of adding or fixing hardware
>>>> definitions. Either I've broken the ABI with a valid reason or added
>>>> hardware definitions, I must not be forced to do Linux kernel development
>>>> for my device tree patches to be applied.
>>>
>>> I'm going to require that it is done, by someone, before I ack a
>>> dt-binding change. I'm also going to require that it's not breaking
>>> other projects, like U-Boot, that pull in the dt-rebasing repository.
>>> If you change the ABI, and therefore change the source files, you also
>>> need to change the users.
>>>
>>> And I would have those requirements whether or not the bindings lie within,
>>> or outside of, the kernel tree :) Suggesting that decoupling the bindings
>>> and kernel would allow that to be relaxed is, in my view, silly - it
>>> would just prevent anyone from being "blindly" able to pull in whatever
>>> the latest revision of platform devicetree source files is, without
>>> substantial risk of regressions. That's a downgrade from the status quo
>>> in my view!
>>
>> I agree. I have an idea for an approach that will keep the status quo and
>> allow us to have proper device tree bindings. Allow changing the device
>> tree binding documents; require the driver to be tested and fixed only if
>> you're changing the device tree source files. This way, we will have proper
>> device tree definitions without affecting the users and have upcoming
>> drivers implement the proper device tree bindings. The non-compliant device
>> tree source files will get a nice complaint when checked with the bindings,
>> encouraging to fix them.
>>
>> We explain on the kernel documentation that if you change the device tree
>> source file to be compliant with the binding document, you are required to
>> test the driver and let the maintainers know that there are no regressions.
>> If there are regressions, a patch to fix the driver must be be included on
>> the patch series and come after the device tree source file patch.
> 
> This is not how an ABI works. If you have to change both sides for
> things to work, then you've broken the ABI.
> 
> With no ABI, the order you suggest for the series is backwards. The
> series is not bisectable. That assumes you mean the driver change
> supports a DT with and without the DT change. If not, it's just
> completely broken.

Thanks for pointing that out Rob. Yes, the order should be that the driver
is fixed first to comply with the binding document, then the device tree
source file is fixed to do the same. With that addressed, what's your
opinion on my proposal overall?

Arınç

