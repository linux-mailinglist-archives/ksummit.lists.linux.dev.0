Return-Path: <ksummit+bounces-2440-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A5BC679B
	for <lists@lfdr.de>; Wed, 08 Oct 2025 21:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 780AF4E6B8D
	for <lists@lfdr.de>; Wed,  8 Oct 2025 19:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EB025EF90;
	Wed,  8 Oct 2025 19:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vavq6fio"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A2321ADCB
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759952039; cv=none; b=NkMOYt/APmvLdqZ4b4SBjYZ0GVlmOOg2Wt5WbmAXF/bOG0V2cAjMH+0qjMf5i7AXKYEw0Z1ZidwCihkKctqi+Lm93mlRJXrCqyjp5EkFa/6/4CxqIfa2DuZStVcOguAY3VxHazVqFU+nTbWVt48U4AJ/3Tp676fb7byDkJie8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759952039; c=relaxed/simple;
	bh=6H1SuTQQWISFkjjlDgdeV3tOAq2M+3BgomyGyDJi060=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOINF/ksiV7nwD7wQ1rfMbPXL/Fbu8oWOY6gAV9goe9OKebFl1QoKSz+HXPsQ9MgeLmDAXH1vy/be7LyZX+HZmG09qqqNiWegMcAwSGulxYJaOSwvK9Ynj5dHjXoHo09sWj+IbGzC7XilirMotqAh7cJP4lMaeknNBrLcSsaSyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vavq6fio; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D503AEFE;
	Wed,  8 Oct 2025 21:32:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759951942;
	bh=6H1SuTQQWISFkjjlDgdeV3tOAq2M+3BgomyGyDJi060=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vavq6fiojX01umYDLs5XPjQ8YhCJVyaoG8yPqv0Uc0CxFD7jcQbDyIgsn9OTyJIyN
	 l3kgMiwEJV0JcwOrSHnteW5VEZoMnIzTA200kkc9yTj2SG7Fy0xS2vl1UL6SdATRaM
	 1vseyPapckZ0N5yD9BxBCPtycVcd05heBpmMhSIQ=
Date: Wed, 8 Oct 2025 22:33:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Chris Mason <clm@meta.com>,
	ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251008193349.GI16422@pendragon.ideasonboard.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <aOa7Tn0QbXwL-Ydo@x1>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aOa7Tn0QbXwL-Ydo@x1>

On Wed, Oct 08, 2025 at 04:28:14PM -0300, Arnaldo Carvalho de Melo wrote:
> On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
> > > My goal for KS/MS is to discuss how to enable maintainers to use review
> > > automation tools to lower their workload.
>  
> > Maintainers will want to use these tools, if they prove to be useful.
> 
> Right.
> 
> > But ideally, we want the developers to use these tools and fix
> > the issues before they post code for review.
> 
> Sure, as before, people should try to follow the best practices before
> sending pull requests, its in the best interest of everybody.
> 
> But if they do so, and I guess most will, there will be more patches
> flowing upstream, thus Chris effort, I think, right?

I'd argue there will be less patches flowing upstream, lots of v1 (and
sometimes subsequent versions) where maintainers point obvious mistakes
will be avoided. The new v1 that would end up on the list will take more
time to review than the old v1, but that's just because the new v1 will
be the old v2.

To make this happen, though, maintainers will need to be reasonably
confident that obvious mistakes will have already been fixed.

> > That reduces the maintainers workload even more. So Maintainers just
> > need to run the tools to prove that the developers have run the tools
> > and have already fixed the problems.
> 
> I think tools evolve and competing tools may provide different results,
> so the more tools that are used, in all steps, there will be a greater
> chance of catching things _before_ maintainers have to look at
> something.
> 
> As b4 does all sorts of checks, making sure that the patch was vetted by
> whatever automation before it hits their inboxes seems to reduce the
> number of steps maintainers will have to perform.
> 
> - Arnaldo
>  
> > So i'm not sure your goal is the correct long term goal. It should be
> > a tool for everybody, not just maintainers.

-- 
Regards,

Laurent Pinchart

