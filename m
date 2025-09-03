Return-Path: <ksummit+bounces-2285-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C2B41C1E
	for <lists@lfdr.de>; Wed,  3 Sep 2025 12:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C7627AD72D
	for <lists@lfdr.de>; Wed,  3 Sep 2025 10:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F312F28F4;
	Wed,  3 Sep 2025 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPM3ELMs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055B42F1FE1;
	Wed,  3 Sep 2025 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896164; cv=none; b=r1JH7fOFW5qqt4tFJkoIeKO1LTwYd8YMXaDGk/0IzRXAgV0Al3A8WWoninXlXAKxppo15PtAywpBtqmCbzRFUWh8AohGr8QNGngKWKJ51STsJV4u3SeYZgUm2f4f4iwMttMKgG4/asstp1dbMlFqkNa0hiplwNGPjFEVzv/tD7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896164; c=relaxed/simple;
	bh=nswBR64ViC/hUPCWHFJwHb30VGxS00bZA6cSKxGjObE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KcIBfN7aUQ1YRiOaTHbRIDE0wari3zszd4RGuo5fjAWSSb3qb0CBD/GQIQS5ztkBlxkGd5CJbP0014/teUWswUkPTjIGxv49Iwb5YFa7HG5uddzUWVKScSJ7cZOK1TfWXJ9QctAp+SXqbH9S0eZfZTULa1imCPgsdRJKR4qTxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPM3ELMs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72382C4CEF0;
	Wed,  3 Sep 2025 10:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756896163;
	bh=nswBR64ViC/hUPCWHFJwHb30VGxS00bZA6cSKxGjObE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mPM3ELMsON/gpoXLTjoBw18ZWNLXtJL15Rcd+I+MzssRclb/U/KNNshXpjBNBBHgI
	 W7LtLDOH9Vr67CnpeyEil9cTMKkJfA4NO6Sq6pUe2NvYDCjJcLW/jvGZF8fQGJ/lBN
	 uqnEDEl3IuK2aVcC2+1y3cI8FZxhrScrOMEUpxHV9lwpuGhTiEEcy2Nqkizton2ROM
	 v0L2WezQ9Y/EXivir7eRZw83yq8K3+tLrT1KNXgpYc+WF08a///6CNiyoGpkvY9Q3m
	 zh6HCDhcksc/o+S60m9jAhtWmpqvBQrO1tkgJpxIEoNoGY19svUpbcvPUH83rx1PDw
	 lp6/hoYwEkrXw==
Date: Wed, 3 Sep 2025 12:42:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250903124229.332dfeae@foz.lan>
In-Reply-To: <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
References: <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
	<b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
	<2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
	<20250901204635.51b81ffd@foz.lan>
	<1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
	<j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
	<865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
	<20250902135938.35048fbc@foz.lan>
	<20250902141434.3e5b14e4@foz.lan>
	<8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
	<xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
	<87ecsox4uy.fsf@trenco.lwn.net>
	<20250902191929.504977bf@foz.lan>
	<87frd4vfys.fsf@trenco.lwn.net>
	<b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 03 Sep 2025 08:29:34 +0200
Johannes Berg <johannes@sipsolutions.net> escreveu:

> On Tue, 2025-09-02 at 12:58 -0600, Jonathan Corbet wrote:
> > > 
> > > The idea is not to override the search path: instead, to use it to
> > > check if the user installed other /usr/bin/python3.* files (or on
> > > some other part of PATH). Most distributions nowadays come with 
> > > multiple python versions. I can't see a downside (*) of not using 
> > > a newer version that the user had installed on his system and
> > > has it on PATH.  
> > 
> > But overriding the path is exactly what this would be doing.  It doesn't
> > seem right to say "we know better than you do" and circumvent the
> > configured path; the user may well have reasons for setting things up
> > the way they did.  
> 
> Absolutely! Please don't ever do this.
> 
> For example, use case we have: using nix-shell to lock down the software
> used to build, for reproducible builds and similar reasons. Without --
> pure, PATH may still contain (last!) software from the system itself,
> but it should basically never be used.

if the PATH is mangled, you'll have a lot more problems than just
building docs as it will pick wrong exec files anyway.

In the particular case of docs, if you have, for instance, two different
python versions, one with sphinx and another one without it, it may pick
the wrong one, causing the build to fail. There's nothing the build system
can do to solve it. The proper fix would be to wrap the calling logic
to save the env before running under nix-shell, restoring env afterwards.

Thanks,
Mauro

