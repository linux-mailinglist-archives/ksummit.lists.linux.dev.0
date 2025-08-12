Return-Path: <ksummit+bounces-2135-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E255B22B9B
	for <lists@lfdr.de>; Tue, 12 Aug 2025 17:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D749F1A22E3B
	for <lists@lfdr.de>; Tue, 12 Aug 2025 15:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056EF2F547C;
	Tue, 12 Aug 2025 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bvbb+dr8"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5D2F5478
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012252; cv=none; b=MhyYKENw/UYUb6tnytwUK0OsgGzPyH2i0WOZXiFWxcTGQodWQ8FpnM6Hc/UaY/7dFJ0FYdh+CwPGkPLrfxA/GIEnomTQnrEYQNUotcNcCdHnCAq8eWCqcnbzxBU0CkqLCwwZTgSI3d+7+bzXDa+pS7spxxgeI/VJwploRM7NZXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012252; c=relaxed/simple;
	bh=YZkldFcLZXUfaiZdHTG0FNFJoXGSRnNhmDKbU8yKz4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGFRlaeAkql9GiHIqKdcb7C6EaYu4of4nizevxBvP7HpeNHNyfyUfHxhtSUdkoqbwm10reVkMhECA13FvI/Qt6OvW9ytgmnK+k34Qo5AxYPAcVs4Kqr53nOsyT708Du2gkckj5bx3zlN2RCs2cHr+b3RL5tfDFGMqDQ9xjkFoLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bvbb+dr8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA4BC4CEF0;
	Tue, 12 Aug 2025 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755012252;
	bh=YZkldFcLZXUfaiZdHTG0FNFJoXGSRnNhmDKbU8yKz4o=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Bvbb+dr8JQFjXNkicc0uRztvS+q/wXwhOoMkS1Hvyf3xPVQyH1Veg+CPDF3pJuLOz
	 m9oM0VttHGDBoh+EROk9X5yzLyAYWxNpRyxQmYmc9BBc0BWwaceXPdhdsmu4sRXxuG
	 sIcw4h1rl5Z66TC55Yz8HGetFPNkzaLMWRekeTWuUiGCkZbq3e20aLEjtmYxKKZMps
	 sjaVrAxUpAgL/C+NDw6+afv6+6LmDGtHef6G1H0ACnResWGSZgfKyhW85TZ0lKOuP5
	 6BIJj3WPlFtzIgA5+Kjv+zJcPCRX51vsWHzzk+RF4k25opUbbxZLAnW2OqmKQ27sts
	 BdKtkQDKAaQoA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9A041CE0AB1; Tue, 12 Aug 2025 08:24:11 -0700 (PDT)
Date: Tue, 12 Aug 2025 08:24:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	"H. Peter Anvin" <hpa@zytor.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <3023b60f-69cf-4d77-b57e-c294d646daa7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
 <alpine.DEB.2.22.394.2508060747440.3518@hadrien>
 <e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
 <d877a0d2-28b4-4231-87bb-4c7b8c10eefe@lucifer.local>
 <20250812103710.5faf83fc@gandalf.local.home>
 <aJtXmi6IFaH4ST_s@lappy>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJtXmi6IFaH4ST_s@lappy>

On Tue, Aug 12, 2025 at 11:02:50AM -0400, Sasha Levin wrote:
> On Tue, Aug 12, 2025 at 10:37:10AM -0400, Steven Rostedt wrote:
> > One thing I look forward to with AI is that it will likely help me debug my
> > own code. I suspect it would be really good at reading my code and say
> > "Hey Stupid! You forgot to free this value over here". And things like that.
> > In other words, I trust AI to debug my code more than I can debug its code.
> 
> I'm surprised that this isn't too common of a practice at this point.
> Sure, AI will make mistakes, but I think that:
> 
> 1. It's much better at reviewing rather than writing.
> 2. Mistakes aren't critical (you'd review it yourself anyway).
> 3. No legal issues.

Ahem.  Please do us all a favor, yourself included, and go count the
number of lawsuits currently in flight on this topic.

						Thanx, Paul

