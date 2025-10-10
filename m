Return-Path: <ksummit+bounces-2475-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954ABCB7A9
	for <lists@lfdr.de>; Fri, 10 Oct 2025 05:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D53F84E623D
	for <lists@lfdr.de>; Fri, 10 Oct 2025 03:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D691C23BD1B;
	Fri, 10 Oct 2025 03:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1u1SI2Y"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FF372629
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 03:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760065735; cv=none; b=nIEGMmyxxlulcy1v2dpMRAVx+S8gNpbEVOoiIbXnynosNeO5BsA5A9S3WMN7jlz4FsLPugK07k3A8E+W102wXd4uwZJu/6TZiysKeYi4B+cY4bFS4oLsCgEUcixVPRFwwFNE28k6mOFvz27Y5SpkBrsty2HV9CC/TAGygq51HW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760065735; c=relaxed/simple;
	bh=KY5uku9xdSd70W+vxv36fjzpevym+8WaSPSe0zKuMwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mU9rL2VZqt8Kc85+tpXPBsyWLbzR0ViWtk3OmyoLahTmJL+W8UFZ6R7xWZs4cpoY86jRSO2K5jllOxMIDWGqsceRgAKrpIeaF3/eHa4P2ext8ReN6MciU46OdPGHqB/Lw7iryBYvwXb5ThfEse5nRsYI85LZilFBeQdwfm8GozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1u1SI2Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC46FC4CEE7;
	Fri, 10 Oct 2025 03:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760065734;
	bh=KY5uku9xdSd70W+vxv36fjzpevym+8WaSPSe0zKuMwE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=m1u1SI2YuKMGob7NmOzlGidF9y3qYTbpC6aahluBfR/wkS9bggB4Aa120mYzLpYkO
	 DOd/h18zdOnRpor8XcsomB26tFagB+64fU5b4DyyE78EIspCwv7iXLO7jU8dW5eZQC
	 v6iFim0uxdWC23QHDnFWrksXEmFT5gOjobaW3ez2kB03GxtDtSc7/3zlUX5Nb8A6/X
	 zj3u1UR1P1W7OiuhyLAs+7JPTEDceSGEhj91o5IG108+qRj7kZFSG0eJkfWQyX3rM4
	 c3yswmOENH1te1TEqeHoMlunmaww35Vp0RjLO+mtiYFBYLPQcvdRQTOrQOOowN2sAh
	 2TbUwmB4JQkhA==
Message-ID: <be5094b9-fb20-462e-ad2f-2b58e520b949@kernel.org>
Date: Fri, 10 Oct 2025 05:08:47 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Chris Mason <clm@meta.com>, ksummit@lists.linux.dev,
 Dan Carpenter <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2025 19:04, Chris Mason wrote:
> Hi everyone,
> 
> Depending on how you look at things, this is potentially a topic for
> either MS or KS.
> 
> One way to lower the load on maintainers is to make it easier for
> contributors to send higher quality patches, and to catch errors before
> they land in various git trees.
> 
> Along those lines, when the AI code submission thread started over the
> summer, I decided to see if it was possible to get reasonable code
> reviews out of AI.
> 
> There are certainly false positives, but Alexei and the BPF developers
> wired up my prompts into the BPF CI, and you can find the results in
> their github CI.  Everything in red is a bug the AI review found:
> 
> https://github.com/kernel-patches/bpf/actions/workflows/ai-code-review.yml
> 
> My goal for KS/MS is to discuss how to enable maintainers to use review
> automation tools to lower their workload.  I don't want to build new CI
> here, so the goal would be enabling integration with existing CI.
> 
> My question for everyone is what would it take to make all of this
> useful?  I'm working on funding for API access, so hopefully that part
> won't be a problem.
> 
> There's definitely overlap between the bugs I'm finding and the bugs Dan
> Carpenter finds, so I'm hoping he and I can team up as well.
> 
> In terms of actual review details, the reviews have two parts:
> 
> 1) The review prompts.  These are stand alone and can just work on any
> kernel tree.  This is what BPF CI is currently using:
> 
> https://github.com/masoncl/review-prompts/
> 
> These prompts can also debug oopsen or syzbot reports (with varying
> success).


In general, I like this entire idea a lot, because I believe it could
drop many style or trivial review points, including obsolete/older code
patterns.

Qualcomm is trying to do something similar internally and they published
their code as well:
https://github.com/qualcomm/PatchWise/tree/main/patchwise/patch_review/ai_review
Different AI engines can be plugged, which solves some of the concerns
in this thread that some are expected to use employer's AI.

They run that instance of bot internally on all patches BEFORE posting
upstream, however that bot does not have yet AI-review enabled, maybe
because of too many false positives?

I also think this might be very useful tool for beginners to get
accustomed to kernel style of commit msgs and how the patch is supposed
to look like.

Best regards,
Krzysztof

