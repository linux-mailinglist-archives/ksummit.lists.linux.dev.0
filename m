Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8A27F14B2
	for <lists@lfdr.de>; Mon, 20 Nov 2023 14:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35F1282481
	for <lists@lfdr.de>; Mon, 20 Nov 2023 13:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85F21B284;
	Mon, 20 Nov 2023 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oHx5Mhgx"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A781B270
	for <ksummit@lists.linux.dev>; Mon, 20 Nov 2023 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Received: from localhost (unknown [98.53.138.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2E0CC537;
	Mon, 20 Nov 2023 13:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2E0CC537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700488244; bh=gEuW4I23lccj8lxBkZqaRVwOS9ed8yhe3xI3Lnumoyw=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=oHx5MhgxVxebROILs9LrXMtd7KOFW/K3c0achNMTsIkK2nN5RqRKD3gOa4dri4fC9
	 obdmM1Vk10HRaKkvmv4jN5MexTD4dX93iRhJgCSZniEpNtpP/I0hdN4cB7oLxdT+5L
	 DXnVkz6ocjsJg3d5CD+patGzXIVDnvw3ubGtkKED14C0aB5udeBSaw2yNeME8P5EyG
	 d2C/j5JY7mdAdzhzHO9mLOPFBBr1zhSUv19PiqIOarlzYX8G+pIdiQ1Zcq+FZBaY9/
	 uCXzOstvxhtbsq92l5j78kd8DooOsj5kyYkckvBOgm3GE3omWS9PFM9vGZCzbtj4JK
	 icTwAPZijBj1A==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Jani Nikula
 <jani.nikula@intel.com>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Kernel documentation
In-Reply-To: <430ee6bb-2556-4674-ae9d-fd7729bf8afd@oracle.com>
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
 <87v8fiq6cl.fsf@meer.lwn.net>
 <430ee6bb-2556-4674-ae9d-fd7729bf8afd@oracle.com>
Date: Mon, 20 Nov 2023 06:50:34 -0700
Message-ID: <877cmc7cut.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> (We already exchanged on this topic, but repeating it for the list:)
>
> On 20/06/2023 21:30, Jonathan Corbet wrote:
>> Jani Nikula <jani.nikula@intel.com> writes:
>> 
>>> It should be more feasible to build the documentation. Make it
>>> faster,
>
> When using PyPy instead of CPython to run Sphinx, I see a 22%
> performance improvement on the kernel documentation, which is not
> insignificant.

That is nice, but we can't really assume that everybody building the
docs has pypy around.

>> A while back, I went into Sphinx with a hatchet and managed to take 
>> about 20% off the build time.  The C domain stuff builds a data 
>> structure of incredible complexity, then just tosses much of it
>> away. I've never had the time to figure out why they do that or to
>> try to get my hack job into a condition where I'd be willing to show
>> it to my dog, much less the Sphinx developers.
>
> I also profiled the documentation build some weeks ago and came to the
> same conclusion: around 40% of the time is spent inside resolve_xref(),
> the exact same C domain stuff you mentioned.
>
> The gcc project/documentation has the same problem, albeit in the C++
> domain code, there is an open ticket for it:
>
>    https://github.com/sphinx-doc/sphinx/issues/10966
>
> If we're really not using the functionality provided by the C domain
> code, maybe instead of ripping it out we could provide something like a
> conf.py toggle to disable it? (The idea being that the patch would be
> smaller and more acceptable upstream...)

Ah but we are - it's how we generate all of the cross-references in the
built docs.  My sense, from a couple of years ago though was that parts
of that code aren't used by *anybody*.  But I didn't feel that I'd
understood it well enough to make a proper patch.  I'd really like to
get back to that.

Thanks,

jon

