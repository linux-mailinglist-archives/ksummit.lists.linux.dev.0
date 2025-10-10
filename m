Return-Path: <ksummit+bounces-2477-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C6BCC00D
	for <lists@lfdr.de>; Fri, 10 Oct 2025 09:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6237406817
	for <lists@lfdr.de>; Fri, 10 Oct 2025 07:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C796B2773CC;
	Fri, 10 Oct 2025 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hXYw7YHM"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A928240611
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083161; cv=none; b=pQd8QitM7sPE5NvwWhuHKX4KiNTkrw+rcGN/HtYY8mEkjCgS8FjbVG587UxVjinVQHAS4V+5141x+iRmPclWMyQwUqPJFvfQP7NubKeRc61sH3LncO6lTAyMGASqnYSN/rBXse6yIe0BDL8XrF7Ku/3t3XsB8T6mE+7k50a+G60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083161; c=relaxed/simple;
	bh=y80Sq/xjJOgPMBKGszV4NvFo7spNt/0qXIy4r7u0ZwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8i23ht/xGfloNvmuR1/6txM66HBJpttFTCPBPboGDbzsNub0l+o9uHFRfT81hU7KkFGgBJg0LBR24ZGUWBoQkqg5CANqaHpuElU5lpl0q2skC5fqE0LYhMs496NqiulVo7w/rLExLeTKO6x3Z47Un8kaq9M03Jw51WhxCmE6SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hXYw7YHM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 78A0B593;
	Fri, 10 Oct 2025 09:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760083061;
	bh=y80Sq/xjJOgPMBKGszV4NvFo7spNt/0qXIy4r7u0ZwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hXYw7YHMTpKhR+iKiMgFAVLumehE7MDDZinjqEW2jUejdbEfNFBN6MiDRCYhc2kaF
	 ZODgag16YRwKxeOh7BXkKm1eXmVyQjtwyiwcnGjPc84+k1LpeE0m4ZqSi/obv3xvsG
	 4VsrsV3Uh1voFcvzH+kxFu3mXBq51B3Y8ufqGHwI=
Date: Fri, 10 Oct 2025 10:59:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Steven Rostedt <rostedt@goodmis.org>, "Bird, Tim" <Tim.Bird@sony.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Chris Mason <clm@meta.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251010075909.GE29493@pendragon.ideasonboard.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <20251009103019.632db002@gandalf.local.home>
 <d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch>

On Thu, Oct 09, 2025 at 04:51:39PM +0200, Andrew Lunn wrote:
> On Thu, Oct 09, 2025 at 10:30:19AM -0400, Steven Rostedt wrote:
> > On Thu, 9 Oct 2025 12:14:05 +0300 Laurent Pinchart wrote:
> > 
> > > Forcing contributors to pay for access to proprietary tools is not
> > > acceptable. Forcing contributors to even run proprietary tools is not
> > > acceptable. If maintainers want contributions to go through any
> > > proprietary tooling before submission, then this has to run on the
> > > maintainer side (be it on a maintainer's machine, in some form of CI, or
> > > somewhere else).
> > 
> > One way I see this working is to attach it to patchwork. Sending a patch to
> > the BPF mailing list has their patchwork trigger a bunch of tests and it
> > will tell you if it passed or failed. I'm assuming if it failed, it doesn't
> > add it to patchwork and the maintainers will ignore it.
> 
> Not quite, at least not for netdev, which shares some infrastructure
> with BPF. Patches get ingested into patchwork, and then some time
> later, the CI system will get them from patchwork and run the
> tests. The results are then added to patchwork, both as red/yellow/green
> traffic lights, and clickable links to the test results. Failing tests
> don't automatically cause patchwork to change the status to "Change
> Requested", a human is needed to look at the actual failures and
> decide if the patch should be rejected or not.

The Linux media subsystem CI does pretty much the same. It's been
working quite OK, although dealing with false positives is not easy.
checkpatch.pl for instance returns lots of false positives (or rather
real violations of the coding style that are fine to ignore), and
contributors get an automated e-mail to tell them to fix and resubmit.

> We also make it clear, this is not a public CI system anybody can
> submit patches to for testing. We expect patches to be "submission
> quality", not WIP. Anybody abusing that will get spoken to.
> 
> > Attaching AI to patchwork could be useful as well. But this would run on
> > some server that someone will have to pay for. But it will not be the
> > submitter.
> 
> The netdev CI does not run on the patchwork instance. It just uses the
> API patchwork offers to get patches from it, and tell it about test
> results. But you are correct, somebody pays for the netdev CI, and it
> is not the submitter.

-- 
Regards,

Laurent Pinchart

