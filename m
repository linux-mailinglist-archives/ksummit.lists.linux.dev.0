Return-Path: <ksummit+bounces-2439-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0EFBC6797
	for <lists@lfdr.de>; Wed, 08 Oct 2025 21:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14E0D404966
	for <lists@lfdr.de>; Wed,  8 Oct 2025 19:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BCF2586E8;
	Wed,  8 Oct 2025 19:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LL4UYg7l"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF319F464
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759951785; cv=none; b=mE3AOUkIZ7aBHhqHS4zxyh3ob/EjCLNgacBvYq3l9jZDMw4Xnhdz5Qb5VXB9W1lth0HoIDHa0WKbkuYG3ZhB3a3kn8fMC4RGJea8UNWEyECVMACKjS0UwsIsPfufsydwtDkO2OHdNFQVxUKZyy/QWNDDBEa8inqcLuiRyA5DeVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759951785; c=relaxed/simple;
	bh=m7c5jYfZHvPzHzUdGNszggjiG6dn0azMrvKlRwZVdD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0/MyAXrxt/e1iEdsr8Yv7F/yd/xgoIPXCesszzUexi8vu9zxw3dq+WftznNfG5pN6Hr2jUHYKIhDdL83+aBlFPoqCB1yia5y7gcFYj8ZjTtRo3j8W9O3Xf9JYzjkcxxJFFpxM8IFuMTy/+K/v08OKG7BQlszbP5kdoo2Ad8Qoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LL4UYg7l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CD10E1831;
	Wed,  8 Oct 2025 21:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759951688;
	bh=m7c5jYfZHvPzHzUdGNszggjiG6dn0azMrvKlRwZVdD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LL4UYg7lgCgJlwSkczpN8OyCvChViyqkhR+TRQzitdp20/Xr5D+vuR1/Jej+yovqF
	 9bNSXGeAH0oRiRhNilPvOQX6AqXtBRGAHdJxLL0aaWcVTn/v1+zInTpT5pGYKDwHqb
	 MiVxzwZO22n8h2NrK0D4bs98LQTyzYHRmbvo+9nc=
Date: Wed, 8 Oct 2025 22:29:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chris Mason <clm@meta.com>, ksummit@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251008192934.GH16422@pendragon.ideasonboard.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>

On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
> > My goal for KS/MS is to discuss how to enable maintainers to use review
> > automation tools to lower their workload.
> 
> Maintainers will want to use these tools, if they prove to be
> useful. But ideally, we want the developers to use these tools and fix
> the issues before they post code for review. That reduces the
> maintainers workload even more. So Maintainers just need to run the
> tools to prove that the developers have run the tools and have already
> fixed the problems.
> 
> So i'm not sure your goal is the correct long term goal. It should be
> a tool for everybody, not just maintainers.

This raises the interesting and important question of how to get patch
submitters to follow a recommended workflow. We routinely get patches
that produce checkpatch errors that are clearly not false positives.
Rob Herring implemented a bot to run checks on device tree bindings and
device tree sources because lots of patches fail those checks. I'm sure
there are lots of other examples that have led maintainers to automate
checks on the receiver's side, through various types of standard CIs or
hand-made solutions. Submitters should run more tests, how to get them
to do so is a broader question.

-- 
Regards,

Laurent Pinchart

