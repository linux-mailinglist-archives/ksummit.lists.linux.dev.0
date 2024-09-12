Return-Path: <ksummit+bounces-1563-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0229769D7
	for <lists@lfdr.de>; Thu, 12 Sep 2024 15:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216E11F224EC
	for <lists@lfdr.de>; Thu, 12 Sep 2024 13:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9F4185B60;
	Thu, 12 Sep 2024 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="fqJkxKKJ"
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883119476
	for <ksummit@lists.linux.dev>; Thu, 12 Sep 2024 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726146087; cv=none; b=WPFI2xXKHilItvrnm1cPKS/hkPTNnWTdAXVKnZ4mGM3Dbr/rT9O6hj9LxTJgwr2VPKNLHwVHwE0D4CELEfTWKKPVpVOjcg0B+XlctgLOktDhPiQXW60mKKpR9oQyr4V7+Tt0cpfZF2MS9pDUmjNZoT/odxCxKkQG+V7crT8SKsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726146087; c=relaxed/simple;
	bh=YfJdTYRPbgIqEbnheFvYeY9ZtM5ACtQgJwW3W9s0s3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9Q8C1DEKJpN05ZkHsEak69f9EaA/7hfwlWmIy81rDy679hNQjyYn6oT2TMOaOumvSIx9El/QdB+xoImAOFJnJDVvUGlCOAeIYJ4kUfV7rvHDVOxBMhupnpCYrC90DAPonajU60aih9jMJDqwFFVEdwWUg6zERG9OCqhGw9WQkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=fqJkxKKJ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A0091BF205;
	Thu, 12 Sep 2024 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1726146082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/cyXadJiB+wPt4OUGMa84KBMUZSYFt/u5ImAPafE4+8=;
	b=fqJkxKKJbjTVFuJmhvz1w3EeixaeewHUcTRbuKP/D5guH658JikBnvs4C7oqfFt1ZyRr3+
	8U4ieJdwji4tskyF6KabZLxGRZ/cQ7ndiYs9YFor7IF0HlxT9Wv0LWTNGQiu5MphSFu/zg
	WbW5WMhl2Y0QjHdwZM5LE0z2blIvRThM2sXxjesRsogpPv4EhqCCciFWHt46MBwS+c4Nyy
	JAwLU+pgrSGlOSBGceVSLhDBKe6MBO0zfbxIAHdmCZe4InYffaM+s7aA7QQELDqhRFa9Rs
	0aHcgGXwdovd7AutPlA+I8YI/Hl99QUKTV9+Ic1wXZQ40ZEcV01mQJeWjhsQ3A==
Message-ID: <9d1af9dd-680a-4df8-a6c7-49a6f809d6f2@arinc9.com>
Date: Thu, 12 Sep 2024 16:01:20 +0300
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files,
 and invitation request
To: Conor Dooley <conor@kernel.org>, Rob Herring <robherring2@gmail.com>
Cc: ksummit@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
 <20240910-specked-rigging-e255283d1f99@spud>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240910-specked-rigging-e255283d1f99@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

On 11/09/2024 00:53, Conor Dooley wrote:
> On Tue, Sep 10, 2024 at 10:46:03AM -0500, Rob Herring wrote:
>> On Tue, Sep 10, 2024 at 5:53 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>
>>> Hello.
>>>
>>> I maintain the MediaTek DSA subdriver and some devicetree bindings and
>>> source files for MediaTek hardware.
>>>
>>> I am especially interested in the best practices of maintaining dt-bindings
>>> and DT source files.
>>>
>>> There's this false impression with some maintainers that, as the
>>> dt-bindings and the DT source files are being hosted on the Linux
>>> repository, Linux drivers have influence over the design of bindings or
> 
>>> fixing DT source files that did not comply with the bindings.
> 
> What does "fixing DT source files that did not comply" have to do with
> Linux, I'm afraid I do not understand what your point is there. The
> bindings are the ABI, and fixing incorrect source files would happen
> regardless of how the project is hosted?

That's exactly what I think. I had a maintainer that argued otherwise is my
point. Which is why I want to strengthen the Linux documentation.

> 
>>> I'd be very interested to be involved in or kick start the efforts to take
>>> dt-bindings and DT source files out of the Linux repository into its own,
>>> separate repository. I believe, this would be a great step in addressing
>>> all the project-dependent bindings of Linux, U-Boot, OpenWrt, and all other
>>> projects, to have a single, unified repository to describe all the hardware
>>> that exists in the world.
>>
>> This! This is precisely why we don't move things out of the kernel.
>> The kernel is the location that has the most hardware support in the
>> world by far. It is not even close. Really, the only h/w missing are
>> things too small to run Linux. And with all that h/w support, comes
>> the people who understand the various classes of h/w. Those people are
>> not going to come along to a separate project. It would be more work
>> and there aren't any maintainers looking for extra work.
>>
>> We already have a separate repository[1]. U-boot has recently
>> incorporated it and is happily (AFAIK) using it. It happens to be
>> generated from the kernel tree, but what doesn't work for you there?
>> I'm happy to discuss what it needs to work better.
>>
>>> I am already working towards this goal by
>>> improving the dt-bindings and DT source files on the Linux repository
>>> whenever I can.
>>
>> That's great, still plenty of work to do there no matter what
>> repository is hosting it.
>>
>>> I must be quite late to make a topic suggestion but I'd be very happy to be
>>> able to attend to the maintainers summit. I've already registered for the
>>> Linux Plumbers Conference 2024.
>>
>> This is probably not a maintainers summit topic. There's a DT BoF
>> scheduled already that Krzysztof is running and supporting other
>> projects is on the agenda already. I won't be there in person nor will
>> I be awake at the scheduled time.
> 
> FWIW, I will be there.

Me too, I'd be very happy to meet you!

Arınç

