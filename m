Return-Path: <ksummit+bounces-2130-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E5AB22AB2
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A951887A33
	for <lists@lfdr.de>; Tue, 12 Aug 2025 14:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BFA2E975F;
	Tue, 12 Aug 2025 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="m2Vb0riY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RUhLCZcc"
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB52D8377
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009071; cv=none; b=mQmvWGyAon7T9pbvoTLC+1nUlQc8uEaSuryr8PevMFpW/UORxUVsqoHP+4RUeRaRsiz/Ad89T1BTtjZKGGjWzHuRgAmqB41bgguV/+Ls2N+2xh1DHfAXpDK563kqFXdhK8aOGLNDYJos3NTwpU3AcnHqNtdlx58lqvFwZM7GR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009071; c=relaxed/simple;
	bh=QeFCowXux60rM3vs7hDQqCI3xZGR2r5jzquKX8mIIr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPZZQtAOTQPYRNjH/JPj5eezGTuGe+Ji3MDqfTue/NrsXwOj2ewRgFIhlaqecqYPYuYNNHVdqeOHkrn+7trslz8jp2b0C00SmbTEUOAb2uOWmCXTAMkdiVzDRhLRu67VhKTlMIFOANwBLe/kKpGBVdmF9StIuLeBKFdPzP35dUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=m2Vb0riY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RUhLCZcc; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 3E3D4EC0271;
	Tue, 12 Aug 2025 10:31:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 12 Aug 2025 10:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1755009067; x=1755095467; bh=9L6tiBiWlJ
	cvxEDaSxz839iJ+l0lOcfIJgN/kbslKQ0=; b=m2Vb0riY6qQ8Yb09Zzy4OF9ZZK
	q2dge6DhI/QGSkfhveVNNCKGqaO3nSYsw0owcncUyl1DzdVb71QLYhuX8M5fNeGp
	ow0A4zdZJTWCdwalKOPCQWz04KEdLgpZsep2bPbOxJRo7ldiH+5DgfOfwB9yGflF
	wkx58NjVID6o0QqpSVQZrU7YHF+BLtDBvx2ddv7ldT947KP2u7HFDk6jzbK6Pxsp
	5kJF47OlKFOQH1vP0i4YJxuTvEH022JIgrQQqjZ+OZnevKAqRgVh3i/B2UZBIqBs
	tSeZ0w6DC/TRhx/QZBSRRLjp1ZlwTyFcdnnY5rfa/4e+SK2ygvn0EYPGtO8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755009067; x=1755095467; bh=9L6tiBiWlJcvxEDaSxz839iJ+l0lOcfIJgN
	/kbslKQ0=; b=RUhLCZccTljiFODdJeghNZavNVKh9IJyxfMbB0anU/DX5JmNmeU
	PD9Seo6ZI+/L5bSi2Tt+5YPrF4b59z/vfaKTGGC8Z4gNmcdIH8Xl3+PYcVyc1aei
	tnml3S/Nm9NVb4VYKjSNTMD71GGLQ9sT+AD3uHwJNhsHF555PCqODla1S+TODoCh
	ukAxjB74UWokd8pZcwIOe+XHqsvSREPUyP36Z+mG6plTs/gpV+ERP+kG8kS5EjPM
	PrjYHTTTEIhQBMEQPCQkMsnhx0l7Rb9RwDRZhPpq5CGs3nJK82rUyzBYo3Lp6BEF
	rhxvKSwPxhiPQYLFmF3wjG4DWb7nvfbhKuw==
X-ME-Sender: <xms:KlCbaDUkI1d1tv9kw0mlCmjkxPCl_nMqgBJ2j57x9Xc-FjSsxiy0rQ>
    <xme:KlCbaLJHeKE0MZtu3vxjy8FhQmSrZb5tsXS8O6meJpJtXySNg_C6ZZJR6vuEfAj9E
    YDmcKYqmFSRhw>
X-ME-Received: <xmr:KlCbaDsGNCe0cReAKHgViGQnmC2RZT6qLhRR045FLamiadhZ6a_LTYYQ3TYIDQRG8pv-Vb2lICh7W7hOm_GnrDs69dD-TQZCO0-sQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeehheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepthhimhdrsghirhgusehsohhnhidrtghomhdprhgtphhtthhopehjrghmvghsrdgsoh
    htthhomhhlvgihsehhrghnshgvnhhprghrthhnvghrshhhihhprdgtohhmpdhrtghpthht
    ohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehsrghshhgrlheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepjhhkohhsihhnrgesshhushgvrdgtohhmpdhrtghpthhtohepkhhsuhhmmh
    hitheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:KlCbaA0pBJiwG-LjjWRUWR67EXez1DnphK_sHanTtxAhwSIeXdqHeg>
    <xmx:KlCbaLO5XtdQ--dZizoWTWdJLWBQ-_ekUxyhb2loFVuxFqP8tUbN0g>
    <xmx:KlCbaAX4ZMCqx4D7It1tqFXhIUu2lXdvvrNCkODKf7t-0MWGWDMJxw>
    <xmx:KlCbaAa4NEnBi3ifqTLuqT0ycSwzpwLlTNYjTKxRX0mDAzyWa-b2Kg>
    <xmx:K1CbaFbd1zVcDCUGUsp-0xo5vrMx8V3r0KBU7MKdAHkz1aR8OpTBRGRq>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Aug 2025 10:31:06 -0400 (EDT)
Date: Tue, 12 Aug 2025 16:31:04 +0200
From: Greg KH <greg@kroah.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <2025081209-friday-gauging-cac5@gregkh>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <MW5PR13MB56323AC4400A7CC5A1880BE6FD2BA@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR13MB56323AC4400A7CC5A1880BE6FD2BA@MW5PR13MB5632.namprd13.prod.outlook.com>

On Tue, Aug 12, 2025 at 01:15:33PM +0000, Bird, Tim wrote:
> The copilot case is going through appeal now, and I wouldn't bet on which
> way the outcome will drop.  It could very well yet result that AI output is deemed
> to be derivative work of the training data in some cases.  If that occurs, then even restricting
> training data to GPL code wouldn't be a sufficient workaround to enable using the AI output
> in the kernel.  And, as has been stated elsewhere, there are no currently no major models restricting
> their code training data to permissively licensed code.  This makes it infeasible to use
> any of the popular models with a high degree of certainty that the output is legally OK.

As semi-proof of this, everyone will note that the closed operating
system developer teams have NOT put their code into these public coding
models, NOR do they allow AI tools trained on these public models to be
checked into their closed source codebases.

So I strongly suggest that perhaps until that happens, we too should
seriously consider that the legal issues involved be taken semi-seriously :)

thanks,

greg k-h

