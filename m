Return-Path: <ksummit+bounces-2289-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49635B42276
	for <lists@lfdr.de>; Wed,  3 Sep 2025 15:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86E6E169B38
	for <lists@lfdr.de>; Wed,  3 Sep 2025 13:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6CD30DEC9;
	Wed,  3 Sep 2025 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rvhzm2b+"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1A230DD0D
	for <ksummit@lists.linux.dev>; Wed,  3 Sep 2025 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907508; cv=none; b=m+aqPURvnFsM+9hlWUnqiJlgWa+9OF6XDRf9oO1f12WnJEb77pynLVTtImW37+YTT112Pb0Q1uUsGIrajEhg+NmeD/ugMXpHpffpGO0SfDbiFOdCSHpWxX/nCaEQgbQwHYK9E4HqgFudES/pCfuNCnXNBW+QyjzVQHy9wWQUYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907508; c=relaxed/simple;
	bh=O/fRfb9etV3ZNsMPi8FLLFmn+EVAdVXV9qldkPSBP9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8tCW/RVAxlGskkjaQkOUYZ/Wy0cTAFcz53qFP2+Hvg6QOg+gs2tKLBZwxSGVE0SsGAl7Gc+5mUoX4fK4IYSI5boHrilm9xIzlfIep09DGclPpne5uGLI9vSWeNQYez+rDjuQyue+5EZL93fbm2V1MLwg+xyLHRawCkOd/n9DKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rvhzm2b+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 51444842;
	Wed,  3 Sep 2025 15:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756907436;
	bh=O/fRfb9etV3ZNsMPi8FLLFmn+EVAdVXV9qldkPSBP9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rvhzm2b+1KMYIucIfgcqj4LASB0TfE7eM4wlyzQA3B5QFm5Vp6DfXzqzwSEd1J156
	 fHqb1JhcKRbQBbR60tZPSPtqvNVXvbkiby8x6yA2xuzO7ebhl28xADjumQM/CAkwHo
	 Mxylh90qfSrTxGrGx9qZ4vdaXwW2XkevIVRyNJgE=
Date: Wed, 3 Sep 2025 15:51:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <20250903135124.GG3648@pendragon.ideasonboard.com>
References: <20250902141434.3e5b14e4@foz.lan>
 <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net>
 <20250902191929.504977bf@foz.lan>
 <87frd4vfys.fsf@trenco.lwn.net>
 <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
 <20250903124229.332dfeae@foz.lan>
 <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
 <20250903153905.7d93c693@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903153905.7d93c693@foz.lan>

On Wed, Sep 03, 2025 at 03:39:05PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 03 Sep 2025 12:45:25 +0200 Johannes Berg escreveu:
> > On Wed, 2025-09-03 at 12:42 +0200, Mauro Carvalho Chehab wrote:
> > > > For example, use case we have: using nix-shell to lock down the software
> > > > used to build, for reproducible builds and similar reasons. Without --
> > > > pure, PATH may still contain (last!) software from the system itself,
> > > > but it should basically never be used.  
> > > 
> > > if the PATH is mangled, you'll have a lot more problems than just
> > > building docs as it will pick wrong exec files anyway.  
> > 
> > Err, no? To search a binary, directories in $PATH are meant to be
> > searched in order of appearance. It's well-defined which one you pick
> > for which, and this setup takes advantage of that (with a rather long
> > $PATH) to control the binaries used for the build.
> 
> Yes. So? the logic does that.
> 
> > > In the particular case of docs, if you have, for instance, two different
> > > python versions, one with sphinx and another one without it, it may pick
> > > the wrong one, causing the build to fail. There's nothing the build system
> > > can do to solve it. The proper fix would be to wrap the calling logic
> > > to save the env before running under nix-shell, restoring env afterwards.  
> > 
> > I don't follow. If this setup breaks the build then that's good, I'll
> > fix the env. If the build does magic inside and sort of ignores $PATH,
> > that's bad.
> 
> The build logic does follow PATH. If python --version < 3.7, it will
> seek, within PATH, for python > 3.6.

Please, let's stop here. As pointed out by Jani, Johannes and Jon,
that's not a good idea. If the user wants to shoot themselves in the
foot, that's all fine. Printing a message to indicate they may want to
use a more recent Python version is totally fine. Picking a Python
interpreter manually to override the python3 symlink is not fine.

-- 
Regards,

Laurent Pinchart

