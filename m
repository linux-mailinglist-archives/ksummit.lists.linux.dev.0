Return-Path: <ksummit+bounces-1250-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8BB907483
	for <lists@lfdr.de>; Thu, 13 Jun 2024 16:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B02672846D8
	for <lists@lfdr.de>; Thu, 13 Jun 2024 14:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D41C14265A;
	Thu, 13 Jun 2024 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="bxZDFi7o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Tz3I69L1"
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41541C8C7
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287364; cv=none; b=evOuvuVUAoIlnjZslgIFb67D2EWd/MG4Re0Z2d9rseuSn3qmlWeZZSpK/fQGLgO/PorDHBXfs03KeUYR5MtJp/qthbYY3UTslQpgMmqJ2YEMgMimy3hey1RvM86xOTPvlZ8tVeXkWVfcoKsuQ83Slx95YNmXBmxgTeAH4rsUWms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287364; c=relaxed/simple;
	bh=uZn2Uf0CUBACJ5DTK6XvpIsze6VVSu/yRpF00uUjMw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cu89yuzB0HK7wgjlZUl9N/nTgDiAV6IJzb50beDE1lvrgP1FGBQGEUqNQuvHQ6IslDkSxHG1N63NBMbM91wN9gcoQCHvmF1xZve6Bw5AmvuHk1rZh548+aHUvNTihowuF/0bWreoOnqdQdXgE9VxMRBHCNcwdusPe8S4xQdaKJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=bxZDFi7o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Tz3I69L1; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id E525818000B7;
	Thu, 13 Jun 2024 10:02:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 13 Jun 2024 10:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718287359;
	 x=1718373759; bh=6Ez/x5iuVpmP1ywP3365V3Iu+tsaH5R/RbXfVCYYkVM=; b=
	bxZDFi7ohGwA1tfCWLsYyZnSUEbMKfz4wrj2FMMKLNw7r/nBw4YU3LwjeYiYfZgJ
	+FpoBLbnV4YvWxVJGd0C2Umd2dlHc6iyBJane51ffDJ66TbKiBjUJ0tWnbFseQ1h
	F/Sb5ClKU934pRYHB0DJ6Lx4roq3IIuV4r4DO/fPNweX3ke8XobciPG4zoxiXN7v
	i80MWw07+OzCkHo1+DXecOrIEOj/hch9wkMHvc1PMbGdAq75o9/neJDZPiCrEqJS
	2ZSrv0g4vGfi3DaLme6lTa6hIrBxb67WKG8VOS5yNKzL8WK/OlJH2bXLl9La+Lgx
	9YDCeJ3gpNEDCq9rhANWWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718287359; x=
	1718373759; bh=6Ez/x5iuVpmP1ywP3365V3Iu+tsaH5R/RbXfVCYYkVM=; b=T
	z3I69L1LXvf7V+yhGnFQXW17uJWS5Ywen69PmVlgJ/m///50FCWiuXu8p7T3sxv5
	gTLuHJgVDGW843aKHtGF5v87Undx0ZYe629Pu/Y2T07cAg/S3Rx3Mi77BSQy08K1
	omCMa8i364HpSiuGVFyBbwGADG/DSBoEdXVE9uhtqaGs8HJFw9mmJ/j0DPWL2kFR
	yOSby6+h30aYavwG/H2PQTIFZP7+/k4rz4SGDMaN/ol/lYSGujERvI+KULVz2DeZ
	FEFTQJO5xVbRILEydEzhjrzO+N9Bm6kK2DmKxxmfZXFTwWBubrl6oKbgBqAIwZ8q
	tr/OkuQGbUbv8HG1lk+Yw==
X-ME-Sender: <xms:_vtqZlVQ3WsnV8BmnW4mrwR48MS-NxIU3bUWxN9WXrhQOoKtOlQ7OQ>
    <xme:_vtqZlmuuc_RTyoC4hfb3S04pkauFCynh712OHYaZBvU0vjWp_WEIm70Ir977_48N
    x6_dBRgFx0Qbw>
X-ME-Received: <xmr:_vtqZhaKHyQKpQddONCn5ZVJQEIM1UUNlDJdfHqlxrUPZxdlUz17EypG3tHSXngz0MY9cppnSSYYWmrgh8BvUMZp7KQLdt5OuKmPlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegve
    evtefgveejffffveeluefhjeefgeeuveeftedujedufeduteejtddtheeuffenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:_vtqZoX7qFw5E1fBQQMAK5o7I1wRnHkg6ORd8lnwzeb7qGj4djNsAA>
    <xmx:_vtqZvlZzLb5TzMT2t9Df7y7iXuv7WYDhg5boNSxeUAF25IA2Tlpvg>
    <xmx:_vtqZlehSs52sGQSXMnywi57poXyGNye9Kyxxax_GZ0X4tePshU2rw>
    <xmx:_vtqZpFtjIN7c2t2LNGzJTxyKcSdbI9SBiH8v4eaYxyf5FBaDzj12Q>
    <xmx:__tqZh4kvXQLE1DTu6Um9vH5ug8MzSQ6u7lNZSlogoHloJ3zrpvccovr>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jun 2024 10:02:38 -0400 (EDT)
Date: Thu, 13 Jun 2024 16:02:34 +0200
From: Greg KH <greg@kroah.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <2024061305-swimming-politely-30f3@gregkh>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
 <ZmruqWDTG2PK-rbu@sashalap>
 <dea93a79fc457d8a5424a18f8c138a4f75def064.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dea93a79fc457d8a5424a18f8c138a4f75def064.camel@HansenPartnership.com>

On Thu, Jun 13, 2024 at 09:56:56AM -0400, James Bottomley wrote:
> On Thu, 2024-06-13 at 09:06 -0400, Sasha Levin wrote:
> > On Thu, Jun 13, 2024 at 07:58:58AM -0400, James Bottomley wrote:
> > > On Thu, 2024-06-13 at 10:42 +0200, Thorsten Leemhuis wrote:
> > > > The scenario shown at the start of the thread illustrates a
> > > > problem I see frequently: commits with a Fixes: tag end up in new
> > > > to stable series releases just days after being mainlined and
> > > > cause regressions -- just like they do in mainline, which just
> > > > was not known yet at the time of backporting. This happens
> > > > extremely often right after merge windows when huge piles of
> > > > changes are backported to the stable trees each cycle shortly
> > > > after -rc1 is out (which even some kernel developers apparently
> > > > are somewhat afraid to test from what I've
> > > > seen).
> > > 
> > > I haven't really observed this for curated fixes.  For most
> > > subsystems, patches with Fixes tags that are cc'd to stable tend to
> > > go steadily outside the merge window.  Obviously a few arrive
> > > within it, but usually at roughly the rate they arrive outside it.
> > > 
> > > What I observe in the merge window is huge piles of patches go into
> > > stable *without* a cc:stable tag from the autosel machinery (and
> > > quite a few even without fixes: tags).
> > 
> > Could you provide a concrete example? This shouldn't happen.
> 
> This one has no fixes or cc stable:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f1663c91934f664fb850306708094a324c227c
> 
> Yet here it is backported:
> 
> Message-id: 20240603121056.1837607-1-sashal@kernel.org
> 
> (I can't give a lore reference because conveniently it was a personal
> cc with no tracked mailing list).
> 
> I picked that one because we discovered a bug with the strlcpy to
> strscpy conversions in SCSI which it looks like this backport has.

It says, in the commit message:
	 Stable-dep-of: c3408c4ae041 ("scsi: qla2xxx: Avoid possible run-time warning with long model_num")

That is why it was backported.

thanks,

greg k-h

