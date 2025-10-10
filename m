Return-Path: <ksummit+bounces-2476-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F14EFBCBFCE
	for <lists@lfdr.de>; Fri, 10 Oct 2025 09:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20BB8188F680
	for <lists@lfdr.de>; Fri, 10 Oct 2025 07:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5F627281C;
	Fri, 10 Oct 2025 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J1DT9BH3"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B841DE3A5
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760082872; cv=none; b=tQYa793+QyKWjXO/+UIa9oaeBL6GS4Vzw3UMqvLMsOtWy6jpCiPRdDmq7j1wya7HmDkJ0belHXKz5MsV+cRvgSZTz69wD73fj9dLA4JY3cG7xd9JeYNsJx5YksiST2/ppPm7w0nf7biOv1ibzOxyLoC1ew77peqOzXGj6+bL8i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760082872; c=relaxed/simple;
	bh=r4nfPffrq1j4Ut79cI50rWQQE1RqYkFC1wvRpS1kr/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIXlw1rEXEqNVsuED8kP8V2JJjrjVtTmSlMuy9vKW09PkoECIXqqV6xML2iL/zBmk5RkaxRV078/5878SzOgLZAu8i12jwiARxU+yD1xPtIUt/WyxMysFHnNIYl3DqARqD7vHqsgD0V1KWS5cyloKWiKBwkq8cZcbuqQUzC+rBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J1DT9BH3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A5672593;
	Fri, 10 Oct 2025 09:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760082765;
	bh=r4nfPffrq1j4Ut79cI50rWQQE1RqYkFC1wvRpS1kr/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1DT9BH3E7m2Pfv9wqEjHgSUVVCWIuRjeCWB97AnXaeGO7aVwpETQxQTnDixT8H8+
	 b/CvAHZTosyseKSWlhjiKcx2jMaFD5Auw6sc3i4oyf8wkj3w5e+HJ0Cg9NmBaRwVdC
	 dlMClZ+2uAp4BFlbtyscrRoGzneb7ZFArBT4/LIc=
Date: Fri, 10 Oct 2025 10:54:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chris Mason <clm@meta.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251010075413.GD29493@pendragon.ideasonboard.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <d4f98276-ab5d-43ca-9662-017420154e4a@meta.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d4f98276-ab5d-43ca-9662-017420154e4a@meta.com>

On Thu, Oct 09, 2025 at 06:03:45AM -0400, Chris Mason wrote:
> On 10/9/25 5:14 AM, Laurent Pinchart wrote:
> 
> >> Indeed.  All the more reason to enforce it at the source.  It then becomes
> >> a cost for the contributor instead of the upstream community, which is
> >> going to scale better.
> > 
> > Forcing contributors to pay for access to proprietary tools is not
> > acceptable. Forcing contributors to even run proprietary tools is not
> > acceptable. If maintainers want contributions to go through any
> > proprietary tooling before submission, then this has to run on the
> > maintainer side (be it on a maintainer's machine, in some form of CI, or
> > somewhere else).
> 
> I strongly agree with Laurent here.
> 
> > You're right that cost would then be a problem. I can certainly imagine
> > $popular_ai_company sponsoring this short term, until we're
> > vendor-locked and they stop sponsorship. I don't think rushing in that
> > direction is a good idea.
>
> I don't think vendor lock in is a problem though.  We're in a phase
> where there is a great deal of competition and innovation in the space,
> and the prompts themselves are just english text against a general
> purpose AI.

I'm not that concerned about being locked to a specific vendor, but more
about being locked to a proprietory technology. Today I'm sure that we
could get sponsorship from different LLM vendors. They're competing to
attract more users, so it would be in their interest. Tomorrow, when the
market will calm down, the story will be different.

I liken this to building a dam to contain the patch flood. It could give
us some room to breathe, and we may then decide to ignore that the water
rises behind the flood gates. When that happens, we won't be able to go
back to where we were before if we later realize we can't have
FOSS-compatible flood gates.

If we were to push the burden of running LLM-based review to
contributors this wouldn't affect us that much, but if we run it on the
maintainers' side (be it on the server side with bots that get patches
from mailing lists, CI systems that feed from patchwork, or on the
client side) the risk of vendor lock-in is higher. Maybe proprietary
technology lock-in would be a better description as this isn't about a
single vendor.

-- 
Regards,

Laurent Pinchart

