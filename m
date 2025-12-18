Return-Path: <ksummit+bounces-2677-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC956CCC10A
	for <lists@lfdr.de>; Thu, 18 Dec 2025 14:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D86E5301E59F
	for <lists@lfdr.de>; Thu, 18 Dec 2025 13:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E76F30EF8F;
	Thu, 18 Dec 2025 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pss+uaXE"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C9335567
	for <ksummit@lists.linux.dev>; Thu, 18 Dec 2025 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065089; cv=none; b=ev8npkKlCLn5IrK2WIk+wPVx0+zKuk4EFur0BgZXwjJ01IaCwzFE+ui7IiPDO9HbGcnymGWjxcV/h0VhUR7Is0TERpZUywrMlBdMFYW/KmzpyGchyqXkAtiWGyHiPbI7ylILrXCb+0pjrlKXZiTYGFhRotAKYrMGZVySyrPVMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065089; c=relaxed/simple;
	bh=cHNrPEqpHiu5xZaZ1D2BS2Di8gOy9EszsNnWR6C5Y4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ifcvYR/mjTypj5ucPHhkYRJnm7TXlkVT/2KbDa5zwQ6qriBO39egJoP0ikfbqnA14sLcaBvZ/pbbyinBfNMxYFbUW8exnG7cAhuRu1v+BBXTR7Ey4I1XRdzgSx9MGSfTqzY4zzBFw3YkqfWrIa2YzIxE6E8Ms5XZIXhR4Ye6Yx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pss+uaXE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766065086; x=1797601086;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=cHNrPEqpHiu5xZaZ1D2BS2Di8gOy9EszsNnWR6C5Y4k=;
  b=Pss+uaXEdGSA04zB6mO3Si2DfyV/B/1+kjTlDVm1ScJ6WLxJcjvlSFyV
   R9kCcR5fntmafpZEWwRQwamWG686XH9/0EWTdyyrvknrucM5mAzzysdPS
   hvvNPFZq2hV/gTnZsMh1bhD3Fdo/9Dhjbfe7D0QmUncTYGNMwp1RXUnf0
   4kKYmX7gwAKoGOj9DkoLk0umtoxfLhTMcn3AFkQ0V4cEmx2pDGX20jKlF
   kFSNM0ewbGxhwvrU7FYYXFmdUSPasnoG8ibYIc01IoJYrrq8kIsLTqjvw
   YdwEtvi1XfNIJbq5Eefzhx3TZ1QhrJuQolhUF+F2OBp9v1u9kmv+CZ8+r
   w==;
X-CSE-ConnectionGUID: 8O1dqcY0TG+6xRJFRkfiJg==
X-CSE-MsgGUID: 49+pOUEdReaxDd53HUw9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71876373"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="71876373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 05:38:03 -0800
X-CSE-ConnectionGUID: WHqHsx7kRmSdl1CudAWlog==
X-CSE-MsgGUID: K7EsC0ZRREGAwxwmTmONNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="197733239"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.247])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 05:38:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mario Limonciello <superm1@kernel.org>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Bjorn Helgaas
 <helgaas@kernel.org>
Cc: users@kernel.org, ksummit@lists.linux.dev
Subject: Re: kernel.org tooling update
In-Reply-To: <6708a973-f70e-4027-88bb-455ea68f7732@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <aUGHHFWe_CFuOnRJ@wunner.de>
 <2ffa25e5-ef7c-4285-925c-3f698089bf28@oss.qualcomm.com>
 <6708a973-f70e-4027-88bb-455ea68f7732@kernel.org>
Date: Thu, 18 Dec 2025 15:37:58 +0200
Message-ID: <9e495b3a7e884788b58e1f61a078e4a7811d498f@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 16 Dec 2025, Mario Limonciello <superm1@kernel.org> wrote:
> On 12/16/25 2:33 PM, Jeff Johnson wrote:
>> On 12/16/2025 8:21 AM, Lukas Wunner wrote:
>>> [cc += Bjorn, start of thread is here:
>>> https://lore.kernel.org/ksummit/20251209-roaring-hidden-alligator-068eea@lemur/
>>> ]
>>>
>>> On Tue, Dec 09, 2025 at 11:48:24PM -0500, Konstantin Ryabitsev wrote:
>>>> ### Bugzilla
>>>>
>>>> It may be time to kill bugzilla:
>>>>
>>>>      - despite periodic "we're not dead yet" emails, it doesn't appear very
>>>>        active
>>>>      - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
>>>>        5.2 development branch and continuing with 5.1
>>>>      - question remains with what to replace bugzilla, but it's a longer
>>>>        discussion topic that I don't want to raise here; it may be a job for
>>>>        the bugspray bot that can extend the two-way bridge functionality to
>>>>        multiple bug tracker frameworks
>>>
>>> The PCI subsystem relies heavily on bugzilla to track issues,
>>> collect dmesg/lspci output from reporters and furnish them with
>>> debug or test patches.
>>>
>>> The SOP when issues are reported on the mailing list without
>>> sufficient information is to ask the reporter to open a bugzilla
>>> issue and attach full dmesg and lspci -vvv output for analysis.
>>>
>>> If bugzilla is deprecated, we'll need at least a way to exchange
>>> files with reporters.  Preferably on kernel.org infrastructure
>>> to be independent from 3rd parties.  A way to communicate with
>>> reporters outside the mailing list is also useful to prevent
>>> spamming linux-pci@vger.kernel.org with messages relevant only
>>> to a single issue or system.
>>>
>>> All the information now recorded in bugzilla should continue
>>> to be available indefinitely so that Link: tags in commits
>>> continue to work.  It's not uncommon to have to dig in old
>>> bugzilla entries in order to understand the motivation for
>>> a particular code section that was introduced years earlier.
>> 
>> At least some of the wireless maintainers also use bugzilla.
>> The ath11k & ath12k drivers have guidance in the wireless wiki:
>> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html
>> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html
>> 
>> So we would also want this or a similar service to be maintained.
>> 
>> /jeff
>
> I know that there was a mention of "external" Gitlab instances earlier 
> in the thread.  How about standing up an LF Gitlab instance?

FWIW, I've been rather discouraged about the free tier GitLab issues
experience. Feature wise, it's a step down from Bugzilla, even if the UI
is more modern. The best stuff is always going into the paid tier. For
this reason alone, I'm partial to something completely community driven
like Forgejo. There's at least the possibility of getting the new
features.


BR,
Jani.


>
> Subsystems that want to use it for issue tracking can have projects 
> there specifically for that.
>
> For example we could have a gitlab.kernel.org and then a project PCI for 
> all PCI subsystem related issues.
>
> This also "potentially" opens up the possibility of subsystems that want 
> to engage in a forge PR/MR workflow with contributors to do so.
>

-- 
Jani Nikula, Intel

