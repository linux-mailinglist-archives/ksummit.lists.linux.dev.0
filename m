Return-Path: <ksummit+bounces-2448-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92429BC6A47
	for <lists@lfdr.de>; Wed, 08 Oct 2025 23:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DC1A3AB8D8
	for <lists@lfdr.de>; Wed,  8 Oct 2025 21:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9137F2BE05E;
	Wed,  8 Oct 2025 21:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbNNLvu7"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DDE24EA81
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 21:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759957710; cv=none; b=TzGc3SA19JywvXnis3l7IiRsQqPbAg9kIGYAyWlT0KQFGLcg6JTPU9n6jIjeKtCUXOYOZ1muqjzLJagzM+uI/qaRkqaud/FADq/ZPIrfjshvMC9vQ0zgzbmZI5bVVZ3bSR3kxOuCBfm3scOInl3WQDIWUqqsHghFHPb0YvREneE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759957710; c=relaxed/simple;
	bh=Csf8szQiIzxpDBndSJo0VozA5lZXfktKBUYk5r+JO3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDF24bc/4L4phLHv9yYW0qcuuxzuX4Q3OmnLBdH7R14jlRktnxNqpj+scA8Sa+hwMLIaAq8/TPw63kfrIgVuAcaaWCbf10pKplq0Is2PXWjktEqEzXZAOU/xUjuJ8nFCRfNNSDs8CwOKFpPw60NWhKpQ9ezmdzQNFt25DSAcVoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbNNLvu7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE54C4CEE7;
	Wed,  8 Oct 2025 21:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759957709;
	bh=Csf8szQiIzxpDBndSJo0VozA5lZXfktKBUYk5r+JO3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbNNLvu7i/wwqnLUqLm/mTqbFkqMkPcUb1v8QmjJUcUz3YGw7Qg33kLJ/eHbiKHGZ
	 wIPo+JaEwSV8EhUbPXyXO89BR+53T8KgUUHO6IzKWw0oK2Yr7Mb4KMKfnr7TZq6icx
	 9VALQLDdRTWGT6XJHR9eWhanDufZQPivXTpCWFTnwyDBfVGuR5IXjCecDyWNWqC1Uw
	 NQ70NrM3v2lPOS3WAC72YHC/TaDusD/Ya66xcsGwQ3EtKMFi+0wJiARQLF10btFQ0A
	 YjmOm+7x8ALZx48kQiw1MK/ksrhKSRAUFhAu8cUVxKG9yzkCKyQeFOgfiEu+QjYzXS
	 8EDvRgJ2tsx5Q==
Date: Wed, 8 Oct 2025 14:08:29 -0700
From: Kees Cook <kees@kernel.org>
To: Chris Mason <clm@meta.com>
Cc: Bart Van Assche <bvanassche@acm.org>, ksummit@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <202510081355.99CCDF8A8C@keescook>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <28cd7001-0a24-4dff-a4c7-714495bff7f0@acm.org>
 <3ffd9164-919e-4fea-8597-601452537331@meta.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ffd9164-919e-4fea-8597-601452537331@meta.com>

On Wed, Oct 08, 2025 at 02:04:26PM -0400, Chris Mason wrote:
> Claude really needs aggressive use of checklists to get it to stay
> focused, other AIs may need other tricks.

So very very true. "I did the high priority stuff; I'm finished now".

Your prompts are very detailed! Have you been able to use a feedback loop
at all to have it update its own prompts to help you clarify its results?
I've found that pretty helpful for development-oriented prompting. i.e.
"Compare the foo.md file to what you now know about the foo process
and update it to reflect anything that needs to be added, removed,
or changed."

Additionally, have you been able to build any patterns from existing
bugs? The "Pattern ID" stuff feels like you built this from specific
instances?

I'm really curious if the "CONTEXT MANAGEMENT" section actually works? I
never considered tell it to discard specific context like you have,
"Discard non-essential details after each phase to manage token limits"
I'm going to try that immediately -- I just have to figure out how to
give it, uh, context about the context I want dropped.

And the semcode MCP sounds very interesting! I look forward to finding
out more about that. :)

Awesome!

-Kees

-- 
Kees Cook

