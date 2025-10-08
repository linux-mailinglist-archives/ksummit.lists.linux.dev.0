Return-Path: <ksummit+bounces-2438-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F755BC6791
	for <lists@lfdr.de>; Wed, 08 Oct 2025 21:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31CB440492B
	for <lists@lfdr.de>; Wed,  8 Oct 2025 19:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EB12566E2;
	Wed,  8 Oct 2025 19:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeaflOBa"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56035246799
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 19:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759951698; cv=none; b=dJy9sAxNK7g1JF0FlTiQA1w/TLpWd4bbaFOt7jKwLZaeo7+4tjnogqBkemRYxZD6s41IoEQy65OZ0Hmgy8ArQ6TllFEPr1G44zQLJqF3rwkoYIg7YW1KPfIJCZsgLq5Wy10wXUjsqzz68ezrfZADtw22p2XaeJ011xnoDeSJUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759951698; c=relaxed/simple;
	bh=bbhdM8yS0Y8GaitQo9xffAV+z36e6vzrQBgFp8FlCzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfGumWisDuRG6hHRX3o8v346rnj1DJT1geIqSMYgqIXh2kZUZ87riysJj16cpGVfhu4UJqXEb4z8H0wrZKECOaHQXo9phJUOCjsGSSY/YKmUwKINRuCm/W+SlXuIHesyRXIofgYV+xZyiaIuhpkijB+8S5VsAmxDlUJCpZKPHvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeaflOBa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563E1C4CEE7;
	Wed,  8 Oct 2025 19:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759951697;
	bh=bbhdM8yS0Y8GaitQo9xffAV+z36e6vzrQBgFp8FlCzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SeaflOBaDJmwF3dPKw4Bce7zVj8+1lOQJ+cAE98hGzlLTqPoPbSSutFYxc+mHw87A
	 MEp085avh3g073JTtEgb+EXXpEi3rcpZF4su3QV4KJ2NIpMJ/mquIxXi32H8WNgNxw
	 wgF1k6vqJgXlqZSPRJlDUHba6R597WjwcEjVxCjqu8FyiLTYDMPD4y08Sq37qOrwLr
	 evHuxN9TfzvhYiqNMgDH2w0/AyvD8vW9lsNSYamS4z2ygN9lQgPYBh/DX5wXIb/rMl
	 3lbJbeEC5PeZ4BcwX2b3l64zu/EPxkdm677NaVsSNYCaEqxSqvAd/lLw2SF+kTvFP/
	 pLqG4xeen/qMA==
Date: Wed, 8 Oct 2025 16:28:14 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chris Mason <clm@meta.com>, ksummit@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOa7Tn0QbXwL-Ydo@x1>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>

On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
> > My goal for KS/MS is to discuss how to enable maintainers to use review
> > automation tools to lower their workload.
 
> Maintainers will want to use these tools, if they prove to be useful.

Right.

> But ideally, we want the developers to use these tools and fix
> the issues before they post code for review.

Sure, as before, people should try to follow the best practices before
sending pull requests, its in the best interest of everybody.

But if they do so, and I guess most will, there will be more patches
flowing upstream, thus Chris effort, I think, right?

> That reduces the maintainers workload even more. So Maintainers just
> need to run the tools to prove that the developers have run the tools
> and have already fixed the problems.

I think tools evolve and competing tools may provide different results,
so the more tools that are used, in all steps, there will be a greater
chance of catching things _before_ maintainers have to look at
something.

As b4 does all sorts of checks, making sure that the patch was vetted by
whatever automation before it hits their inboxes seems to reduce the
number of steps maintainers will have to perform.

- Arnaldo
 
> So i'm not sure your goal is the correct long term goal. It should be
> a tool for everybody, not just maintainers.
> 
>      Andrew

