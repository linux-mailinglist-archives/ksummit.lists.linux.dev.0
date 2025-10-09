Return-Path: <ksummit+bounces-2459-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C363BBC91CB
	for <lists@lfdr.de>; Thu, 09 Oct 2025 14:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17C2188AF33
	for <lists@lfdr.de>; Thu,  9 Oct 2025 12:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39F12E11A6;
	Thu,  9 Oct 2025 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epwGL7Rw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A973BA3F
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014113; cv=none; b=Cpwl17kPb01IIZH2GBkI7pGlRHinV2CnynbMCiZaQj3/iSYVO2YJEbtuXMA+rF39l4TBcCKl7O4IW8uV+PZtTCASmlujXqI4we4J1okZSJIeR+DAdRNsp7paYIpOmnGTH/7/GI3sP4LUKl+oUhEkOa1f7P8D9k5URapiDBydidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014113; c=relaxed/simple;
	bh=iGJDg+HTB9s8tcjnBaNHTi8x6BIEyyEkVO9tEVUwo5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PV50dURlpZ768Q1cspbQcvRwe7PD5kpVlFgQ1aMRyC6LNXsCLdFescdcsLdxPR5a+l657E5evuZL/VR0JUob5NNTm9pBWju3KWWtShKRcu+VCzdEDQg7XIGwprrDHSngtFkTyrIPzHf4OD/5/gfu5hNKcKXgAkwrMR7VI/s08CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epwGL7Rw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C59C4CEE7;
	Thu,  9 Oct 2025 12:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760014111;
	bh=iGJDg+HTB9s8tcjnBaNHTi8x6BIEyyEkVO9tEVUwo5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epwGL7RwyhAJoR6HQoSWpN6b9WHyQX8yEc0KlvF7mk8YS4umMZjyA5zswh2V2zSeg
	 9QGoR2s6vuKrr7n/dZdnVNwZWpkdO/FBZcUei1+GTpf38uzvU0qq4/x4MM7El6rEsB
	 VGTYrxerwYZPE+J1K9bboZ40pZEfbKWeEwvpyYF1sA/9XDCs87ErabpRXalGPvMp2n
	 y3G9m/vqpVb4+PIgGTl1Y+A81PM+unbmuOoOY/GIL5RhEEnDH2rpDOwfd5jH7V8Mbg
	 q2VbcPeSqRKEL79nI32M2bJix6HrWRNJLIvceRrrejnEgufH3PXGCgjSLWV3BOUQCu
	 9xjdwN4ndnfDw==
Date: Thu, 9 Oct 2025 09:48:27 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Chris Mason <clm@meta.com>,
	ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOevGww0S2nG9BFa@x1>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <aOa7Tn0QbXwL-Ydo@x1>
 <20251008193349.GI16422@pendragon.ideasonboard.com>
 <aOa95ZFLXgaEh5PJ@x1>
 <20251009093750.GE12674@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009093750.GE12674@pendragon.ideasonboard.com>

On Thu, Oct 09, 2025 at 12:37:50PM +0300, Laurent Pinchart wrote:
> On Wed, Oct 08, 2025 at 04:39:17PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Wed, Oct 08, 2025 at 10:33:49PM +0300, Laurent Pinchart wrote:
> > > On Wed, Oct 08, 2025 at 04:28:14PM -0300, Arnaldo Carvalho de Melo wrote:
> > > > On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
> > > > > But ideally, we want the developers to use these tools and fix
> > > > > the issues before they post code for review.

> > > > Sure, as before, people should try to follow the best practices before
> > > > sending pull requests, its in the best interest of everybody.

> > > > But if they do so, and I guess most will, there will be more patches
> > > > flowing upstream, thus Chris effort, I think, right?

> > > I'd argue there will be less patches flowing upstream, lots of v1 (and
> > > sometimes subsequent versions) where maintainers point obvious mistakes
> > > will be avoided. The new v1 that would end up on the list will take more
> > > time to review than the old v1, but that's just because the new v1 will
> > > be the old v2.
> > 
> > Hopefully, but then all that time the contributors had to spend on
> > writing multiple versions for the same patch could be used to send tons
> > of good v1 patches, leading to more features, or dealing with lots of tech
> > debt most people have. :-)

> One can always dream :-)

:-)

> If you think of a series that goes from v1 to v10 today, we will just
> not see v1 on the list and v2 to v10 will be renamed v1 to v9, but the
> submitter will still make a v1, run it through tests, and fix issues
> before submitting. This will likely take less time than waiting for a
> review on v1, but will still take development time.

Right, using AI to do pre-review should be encouraged, some people will
not want to use some, while find some more acceptable, some will not use
any and will ask a friend, more effort before sending patches is what
maintainers need.
 
> > > To make this happen, though, maintainers will need to be reasonably
> > > confident that obvious mistakes will have already been fixed.

> > I think maintainers can't take anything for sure, even when dealing with
> > contributors that posted tons of patches before :-/

> > And as you said, we can't count on contributors running existing tests,
> > or using things like linters, checkpatch, you name it, let alone AI
> > assistants.

> A big difference is that we can complain about submitters not running
> checkpatch, but we can't insist they run proprietary tools.

I agree that we shouldn't make it a requirement that a proprietary tool
be used to make development dependent on it, not even require that
something that doesn't run locally, I'd say.

But this is no bitkeeper, I think, or shouldn't be, i.e. if you
completely stop thinking and trust just LLMs to code and review for
you...

Supposedly we can at any time stop using it and go back to our old ways,
no? :-)

Oh, it may be a bitkeeper, so convenient, who would want to use just
patches....

- Arnaldo

