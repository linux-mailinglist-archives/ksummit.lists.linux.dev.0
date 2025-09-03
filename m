Return-Path: <ksummit+bounces-2296-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 390AAB42579
	for <lists@lfdr.de>; Wed,  3 Sep 2025 17:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64A793AB7B8
	for <lists@lfdr.de>; Wed,  3 Sep 2025 15:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C50A25B1D2;
	Wed,  3 Sep 2025 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7bfkZBK"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF640259C92;
	Wed,  3 Sep 2025 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913133; cv=none; b=ra57ipXf/3rtPK/4wChuIqFZLRX8t/urhrsfXgemkqI3IDBU33H3uuTZfznNWEPeqkmfN2mVBMPWcwts8g8oP+zOQIKqjL8bymSCpbps9wjAYanTH4FFkMncXkcASr+zRTFiYTCxM1jo62d1p4m4mdyv4G7A10FysMjNLyhKB8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913133; c=relaxed/simple;
	bh=PPPHepslJ/GbTqHPpzV+/rJxxOq0MiE6gSStTzqYzzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHtu5wr6IlPG1ZPA1eqHKmk6ba5yFe0t6oY4/+uk/o/FsC9AQmsN4k7QpQ52X7POTp6Jhw2c++Tg0XPXmmq7/oX8t7rR5VTSeMu9X6fGWwkFOECRJvpGK4VOmNeTbQmgT1Xioc6MUrETWnLnMBkLHUHjBmH4GkPeYFa8P22CVzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7bfkZBK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8C2C4CEE7;
	Wed,  3 Sep 2025 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756913133;
	bh=PPPHepslJ/GbTqHPpzV+/rJxxOq0MiE6gSStTzqYzzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7bfkZBKVlLoYtCa9GItdF2AF5Ic5IA++BESUUTwExi17DUHJrCTOsdR/ZvQBeL1L
	 fRERsPI7PIUhN0Tgi0R+rjE6WZTKt8G+kkJsABlTdoUVbONICjmmwMElswCM54qudD
	 cXbylfizJpIlv/XHZE9Lt8VES7KDTLe/zDvP+gHu0YeTjAa5v9QxTDB0COQqoGvhNo
	 9Fe5OepsA1EJRkhnYmneOQpISBeiX0WXZgmOcqdyOn4pQusN4d2/dWuktlfLoASomR
	 8cRtY1MZAq8WHisX+7bB4UwBY3v/1WonxKkzQ++NJJ8Ph1HPJ+qtlsEkgW80T/m6uR
	 f3Ct+DVuKG9lg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1utpMZ-00000007Hf6-0zRK;
	Wed, 03 Sep 2025 17:25:31 +0200
Date: Wed, 3 Sep 2025 17:25:31 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, 
	Linux Documentation <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <vu3l5df4iz4rbwinxldr56vzupzxeupemcvxt7ziqi7kwhytso@wrgznki67cew>
References: <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net>
 <20250902191929.504977bf@foz.lan>
 <87frd4vfys.fsf@trenco.lwn.net>
 <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
 <20250903124229.332dfeae@foz.lan>
 <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
 <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
 <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw>
 <874a85f2154d6b05635d856dcdd85d4715d19d3c.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874a85f2154d6b05635d856dcdd85d4715d19d3c.camel@sipsolutions.net>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Sep 03, 2025 at 05:11:12PM +0200, Johannes Berg wrote:
> On Wed, 2025-09-03 at 16:57 +0200, Mauro Carvalho Chehab wrote:
> > There are actually 3 different issues that depend on python version:
> > 
> > 1. sphinx-pre-install:
> > 
> >     This used to be a Perl script. The goal is to check if sphinx-build
> >     is installed and works, and identify missing dependencies.
> > 
> >     The problem is: if one installs python3xx-Sphinx, instead of
> >     python3-Sphinx, the script will fail, except if it first switches
> >     to python3.xx;
> 
> So let it fail. Fail is fine, at least it's a clear signal. The python3-
> Spinx package will anyway be a sort of meta-package that's basically
> empty and depends on a specific version.

No, that's not the case. On Leap, python3-Sphinx uses python 3.6 and has
Sphinx version 2.3.x, which is too old.

> > 2. sphinx-build logic inside makefile, required for doc-specific targets:
> > 
> >    - If python < 3.7, doc builds fail;
> 
> Fine, python 3.7 is really old by now, if you actually have python3==3.7
> you probably have other problems anyway. I don't think we need to
> support that.

On our past discusions on linux-doc ML, we opted to support the latest
openSUSE LTS version (Leap).

> >    - If python3xx-Sphinx is installed, build only works if started using
> >      the right python3.xx exec
> 
> Yeah, but again, we can require python3-sphinx here.

See above. python311-Sphinx is OK, and it is a distro-installed package.

I can't see why we can't use to build the docs if the user explicitly
installed it.

> > Now, for (1) and (2), it should be possible to allow building docs even
> > if the distro requires Python < 3.7, providing extra packages for newer
> > Python, as almost all distros do. See, several distros require python
> > on their minimal install images, because it can be using during package
> > install. Removing the default python replacing by a new version may break
> > the system, as the newer version may not be backward-compatible.
> 
> Umm, no? I'm not sure there's a need to cater to truly ancient software
> in today's kernel build environment. Even debian *oldoldstable* has
> python3==3.9:
> https://packages.debian.org/bullseye/python3

True, but at least one of the major LTS distros don't have it(*).

We can review it after Leap is replaced for the next openSUSE release.

(*) also, RHEL8 (and its derivated releases) suffer the same issues
     and they aren't EOL yet.

For most of us, I doubt the fallback logic would ever be used.

> > The best alternative seems to check if:
> > 
> > - python version is bellow the minimal supported version;
> > - there is a newer python binary at PATH;
> > - check if sphinx-build runs with the newest version.
> > 
> > If all those 3 conditions are met, build docs with a version that works,
> > printing a message to tell the user what Python binary was used.
> 
> I still disagree. The only predictable thing is to use "python3" and
> associated python3-xyz tools, and let things fail if those versions are
> too old.
> 
> Picking a random different version that will depend on the kernel
> version etc. is just going to introduce more moving parts and will
> eventually be painful.

When it becomes painful, we can drop it.

Anyway, I'll let it for Jon to decide.

-- 
Thanks,
Mauro

