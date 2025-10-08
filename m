Return-Path: <ksummit+bounces-2429-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E61FBBC6231
	for <lists@lfdr.de>; Wed, 08 Oct 2025 19:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347E83B9F08
	for <lists@lfdr.de>; Wed,  8 Oct 2025 17:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BE12BD036;
	Wed,  8 Oct 2025 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UuMXg0K1"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187F91F462D
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 17:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759944025; cv=none; b=X7ILff5lNl3WuZjEJRFn/vlcjb+bnVGonI7n5QWGDiSKKu5b1xJbTvVcsedl3hfjrQlj0X/kZtiOXl/PHrWn4LONvpgjs0bAu5+bFKlvG+ebRMq5KfrgaWwPNHtAgNBGY0OGlzcTpZ0soApICZI5nge575XkKZ8/c+tjHCNFX9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759944025; c=relaxed/simple;
	bh=KA1tU83NbKCMtMsOPUn940BgdVTHAcgLh2Au5MBj3V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/rjddS+nBpWOeTrOn4zsHnXYRkvGSZcDjzs0h8P+l4kfkknRkCn6ReOFjT00p7gKOkeVcMHvnKqraCTIc7WHTVEvmT/YVknXVFsjCrlQNbS8Zuh4tQaLef3yQvuu2mwtisTP9nt0QCawBcCw8Jp7LxKT5mONRkVKiBGRb2niEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UuMXg0K1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D48AC4CEF4;
	Wed,  8 Oct 2025 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759944022;
	bh=KA1tU83NbKCMtMsOPUn940BgdVTHAcgLh2Au5MBj3V4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UuMXg0K1aU4uXPv7jbQiUq2BpUptJ9lqzrB7oBnpXvzffKqe9JBnf9a+/Ho3QOY6T
	 TaN9i1xRgXZ+2ohp6vRh9eceUPQ8zkU/wbpBU1rGqySs9cUPHXgUS4S8TX8WF7D8Nn
	 5oHzxpuEGX3L6eHGPFJyO9fCYpg/ahQDNnkn+zbE=
Date: Wed, 8 Oct 2025 13:20:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Chris Mason <clm@meta.com>
Cc: ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251008-lively-vermilion-snail-beff9a@lemur>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>

On Wed, Oct 08, 2025 at 01:04:54PM -0400, Chris Mason wrote:
> My goal for KS/MS is to discuss how to enable maintainers to use review
> automation tools to lower their workload.  I don't want to build new CI
> here, so the goal would be enabling integration with existing CI.
> 
> My question for everyone is what would it take to make all of this
> useful? 

I am generally of the opinion that it's more useful to talk about it than to
ignore it. Clearly, this is a controversial subject -- many will liken
introducing proprietary AI tooling to what happened with bitkeeper.

I've been working on incorporating series summarization with b4, but I'm
trying to make it work with ollama/gemma3 so as not to introduce a proprietary
dependency. My results are probably a lot more hit-and-miss than with Claude
4.5 Sonnet -- but I find it hard to judge because the summaries *look*
reasonably good to someone who is not a maintainer of that particular
subsystem.

Maybe it's more of a BoF session material?

-K

