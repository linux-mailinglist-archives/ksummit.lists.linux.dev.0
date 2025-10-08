Return-Path: <ksummit+bounces-2434-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98EBC64EC
	for <lists@lfdr.de>; Wed, 08 Oct 2025 20:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BEE940661C
	for <lists@lfdr.de>; Wed,  8 Oct 2025 18:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7702C0F7D;
	Wed,  8 Oct 2025 18:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F34ZRgir"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864842C0292
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 18:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948433; cv=none; b=tywyTvv7+p7I98YaN6NZccrty1K/K6nZgEBT45tqzuBcKUu2z/UyhoxJ8ZM1nUu10JqiXgjNer0K8L9Y1sDyAAwiJBbuNKwyRrMcZedF0iXi72iSs0g8sWav5+Mr42g7Sntni+sqpcjJNK6tAzpFNV0m+BoMr8wor7OySlvkFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948433; c=relaxed/simple;
	bh=3P4TdprLHBCffrbpLrnlAg9soCoWomiW7A2V80dzjbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ei8UegYwnJeCZXDoldpYofAG38dWMjniSFWyNenWnctH2PkqQlq/bYQkjToCctPHRsfIbeJPgdZrMuRlcTCHxwvO1kbhSAjZEUGZ+v/FvWPq3tlAMpWWSNHdnoOk1mY5U1asC4A6NDCWDAinVzwTW3IfsFGwbGV1DkXS2YP32pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F34ZRgir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C31C4CEE7;
	Wed,  8 Oct 2025 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759948433;
	bh=3P4TdprLHBCffrbpLrnlAg9soCoWomiW7A2V80dzjbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F34ZRgirUrcM/2B7TjPFitk3KAKMYru1IqIDmstnWr4bft/9U+FvFBwyQURXta1yU
	 1iuzJGTtfTHfn39qqg8r6efTAh0bc3BJ5ydpehJbvA9XLmCadOJdiJD4FcncuteAvB
	 01g8uMba2EmATNvGjfpFNPsSQmy59qej8Nio7AlwKZYtrcJvd/lysELoLlKlCOt1XR
	 zJOQnhBEHaMrxLYi1emfC5r2Cy86pbak/h+uf3w4to85WVWVf8Hh0cn7UdK3Gp8IFF
	 iCrxQt6Ei8EhkN2fNJjxavnwJNF/v5df7nosAKBeRpk7MouBM9Ampd//47ARZJGIrB
	 dC+zlIPUIuNng==
Date: Wed, 8 Oct 2025 14:33:51 -0400
From: Sasha Levin <sashal@kernel.org>
To: Chris Mason <clm@meta.com>
Cc: ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOaujzH1dl-OEbsO@laps>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>

On Wed, Oct 08, 2025 at 01:04:54PM -0400, Chris Mason wrote:
>Hi everyone,
>
>Depending on how you look at things, this is potentially a topic for
>either MS or KS.
>
>One way to lower the load on maintainers is to make it easier for
>contributors to send higher quality patches, and to catch errors before
>they land in various git trees.
>
>Along those lines, when the AI code submission thread started over the
>summer, I decided to see if it was possible to get reasonable code
>reviews out of AI.

This is a really great subject to discuss.

IMO when the AI topic initially came up the concerns around AI drowned
discussions of finding places where AI could be useful and provide support for
maintainers struggling under the load.

>There are certainly false positives, but Alexei and the BPF developers
>wired up my prompts into the BPF CI, and you can find the results in
>their github CI.  Everything in red is a bug the AI review found:
>
>https://github.com/kernel-patches/bpf/actions/workflows/ai-code-review.yml
>
>My goal for KS/MS is to discuss how to enable maintainers to use review
>automation tools to lower their workload.  I don't want to build new CI
>here, so the goal would be enabling integration with existing CI.

This is great to see!

I think that AUTOSEL is already a large scale kernel patch review workflow and
I'd love to work more towards a unified kernel patch AI review story that
community members could use.

I've gotten good feedback[1] from Linus about the AI AUTOSEL workflow and his
idea around expanding our AI tooling to help with maintainer workflows sounds
in line with what you're describing here.

>My question for everyone is what would it take to make all of this
>useful?  I'm working on funding for API access, so hopefully that part
>won't be a problem.

I've been playing with extending[2] b4 (unofficially) with AI workflows that
are useful for myself. The patches themselves aren't too interesting, but what
I found exciting is expanding b4 with tooling that maintainers can run locally
and which will save them a good amound of time/effort.

Something along the lines of "b4 ai review [commit]" or "b4 ai style [patch]".

>There's definitely overlap between the bugs I'm finding and the bugs Dan
>Carpenter finds, so I'm hoping he and I can team up as well.
>
>In terms of actual review details, the reviews have two parts:
>
>1) The review prompts.  These are stand alone and can just work on any
>kernel tree.  This is what BPF CI is currently using:
>
>https://github.com/masoncl/review-prompts/

I think I'll borrow some of these :)

It was interesting to read through some of the prompts and see where you had
good and bad experience with the AI ("You're not smart enough to understand
smp_mb()" :D )

>These prompts can also debug oopsen or syzbot reports (with varying
>success).
>
>2) A code indexing tool with MCP server that Claude can use to find
>functions, types, and call chains more effectively.  This makes it more
>likely Claude can trace complex relationships in the code:
>
>https://github.com/facebookexperimental/semcode
>
>Asking claude to produce a callgraph for btrfs_search_slot() consumes
>~444K tokens.  With semcode installed, the same query produces better
>results and uses 25K tokens. (btrfs_search_slot() has a huge callchain)

Also very interesting! AUTOSEL is a token eating machine. Reducing token counts
while still getting the same (or better) quality of outputs is really great.



[1] https://lore.kernel.org/all/CAHk-=wgX-2+hH5fM344_wKYNZS5CSf4ispS4X+s5xkma_Mdu_Q@mail.gmail.com/
[2] https://github.com/sashalevin/b4-ai

-- 
Thanks,
Sasha

