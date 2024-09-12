Return-Path: <ksummit+bounces-1562-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1CC9769C6
	for <lists@lfdr.de>; Thu, 12 Sep 2024 14:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E3AF1F224BB
	for <lists@lfdr.de>; Thu, 12 Sep 2024 12:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1171A4E99;
	Thu, 12 Sep 2024 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="aIlNcAyZ"
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD67D1A2627
	for <ksummit@lists.linux.dev>; Thu, 12 Sep 2024 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145833; cv=none; b=U/2cFrxa09v+YCas0sO8LiZ4EF3xMsWkegQN92p5i9S5Zr999+6+5S2JmzMIKkXF2LEsojJ8SYcB9qSYCqrO+ESg63CIVTjYpaluuLzdhXvUbf+ZTPyun6Q+53xdQYkpL5stgrYZMs0DBRnLHO6K9TWeGhzESFGEMc+hHDqY/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145833; c=relaxed/simple;
	bh=+/5Ftx7pvk5WfHA0fgU9a5YRBt+ArnnGenehgLXuNf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRLrB47QUnNbz5uIwjt/xNiil+wr12wNGVcIU4urTwH+viUsY2Tl90sYnC6UnUPeifx14Zlyi5mCTu66RZJ9WHWkpsIwr32yQ7Ja05IZMr8zEQtSbmnDvGKr6MC/faSSi2Y2HtsTD15kpN+BV7WZ4+mc/l/TwOiQ1xzfCOvGMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=aIlNcAyZ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A0111BF203;
	Thu, 12 Sep 2024 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1726145823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIEKJpTi8/LIDwMUv2d+NdAvO8Ee3wDvrdzubnd00PA=;
	b=aIlNcAyZ6f2qQp0BMId6WHgsXA/K1z/4IjsGXfvGa+z72jvt0x4z4gS4nGDgmz+PKekA7Z
	C7kpbxl1XxzTqPWn/8GwxANckgCRfBXSclx56oRBm1swhI/T6brKqqCVAv6wP7Te60KctK
	GY6WVQBim5enNFn6xId57Mk6m5cLvaijMnIJIviI+Iz7BihP2gBRZ2sYnh4d9zGELMvUC/
	UGBBomQ6SGK8qVLAxNvS8SsJO9MIFW8fgwJ6W63rRAQ799lG3PPyJvKAApC8X3M74Wd09P
	GkM3loYqn0nFMbrEC5bKGMT18kftW81PH0pi6tuBzCYyfnYSOHxaGm9vfK54CQ==
Message-ID: <32400a92-23c0-4ec3-9e42-29074e6db1f5@arinc9.com>
Date: Thu, 12 Sep 2024 15:57:00 +0300
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
Cc: ksummit@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor@kernel.org>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

On 10/09/2024 18:46, Rob Herring wrote:
> On Tue, Sep 10, 2024 at 5:53 AM Arınç ÜNAL<arinc.unal@arinc9.com> wrote:
>> Hello.
>>
>> I maintain the MediaTek DSA subdriver and some devicetree bindings and
>> source files for MediaTek hardware.
>>
>> I am especially interested in the best practices of maintaining dt-bindings
>> and DT source files.
>>
>> There's this false impression with some maintainers that, as the
>> dt-bindings and the DT source files are being hosted on the Linux
>> repository, Linux drivers have influence over the design of bindings or
>> fixing DT source files that did not comply with the bindings.
>>
>> I'd be very interested to be involved in or kick start the efforts to take
>> dt-bindings and DT source files out of the Linux repository into its own,
>> separate repository. I believe, this would be a great step in addressing
>> all the project-dependent bindings of Linux, U-Boot, OpenWrt, and all other
>> projects, to have a single, unified repository to describe all the hardware
>> that exists in the world.
> This! This is precisely why we don't move things out of the kernel.
> The kernel is the location that has the most hardware support in the
> world by far. It is not even close. Really, the only h/w missing are
> things too small to run Linux. And with all that h/w support, comes
> the people who understand the various classes of h/w. Those people are
> not going to come along to a separate project. It would be more work
> and there aren't any maintainers looking for extra work.

Understood. I can only speculate the reasons for having the device tree
binding documents and source files - let's call them device tree
definitions - on the Linux repository in the first place. It seems
convenience was a big if not the only factor.

On top of what you've pointed out, device tree source files are associated
with Linux architecture code. Therefore, there is a single menu to choose
both the architecture code and the device tree. This and the fact that
device tree source files are compiled along with the architecture code is
quite convenient. However, there is a case in which I just want to compile
a source file. I shouldn't need to have anything to do with Linux drivers
to achieve that.

> 
> We already have a separate repository[1]. U-boot has recently
> incorporated it and is happily (AFAIK) using it. It happens to be
> generated from the kernel tree, but what doesn't work for you there?
> I'm happy to discuss what it needs to work better.

The separate repository with the device tree definitions extracted is
excellent. It seems to bring the best of both worlds. I can build a single
device tree binary without having anything to do with the Linux repository.
And the device tree definitions on the Linux repository is kept so the
submissions for them still work through the means laid out by decades of
Linux and device tree development. Though, the repository seems to be
missing the functionality to validate the device tree binding documents and
source files.

However, this doesn't address the fact that device tree definitions have
nothing to do with Linux as a kernel. Because that the device tree
definitions are part of the Linux repository, on the surface, this gives
the false impression that Linux drivers have influence over the device tree
definitions. This is what I am in discontent with.

Over the course of years, I've had maintainers resisting to or completely
blocking my changes on the device tree definitions because of Linux driver
related reasons. I couldn't have patches that fixed incorrect hardware
definitions to be applied, because the maintainer would demand a change on
Linux driver to happen beforehand. I've stumbled upon misconceptions such
as thinking that a Linux driver change could break ABI. In reality, that is
nonsense because a driver change represents the implementation being
changed, not the bindings. The implementation change can only be so that it
breaks compliance with the bindings.

I understand that developers naturally become maintainers of the device
tree definitions for the hardware they've developed the driver for. So they
may not know better and fall into these false understandings. There are
currently Linux-driver-specific device tree definitions on the repository.
Device tree bindings for "DSA" switches which are actually Ethernet
switches with CPU ports. I hope to address this when I can.

I'd like to improve the Linux documentation so that I can refer to it in
the future instead of arguing the same points with folks every single time.
I'm thinking of making changes on two documents [1] [2]. I intend to
include the points below in these documents.

The device tree binding documents and device tree source files, to be
collectively referred to as the device tree definitions, on the Linux
repository are to be treated completely separately from the Linux kernel
development. The design of the device tree definitions is not to be
influenced by Linux or any other project. That means the device tree
definitions are described first, then the implementation is made by any OS
or project. Maintainers, do not block device tree patches until a patch for
a Linux driver is taken in.

> 
>> I am already working towards this goal by
>> improving the dt-bindings and DT source files on the Linux repository
>> whenever I can.
> That's great, still plenty of work to do there no matter what
> repository is hosting it.

I agree. There is serious, hard work to do here. I'm looking to turn this
into a full time job if there's such interest from Linaro to further employ
folks with experience and interest in this line of work.

> 
>> I must be quite late to make a topic suggestion but I'd be very happy to be
>> able to attend to the maintainers summit. I've already registered for the
>> Linux Plumbers Conference 2024.
> This is probably not a maintainers summit topic. There's a DT BoF
> scheduled already that Krzysztof is running and supporting other
> projects is on the agenda already. I won't be there in person nor will
> I be awake at the scheduled time.

I see it. I'll be there.

Arınç

