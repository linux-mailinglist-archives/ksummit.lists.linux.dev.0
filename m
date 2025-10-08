Return-Path: <ksummit+bounces-2441-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF13BBC67B5
	for <lists@lfdr.de>; Wed, 08 Oct 2025 21:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634FF404C25
	for <lists@lfdr.de>; Wed,  8 Oct 2025 19:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A10264634;
	Wed,  8 Oct 2025 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/lSOTcP"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB27237A4F
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 19:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759952364; cv=none; b=MqLLs9SfoP3ujvBy8PxbMat90d4LI3MHubvYMwiQ5EW4IFrAQQuSJxtPk61ffz/TN3XCHvix1FGxwt81sxgzeDMSOp2oCaJcJEgE5JZDGmMwFZO90XKZ6CcXUDHfPcHOVcXme0QQSitdQcx3ofX8oQ1CpX9ja0kihNi+1fBDukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759952364; c=relaxed/simple;
	bh=rBzYTre9d8OtCseTfCZsIGepPO444CCV05HXTILbOGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGB2APKgWNajAiIeO+T2JGl11JYcrYz3m2BSqllHKztpBckKaDdDkZvyF+Tg74icrdktXcSWIvU3LfWN4d9m7KjaiPM0Vzaf/hKwr9ikbjiyQJSZi5QVxxgvaKohIZZ6s+Y34NtlFw1u52IyUdfzivG/ej2EFaGAttvpAQpavNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/lSOTcP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997ACC4CEE7;
	Wed,  8 Oct 2025 19:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759952361;
	bh=rBzYTre9d8OtCseTfCZsIGepPO444CCV05HXTILbOGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/lSOTcP8uFkk5FRFI4FAgUzUqlCe/ZHnzh1mgQcKfbw0+bzd7VuLCYbO1sVHMFfB
	 cDCVTjtK8TG2oZ43kXcvTsGDpVCvxPc8EOAosMIsq1/XQasCkBAm351XyeN+j+kcWO
	 I0RWS7O8HpIRmKU1XlcTmQ4xMZLxox5xNziS1f+FC6vTIlO562qKZAdJvKwp4eq4s+
	 bG9iR9Clko2iolNayO35K9Ny8+wrh5DXsRRFG8DQ0j0SB5YhenKg318LU//jWQPtCz
	 53uU3piW+64xLiQMBgTr2S2tqIgL1wWYZVg3XgBQ/Lx3zVR0yHQIaNPzMTXmAUsA2c
	 hAaUq3kyBIG+Q==
Date: Wed, 8 Oct 2025 16:39:17 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Chris Mason <clm@meta.com>,
	ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOa95ZFLXgaEh5PJ@x1>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <aOa7Tn0QbXwL-Ydo@x1>
 <20251008193349.GI16422@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008193349.GI16422@pendragon.ideasonboard.com>

On Wed, Oct 08, 2025 at 10:33:49PM +0300, Laurent Pinchart wrote:
> On Wed, Oct 08, 2025 at 04:28:14PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
> > > But ideally, we want the developers to use these tools and fix
> > > the issues before they post code for review.

> > Sure, as before, people should try to follow the best practices before
> > sending pull requests, its in the best interest of everybody.

> > But if they do so, and I guess most will, there will be more patches
> > flowing upstream, thus Chris effort, I think, right?
 
> I'd argue there will be less patches flowing upstream, lots of v1 (and
> sometimes subsequent versions) where maintainers point obvious mistakes
> will be avoided. The new v1 that would end up on the list will take more
> time to review than the old v1, but that's just because the new v1 will
> be the old v2.

Hopefully, but then all that time the contributors had to spend on
writing multiple versions for the same patch could be used to send tons
of good v1 patches, leading to more features, or dealing with lots of tech
debt most people have. :-)
 
> To make this happen, though, maintainers will need to be reasonably
> confident that obvious mistakes will have already been fixed.

I think maintainers can't take anything for sure, even when dealing with
contributors that posted tons of patches before :-/

And as you said, we can't count on contributors running existing tests,
or using things like linters, checkpatch, you name it, let alone AI
assistants.
 
- Arnaldo

