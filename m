Return-Path: <ksummit+bounces-2292-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2CEB4246A
	for <lists@lfdr.de>; Wed,  3 Sep 2025 17:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6779680AF5
	for <lists@lfdr.de>; Wed,  3 Sep 2025 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FAE3126C7;
	Wed,  3 Sep 2025 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JGusKvJA"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF03930DD3A
	for <ksummit@lists.linux.dev>; Wed,  3 Sep 2025 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912073; cv=none; b=JeLHxWvPhCjxgFKgjfJ9uDwjVKHCNAz8jqNNaU20g0rVC1xVm++PTavd+5SuaHIJX6z90y+LU95rsmHb3jQtpYamBaIu8+TLgXLIim9WuEmfWnWQteiDL8iJ7c0EYKIRnMaQCBSHqEoUvQMnJCGu3JkLXzbWaMusaRYU8tFm9/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912073; c=relaxed/simple;
	bh=KM2ARPbvkZ04euc+kZODbyhtUqA+d9ujDTrAnqhBbF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BW5G2ZGZpwVbkmcvviJytljbOVUt1zagiBjEvB10Xgfpb78uvK2vz6zGcQgtbu/GKqFFlH43nIqe5VlQb4rQ0+9sJFawdq7IWvdJlAeWK+g7/2l0+ooJjwCTFKng+LV/ZX7jJNYbLSdqeKix6DEhj/pHtqA3ECDIefM3bvXjAko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JGusKvJA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D77A58D4;
	Wed,  3 Sep 2025 17:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756912000;
	bh=KM2ARPbvkZ04euc+kZODbyhtUqA+d9ujDTrAnqhBbF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGusKvJATe2gzsIxLtDYz25c91bUzOAkDfdyKxYoCAo43PCrpg3rAqi8+sIuXdaXZ
	 aJl931uw25mXo+ZYJhpjT4zs33+rxWe8FcUGxubQOiR9Ng07DKBSnSp5L2KlSo6YGL
	 UeMhZT1QCPmsO12GUCktY8hOxyY52VWLx7mbsmzM=
Date: Wed, 3 Sep 2025 17:07:29 +0200
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
Message-ID: <20250903150729.GP3648@pendragon.ideasonboard.com>
References: <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net>
 <20250902191929.504977bf@foz.lan>
 <87frd4vfys.fsf@trenco.lwn.net>
 <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
 <20250903124229.332dfeae@foz.lan>
 <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
 <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
 <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw>

On Wed, Sep 03, 2025 at 04:57:15PM +0200, Mauro Carvalho Chehab wrote:
> On Wed, Sep 03, 2025 at 12:54:04PM +0200, Johannes Berg wrote:
> > On Wed, 2025-09-03 at 12:45 +0200, Johannes Berg wrote:
> > > 
> > > I don't follow. If this setup breaks the build then that's good, I'll
> > > fix the env. If the build does magic inside and sort of ignores $PATH,
> > > that's bad.
> > 
> > Or maybe it's not ignoring $PATH, but rather picking the "best"
> > python3.xy binary from $PATH - still that's annoying because you'd have
> > to control which ones are there and/or know which ones it might pick.
> > 
> > Far more predictable and usable to just use "python3" and print a
> > message saying you might want to use a better version if you think it's
> > too slow.
> 
> There are actually 3 different issues that depend on python version:
> 
> 1. sphinx-pre-install:
> 
>     This used to be a Perl script. The goal is to check if sphinx-build
>     is installed and works, and identify missing dependencies.
> 
>     The problem is: if one installs python3xx-Sphinx, instead of
>     python3-Sphinx, the script will fail, except if it first switches
>     to python3.xx;
> 
> 2. sphinx-build logic inside makefile, required for doc-specific targets:
> 
>    - If python < 3.7, doc builds fail;
>    - If python3xx-Sphinx is installed, build only works if started using
>      the right python3.xx exec
> 
> 3. kernel-doc via command line. Python >=3.6 and <= 3.11 works. It is
>    just 60% slower.
> 
> For (3), I agree with you: let it run at the slow way, printing a warning;
> eventually suggesting a newer version and, as Jon suggested, added a
> command line like --newest-python that could optionally pick the fastest
> version.
> 
> Now, for (1) and (2), it should be possible to allow building docs even
> if the distro requires Python < 3.7, providing extra packages for newer
> Python, as almost all distros do. See, several distros require python
> on their minimal install images, because it can be using during package
> install. Removing the default python replacing by a new version may break
> the system, as the newer version may not be backward-compatible.
> 
> So, what distros do, instead, to ensure backward-compatibility is to
> provide multpile Python versions (together with python libraries).
> 
> The htmldocs/pdfdocs/... targets must support it somehow.
> 
> The best alternative seems to check if:
> 
> - python version is bellow the minimal supported version;
> - there is a newer python binary at PATH;
> - check if sphinx-build runs with the newest version.
> 
> If all those 3 conditions are met, build docs with a version that works,
> printing a message to tell the user what Python binary was used.

This should fail. If you really insist you could print a message telling
the user there's another Python version on their system that may work,
but selecting it automatically isn't a good idea.

-- 
Regards,

Laurent Pinchart

