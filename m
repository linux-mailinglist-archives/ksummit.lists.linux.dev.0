Return-Path: <ksummit+bounces-1567-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ABE977887
	for <lists@lfdr.de>; Fri, 13 Sep 2024 07:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADC0E1F25684
	for <lists@lfdr.de>; Fri, 13 Sep 2024 05:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55837186E5E;
	Fri, 13 Sep 2024 05:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="pZ76IH+p"
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D052D323D
	for <ksummit@lists.linux.dev>; Fri, 13 Sep 2024 05:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726206621; cv=none; b=X0txxaKtkr7oanvP5+Qu8oeNU+kR/vxjmojgpFAb/W/XmH1f6MOMoAl6/TiqsvUaZd5ojOunz1WlwQYbfWy2cPTgy9sQjVxPEJaJxSo8K+24bjqGSjaqrjU2fx1WCpkzbZxIBGeztoxxjNcpHaVJcDpy9w/JP+CrmKupQbtYZFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726206621; c=relaxed/simple;
	bh=ivAlVN6KXfDHc4RJtReXuPIWE3MuVKJh+oGzM9xKvJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYYDNmJRtcAkiBKZKmpAc97VvmeFgsGBa89gCX6AQ1qQ+iQCW25yaOskkEim3N9vYyJv42SLnBCr7Bz0/DvP3uDOn8IpotvySc4rMeRPE/Pn51tDnXUYStwruN1LjRKhTF3joR/nlfUCBj9tODc9MLKZnS4JeELPblu2q1dyv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=pZ76IH+p; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9BEE240004;
	Fri, 13 Sep 2024 05:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1726206616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3ck3kVj6myK2xdDIVMmvzh3pIlNxVEThEclrVrkJC8=;
	b=pZ76IH+pjmeKw3jWTc+2/I42Q6149pGkhBt2Jb8SdIg+kfviL69qk5UNCavuz57QGuX6fI
	sAmSlJvr4mT5Gs0Yu7RCwh1vdljdL6mSjsknFz7QUUGRgIXD3QvlYTb8qoW6Crwm4Q1/wp
	a7EuGxCbgAKv+p20koUFooGzOgEK8X+yyZ/aKxluRzGPLM1rGE5gDzGCTgtcw8XRrRVw+r
	NAZ7AHy909r0kKI7Pk6oGE/sTbR4QgETJSGNBelAO0A6v4Js9wpgFN70lnNUftannKaFTu
	H4/X+IDmEo6J8W+lXOBRpj/oxwNZfKp/hmIBi4WYlsxX9KxHallYLX9RkTlT2A==
Message-ID: <644df50c-29df-4c2b-804b-fb6a34e89ac3@arinc9.com>
Date: Fri, 13 Sep 2024 08:50:14 +0300
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
Cc: Rob Herring <robherring2@gmail.com>, ksummit@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
 <20240910-specked-rigging-e255283d1f99@spud>
 <9d1af9dd-680a-4df8-a6c7-49a6f809d6f2@arinc9.com>
 <20240912-marxism-doorway-eac24989e4b4@spud>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240912-marxism-doorway-eac24989e4b4@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

On 12/09/2024 20:05, Conor Dooley wrote:
> On Thu, Sep 12, 2024 at 04:01:20PM +0300, Arınç ÜNAL wrote:
>> On 11/09/2024 00:53, Conor Dooley wrote:
>>> On Tue, Sep 10, 2024 at 10:46:03AM -0500, Rob Herring wrote:
>>>> On Tue, Sep 10, 2024 at 5:53 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>>>
>>>>> Hello.
>>>>>
>>>>> I maintain the MediaTek DSA subdriver and some devicetree bindings and
>>>>> source files for MediaTek hardware.
>>>>>
>>>>> I am especially interested in the best practices of maintaining dt-bindings
>>>>> and DT source files.
>>>>>
>>>>> There's this false impression with some maintainers that, as the
>>>>> dt-bindings and the DT source files are being hosted on the Linux
>>>>> repository, Linux drivers have influence over the design of bindings or
>>>
>>>>> fixing DT source files that did not comply with the bindings.
>>>
>>> What does "fixing DT source files that did not comply" have to do with
>>> Linux, I'm afraid I do not understand what your point is there. The
>>> bindings are the ABI, and fixing incorrect source files would happen
>>> regardless of how the project is hosted?
>>
>> That's exactly what I think. I had a maintainer that argued otherwise is my
>> point. Which is why I want to strengthen the Linux documentation.
> 
> On a bunch of older platforms it's pretty common that the bindings were
> lacklustre or didn't match the devicetree and kernel source code, and in
> those cases (which are almost always text bindings) two outweighs one.
> Ordinarily though, if the kernel or dts don't match the binding they get
> adjusted, and if there are maintainers resisting this, then point them
> our way.
> 
> If things have been wrong for enough time for it to affect users,
> usually the correct thing to do is fix the kernel to support the
> incorrect as well as the correct. The same, however, goes for other
> projects: if something long established is being fixed, the other users
> need to be accounted for, particularly those that automatically import
> from the devicetree-rebasing repository.

The users in mention are the Linux kernel users, of course. So a maintainer
must not demand patches fixing the kernel to support the incorrect to be
submitted before accepting device tree patches; do we agree? This is what I
mean when I say complete autonomy from the Linux kernel development.

Arınç

