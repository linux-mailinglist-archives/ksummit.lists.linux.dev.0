Return-Path: <ksummit+bounces-2458-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53949BC9138
	for <lists@lfdr.de>; Thu, 09 Oct 2025 14:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60E8719E622A
	for <lists@lfdr.de>; Thu,  9 Oct 2025 12:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92E778F59;
	Thu,  9 Oct 2025 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0FAgQTB"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA0A34BA39
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 12:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013623; cv=none; b=ja/rVaDUVviinvv67h7HVSzYX7trGQ32OOwbTjAEE9vqGeleA6X7cbD9aNK2VmEn/GxUg1Z5o5MRQWzlu5kKfos2UyvdQ0ey4DQvkC/DW6crWC1gtpObd03YTtMjpnCst2W10KeGoefBBC+s4NxAN4nHxF7Llzn5UPB6vPwuD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013623; c=relaxed/simple;
	bh=zPPNaW3l/IBTyKOgyu9qbflkK+SeAOYDS9d4ef3/swY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQxOffpUyxzuYQRYL2EDe1HFUbrk9l9U7HsTvs4joCj8yCJhsFbLvXIYeWITqn8YV9SxDP+eBG6zy6KTCfeDkabK5Bn44EPNhj59dsqzGl8yNlRBAPCPpR7VSjK9XGeronT8H+E8SRyxxtQ12OBDRHO7c1AB7KFRU83sjPVADlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0FAgQTB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE70C4CEE7;
	Thu,  9 Oct 2025 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760013622;
	bh=zPPNaW3l/IBTyKOgyu9qbflkK+SeAOYDS9d4ef3/swY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0FAgQTBiDZ1HlC+C+rTQMmjoSEnf67DQwFB5LDtmBBnbViYdPrTPljHZ6bmK8IHj
	 17/FyWmJPQmNnzEvgjEnY9WryS8ztCV8ARXotPpAuj3BY379iJnK3SuAHVpteIaegh
	 FuZMkqucTzn0sGf0jlCEzerbUu1eNwPleEW+vI1X20IBb0FVHC612mGPVKORmkdXbB
	 zGG9eh7kHgDEXa+UIGCq69qQgJBmjGBqMeGDSgenA+ydgkXmGDaTlKAI7DKQDX1xVB
	 tE6DXl1ARtFu1e72YkGL+4+SQK2AOPSzQkuzNX0ejlh+N1zeMacaO4bRhZiiiIq9ii
	 A3eoz1ByovGSQ==
Date: Thu, 9 Oct 2025 09:40:19 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chris Mason <clm@meta.com>, ksummit@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOetMx2M58NYfmP3@x1>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <2c04a89f-abd5-48c6-abfc-2e71d24e913f@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c04a89f-abd5-48c6-abfc-2e71d24e913f@lunn.ch>

On Wed, Oct 08, 2025 at 10:37:51PM +0200, Andrew Lunn wrote:
> > This raises the interesting and important question of how to get patch
> > submitters to follow a recommended workflow. We routinely get patches
> > that produce checkpatch errors that are clearly not false positives.
> > Rob Herring implemented a bot to run checks on device tree bindings and
> > device tree sources because lots of patches fail those checks. I'm sure
> > there are lots of other examples that have led maintainers to automate
> > checks on the receiver's side, through various types of standard CIs or
> > hand-made solutions. Submitters should run more tests, how to get them
> > to do so is a broader question.
 
> The netdev CI tooling is available from github. You can run it as a
> docker image. So it is possible for a netdev developer to run the same
> tests as netdev Maintainers do. Maybe we need more subsystems to make
> their CI tooling available to their developers so they can be run
> locally?
 
> It has also been pointed out elsewhere, b4 is gaining more testing
> capabilities. We should keep building this out, making subsystem
> tooling more subsystem specific, while b4 can do all the standard
> stuff we expect all developers to do before submission.

Yeah, if b4 would run these then the process would be streamlined,
great.

But the good thing would be to maybe have a CI see patches,
test/LLM/lint/kitchen sink it/etc them and sign them, giving it a "seal
of approval", or some brownie point that would then make procmail (or
equivalent) move this to a "special folder", that would be the first one
maintainers would read in the morning.

Maintainers would receive everything, as today, all of lkml/etc, but
some classification would be done so that they would look first at the
"good stuff".

I'd really love if running 'make -C tools/perf build', 'perf test' and
https://github.com/acmel/linux-tools-container-builds, after applying a
series would complete successfully. One can dream :-)

Even if all of this was done, I think b4 should do as you suggest,
checking one last time.

- Arnaldo

