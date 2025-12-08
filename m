Return-Path: <ksummit+bounces-2651-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE9CABB62
	for <lists@lfdr.de>; Mon, 08 Dec 2025 02:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C8153016369
	for <lists@lfdr.de>; Mon,  8 Dec 2025 01:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783BA1DC1AB;
	Mon,  8 Dec 2025 01:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5cp8W78"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E2B175D53
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 01:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765156374; cv=none; b=CG1aaFSdFpiKyON0vrBteuPVvkaVmlK2Uh1n8pnVODnYTny6vGHTU9fBRVk5MsRBtzmqD1dM037JHmx/G6jXds4Ef1ZnYU4Napi99dtrldqzkpFMAEZ2KXymb6Rm7BsXiOFC3dbk+kikJ8X6/NEenSu9XJEp5O3vGy+U9tEmywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765156374; c=relaxed/simple;
	bh=8onR20Eg5ltNvsfqfkgzG+YO557vUWh9F0FBGtY73xg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcJo4/hkhIyehvQsVKTc7onUVNThmCeX/fI6k8GIwbbUyVYwYjhvVxcWJbtAHQVS+nE8+Ff5ytz1vJEJHXqgpd10FUGMn1VkU8evyzTvHr27CRBlCSh0uJ9I0R0XySRWnLOttQUkinDEDqiwO7Zd2/abM5hlIb4vaNrJBsF3mkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5cp8W78; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63364C4CEFB
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 01:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765156373;
	bh=8onR20Eg5ltNvsfqfkgzG+YO557vUWh9F0FBGtY73xg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=k5cp8W78E1LVI9M2qljOMwIZavyFtfbGDk5vIvM690Ur5Noc8Ov1vIcXQHSSsca2f
	 LRIvLZYmwBK5muRx3Yd2OP1mgrwYmOS05qlZVgIjohYq1+ttgLO7aX4r7Ib+Q8fJ5K
	 8bBhSp+VdLSRvoMhgjYi9pfTJURuDDkZUAw189qNauXK9WiI3of8G/OnofOhtrygLA
	 ewiKqtVFstmb14Ow2KLY5yY3tl9hmDAwVj6O3oiUewzpKUGfraw1UWyxruu6x511Yz
	 jcetAwdmQ8EC0H8a6XVEtP0QUB/GJ4OyZsiCVCuuw4PUE7dkvRJe3K0QDkoNQYlnv0
	 FkKoNuipRBRiQ==
Date: Sun, 7 Dec 2025 20:12:51 -0500
From: Sasha Levin <sashal@kernel.org>
To: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <aTYmE53i3FJ_lJH2@laps>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>

This (and parallel) threads have generated substantial discussion across
several related topics.  In preperation for the Maintainer's summit, here's a
summary of where we appear to have consensus, where we don't, and some
questions to consider before the summit.

Where We Have Consensus:

1. Human accountability is non-negotiable:

The From: line must always be a human who takes full responsibility for the
patch. No "but the AI wrote that part" excuses. This maps cleanly to our
existing DCO requirements and approach to tooling.

2. Some form of disclosure is needed:

Whether it's a trailer tag, a note below the cut line, or something else,
there's broad agreement that AI involvement should be disclosed. The exact
mechanism is debatable, but the principle is not.

3. Maintainer autonomy matters:

Individual subsystem maintainers should be empowered to set their own policies.
An opt-in approach per-subsystem seems preferred over a kernel-wide mandate
that doesn't account for different subsystem needs.

4. This isn't going away:

Industry is already using AI extensively. We're already receiving AI-generated
bug reports. Ignoring this won't make it disappear; better to have a thoughtful
policy than no policy.

5. Language assistance for non-native speakers is legitimate

Using AI to improve documentation and commit messages should not be stigmatized
or treated the same as AI-generated code.


Where We Don't Have Consensus:

1. The nature of AI errors:

Some argue AI makes fundamentally different errors than humans - subtle
mistakes that slip past review because we're trained to spot human-pattern
errors. Others argue AI errors are obvious when the model is under-trained, and
that better training can address most issues. This affects how much scrutiny
AI-assisted patches need.

2. Same bar or higher bar?

The kernel already has a significant bug rate - roughly 20% of commits in a
release cycle are fixes. Should we hold AI to the same standard we hold humans,
or does the kernel's criticality demand a higher bar for AI? There's genuine
disagreement here.

3. Legal risk tolerance:

DCO clause (a) requires certifying "I have the right to submit it under the
open source license." With AI training data provenance unclear and litigation
ongoing, how cautious should we be? Some advocate waiting for legal clarity;
others argue the legal concerns are overblown and we should focus on practical
guardrails.

4. The asymmetric effort problem:

AI can generate patches in seconds; review takes hours. Unlike human
contributors who learn from feedback and improve, AI models will repeat the
same mistakes. How do we prevent maintainer overload? There's no clear answer
yet.


Questions for the Summit:

1. Policy scope: Should we establish a kernel-wide minimum policy, or
    simply document that subsystem maintainers set their own rules?

2. Disclosure format: What should disclosure look like? Options discussed
    include:

    - Trailer tag (e.g., `Assisted-by:`, `Generated-by:`)
    - Below-the-cut note
    - Verbose commit log explanation
    - Technology-agnostic "tooling" terminology vs. AI-specific

3. Generation vs. review: AI for code review and debugging seems less
    controversial than AI for code generation. Should we treat these
    differently in policy?

4. What requires disclosure?: Where's the line? Clearly, wholesale
    AI-generated patches need disclosure. What about:

    - AI-suggested fixes that a human then implements?
    - Using AI to understand an API before writing code?
    - AI assistance with commit message wording?

5. Legal stance: Should we take a position on AI-generated code and DCO
    compliance, or leave that to individual contributors to assess?

6. Enforcement reality: We can't even get everyone to run checkpatch.
    Whatever policy we adopt, how do we think about enforcement?

Looking forward to the discussion.

-- 
Thanks,
Sasha

