Return-Path: <ksummit+bounces-2081-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831E6B1BC5F
	for <lists@lfdr.de>; Wed,  6 Aug 2025 00:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2096E18A0CB7
	for <lists@lfdr.de>; Tue,  5 Aug 2025 22:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB5D24291E;
	Tue,  5 Aug 2025 22:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="om6+9nV+"
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5480B200127
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 22:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754431581; cv=none; b=YGyWKE5wv8WoxfshDLZmshtCYVjaPu9ckyBj6eNGArXdYMsxJWYOUmEjLdw/Gv1J6K7RcioL0UKggF/P8f4NKnU5g2Lz7rpCpGmgMBdhoZ0HFl+GfsRiF5nDtYvqrEppHJ7DeaKl9zzzNVYNElB+JCdp+3nbNef32cLPZ0HX3c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754431581; c=relaxed/simple;
	bh=LOIuD0C5Yp65hV6SKYM7d7yWW5yyEeVxf3VemikXFHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LImkFwpHCqnY3GJqUbEy5PJDpN+PTcpaHB2pQccoq3PeuuCL5z+6rzRoZjMAJ3+SAB6SceBpgkATvrDWeYBzIKN5kqITl2MpNKZeYXPUs+ATDGJmr9DjBFkjzO6eJTEMT0Ia0JFsT4q5lpIRBLkdhk4bWADELcmsJ4/JV5Kf/Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=om6+9nV+; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7172543178;
	Tue,  5 Aug 2025 22:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754431577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSnUdPsTrvyRlxpoOa+G/DSQNMz74j7UzgvhOgC6Vn8=;
	b=om6+9nV+nb4Xz6Gf4Ty+naQ2t/kQaQ7sHN8agl+7S3zUM35sMjMyMx/wdi49Lwsbi4G+KD
	CpUryB9ylc7NJ7R3XhcVLscPQq8RspAIZkMS/zUZbjLc0HHZkWSBTqSMpIMl4omhdsvPfv
	0/OOpF4FSXxWNznA3AvSrU9bLvfM3mOxzPuQprk4EfekphNWkNKVw9TC3roFGjAL4c7jnv
	I6K8Dwu4J8QgN47JROW51YVu8BC6HdynQL5s1iSDpXHoeTz2XPsyjpG8MhQuBQ2XCXTw28
	wC/GZNTiO/CPi/fh3pWh6i1CkYBbR/wOtUoUk97bBxqd24djqUvr8GCHkPT3oA==
Date: Wed, 6 Aug 2025 00:06:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <2025080522061676e4bddb@mail.local>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <20250805180010.GA24856@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805180010.GA24856@pendragon.ideasonboard.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudeifeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeghedruddurdeikedrvddvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeghedruddurdeikedrvddviedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepshgrshhhrghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjkhhoshhinhgrsehsuhhsvgdrtghomhdprhgtphhtthhopehkshhumhhmihhtsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: alexandre.belloni@bootlin.com

On 05/08/2025 21:00:10+0300, Laurent Pinchart wrote:
> On Tue, Aug 05, 2025 at 01:50:57PM -0400, Sasha Levin wrote:
> > On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
> > >This proposal is pretty much followup/spinoff of the discussion currently
> > >happening on LKML in one of the sub-threads of [1].
> > >
> > >This is not really about legal aspects of AI-generated code and patches, I
> > >believe that'd be handled well handled well by LF, DCO, etc.
> > >
> > >My concern here is more "human to human", as in "if I need to talk to a
> > >human that actually does understand the patch deeply enough, in context,
> > >etc .. who is that?"
> > >
> > >I believe we need to at least settle on (and document) the way how to
> > >express in patch (meta)data:
> > >
> > >- this patch has been assisted by LLM $X
> > >- the human understanding the generated code is $Y
> > >
> > >We might just implicitly assume this to be the first person in the S-O-B
> > >chain (which I personally don't think works for all scenarios, you can
> > >have multiple people working on it, etc), but even in such case I believe
> > >this needs to be clearly documented.
> > 
> > The above isn't really an AI problem though.
> > 
> > We already have folks sending "checkpatch fixes" which only make code
> > less readable or "syzbot fixes" that shut up the warnings but are
> > completely bogus otherwise.
> > 
> > Sure, folks sending "AI fixes" could (will?) be a growing problem, but
> > tackling just the AI side of it is addressing one of the symptoms, not
> > the underlying issue.
> 
> Perfect, let's document a policy and kill two birds with one stone then.
> 

Yes, I was going to bring up static checkers and the patches generated
to fix warnings that don't make sense. I'd like contributor to
explicitly state they used a tool to find an "issue" and generate the
patch so I could more easily ignore them. For example, we have been
adding plenty of return value checks and error messages for things that
are never going to happen or is they happen, the system is a state so
bad that it will never get to print the string.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

