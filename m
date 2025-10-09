Return-Path: <ksummit+bounces-2455-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176BFBC856D
	for <lists@lfdr.de>; Thu, 09 Oct 2025 11:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB7F23E61A7
	for <lists@lfdr.de>; Thu,  9 Oct 2025 09:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369FB2D4816;
	Thu,  9 Oct 2025 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oO+tXpZM"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A129BDA4
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002681; cv=none; b=txQ7Jv4pAx4z/Wucf79ZniCjgzjU7wSTjRNA4h7rdiLALpAWKJnkVa19LbaA4J+CcNlwoATymIfoOM2cq/lIVeT4afBSm1OU5mj3DQIpnul/wycz4ABkvYh7oGLxmlUCnzN/kike4I2Xg7OIJDU5Oz7jervSMphoDZvbvX3h6ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002681; c=relaxed/simple;
	bh=f+sLIBrVM5CFKjPPNhaKES2ETep6TbId+58opUeeh3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRq41CBwMipxnoXsIx50YnVottCX5bgwT3fX7+LlfCBrhcKJLZbf3VoxBLJonRY1cw3rID8ptpGoe4eemQwfWqiisg2KIwLTp10Uey3UVXG4EvknMwCv+++t04LGzBDzn0taUurbjvI1JO/BHsB14yv5PaBu9ieRpgG0gT8DDNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oO+tXpZM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D4AD1BB;
	Thu,  9 Oct 2025 11:36:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760002583;
	bh=f+sLIBrVM5CFKjPPNhaKES2ETep6TbId+58opUeeh3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oO+tXpZMllwKIBB/o3EznL2U9tmIjxWXXVSXSAvtc/4/UWRvBvJ8Faa4IkeK3+gNf
	 w+nm8jFHuBMH9uwUrTLsUVrutkzmLjTJCh6gJHL+Jz0hntd8EuBbxX9HwDC+FUKKPU
	 uxvMgZNgjPKo9g6rimu1Bz75TDBGiVaffqZhUwGo=
Date: Thu, 9 Oct 2025 12:37:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Chris Mason <clm@meta.com>,
	ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251009093750.GE12674@pendragon.ideasonboard.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <aOa7Tn0QbXwL-Ydo@x1>
 <20251008193349.GI16422@pendragon.ideasonboard.com>
 <aOa95ZFLXgaEh5PJ@x1>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aOa95ZFLXgaEh5PJ@x1>

On Wed, Oct 08, 2025 at 04:39:17PM -0300, Arnaldo Carvalho de Melo wrote:
> On Wed, Oct 08, 2025 at 10:33:49PM +0300, Laurent Pinchart wrote:
> > On Wed, Oct 08, 2025 at 04:28:14PM -0300, Arnaldo Carvalho de Melo wrote:
> > > On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
> > > > But ideally, we want the developers to use these tools and fix
> > > > the issues before they post code for review.
> > >
> > > Sure, as before, people should try to follow the best practices before
> > > sending pull requests, its in the best interest of everybody.
> > >
> > > But if they do so, and I guess most will, there will be more patches
> > > flowing upstream, thus Chris effort, I think, right?
> >
> > I'd argue there will be less patches flowing upstream, lots of v1 (and
> > sometimes subsequent versions) where maintainers point obvious mistakes
> > will be avoided. The new v1 that would end up on the list will take more
> > time to review than the old v1, but that's just because the new v1 will
> > be the old v2.
> 
> Hopefully, but then all that time the contributors had to spend on
> writing multiple versions for the same patch could be used to send tons
> of good v1 patches, leading to more features, or dealing with lots of tech
> debt most people have. :-)

One can always dream :-)

If you think of a series that goes from v1 to v10 today, we will just
not see v1 on the list and v2 to v10 will be renamed v1 to v9, but the
submitter will still make a v1, run it through tests, and fix issues
before submitting. This will likely take less time than waiting for a
review on v1, but will still take development time.

> > To make this happen, though, maintainers will need to be reasonably
> > confident that obvious mistakes will have already been fixed.
> 
> I think maintainers can't take anything for sure, even when dealing with
> contributors that posted tons of patches before :-/
> 
> And as you said, we can't count on contributors running existing tests,
> or using things like linters, checkpatch, you name it, let alone AI
> assistants.

A big difference is that we can complain about submitters not running
checkpatch, but we can't insist they run proprietary tools.

-- 
Regards,

Laurent Pinchart

