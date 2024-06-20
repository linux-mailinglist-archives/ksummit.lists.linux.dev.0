Return-Path: <ksummit+bounces-1334-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 691A69105B5
	for <lists@lfdr.de>; Thu, 20 Jun 2024 15:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0155D28735C
	for <lists@lfdr.de>; Thu, 20 Jun 2024 13:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AED71E49E;
	Thu, 20 Jun 2024 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngRjmSPf"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15513CF63
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718889643; cv=none; b=Z5IRcoY53LIaUUJ9TopIoWllATlSYIajCAwbRH4ePCrKibsajgwu5L2YAAKMsEo2DgetGjFmTcIyxiX8rgBLtaQpiOCEYyMGiUi5ktbaNKb1zb5SGOxrL4Bod2875DPUwyAOi3rjhw3yDAGgSB0HKO8ZVvDSn7gHG/zr1amcuh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718889643; c=relaxed/simple;
	bh=pP50IXn5ymDC2oaEyrMafRcOFuXMVfpvkzYjccL3tzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fQ1BvlqWiGYYv5g8EzzENaQkYixIjn/Z1rBfxyr0T6gWU4fZKE+P7xq6bqbAxBsG67daBmJcLUEHvE+6IU2fgfVh8gquMW3E1osYsNRKFdP7A2bI8bAAjM0xFZ35deOswmVLZSwpEz7+i23YlJ0X1PfvpnQSfQXVKTpOz+DKXTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngRjmSPf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718889642; x=1750425642;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=pP50IXn5ymDC2oaEyrMafRcOFuXMVfpvkzYjccL3tzs=;
  b=ngRjmSPfNem5X5DkbdRfrxDR+qFp1U03Czy2P32StYpPVI7bH8em34mJ
   RuRpf/1Cn5FKksFK/E/VZGE/FATLq8CjyBEnx/fU32pI2SAy+R1WYhdFs
   S5kAvJbzTyrGS9VPZyVe1xqSuLftaAJrrCcENdo50Y+2bLqEXuyhyyFtb
   QG+BAfewbpIXXJwh965QG97X2I5newRTNz7BpOJbg6Qxy3FB4C7PCzYWY
   BNTh9cH+9icMqnfKQ2hZ01zIIArEfjF3qLbMU7qbHvq/4QH2/vSKaSbdb
   TDjfuw8wCe9IJGB+Urzi7Je5UEj6ABbjgXi4fr9emIMbF9PYz375l7p8L
   A==;
X-CSE-ConnectionGUID: YTvJSwFISxi1PsdCv8hURA==
X-CSE-MsgGUID: jKqz4JCUSyaucOttuv9ibw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15838804"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="15838804"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 06:20:41 -0700
X-CSE-ConnectionGUID: GNDlD3XyQRG6qVPW8s0hoQ==
X-CSE-MsgGUID: IkxqN9ntR1++4VtnOk+mWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42175941"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.95])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 06:20:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thorsten Leemhuis <linux@leemhuis.info>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [3/4] Elevate handling of regressions that
 made it to releases deemed for end users
In-Reply-To: <a1c7cf66-07ec-476a-a2aa-f09cae929c0a@leemhuis.info>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info>
 <20240613113455.GH6019@pendragon.ideasonboard.com>
 <a1c7cf66-07ec-476a-a2aa-f09cae929c0a@leemhuis.info>
Date: Thu, 20 Jun 2024 16:20:33 +0300
Message-ID: <87jzijeony.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 18 Jun 2024, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> On 13.06.24 13:34, Laurent Pinchart wrote:
>
>> On Thu, Jun 13, 2024 at 10:34:17AM +0200, Thorsten Leemhuis wrote:
>>
>>> I'd like to make the language somewhat stronger.
>>>
>>> """Handle mainline regressions that recently made it into a proper
>>> mainline, stable, or longterm release (either directly or via backport)
>>> with an even higher priority and try to fix them as fast as possible.
>>> [...] Aim hard to mainline a fix by Sunday after the next, if the
>> 
>> Are we really telling people, some of them contributing in their spare
>> time, that they have to work during weekends ?
>
> To clarify: I'm not asking for that at all. The aim for Sunday is only
> here because Linus usually releases new -rc's on Sunday evenings, which
> quite a few people seem to use. So from the regressions point of view
> it's better to flush fixes to Linus late in the week (say on Friday --
> or if you want on Sat or Sun, which some subsystem do), and not on a
> Monday, as people that use -rcs otherwise will run into the regression
> for yet another week -- and sometimes report it again, when the fix was
> just mainlined.
>
> What wording can avoid this? "By the end of the (current/next) week"
> maybe? In business context that afaik usually mean Fridays, but I'm not
> a native speaker, so might be wrong there.

Perhaps try wording it in terms of -rc/release instead of calendar?
That's what we want, anyway, and it depends on the driver/subsystem how
early you need to be to hit that target.

See, adding another level of abstraction works in language in general,
not just programming. ;)

BR,
Jani.



>
> Ciao, Thorsten
>

-- 
Jani Nikula, Intel

