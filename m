Return-Path: <ksummit+bounces-2291-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 566FBB4242B
	for <lists@lfdr.de>; Wed,  3 Sep 2025 16:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079D918971C1
	for <lists@lfdr.de>; Wed,  3 Sep 2025 14:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0262DCF62;
	Wed,  3 Sep 2025 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibBhD+9Q"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF321A2C04;
	Wed,  3 Sep 2025 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911440; cv=none; b=QXnyiTu5xOyj5OJBV6pdqExfM2flBIVWebj/G5JmiLV/ogBHCNqdcSegOY3Q1KoJA8KZo8s4vcHRUwtYQ1Lq0hKW5QWst/gmokKC28SgmvwQpZ51cgJ7yn2wCDachl2na/6Trc3dOvTgztTZhiRkVBtQao3/aF3EYUMKtTvYAaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911440; c=relaxed/simple;
	bh=UBGOcVsN02FLc+3G4s7YCvByclUEO3H7WjNbWeIbvsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvCB3bwQxbJFKPVmck8+5HpgFlK4LCmR1qMKiPvm6cSkvQ0YkmGVY11BjcG2XyKx0/X+84g4buNCT95jsabpmxD7brSpefC/PJ/iQJiFhGl3Ugtoaa02eltjoHxikxDiai+BX7NhiSY9i5uuPz32tR99WHyo49Qz3Ff7SLCh2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibBhD+9Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93686C4CEE7;
	Wed,  3 Sep 2025 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756911438;
	bh=UBGOcVsN02FLc+3G4s7YCvByclUEO3H7WjNbWeIbvsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibBhD+9QlIfb/auG56wGqNncNbljPd90aOZCGj4MUsbqmHNLPBl8fQ6/xZt1/3J7Z
	 e9i59dTBWkPrNnjhoW8MoGNARcR427mG9Tp0XjGn5V4GUX3kW6AhjaC4eIJg27AyE8
	 lT0JJdr0dtBJwQgwG3VNeXDSxSEE+RW/436vVfXoerrK2g+Iq/J3F3rzixSvBfs/e+
	 2ublm/Qh30tl7ZXbyCwEm/oIGNCuvPx6MPBM4l8IT2EJrAiPzUA4UCGyAIPB+FW35K
	 M5Jw0sFHK8RNhGskUybZQY+OpI67mSbmfGSHAI1MXxkCktrIz5b4tsZDSoTbY16YCm
	 siON00oM26H2w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1utovD-00000007AQa-40MK;
	Wed, 03 Sep 2025 16:57:15 +0200
Date: Wed, 3 Sep 2025 16:57:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, 
	Linux Documentation <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw>
References: <20250902141434.3e5b14e4@foz.lan>
 <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net>
 <20250902191929.504977bf@foz.lan>
 <87frd4vfys.fsf@trenco.lwn.net>
 <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
 <20250903124229.332dfeae@foz.lan>
 <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
 <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Sep 03, 2025 at 12:54:04PM +0200, Johannes Berg wrote:
> On Wed, 2025-09-03 at 12:45 +0200, Johannes Berg wrote:
> > 
> > I don't follow. If this setup breaks the build then that's good, I'll
> > fix the env. If the build does magic inside and sort of ignores $PATH,
> > that's bad.
> 
> Or maybe it's not ignoring $PATH, but rather picking the "best"
> python3.xy binary from $PATH - still that's annoying because you'd have
> to control which ones are there and/or know which ones it might pick.
> 
> Far more predictable and usable to just use "python3" and print a
> message saying you might want to use a better version if you think it's
> too slow.

There are actually 3 different issues that depend on python version:

1. sphinx-pre-install:

    This used to be a Perl script. The goal is to check if sphinx-build
    is installed and works, and identify missing dependencies.

    The problem is: if one installs python3xx-Sphinx, instead of
    python3-Sphinx, the script will fail, except if it first switches
    to python3.xx;

2. sphinx-build logic inside makefile, required for doc-specific targets:

   - If python < 3.7, doc builds fail;
   - If python3xx-Sphinx is installed, build only works if started using
     the right python3.xx exec

3. kernel-doc via command line. Python >=3.6 and <= 3.11 works. It is
   just 60% slower.

For (3), I agree with you: let it run at the slow way, printing a warning;
eventually suggesting a newer version and, as Jon suggested, added a
command line like --newest-python that could optionally pick the fastest
version.

Now, for (1) and (2), it should be possible to allow building docs even
if the distro requires Python < 3.7, providing extra packages for newer
Python, as almost all distros do. See, several distros require python
on their minimal install images, because it can be using during package
install. Removing the default python replacing by a new version may break
the system, as the newer version may not be backward-compatible.

So, what distros do, instead, to ensure backward-compatibility is to
provide multpile Python versions (together with python libraries).

The htmldocs/pdfdocs/... targets must support it somehow.

The best alternative seems to check if:

- python version is bellow the minimal supported version;
- there is a newer python binary at PATH;
- check if sphinx-build runs with the newest version.

If all those 3 conditions are met, build docs with a version that works,
printing a message to tell the user what Python binary was used.

Thanks,
Mauro

