Return-Path: <ksummit+bounces-2432-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F9BC6419
	for <lists@lfdr.de>; Wed, 08 Oct 2025 20:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61BFD40645F
	for <lists@lfdr.de>; Wed,  8 Oct 2025 18:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665612C0F67;
	Wed,  8 Oct 2025 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzLHu+GF"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0D42BE625
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947076; cv=none; b=QjWhuzpdZN3KlRByLkP19t7RH1JafTLIFKkepuoI0qjpp9C3fGyS+LrRGaHEgyynh7UMJ8zGXe39fqFbamhqtOPcw814G4mCED0gg3LnvPBCMOmrvq9E2OC8rg9eX9/n0lF+P50YDweO8WvhNWG6iOR0H3QR44+kyc8n8E6Fxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947076; c=relaxed/simple;
	bh=HA9kiNoQOxg68/9dM/1Y4SWlX5gZ2yQCpebNIEl2L2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZG2wez8Aqan8Fm9cVcf+4n10WXjYzl7mBR5LApdpLBLFBh7sx1mmqERjAexScDCuiVj6D6pAV9ss2PxFtMfpqkll9Y2gnsDK9QshoRsaY86AQgzHYy1BCjRyOm/sjqlkCAPxWtmREO1A7Ipx1F63oHhitDdX/MZnYn5jVrPnTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzLHu+GF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC46C4CEE7;
	Wed,  8 Oct 2025 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759947075;
	bh=HA9kiNoQOxg68/9dM/1Y4SWlX5gZ2yQCpebNIEl2L2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzLHu+GFjw9uGjgvDGufahJuZc8eMJbFroxJ1Q5s9AFpJc7ALk+JsKRdCAd8rwZOX
	 vfRZJekYIGAxb0sluu0KjxnYf/pwhCv/oQogOqyE5iueghpuK3iJF/ZucfhMS/EdJe
	 XUEtRNEZMBG5L0qEaSBcfizOx+cN7ivBwK6fmkFgCze4mCJcNnaXYQzvhNr1VjJUsN
	 o2hF+Hd633O/ONTVcPL+/sG359S0PJomvIR8s0rQ0bZERrviLn5jXhUKrxhx7/kqVz
	 0PHKH/VU/IhBgMBAoXThkIKmuzbT++xFk5ghh05i33ng28yWUPzo8mYyMdyCE6zm2t
	 WcouU9ukOiYPg==
Date: Wed, 8 Oct 2025 14:11:14 -0400
From: Sasha Levin <sashal@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Chris Mason <clm@meta.com>, ksummit@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOapQhwE8sDVjz16@laps>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <20251008-lively-vermilion-snail-beff9a@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008-lively-vermilion-snail-beff9a@lemur>

On Wed, Oct 08, 2025 at 01:20:21PM -0400, Konstantin Ryabitsev wrote:
>On Wed, Oct 08, 2025 at 01:04:54PM -0400, Chris Mason wrote:
>> My goal for KS/MS is to discuss how to enable maintainers to use review
>> automation tools to lower their workload.  I don't want to build new CI
>> here, so the goal would be enabling integration with existing CI.
>>
>> My question for everyone is what would it take to make all of this
>> useful?
>
>I am generally of the opinion that it's more useful to talk about it than to
>ignore it. Clearly, this is a controversial subject -- many will liken
>introducing proprietary AI tooling to what happened with bitkeeper.
>
>I've been working on incorporating series summarization with b4, but I'm
>trying to make it work with ollama/gemma3 so as not to introduce a proprietary
>dependency. My results are probably a lot more hit-and-miss than with Claude
>4.5 Sonnet -- but I find it hard to judge because the summaries *look*
>reasonably good to someone who is not a maintainer of that particular
>subsystem.

The approach I've been trying to take with my tools is that instead of
embedding the AI API calling logic into the tool itself (like I did initially
with the AUTOSEL rewrite), I just provided a "hook" in the form of a script
that takes the prompt as input and outputs the respose from whatever LLM was
used behind the scenes.

It make it easier both in the sense that I can easily switch between providers
just by calling a different script, and also I don't get locked into any single
provider and can decide if I want to use one of the open models or a
proprietary one.

We can provide a library of these scripts to make it easy for users and give
them the freedom to choose which model they want to be using.

-- 
Thanks,
Sasha

