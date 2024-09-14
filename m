Return-Path: <ksummit+bounces-1572-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7AA979125
	for <lists@lfdr.de>; Sat, 14 Sep 2024 15:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2F7728299B
	for <lists@lfdr.de>; Sat, 14 Sep 2024 13:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F521482F3;
	Sat, 14 Sep 2024 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="C0lz39l9"
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F813C90F
	for <ksummit@lists.linux.dev>; Sat, 14 Sep 2024 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726321808; cv=none; b=N/CuKIbr0LmlaE6GL5gKeqA3YeUmWEhazxyDFmUEt5YMXYXHWbYnvIlTq1ZkvnxO0EBQXcXNSVfaAYw+Q9Jwo70hFLji0xDe0df7TTZ5Rd4jJznm67DWRjPCauD+VgvGyKIimHcvQmcx23A6Fh2+I0Kh7EqnJYuea1dVV/pHkM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726321808; c=relaxed/simple;
	bh=PoFIevgFuPaOdWxATsv/UwbYbFoA4Mi5f/pGj5gNJKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qMeBN6NGUjxXDJgSPmI/2Q05ibr1j59Z/McqHKH2ymzK/uDZA8UyAh5s5tGCCHFUnb8mTkjp8IGXbWNc47hoO8bJsGjeFltnc+ysOJ502MD6iszoer0Xb3WFTxm57LKYLDBEHdCj7V5FjyXSEGNxqNL6tGdLAO10oMqBtythmZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=C0lz39l9; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C753F240003;
	Sat, 14 Sep 2024 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1726321798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kqLruAGHAMIVMoSzcCizJ1fmLHtmodTo/qvLahUzbNE=;
	b=C0lz39l9Jlx+NDdy+BKY5PCqsGmXS73Ami8cTjv8Y+Q/f114lfwwpyRdEup2eGNkNC8KxL
	1jDHEOEVIL3VPm8Q8rkzIn278L3K/CM4uEZmFpA8XAhdimwBrIwCEbCzCXPGsOAVZswJFR
	sY8d2GQP9s6Cvl9CflGtqezyFn93HKw9nzUBduAVVMqunEaauFkb5/U1i1foUuhdwo2pqg
	TKWVHqikOm+2NMJR1KPpnXlFtZ1pTtyrPN7axmUnbCOE/bukDPZB4cjGHuFl8z/VQw/YP9
	bm7ellR2E7nLDYpyhxFd/jWzkrztrTRHY5grH5zwWllqNKk8W6oH8igYs3GX+g==
Message-ID: <a4ba75e1-0a49-48eb-91b2-cb701b211710@arinc9.com>
Date: Sat, 14 Sep 2024 16:49:56 +0300
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files,
 and invitation request
To: Conor Dooley <conor@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Rob Herring
 <robherring2@gmail.com>, ksummit@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
 <32400a92-23c0-4ec3-9e42-29074e6db1f5@arinc9.com>
 <0ebbade1dd90305b4abf1315a2735f7f7caa81bd.camel@infradead.org>
 <074766B4-C125-4514-B57D-043473819A0B@arinc9.com>
 <20240913-elective-barmaid-a15b56b5dab7@spud>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240913-elective-barmaid-a15b56b5dab7@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

On 13/09/2024 19:13, Conor Dooley wrote:
> On Fri, Sep 13, 2024 at 05:38:44PM +0200, Arınç ÜNAL wrote:
>> On 13 September 2024 10:08:41 CEST, David Woodhouse <dwmw2@infradead.org> wrote:
>>> On Thu, 2024-09-12 at 15:57 +0300, Arınç ÜNAL wrote
>>>> Over the course of years, I've had maintainers resisting to or completely
>>>> blocking my changes on the device tree definitions because of Linux driver
>>>> related reasons. I couldn't have patches that fixed incorrect hardware
>>>> definitions to be applied, because the maintainer would demand a change on
>>>> Linux driver to happen beforehand. I've stumbled upon misconceptions such
>>>> as thinking that a Linux driver change could break ABI. In reality, that is
>>>> nonsense because a driver change represents the implementation being
>>>> changed, not the bindings. The implementation change can only be so that it
>>>> breaks compliance with the bindings.
>>>
>>>
>>> We should be careful here.
>>>
>>> The device-tree bindings are the definition of the ABI. But they are
>>> only words; what matters is the interface between the DT blob itself
>>> and the OS drivers which interpret them.
>>>
>>> If we want to *change* that ABI in a way which breaks users of it, then
>>> of *course* we have to consider a transition path for those users.
>>>
>>> That's true of *any* ABI, be it a command line, a library ABI, or the
>>> device-tree bindings.
>>
>> First, let's agree on the two cases of changing the ABI. You either add
>> new properties and rules (let's call them definitions) to describe the
>> hardware more in detail, or you change the existing definitions which
>> would break the ABI. As it's irrelevant to my point, I'll simplify the
>> valid reasons to break the ABI as: The existing definitions wouldn't allow
>> the hardware to be properly described.
>>
>>>
>>> So where you say, "blocking my changes on the device tree definitions
>>> because of Linux driver related reasons", that isn't necessarily wrong.
>>> A breaking change to an ABI *needs* to have a transition plan for how
>>> its users get from old to new without a flag day.
>>
>> This is a concern for the Linux kernel. If we demand the compliance of the
>> Linux kernel with the changed device tree definitions from the people that
>> made the change, then we can't talk about a complete autonomy of the
>> device tree development from the Linux kernel development. I should be
>> able to submit patches with the only goal of adding or fixing hardware
>> definitions. Either I've broken the ABI with a valid reason or added
>> hardware definitions, I must not be forced to do Linux kernel development
>> for my device tree patches to be applied.
> 
> I'm going to require that it is done, by someone, before I ack a
> dt-binding change. I'm also going to require that it's not breaking
> other projects, like U-Boot, that pull in the dt-rebasing repository.
> If you change the ABI, and therefore change the source files, you also
> need to change the users.
> 
> And I would have those requirements whether or not the bindings lie within,
> or outside of, the kernel tree :) Suggesting that decoupling the bindings
> and kernel would allow that to be relaxed is, in my view, silly - it
> would just prevent anyone from being "blindly" able to pull in whatever
> the latest revision of platform devicetree source files is, without
> substantial risk of regressions. That's a downgrade from the status quo
> in my view!

I agree. I have an idea for an approach that will keep the status quo and
allow us to have proper device tree bindings. Allow changing the device
tree binding documents; require the driver to be tested and fixed only if
you're changing the device tree source files. This way, we will have proper
device tree definitions without affecting the users and have upcoming
drivers implement the proper device tree bindings. The non-compliant device
tree source files will get a nice complaint when checked with the bindings,
encouraging to fix them.

We explain on the kernel documentation that if you change the device tree
source file to be compliant with the binding document, you are required to
test the driver and let the maintainers know that there are no regressions.
If there are regressions, a patch to fix the driver must be be included on
the patch series and come after the device tree source file patch.

> 
> The far harder thing to deal with at present is ABI "compliant" changes
> to devicetree source files, for example where a new dedicated clock node
> replaces a set of fixed-clocks, which is something we need platform
> maintainers to become more aware of as use of the dt-rebasing
> repo/OF_UPSTREAM grows in U-Boot.

I think this falls under the case of breaking the ABI to be able to
properly describe the hardware. In any case, I don't see this interfere
with my suggestion.

> 
> Cheers,
> Conor.
> 
>> I should not need to know the C
>> language to do device tree work. If we want more folks to do device tree
>> janitor work, let's not add in unnecessary requirements.
>>
>> Device tree definitions are not just for being compiled into a blob for
>> drivers to interpret. For example, I do regularly read device tree
>> definitions to learn about the hardware being described. So it has a use
>> for documentation as well.
>>
>> Arınç

Arınç

