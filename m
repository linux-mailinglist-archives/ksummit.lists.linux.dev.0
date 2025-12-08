Return-Path: <ksummit+bounces-2656-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8967BCAC062
	for <lists@lfdr.de>; Mon, 08 Dec 2025 05:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D0B8300D405
	for <lists@lfdr.de>; Mon,  8 Dec 2025 04:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FEB2FD673;
	Mon,  8 Dec 2025 04:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WhBL4hfx"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B92F9DBB
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 04:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765167787; cv=none; b=qhuETDV3VDv7G3TCHFW6VdPPRfCLieaycADY06194PmFR/IHg8n4X9OCTNas/N4NtjzG0Ae/seY5NFbmEtaroh+fLABl82ppgic3ybXUiMVGURzy8RFp5j0XNWswZFyjv/lz3ChnNvcnK9atFG+zmkDdTbNZd7DF+hArjO4bq30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765167787; c=relaxed/simple;
	bh=7ANo9qqfVI3hp5t4F71K/KcTJEo5JFpPmuyplvatjPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVTbLgB4sO+OyQ+2lCUIUQ+YnNigoK5woGULJ7pQV4x0alCqxPs7/Z0Z6WFsv9qCxpGVTiVoMCN7ch9CTeVc3uxRpSTLBWoMORK7UyFqGYRVOOE0lNrW0DjpJl0LCtwF2oggkgbIDSQo5crlmdf+WJl+ah4l+0sN4mFCRLKFwio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WhBL4hfx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (p7838222-ipoefx.ipoe.ocn.ne.jp [123.225.39.221])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0CD0389A;
	Mon,  8 Dec 2025 05:13:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765167188;
	bh=7ANo9qqfVI3hp5t4F71K/KcTJEo5JFpPmuyplvatjPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhBL4hfxXOmoP5wpcmG8WhXZ3B6YXdViLqYE/ZgGvMnV+wCErgqnW3mqZjox1sAk5
	 JXULtpt3ZqoyrIiuaZPNuKpCESgORcENCKFJSUGzvz3vKMJx8/DEHs39poPqCJJiKj
	 EE3aIfWQaYVyedRv1AsMg2LpWctGNIdVomAUp/LQ=
Date: Mon, 8 Dec 2025 13:15:07 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20251208041507.GB30348@pendragon.ideasonboard.com>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <aTYmE53i3FJ_lJH2@laps>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aTYmE53i3FJ_lJH2@laps>

Hi Sasha,

Thank you for summarizing the long discussions. I won't ask if this
summary has been written by an LLM :-)

On Sun, Dec 07, 2025 at 08:12:51PM -0500, Sasha Levin wrote:
> This (and parallel) threads have generated substantial discussion across
> several related topics.  In preperation for the Maintainer's summit, here's a
> summary of where we appear to have consensus, where we don't, and some
> questions to consider before the summit.
> 
> Where We Have Consensus:
> 
> 1. Human accountability is non-negotiable:
> 
> The From: line must always be a human who takes full responsibility for the
> patch. No "but the AI wrote that part" excuses. This maps cleanly to our
> existing DCO requirements and approach to tooling.
> 
> 2. Some form of disclosure is needed:
> 
> Whether it's a trailer tag, a note below the cut line, or something else,
> there's broad agreement that AI involvement should be disclosed. The exact
> mechanism is debatable, but the principle is not.
> 
> 3. Maintainer autonomy matters:
> 
> Individual subsystem maintainers should be empowered to set their own policies.
> An opt-in approach per-subsystem seems preferred over a kernel-wide mandate
> that doesn't account for different subsystem needs.
> 
> 4. This isn't going away:
> 
> Industry is already using AI extensively. We're already receiving AI-generated
> bug reports. Ignoring this won't make it disappear; better to have a thoughtful
> policy than no policy.
> 
> 5. Language assistance for non-native speakers is legitimate
> 
> Using AI to improve documentation and commit messages should not be stigmatized
> or treated the same as AI-generated code.
> 
> 
> Where We Don't Have Consensus:
> 
> 1. The nature of AI errors:
> 
> Some argue AI makes fundamentally different errors than humans - subtle
> mistakes that slip past review because we're trained to spot human-pattern
> errors. Others argue AI errors are obvious when the model is under-trained, and
> that better training can address most issues. This affects how much scrutiny
> AI-assisted patches need.
> 
> 2. Same bar or higher bar?
> 
> The kernel already has a significant bug rate - roughly 20% of commits in a
> release cycle are fixes. Should we hold AI to the same standard we hold humans,
> or does the kernel's criticality demand a higher bar for AI? There's genuine
> disagreement here.
> 
> 3. Legal risk tolerance:
> 
> DCO clause (a) requires certifying "I have the right to submit it under the
> open source license." With AI training data provenance unclear and litigation
> ongoing, how cautious should we be? Some advocate waiting for legal clarity;
> others argue the legal concerns are overblown and we should focus on practical
> guardrails.
> 
> 4. The asymmetric effort problem:
> 
> AI can generate patches in seconds; review takes hours. Unlike human
> contributors who learn from feedback and improve, AI models will repeat the
> same mistakes. How do we prevent maintainer overload? There's no clear answer
> yet.
> 
> 
> Questions for the Summit:
> 
> 1. Policy scope: Should we establish a kernel-wide minimum policy, or
>     simply document that subsystem maintainers set their own rules?
> 
> 2. Disclosure format: What should disclosure look like? Options discussed
>     include:
> 
>     - Trailer tag (e.g., `Assisted-by:`, `Generated-by:`)
>     - Below-the-cut note
>     - Verbose commit log explanation
>     - Technology-agnostic "tooling" terminology vs. AI-specific
> 
> 3. Generation vs. review: AI for code review and debugging seems less
>     controversial than AI for code generation. Should we treat these
>     differently in policy?
> 
> 4. What requires disclosure?: Where's the line? Clearly, wholesale
>     AI-generated patches need disclosure. What about:
> 
>     - AI-suggested fixes that a human then implements?
>     - Using AI to understand an API before writing code?
>     - AI assistance with commit message wording?
> 
> 5. Legal stance: Should we take a position on AI-generated code and DCO
>     compliance, or leave that to individual contributors to assess?
> 
> 6. Enforcement reality: We can't even get everyone to run checkpatch.
>     Whatever policy we adopt, how do we think about enforcement?

This is a pretty good summary. It's missing one point in my opinion,
partly related to the legal stance: the ethical stance.

The Linux kernel is governed by the GPL. There are contributors who care
about the copyleft aspect of the license. Even if the legal issues get
cleared in the future, not everybody will agree that usage of GPL code
as input to create proprietary LLMs is ethical: it may not breach the
letter of the license while breaching the spirit. I would like to see
this question being discussed.

> Looking forward to the discussion.

-- 
Regards,

Laurent Pinchart

