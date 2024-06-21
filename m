Return-Path: <ksummit+bounces-1346-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFE9911C1A
	for <lists@lfdr.de>; Fri, 21 Jun 2024 08:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F8031F24743
	for <lists@lfdr.de>; Fri, 21 Jun 2024 06:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904AA13DDAE;
	Fri, 21 Jun 2024 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXUavA6U"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9CC7F49B
	for <ksummit@lists.linux.dev>; Fri, 21 Jun 2024 06:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952428; cv=none; b=ly7jCWtRclIynSQWbZPbvY8xyWimW1yafmFDQkpdhbOwAz8ZhMG1vabPhy0xJI/a4CiT8+RfiKYJX7uXeLTecCz/18e21zNjC2zVk/BbnK2h9CQDoiwldu0V7JSVKjY3dBcSz0I8z40+wbxNtcDnnerEk8w0vJa/nNwZ1/rjyfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952428; c=relaxed/simple;
	bh=FVoRW/phNX6OAWTbQpEXkerHRYwQYmneklLSoDKW8t0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RswvvNiicidM6V86oSHdo4LGYVo7DERA5kCYmOJZEusEgGkNSwY6S4mDsO+dVQP/+qm8PtEctaYu2H5KUMncAw1My+V1kSKuRcDxvAMHvsLj7g1qZQPN54Q8qymUuYB/5hpfjG9mhTu27b1xmQEDXITWj2lWNl9PnS/0zqbkmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXUavA6U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4153BC2BBFC;
	Fri, 21 Jun 2024 06:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718952427;
	bh=FVoRW/phNX6OAWTbQpEXkerHRYwQYmneklLSoDKW8t0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WXUavA6UKI8ONwQbVXQ4cWnl6zuBQnifvYGw33rQ5KENkZ7yQ3fxD+kK+IjMLd7ag
	 93rhyPHID8FBK+rAWpl1MG8oZgqSwrFoUV0YUaKfebMAlEWMTJlDnMkja+z3d3eyRg
	 7KrVJWVyCT5ajGHm1sfnTE/nDfwChiqSg0hNl/2RsFYN4pyJFxaZeeZYGpDpjNaTxe
	 xQefpHF3pFdynEYEUNdYRajvV4JsOAxY0SdqPthvHbOAgrUGcp1iGFahtHzZ69As7j
	 6p1hikIyQrmTfHlX3kjsqK0ArAHvirOp+HyNAL5xa5ut+kshYU8T+zwhADaKE/lEYx
	 Fr9T6IESq5DUQ==
Date: Fri, 21 Jun 2024 08:47:03 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
cc: Jani Nikula <jani.nikula@intel.com>, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [3/4] Elevate handling of regressions that
 made it to releases deemed for end users
In-Reply-To: <9e417917-91b9-4506-9fbe-d6436ed48b9e@leemhuis.info>
Message-ID: <nycvar.YFH.7.76.2406210840020.24940@cbobk.fhfr.pm>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info> <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info> <20240613113455.GH6019@pendragon.ideasonboard.com> <a1c7cf66-07ec-476a-a2aa-f09cae929c0a@leemhuis.info> <87jzijeony.fsf@intel.com>
 <9e417917-91b9-4506-9fbe-d6436ed48b9e@leemhuis.info>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jun 2024, Thorsten Leemhuis wrote:

> Not totally against that, but the thing is: in a earlier local draft it 
> used to be like that. And then I noticed that this will add another week 
> when it comes to the merge window.

I'll be repeating myself, but I personally really don't like any such 
strong timelines in kernel documentation.

You are increasing the pressure on maintainers for no benefit. Everybody 
of course tries to get the regressions fixed as soon as possible once it's 
identified.

Sometimes it takes longer, because it's complex. Sometimes people are on 
holidays. Sometimes it just falls in between cracks, and people need 
to be pinged to look into that.

Kernel documentation wording is not going to stop any of that.

Also it might be setting unrealistic expectations at the user/reporter 
side. 

-- 
Jiri Kosina
SUSE Labs


