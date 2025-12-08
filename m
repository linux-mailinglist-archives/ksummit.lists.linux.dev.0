Return-Path: <ksummit+bounces-2652-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFECCABB7F
	for <lists@lfdr.de>; Mon, 08 Dec 2025 02:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27B223005D1B
	for <lists@lfdr.de>; Mon,  8 Dec 2025 01:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4B71FECCD;
	Mon,  8 Dec 2025 01:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="E8EGgJv4"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF971F4168
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765157140; cv=none; b=c3Hbe3TmZxhMzYZ4xeV2tPHUTqARkGimlTm7WI2gS8xYiQc5DvvfrTF/3jNBZfDKiLizeMF5f0fVbvlPFjVeOIZfi/3sDpYcG/Pnam52GLX3XPAPFZl7oUu8lR7DT94tZ8iV64QFM2pTCBDu/0wugvVpXmC68mk4GyIZWoQ8fzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765157140; c=relaxed/simple;
	bh=HVFvvCWfaMy91mSsleiyeRNVc/85z7uk9VNNyqSh5IA=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lx0ku4sxcidWGqWK2vDAuHrakDzLYSfWLx5cVkcRSTk0g3hfKwf3pZBqQOYHs47Z86rcHzhBVJR2SQSmM4R6DKQeE1wQbkNjOiYGqY7ZC43qxEBWt67Je7O8TblJuZQamKW1mFDPNBJHBl9Oh7dHqORUKZ7GNU6jGbXTXbWalBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=E8EGgJv4; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net ([172.59.162.254])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5B81PKu42001081
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 7 Dec 2025 17:25:21 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5B81PKu42001081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025112201; t=1765157123;
	bh=z57PJd5/42W5koQ4rOdMykq+HP2O8nTRQ5Q87oYfFFU=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=E8EGgJv4ni24ao88UowCqMMpcKE5pcIwv94/VGZr65+7PZNQeme7c+s2xehrPFUbs
	 pgSADJepCsBamMn1z16HRyhpwC2WY8OlgpddiRVSQ7Uea3yDQmc9Aa0F1Gk1GQrsoi
	 u1xgmXmdl/h4LN7DAa1BAns4dETns6HtQMWAA2K9SLolyUhefmkObUfr4DeduSHW4A
	 CGDPVLJIfsILh/Y/yQ5VJQDCkPhme8WlluS2kOcWcq+aHeMytqSMdSzWkC4P/3lr5f
	 p0CLLTQn5QitKsB/Mt29yWDtJJs/+jLrHrCP46UngXniOMV1DRjWsd5pfLfTKE6fQr
	 4OIkgQzgNgfmA==
Date: Sun, 07 Dec 2025 17:25:13 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BMAINTAINERS_SUMMIT=5D_The_role_o?=
 =?US-ASCII?Q?f_AI_and_LLMs_in_the_kernel_process?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aTYmE53i3FJ_lJH2@laps>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local> <aTYmE53i3FJ_lJH2@laps>
Message-ID: <4BDD9351-E58A-4951-9953-00F1E9F24FB4@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On December 7, 2025 5:12:51 PM PST, Sasha Levin <sashal@kernel=2Eorg> wrote=
:
>This (and parallel) threads have generated substantial discussion across
>several related topics=2E  In preperation for the Maintainer's summit, he=
re's a
>summary of where we appear to have consensus, where we don't, and some
>questions to consider before the summit=2E
>
>Where We Have Consensus:
>
>1=2E Human accountability is non-negotiable:
>
>The From: line must always be a human who takes full responsibility for t=
he
>patch=2E No "but the AI wrote that part" excuses=2E This maps cleanly to =
our
>existing DCO requirements and approach to tooling=2E
>
>2=2E Some form of disclosure is needed:
>
>Whether it's a trailer tag, a note below the cut line, or something else,
>there's broad agreement that AI involvement should be disclosed=2E The ex=
act
>mechanism is debatable, but the principle is not=2E
>
>3=2E Maintainer autonomy matters:
>
>Individual subsystem maintainers should be empowered to set their own pol=
icies=2E
>An opt-in approach per-subsystem seems preferred over a kernel-wide manda=
te
>that doesn't account for different subsystem needs=2E
>
>4=2E This isn't going away:
>
>Industry is already using AI extensively=2E We're already receiving AI-ge=
nerated
>bug reports=2E Ignoring this won't make it disappear; better to have a th=
oughtful
>policy than no policy=2E
>
>5=2E Language assistance for non-native speakers is legitimate
>
>Using AI to improve documentation and commit messages should not be stigm=
atized
>or treated the same as AI-generated code=2E
>
>
>Where We Don't Have Consensus:
>
>1=2E The nature of AI errors:
>
>Some argue AI makes fundamentally different errors than humans - subtle
>mistakes that slip past review because we're trained to spot human-patter=
n
>errors=2E Others argue AI errors are obvious when the model is under-trai=
ned, and
>that better training can address most issues=2E This affects how much scr=
utiny
>AI-assisted patches need=2E
>
>2=2E Same bar or higher bar?
>
>The kernel already has a significant bug rate - roughly 20% of commits in=
 a
>release cycle are fixes=2E Should we hold AI to the same standard we hold=
 humans,
>or does the kernel's criticality demand a higher bar for AI? There's genu=
ine
>disagreement here=2E
>
>3=2E Legal risk tolerance:
>
>DCO clause (a) requires certifying "I have the right to submit it under t=
he
>open source license=2E" With AI training data provenance unclear and liti=
gation
>ongoing, how cautious should we be? Some advocate waiting for legal clari=
ty;
>others argue the legal concerns are overblown and we should focus on prac=
tical
>guardrails=2E
>
>4=2E The asymmetric effort problem:
>
>AI can generate patches in seconds; review takes hours=2E Unlike human
>contributors who learn from feedback and improve, AI models will repeat t=
he
>same mistakes=2E How do we prevent maintainer overload? There's no clear =
answer
>yet=2E
>
>
>Questions for the Summit:
>
>1=2E Policy scope: Should we establish a kernel-wide minimum policy, or
>   simply document that subsystem maintainers set their own rules?
>
>2=2E Disclosure format: What should disclosure look like? Options discuss=
ed
>   include:
>
>   - Trailer tag (e=2Eg=2E, `Assisted-by:`, `Generated-by:`)
>   - Below-the-cut note
>   - Verbose commit log explanation
>   - Technology-agnostic "tooling" terminology vs=2E AI-specific
>
>3=2E Generation vs=2E review: AI for code review and debugging seems less
>   controversial than AI for code generation=2E Should we treat these
>   differently in policy?
>
>4=2E What requires disclosure?: Where's the line? Clearly, wholesale
>   AI-generated patches need disclosure=2E What about:
>
>   - AI-suggested fixes that a human then implements?
>   - Using AI to understand an API before writing code?
>   - AI assistance with commit message wording?
>
>5=2E Legal stance: Should we take a position on AI-generated code and DCO
>   compliance, or leave that to individual contributors to assess?
>
>6=2E Enforcement reality: We can't even get everyone to run checkpatch=2E
>   Whatever policy we adopt, how do we think about enforcement?
>
>Looking forward to the discussion=2E
>

I contend there is a huge difference between *code* and descriptions/docum=
entation/=2E=2E=2E

Although git is an enormous help, it is still far harder to unwind code th=
an the auxiliary stuff=2E=20

AI bug reports? We have gotten robot bug reports for decades=2E Translatio=
n tool? Not a problem=2E Using AI to get ideas? Not really different than r=
eading out of a textbook=20

However, *code* taken out of an AI seems to me that it would have to be pr=
esumed plagiarized=2E Furthermore, it is very often wrong in both subtle an=
d blatant ways=2E

