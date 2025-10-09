Return-Path: <ksummit+bounces-2462-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F782BC99E6
	for <lists@lfdr.de>; Thu, 09 Oct 2025 16:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AD6119E1D00
	for <lists@lfdr.de>; Thu,  9 Oct 2025 14:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E912EAB9F;
	Thu,  9 Oct 2025 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihQiY0mj"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8DD2E7185
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021397; cv=none; b=ic6e6kcbSSzFp8WmStZaZ2l4ab0jonNnLeEmU8jHxwFnEzG4P2biMAnQtfp7U9CAsMek92nKU3GmYTHgl/pT961lp0s9cx59FG7j13awGjfG9+VUMl4maM1ivlFMEFTmyZVS06Jv+C9cCrV/UF6LokS6HKopJM3IbITl8sRsYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021397; c=relaxed/simple;
	bh=ht7hG01etfkIdjPGAeo7HFMLvAXGQV6q3avL82vl77g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1lQ+FWLOgqDMofhAxPmSPkiOnEctDUMKx2jDRnao4cMqDpIB8EAf1nclwuP9yn3peq91UK59ZTmx+2t5ehEuewIWp7eeoi5YG0qRPJnaabb2JeQuPgTi/cZvlB9yf/3sc1XIUN+4DT3TpxsudtDiq4AHuNOlRnoqJT2hG+EcUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihQiY0mj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFE0C4CEE7;
	Thu,  9 Oct 2025 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760021397;
	bh=ht7hG01etfkIdjPGAeo7HFMLvAXGQV6q3avL82vl77g=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ihQiY0mjOFL+HYyTvsTPGNZll8E6A0T+XHsMp8ZBYwsB6+ZC+y80juTrER3RsQHOZ
	 ZNM547AhgYGSKxFmuQltnjNkuIgtzVEhlV6jkGNX/V1SZa65Pa4/rYZ/cPn4OjzWvp
	 gZsCK36MNE9SObHE/nmA67g6PV7CY6T5unCMqKoVO5MOzvYlzzjuiPcFq0ZhgWb4uI
	 X6pjY4W440wY1d8Do3cNSgFvWhNJlRlr3/XNqOkY8tUz+85u8bam3jSWzBGWRCs1or
	 JsENHt+5uRfMu24WNDXVZsL3nN9uJRsfeeWAQ5GBnxNnGSVaVGGJ7cwR0rYPHRwi/4
	 gD/sCB37p9O0w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 96948CE0D18; Thu,  9 Oct 2025 07:49:56 -0700 (PDT)
Date: Thu, 9 Oct 2025 07:49:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Chris Mason <clm@meta.com>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <2ae237ad-d59e-4b9d-862c-f01d8254d143@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <aOaujzH1dl-OEbsO@laps>
 <796882a3-cb05-41a9-b7ca-8af49a05623f@meta.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <796882a3-cb05-41a9-b7ca-8af49a05623f@meta.com>

On Wed, Oct 08, 2025 at 09:43:48PM -0400, Chris Mason wrote:
> On 10/8/25 2:33 PM, Sasha Levin wrote:
> > On Wed, Oct 08, 2025 at 01:04:54PM -0400, Chris Mason wrote:

[ . . . ]

> >> There's definitely overlap between the bugs I'm finding and the bugs Dan
> >> Carpenter finds, so I'm hoping he and I can team up as well.
> >>
> >> In terms of actual review details, the reviews have two parts:
> >>
> >> 1) The review prompts.  These are stand alone and can just work on any
> >> kernel tree.  This is what BPF CI is currently using:
> >>
> >> https://github.com/masoncl/review-prompts/ 
> > 
> > I think I'll borrow some of these :)
> > 
> > It was interesting to read through some of the prompts and see where you
> > had
> > good and bad experience with the AI ("You're not smart enough to understand
> > smp_mb()" :D )
> 
> If I'm being honest, I'm probably not smart enough to teach AI about
> smp_mb(), but that's a different problem.

Ask the AI to read tools/memory-model and Documentation/memory-barriers.txt?

More seriously, yes, the AI might need considerable background information
to make sense of the .bell and .cat files.

						Thanx, Paul

