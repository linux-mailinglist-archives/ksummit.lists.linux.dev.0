Return-Path: <ksummit+bounces-2454-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 697FCBC83B2
	for <lists@lfdr.de>; Thu, 09 Oct 2025 11:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F11923B611E
	for <lists@lfdr.de>; Thu,  9 Oct 2025 09:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974922D540D;
	Thu,  9 Oct 2025 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a27BmBGs"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D023536C
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001257; cv=none; b=WYF/z4z3ItPOAa+nZK52A7R3CuAJeOJBt5PogHMhdagV5Kp0gDjE4OvM7OELqGac5SDUT/PXPVBechQNWafaLWePnJElwH5DhU53jueF6HgO//D4cAR2PGQeN8/oFb6uJbjJqT1cIS7OhwxswEvAebQWk/WQmrFRAUzNMzVijbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001257; c=relaxed/simple;
	bh=a8V+Cz5UIF80bJaSE950EYYAapgHvfsdyydi2tCz1Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCaTKFbWCclZ72OK5XtD+BlfxQ8pYQTAeucHls5O5t1DD82YfBhaj0JFyBmFBtiP3RWzbWInOlJDNVzkAQYxd1MbqX9tYRbABVczWTsyzgPCRgt+2+9CRm32+XkRLVks8rCwl9BrnhmMQ4O6atnp23ys0bfbB1Oy1jWlPUWz07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a27BmBGs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 13633EFE;
	Thu,  9 Oct 2025 11:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760001158;
	bh=a8V+Cz5UIF80bJaSE950EYYAapgHvfsdyydi2tCz1Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a27BmBGso/kwE0KyxD5Y1E09M0JnvKIUxeDfQPpOZh0b2hZxpWOF0DHXSvWWAYflI
	 veEyue17YHuMY9YnDR850vFmBqXIofzjPrI79MC7CD4uiaKmPMnoqs033/LnBXEPRT
	 1IK8kWG6qfbeyeOg+4JbMuLjxxPxclT+7arZPlnU=
Date: Thu, 9 Oct 2025 12:14:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Andrew Lunn <andrew@lunn.ch>, Chris Mason <clm@meta.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251009091405.GD12674@pendragon.ideasonboard.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>

On Wed, Oct 08, 2025 at 08:38:45PM +0000, Bird, Tim wrote:
> > -----Original Message-----
> > From: James Bottomley <James.Bottomley@HansenPartnership.com>
> > On Wed, 2025-10-08 at 19: 50 +0000, Bird, Tim wrote:
> > > > -----Original Message-----
> > From: Laurent Pinchart <laurent. pinchart@ideasonboard.com>
> > On Wed, 2025-10-08 at 19:50 +0000, Bird, Tim wrote:
> > > > -----Original Message-----
> > > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
> > > > > > My goal for KS/MS is to discuss how to enable maintainers to
> > > > > > use review automation tools to lower their workload.
> > > > >
> > > > > Maintainers will want to use these tools, if they prove to be
> > > > > useful. But ideally, we want the developers to use these tools
> > > > > and fix the issues before they post code for review. That reduces
> > > > > the maintainers workload even more. So Maintainers just need to
> > > > > run the tools to prove that the developers have run the tools and
> > > > > have already fixed the problems.
> > > > >
> > > > > So i'm not sure your goal is the correct long term goal. It
> > > > > should be a tool for everybody, not just maintainers.
> > > >
> > > > This raises the interesting and important question of how to get
> > > > patch submitters to follow a recommended workflow. We routinely get
> > > > patches that produce checkpatch errors that are clearly not false
> > > > positives. Rob Herring implemented a bot to run checks on device
> > > > tree bindings and device tree sources because lots of patches fail
> > > > those checks. I'm sure there are lots of other examples that have
> > > > led maintainers to automate checks on the receiver's side, through
> > > > various types of standard CIs or hand-made solutions. Submitters
> > > > should run more tests, how to get them to do so is a broader
> > > > question.
> > >
> > > Maybe it would be worthwhile to annotate patch submissions with tags
> > > indicating what tools have been run on them.  I know we're trying to
> > > avoid overuse of commit tags, but maybe we could automate this a bit,
> > > and/or' reuse the 'Reviewed-by:' tag in the commit message.  I could
> > > envision, in some future workflow utopia, where a missing 'Reviewed-
> > > by: checkpatch.pl AND claude AI review' would be grounds for
> > > requesting these before human review.
> > 
> > Realistically, we can't even get some submitters to run checkpatch, so
> > I don't think the additional tag would help. What does help is having
> > the 0day bot take a feed of the mailing list, select the [PATCH] tag
> > and run checkpatch.pl as part of the tests, so someone could do the
> > same with whatever AI acceptance tests are agreed.
> 
> There's no question that 0day automation of checkpatch.pl feedback
> has been a great thing.  I suspect that more submitters would run
> checkpatch before sending their patches, if failure to do so resulted
> in automatic rejection of the patch.  This is more of a process backbone
> issue than anything else.
> 
> > Although the problem with AI acceptance testing is that these models
> > and the inferencing required to run them doesn't come for free so
> > someone is going to end up paying for all this AI ... unless we can get
> > some cloud company to donate it, of course ...
>
> Indeed.  All the more reason to enforce it at the source.  It then becomes
> a cost for the contributor instead of the upstream community, which is
> going to scale better.

Forcing contributors to pay for access to proprietary tools is not
acceptable. Forcing contributors to even run proprietary tools is not
acceptable. If maintainers want contributions to go through any
proprietary tooling before submission, then this has to run on the
maintainer side (be it on a maintainer's machine, in some form of CI, or
somewhere else).

You're right that cost would then be a problem. I can certainly imagine
$popular_ai_company sponsoring this short term, until we're
vendor-locked and they stop sponsorship. I don't think rushing in that
direction is a good idea.

-- 
Regards,

Laurent Pinchart

