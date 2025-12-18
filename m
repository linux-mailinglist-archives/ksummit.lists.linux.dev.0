Return-Path: <ksummit+bounces-2678-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1055CCC32A
	for <lists@lfdr.de>; Thu, 18 Dec 2025 15:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D07BB3058E4D
	for <lists@lfdr.de>; Thu, 18 Dec 2025 14:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2D633B6D5;
	Thu, 18 Dec 2025 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nn6CtumR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF59033A9F3
	for <ksummit@lists.linux.dev>; Thu, 18 Dec 2025 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766066947; cv=none; b=e4ioRl0L5KhnLQl6Vfnsva8N7PB1+pDOLtt1qO7bxi97fhXbLrXAcMdfc3NV4dd5QS7/dLZizn/erfPyaUT56KeythzrJBOBV+uGlku61D++QmpVJgrXoGkUtHE/i/lkw2EtgOnPWGzAgCy794uXh2W/uXRCt2qIir2HAZe2i4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766066947; c=relaxed/simple;
	bh=ehzZsdTbjEtyToODT5Rw4of5nmzUMQTKjS/S5BYCrFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPcxZ9ibLlxeTCTRqxFZToqJDRyjZyaPUTdVH2cW5ceaSAJKys5ml3M79sNOQkwrsHXaYW58UJWP93IpiZ6wGuIMdzb+sP/f6NgEm1P2GC+ATQ5XmwyMjgUT6pm7Jcskb9Y1SYKfpQ9JkiW02sUCdlJUKxRE5zfx5dj755LqZ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nn6CtumR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA5EC4CEFB;
	Thu, 18 Dec 2025 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766066946;
	bh=ehzZsdTbjEtyToODT5Rw4of5nmzUMQTKjS/S5BYCrFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nn6CtumRxl9QEQJnun/veU/p7hyK4NHQwAX9i7scJQ38VvYKO4KIFcymcjFpQKQAi
	 FXtOjVwFhvhe6DeIcKdGhl8hYsoJMTUHdZsnQVTkVHHh8Tv/yA9CZL5pTUX4iPyoNd
	 fmJ7kF1O93IicIH0h4g1DwP9EylVPpLu81G/r1ZUx6FIryXArlfunC79c3gg6n/d9g
	 7bHWVqZxXob4iWlobrI0Pz4YW7ojuGcHqFsjU9KjiKBfoN/r7gP1++w+h8RhRHdkA2
	 4BAftekV8jKz0jZxJf6ypW9ecXhDuYzNsNfxVD9e06IJZscKSSXjS70BaTT8xBnzi8
	 b+pVh7xXlkrhA==
Message-ID: <beee4126-ff06-401b-9062-73683d2e7d66@kernel.org>
Date: Thu, 18 Dec 2025 08:09:03 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel.org tooling update
To: Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Lukas Wunner
 <lukas@wunner.de>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: users@kernel.org, ksummit@lists.linux.dev
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <aUGHHFWe_CFuOnRJ@wunner.de>
 <2ffa25e5-ef7c-4285-925c-3f698089bf28@oss.qualcomm.com>
 <6708a973-f70e-4027-88bb-455ea68f7732@kernel.org>
 <9e495b3a7e884788b58e1f61a078e4a7811d498f@intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <9e495b3a7e884788b58e1f61a078e4a7811d498f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/18/25 7:37 AM, Jani Nikula wrote:
> On Tue, 16 Dec 2025, Mario Limonciello <superm1@kernel.org> wrote:
>> On 12/16/25 2:33 PM, Jeff Johnson wrote:
>>> On 12/16/2025 8:21 AM, Lukas Wunner wrote:
>>>> [cc += Bjorn, start of thread is here:
>>>> https://lore.kernel.org/ksummit/20251209-roaring-hidden-alligator-068eea@lemur/
>>>> ]
>>>>
>>>> On Tue, Dec 09, 2025 at 11:48:24PM -0500, Konstantin Ryabitsev wrote:
>>>>> ### Bugzilla
>>>>>
>>>>> It may be time to kill bugzilla:
>>>>>
>>>>>       - despite periodic "we're not dead yet" emails, it doesn't appear very
>>>>>         active
>>>>>       - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
>>>>>         5.2 development branch and continuing with 5.1
>>>>>       - question remains with what to replace bugzilla, but it's a longer
>>>>>         discussion topic that I don't want to raise here; it may be a job for
>>>>>         the bugspray bot that can extend the two-way bridge functionality to
>>>>>         multiple bug tracker frameworks
>>>>
>>>> The PCI subsystem relies heavily on bugzilla to track issues,
>>>> collect dmesg/lspci output from reporters and furnish them with
>>>> debug or test patches.
>>>>
>>>> The SOP when issues are reported on the mailing list without
>>>> sufficient information is to ask the reporter to open a bugzilla
>>>> issue and attach full dmesg and lspci -vvv output for analysis.
>>>>
>>>> If bugzilla is deprecated, we'll need at least a way to exchange
>>>> files with reporters.  Preferably on kernel.org infrastructure
>>>> to be independent from 3rd parties.  A way to communicate with
>>>> reporters outside the mailing list is also useful to prevent
>>>> spamming linux-pci@vger.kernel.org with messages relevant only
>>>> to a single issue or system.
>>>>
>>>> All the information now recorded in bugzilla should continue
>>>> to be available indefinitely so that Link: tags in commits
>>>> continue to work.  It's not uncommon to have to dig in old
>>>> bugzilla entries in order to understand the motivation for
>>>> a particular code section that was introduced years earlier.
>>>
>>> At least some of the wireless maintainers also use bugzilla.
>>> The ath11k & ath12k drivers have guidance in the wireless wiki:
>>> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html
>>> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html
>>>
>>> So we would also want this or a similar service to be maintained.
>>>
>>> /jeff
>>
>> I know that there was a mention of "external" Gitlab instances earlier
>> in the thread.  How about standing up an LF Gitlab instance?
> 
> FWIW, I've been rather discouraged about the free tier GitLab issues
> experience. Feature wise, it's a step down from Bugzilla, even if the UI
> is more modern. The best stuff is always going into the paid tier. For
> this reason alone, I'm partial to something completely community driven
> like Forgejo. There's at least the possibility of getting the new
> features.

Sure - totally.

> 
> 
> BR,
> Jani.
> 
> 
>>
>> Subsystems that want to use it for issue tracking can have projects
>> there specifically for that.
>>
>> For example we could have a gitlab.kernel.org and then a project PCI for
>> all PCI subsystem related issues.
>>
>> This also "potentially" opens up the possibility of subsystems that want
>> to engage in a forge PR/MR workflow with contributors to do so.
>>
> 


