Return-Path: <ksummit+bounces-2059-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53322B1B9BC
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A1E4184605
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA69E202961;
	Tue,  5 Aug 2025 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fwRB1ANs"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34E57E0FF
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754416830; cv=none; b=Z2Vu+uqzbS8WAoUcNfbx5/h59Xvib/VuyNfnE6zgDXLMmNkDmNC6MzRj0mETJBO6Pa+CiWKhBG34TdeuhDh9qullCRJK9chJGSNskBoXjPrneRg6W33bV0jJwcKDadu3k6IowIMPUzZdIf5Zh32x1Tjg1ylQVIjCND6sXMmJfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754416830; c=relaxed/simple;
	bh=SEYc1jlhxt2UMXKA4eVc13DYWSB2DFZ0GUp2ed1D90s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDG5M8Pz3x3rm+IOoXXrAUU9oSh/R9kdQv2SMPfKgNykq5x3puRqkLMF/EaVBY8ebZbWTG2YZVjqUQELvOBmsJ9q0VN0iXTLjPPaE9AmagVIWcmoj/hVN1HOegcBO7CgrdVbX3iSWwkSUehZNIZR3iHiIGLLybEJWj9fmms5UWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fwRB1ANs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CA5B03C46;
	Tue,  5 Aug 2025 19:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754416777;
	bh=SEYc1jlhxt2UMXKA4eVc13DYWSB2DFZ0GUp2ed1D90s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwRB1ANsWp/RanREz2mRSnC5MKRiuT/mpWTJYpW4yUswHnA2HPOUp721p9rktIgHc
	 bJi3kvEmlzwfa9Kpy9zUlS6vWxU7KtnkdbczrGVH++EPT4MWog8lmiRNZz2vEf6o8V
	 hpT7OnimlQ8V1LhyDA6P1Z5AbDpwysdNuyq/NFms=
Date: Tue, 5 Aug 2025 21:00:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250805180010.GA24856@pendragon.ideasonboard.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJJEgVFXg4PRODEA@lappy>

On Tue, Aug 05, 2025 at 01:50:57PM -0400, Sasha Levin wrote:
> On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
> >This proposal is pretty much followup/spinoff of the discussion currently
> >happening on LKML in one of the sub-threads of [1].
> >
> >This is not really about legal aspects of AI-generated code and patches, I
> >believe that'd be handled well handled well by LF, DCO, etc.
> >
> >My concern here is more "human to human", as in "if I need to talk to a
> >human that actually does understand the patch deeply enough, in context,
> >etc .. who is that?"
> >
> >I believe we need to at least settle on (and document) the way how to
> >express in patch (meta)data:
> >
> >- this patch has been assisted by LLM $X
> >- the human understanding the generated code is $Y
> >
> >We might just implicitly assume this to be the first person in the S-O-B
> >chain (which I personally don't think works for all scenarios, you can
> >have multiple people working on it, etc), but even in such case I believe
> >this needs to be clearly documented.
> 
> The above isn't really an AI problem though.
> 
> We already have folks sending "checkpatch fixes" which only make code
> less readable or "syzbot fixes" that shut up the warnings but are
> completely bogus otherwise.
> 
> Sure, folks sending "AI fixes" could (will?) be a growing problem, but
> tackling just the AI side of it is addressing one of the symptoms, not
> the underlying issue.

Perfect, let's document a policy and kill two birds with one stone then.

-- 
Regards,

Laurent Pinchart

