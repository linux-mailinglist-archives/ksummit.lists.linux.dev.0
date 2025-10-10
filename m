Return-Path: <ksummit+bounces-2479-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 34862BCCCFD
	for <lists@lfdr.de>; Fri, 10 Oct 2025 13:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ED81D4E0F4E
	for <lists@lfdr.de>; Fri, 10 Oct 2025 11:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBD828727C;
	Fri, 10 Oct 2025 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kekRBIuq"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7382848BF
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760097225; cv=none; b=rL1pu6Suzmy+bNnfdnex+JVvmk9PunZGs5iCyiiFA6LcVX/GHEyPcs2ZGO91fpdFEX2bjzkrm6s/f9J+SQJdR050Ra/wAaV7npZSj9aWwEbe4WTmvZgJCIrn2MnRZ5LFOsL2rCudNihQJ/0AKLMsA0UJH5kNbi8HUTVSJjafV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760097225; c=relaxed/simple;
	bh=+4wvZOXQCFrJMGr1w8+fq7k3IE4sw1i8bG8+1eDgAr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFnaTQwzPwYR2TYE68/FAyTAsN6eWIKx+PO5GXXRq07XZ4NLNNDx3+KGpNIWOFUr1g3fuACEpigjPJIFoibB0ZnAyX/dL5zXkcNDe1Nrdlj7XULqlZ1J+y3/8A81szpweb9mm0fVG8mCtnxhENDjzzuVK1Sfn3ryfU1bk/YmV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kekRBIuq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1AD73664;
	Fri, 10 Oct 2025 13:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760097126;
	bh=+4wvZOXQCFrJMGr1w8+fq7k3IE4sw1i8bG8+1eDgAr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kekRBIuqiEGjU++EXgiOSLaK3f26r43QbllgvG1C4HmQZKSxVHFgIX2MvzGI4leuL
	 ybaYWAzyNJKnVJ+T9bUVbL2vBZD0r1G/v8ERHzcnZa9R0oe9JRqQwpkaxO1lkSaVxz
	 kkY/HlHPdmJ5sDI8hVBNm0MtZA/gGyTlDD1ho9uc=
Date: Fri, 10 Oct 2025 14:53:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Chris Mason <clm@meta.com>, "Bird, Tim" <Tim.Bird@sony.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251010115334.GB28598@pendragon.ideasonboard.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <d4f98276-ab5d-43ca-9662-017420154e4a@meta.com>
 <20251010075413.GD29493@pendragon.ideasonboard.com>
 <3996fd684c497c7bcb4ad406ff3cec99df7180df.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3996fd684c497c7bcb4ad406ff3cec99df7180df.camel@HansenPartnership.com>

On Fri, Oct 10, 2025 at 07:40:45AM -0400, James Bottomley wrote:
> On Fri, 2025-10-10 at 10:54 +0300, Laurent Pinchart wrote:
> > On Thu, Oct 09, 2025 at 06:03:45AM -0400, Chris Mason wrote:
> [...]
> > I'm not that concerned about being locked to a specific vendor, but
> > more about being locked to a proprietory technology. Today I'm sure
> > that we could get sponsorship from different LLM vendors. They're
> > competing to attract more users, so it would be in their interest.
> > Tomorrow, when the market will calm down, the story will be
> > different.
> > 
> > I liken this to building a dam to contain the patch flood. It could
> > give us some room to breathe, and we may then decide to ignore that
> > the water rises behind the flood gates. When that happens, we won't
> > be able to go back to where we were before if we later realize we
> > can't have FOSS-compatible flood gates.
> 
> This is pre-supposing that AI will always be proprietary.  Given the
> vast expansion of open source over the last couple of decades I
> wouldn't take that bet.

I wouldn't bet either way, but I tend to play it safe. I wouldn't want
to go in the direction of relying on proprietary technologies based
solely on the hope that at some point in the future we will get free
alternatives. I'm absolutely fine if people want to start experimenting
now based on that assumption, as long as we make it clear it's too early
to cross a point of no return.

> > If we were to push the burden of running LLM-based review to
> > contributors this wouldn't affect us that much, but if we run it on
> > the maintainers' side (be it on the server side with bots that get
> > patches from mailing lists, CI systems that feed from patchwork, or
> > on the client side) the risk of vendor lock-in is higher.
> 
> Pushing the burden on to contributors always causes more friction than
> building it into the CI.  Plus if there's a cost involved you're making
> contribution pay for play which really doesn't work out well.

Neither side is ideal :-/ Given all the arguments given in this thread I
think we would need to run checks on the maintainer side in any case,
even if we were to try and push them to the developer side. For that
reason it makes sense to first focus on the maintainer side, and try to
solve the technical, financial and freedom issues there as we'll have to
anyway.

As for pay-for-play, let's discuss a tax on upstream contributions
around a bottle of nihonshu at LPC. That topic requires not being sober
:-)

> >  Maybe proprietary technology lock-in would be a better description
> > as this isn't about a single vendor.
> 
> Well, firstly we've had this before: us with bitkeeper and most
> recently Kubernetes with Slack and everyone has survived. But secondly
> the far more likely scenario is that the AI stock bubble bursts and the
> investment dries up changing the way AI is done (definitely killing the
> who can by powerstations and huge hardware installations model of
> today) and who the players are (probably the point at which open source
> becomes more prevalent).

I'd love to fast-track to that and skip the current tragicomedy.

> However, regardless of what happens in future, it will be way easier to
> cope with if we've got AI in the CI rather than trying to push it into
> contributor tooling.

-- 
Regards,

Laurent Pinchart

