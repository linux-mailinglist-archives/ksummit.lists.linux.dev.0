Return-Path: <ksummit+bounces-2153-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E46B2B175
	for <lists@lfdr.de>; Mon, 18 Aug 2025 21:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD770564A6C
	for <lists@lfdr.de>; Mon, 18 Aug 2025 19:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56FA27280B;
	Mon, 18 Aug 2025 19:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLqUIlrB"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F3288A2
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 19:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755544771; cv=none; b=pYDmKioUfjGYRifJHoz/bvoAfdNqA3YarJcEkZ5FocCVu01oc1ET879V7lkzaDgnA72rYa6E1rcLligo+AsTPlOpuYOnfQ/b+Zrp8vgN8S9+ISHkc/PFNMDtVTDFsvgbI9pzczhhVH2fd1TBgmk7X5+KT057fa6X7JtcEIfXnRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755544771; c=relaxed/simple;
	bh=L4KadCrxAJhkhsvbhg5ESLrQXN8h+dSvb+FevdSn7TU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DgZMPEtCyN3zmlZyGoYMM0d8UhpuVM6It7t+rYMgof7UDWH3Xe6Bxy+MaSQ+l9RyTszEWl5Mv+PYtdUgbp2Pyzf2eYAjI6mzaRDM3x5uwa77PmEWeDSFWBs6SXprSe7jmOvY6j45dZVZm3ZebJ7h/LBDJ29Ns04eYySqxwLUdJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLqUIlrB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F57CC19425;
	Mon, 18 Aug 2025 19:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755544770;
	bh=L4KadCrxAJhkhsvbhg5ESLrQXN8h+dSvb+FevdSn7TU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PLqUIlrBr4i/aHVDgznnp4+5oaSqBhiVskT0SaGtK4XY6cDXfhTFAWEqdkCsfL/YQ
	 87vYU8XMjL1p3LKYHZqxx3DY8r9rIBakoJbDPcEbRljIPYrbHmViXE9Jom3jgful7g
	 axLhcwzGyEPeZ5WPpf+1jKD1XIasS+BD3Sbz8metuEPn6D5uinDdb+jGaJyIUnHZ2a
	 9pRRr7Ire6SgqLElgBAiIZ1VDVFu1FhAS/A8IKico4Q3co2COpp+zAWujoRavnmRZV
	 4k+a8Xng6RUSdhuku8R3Xq6agVm2bRAi+NmkywuTx3LjjkfNwSzeEzYHjaCmNFNGwC
	 X2sGfgN7X0n0w==
Date: Mon, 18 Aug 2025 21:19:27 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
cc: James Bottomley <James.Bottomley@HansenPartnership.com>, 
    paulmck@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
    Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
In-Reply-To: <20250818211354.697cb25a@foz.lan>
Message-ID: <6o4sp81n-q5rr-6n92-o48o-4pr34s9n426q@xreary.bet>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org> <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <20250818211354.697cb25a@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Aug 2025, Mauro Carvalho Chehab wrote:

> On my tests with AI, humans need to modify it anyway. It reminds me
> the (not so) good old code generators we had in the past: AI-generated
> code, even when it works, it usually have unneeded steps and other
> caveats that require human interaction to clean it up and fix.
> 
> I got good results with AI for things like generating unit tests, but
> once tests are generated, still 50%-60% of them fails because AI
> did stupid things, like not counting whitespaces right, and even
> sometimes forgetting parameters and arguments.
> 
> From several aspects, it looks like contact a very junior intern
> that knows a programming language and code really fast, but it has
> no glue about how to generate a production quality level code.
> 
> After dozens of interactions, the code can be used as the bases for
> a senior professional to modify it and have something ready for
> merging.
> 
> The net result is that:
> 
> 1. AI alone doesn't produce a ready-to-merge code;
> 2. Lots of refinement requirements made by humans to shape the code 
>    into something that actually works;
> 3. During AI interaction, human has to intervene several times to
>    avoid AI to hallucinate. Sometimes, it also has to close the
>    chat and open again - or even use a different LLM model when
>    AI can't converge;
> 4. At best scenario, human still needs to read the code and carefully
>    modify for it to make sense; at worse, it has to write its own
>    code, eventually using some suggestions from the AI hallucination.

And the point is -- this all has now been much more easily available, and 
the increase pressure on maintainers is inevitable (pretty much everybody 
is now capable of submitting OK-ish looking code), so the 
submitter/maintainer ratio might become very unfair/unbalanced.

Hence the need (I believe) to require proper annotation, even with all the 
legal aspect aside.

Thanks,

-- 
Jiri Kosina
SUSE Labs


