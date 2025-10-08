Return-Path: <ksummit+bounces-2444-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52281BC696E
	for <lists@lfdr.de>; Wed, 08 Oct 2025 22:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 778E934EC37
	for <lists@lfdr.de>; Wed,  8 Oct 2025 20:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6A226A1A4;
	Wed,  8 Oct 2025 20:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKRHK4H0"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3C212560
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 20:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759955435; cv=none; b=AlEsN+EOHa/6OPo6KNj6fMNlE/ebQLKY36ilYRkOYn/wjECNEze7mz2SrOzZ4v0fF0PcxeLa6J+sEd3Zj766nKtUL6+bmAgQw2hYBimS92E9v45lDvlTh/VbMWAULuoHvsjpJwnC++ZmqjQ9FPq0W42+RGRiCcBYg5Vv02Njcu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759955435; c=relaxed/simple;
	bh=ZI/+EDpirfpD7jE80bymJAYV8XOSGdotKCE0j2rXF+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLy9B4XIgaXwu4PBX1kQSTT+sV1vvSUpUq3PbRQ8KrGMntCFLgvHNgPSsnvudGgar8Vv6m7FWeai2RJQVNAo1n3VQqmIybAppgrlw+Vq2w7O+HIoRmbIslb/UbrByjFWFcp3iDMvv/26W71CMQ6UwZfbyY1wpa3CHpwbpb49lKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKRHK4H0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121E8C4CEE7;
	Wed,  8 Oct 2025 20:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759955435;
	bh=ZI/+EDpirfpD7jE80bymJAYV8XOSGdotKCE0j2rXF+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKRHK4H0kD+7JOSJe7vk9fzPgGr5RQfO4BiAJ0iJ9jnMTactU+uLJv0nHwF9hR6Ry
	 arextHHZ+zPTcupYFmz8M79SeMP41Zus4ERSPMyxc0+RxiQyZ0m1Ydysik1fB61kVc
	 0J7d8AKllmHzpoGrhxQToxirdLExDwQeCYMCS7LzQuKt14hljeKI+uH0kSYnnf87yF
	 plKtbmGp2OSX6gjZLxm6UOtseR8DgrjyA8BvrvtoFrjXLgJhB7xeRhclf+eVXlT12l
	 mwJ/A7AnBESrIL3IdjlM4WHelEUI5bFi/q0evowkAA2h4SKhz33mJwJMNBbRCQ5e0X
	 Orqfqh83B3APg==
Date: Wed, 8 Oct 2025 16:30:32 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Andrew Lunn <andrew@lunn.ch>, Chris Mason <clm@meta.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aObJ6GPU9aKeI_CZ@laps>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>

On Wed, Oct 08, 2025 at 07:50:32PM +0000, Bird, Tim wrote:
>
>
>> -----Original Message-----
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
>> > > My goal for KS/MS is to discuss how to enable maintainers to use review
>> > > automation tools to lower their workload.
>> >
>> > Maintainers will want to use these tools, if they prove to be
>> > useful. But ideally, we want the developers to use these tools and fix
>> > the issues before they post code for review. That reduces the
>> > maintainers workload even more. So Maintainers just need to run the
>> > tools to prove that the developers have run the tools and have already
>> > fixed the problems.
>> >
>> > So i'm not sure your goal is the correct long term goal. It should be
>> > a tool for everybody, not just maintainers.
>>
>> This raises the interesting and important question of how to get patch
>> submitters to follow a recommended workflow. We routinely get patches
>> that produce checkpatch errors that are clearly not false positives.
>> Rob Herring implemented a bot to run checks on device tree bindings and
>> device tree sources because lots of patches fail those checks. I'm sure
>> there are lots of other examples that have led maintainers to automate
>> checks on the receiver's side, through various types of standard CIs or
>> hand-made solutions. Submitters should run more tests, how to get them
>> to do so is a broader question.
>
>Maybe it would be worthwhile to annotate patch submissions with tags
>indicating what tools have been run on them.  I know we're trying to avoid
>overuse of commit tags, but maybe we could automate this a bit, and/or'
>reuse the 'Reviewed-by:' tag in the commit message.  I could envision, in some
>future workflow utopia, where a missing 'Reviewed-by: checkpatch.pl AND claude AI review'
>would be grounds for requesting these before human review.

This is similar to what was proposed in the last round[1] of discussions around
disclosing (AI) tool usage.

 From the cover letter:

	Assisted-by: Claude-claude-3-opus-20240229 checkpatch

At which point maintainers can set their own policies for their subsystem and
automate workflows based on those policies.



[1] https://lore.kernel.org/all/20250809234008.1540324-1-sashal@kernel.org/

-- 
Thanks,
Sasha

