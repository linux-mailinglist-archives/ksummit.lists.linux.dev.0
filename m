Return-Path: <ksummit+bounces-2487-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 576D4BCDED8
	for <lists@lfdr.de>; Fri, 10 Oct 2025 18:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 114643A5DE3
	for <lists@lfdr.de>; Fri, 10 Oct 2025 16:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1E82FBDF4;
	Fri, 10 Oct 2025 16:11:37 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBBF266595
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760112697; cv=none; b=A3pQpsyiAsTdTFdaetjVlwHc8Qe+Wq79THenmporfhBRXVqMiOLxMjzJLd/x+wFaxw7HzMPO5C4lcK2ZblrqypXw3UMhYeB52h8eKDV5OFKnSXquGyzw+BlQkGNr9SPxzcnrxp4o9mB5JLFaPDEoG0Jrvvfw9sSPYVMVq4uOQpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760112697; c=relaxed/simple;
	bh=KnAmuUT1iJzqFcucIliuO6wVsjEnwirleHAMsgzBwkA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3t7aqXISwafmysTQU/ScLr0SXn/Q5XTxvlZm0CIXYqV6RSpyHWXZMp+4PuocZALUQZTRARNEq7x2pz7fiGUUE0Xu8lenXLpy3YnUzTqhYFwyER3YZFPvDhgH8wbyqHq+NujNBb/QHg/HmCKeEP/pctEZp/u1ibvX2qcIxemONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 43A4387249;
	Fri, 10 Oct 2025 16:11:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id DB83180015;
	Fri, 10 Oct 2025 16:11:24 +0000 (UTC)
Date: Fri, 10 Oct 2025 12:11:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Joe Perches <joe@perches.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, "laurent.pinchart@ideasonboard.com" 
 <laurent.pinchart@ideasonboard.com>, Andrew Lunn <andrew@lunn.ch>, James
 Bottomley	 <James.Bottomley@hansenpartnership.com>, Chris Mason
 <clm@meta.com>, "ksummit@lists.linux.dev"	 <ksummit@lists.linux.dev>, Dan
 Carpenter <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251010121127.05381ba8@gandalf.local.home>
In-Reply-To: <739c7a03558c3c8642fc6a51de4d679ecd389365.camel@perches.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
	<fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
	<20251008192934.GH16422@pendragon.ideasonboard.com>
	<MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
	<MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<20251009091405.GD12674@pendragon.ideasonboard.com>
	<20251009103019.632db002@gandalf.local.home>
	<d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch>
	<20251010075909.GE29493@pendragon.ideasonboard.com>
	<MW5PR13MB5632C7D79221CF57565DEEF2FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
	<739c7a03558c3c8642fc6a51de4d679ecd389365.camel@perches.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DB83180015
X-Stat-Signature: 8gqo5waec1dxubou91moy76e6zh6ohmw
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+JPDE08c2WGY2o8hxjrWkBwvfDpqCAGg0=
X-HE-Tag: 1760112684-194682
X-HE-Meta: U2FsdGVkX1+iC2TfalFj18atrubFQoFuWoxdo7Iy89GP4vmT/m+AmIQYYoy0ROSz654M4a6meqmuQ4/Z33dZLjx/SWbmSi8tSyXkcyDFM4JfVAJPLdY51wsoqpJROUQBOalax1tx2TT+39QIlaQ8xPAjTsAzw4RvBHgBaUiWqikU7Wv42GaAPQ8mNET5vND68rbTvNXq2W8h4bc55HFfpAPjcAHUXaYXWzMfnB5MtPOdZRIhu2WRtOM8HTHbzAUzkQ7oPlLbXvTOOMAM4DPgzZj7tNRmdzrVllGV/y4tZYz1D5Q/KZFyTydjolM0Aoqi1baj1ceTmI9z2lnvs562tordm2EIi4WbT6RouaKfVQSnDTFL4LWDQA7biNcIVQ/j

On Fri, 10 Oct 2025 08:07:39 -0700
Joe Perches <joe@perches.com> wrote:

> On Fri, 2025-10-10 at 14:15 +0000, Bird, Tim wrote:
> > I have ideas to address the false positive rate, based on features that checkpatch.pl
> > already has, as well as ideas for handling some of the concerns that running
> > checkpatch.pl (or an equivalent) at build time would raise.  Some of these might
> > apply to AI review as well.  Let me know if you want me to elaborate, or if we
> > should just discuss in Tokyo.  
> 
> Please elaborate.

Note, checkpatch.pl fails on pretty much anything in include/trace, as
those files contain complex macros that are basically their own language.
Anything that tries to make them follow kernel conventions simply makes
the output uglier and harder to read.

-- Steve

