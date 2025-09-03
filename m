Return-Path: <ksummit+bounces-2288-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77271B42210
	for <lists@lfdr.de>; Wed,  3 Sep 2025 15:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F2BD7C2E5E
	for <lists@lfdr.de>; Wed,  3 Sep 2025 13:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1238B3043CD;
	Wed,  3 Sep 2025 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spn3Fnbn"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764101FDE09;
	Wed,  3 Sep 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906751; cv=none; b=AtRr+Pgh6HmKjK5q1y3h+5dItl3MCmhpewd5e/p+KKCNt8mOLrS/6fofXsH1foIwW5ojzMnshnODe5v6DdWTRmJlPxyYF4Uoc7JanHAvg/hAzPfRFGFS3v5FQ7BDN8zjQOh5nZWMmwVBG+lJSGWr9YieGSf8q/eU52YqTU4bDbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906751; c=relaxed/simple;
	bh=vg8sLe5HKU8sHBwXSeRZkySZwk7wqz1uT7yc+zg+31A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9M9TzUytDsfmIZS1nQb0i28w34Num8+6cNj+fR6Limc5OD4XZBQSg30i7J8grU8p87vDzG6TnMvu95SNzuWHyEPVBjI6laQ2Zyx82SIrj7RxYv5ZrHPvZFDxYZAZ1uc+n0z5Or8W3zLAl47psvf5szB+DfqMDBO7o709lOdDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spn3Fnbn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9B0C4CEF0;
	Wed,  3 Sep 2025 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756906751;
	bh=vg8sLe5HKU8sHBwXSeRZkySZwk7wqz1uT7yc+zg+31A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=spn3FnbnU0x722a7dIBM4K7NM6Ass0qJnqEidaQDT7oVcBNl4O1a3A/ZbJ2NtkFUw
	 LvMi/w1gDDciuij7h31PDGqzm0+B/eAPOnTh20Mn7bb3mh3uT4aC15Sx0514nADTdI
	 lcQyUrkZvDKQGcOCZh6fsv8Iy6trxK3BYMrvY5PU6CkOrvhrAHAEikn1SplOrQ0u8A
	 4bpmpptfizDm3lI6TLNXymqdvOchtsuYO6C/jT+RXsUQoSmsxbEy03oS7sLEK9PJs3
	 vFsXZnwCw20jfEPE4QFbitUkyCRUnyYdxDjvbfOETObwVaBAmGm2vxZge5oNOPNDIb
	 fSWgXkFDl5V2Q==
Date: Wed, 3 Sep 2025 15:39:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum	
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation	
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya	 <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250903153905.7d93c693@foz.lan>
In-Reply-To: <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
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
	<20250903124229.332dfeae@foz.lan>
	<431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 03 Sep 2025 12:45:25 +0200
Johannes Berg <johannes@sipsolutions.net> escreveu:

> On Wed, 2025-09-03 at 12:42 +0200, Mauro Carvalho Chehab wrote:
> > > For example, use case we have: using nix-shell to lock down the software
> > > used to build, for reproducible builds and similar reasons. Without --
> > > pure, PATH may still contain (last!) software from the system itself,
> > > but it should basically never be used.  
> > 
> > if the PATH is mangled, you'll have a lot more problems than just
> > building docs as it will pick wrong exec files anyway.  
> 
> Err, no? To search a binary, directories in $PATH are meant to be
> searched in order of appearance. It's well-defined which one you pick
> for which, and this setup takes advantage of that (with a rather long
> $PATH) to control the binaries used for the build.

Yes. So? the logic does that.

> > In the particular case of docs, if you have, for instance, two different
> > python versions, one with sphinx and another one without it, it may pick
> > the wrong one, causing the build to fail. There's nothing the build system
> > can do to solve it. The proper fix would be to wrap the calling logic
> > to save the env before running under nix-shell, restoring env afterwards.  
> 
> I don't follow. If this setup breaks the build then that's good, I'll
> fix the env. If the build does magic inside and sort of ignores $PATH,
> that's bad.

The build logic does follow PATH. If python --version < 3.7, it will
seek, within PATH, for python > 3.6.

Thanks,
Mauro

