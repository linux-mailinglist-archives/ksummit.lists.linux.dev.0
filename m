Return-Path: <ksummit+bounces-2284-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B9DB41BC7
	for <lists@lfdr.de>; Wed,  3 Sep 2025 12:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E29207FF6
	for <lists@lfdr.de>; Wed,  3 Sep 2025 10:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3420A2E9EB8;
	Wed,  3 Sep 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzAl2yB1"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185AF275B18
	for <ksummit@lists.linux.dev>; Wed,  3 Sep 2025 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895127; cv=none; b=CpNHExzFOP6VXOkE7GjzYwyQDBZpOifZfVh8R4MqCgOuJnwBCTW3Kv43VDe1+wmuE2hLVUQGB/4olDIt3z+OAyDTcnE0SBxln0RE8Lf+yaDkMbA4XX5r2yftYLT2tB5wf3U/AZsa9QVwBZBjrFnkjsrkc5sT1eFgkpk6m0V5e1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895127; c=relaxed/simple;
	bh=Q9fut6T33IgYBTP8+/KBZMHpXGM2Z8NN5b4LqjxG6tY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ERUtJg89S54LDHBnigmx0VG3dw8bejPRK1gv54puWoejLn3KVoUUI2C8IWbHbzr1F88pkq55dUPJrQ28mrYIcWtUrDoOtmS5zFygO4hJx3CtAqtHhw6xya6UPEY9cxozXqzcOAQKSEYffr6FXBvi8AgThehrLjkmcS8svxYRoVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzAl2yB1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756895126; x=1788431126;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Q9fut6T33IgYBTP8+/KBZMHpXGM2Z8NN5b4LqjxG6tY=;
  b=kzAl2yB11UIvMPjsK7OCNtJ07w8Y3qI2IW+8O3T2nXOv7GXziz9mQyuK
   yVeDDpofuRkzKUXoRMn586DIrgsxQBzcopGfh7zPUIkIBfTZLMzBtr50m
   XMCutH7LW4a4AA2rkLJtFAqab2nnC3G+cp3rlw3vj3KQLQicxil4n9VTL
   V9tnGN3BkDIe/tJAmQ8/Zd74XWLsYmCHQUvBu75kx6Q4/r7moSdrk6Vgw
   1AXoVlsD7Nk2ve8eUSQPoVhvRLjh0pRjPkZgx2xavna8ycegldXcjwUty
   /AKRZ6n7/Ust5AJclk4IO6EcrsK+1RtHSnP4RQzDiWw1sAkdcG4H/Nkeq
   A==;
X-CSE-ConnectionGUID: S8rnsWvxSYeQFdje2vv7zA==
X-CSE-MsgGUID: rlyoPCDpToKH4PpkKFGPjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76646294"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="76646294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:25:25 -0700
X-CSE-ConnectionGUID: 3bqGDvcVQPyzkmTHFlI1Sw==
X-CSE-MsgGUID: Z0qDKcfPR+qZQh0mcRqE2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="175916773"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.246])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:25:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250903120409.32f3b3b0@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250901204635.51b81ffd@foz.lan>
 <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
 <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
 <865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
 <20250902135938.35048fbc@foz.lan> <20250902141434.3e5b14e4@foz.lan>
 <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net> <20250902191929.504977bf@foz.lan>
 <20250902185221.GA1602@pendragon.ideasonboard.com>
 <50492e9bd0d647a6ba7eccbed73f782181f83499@intel.com>
 <20250903120409.32f3b3b0@foz.lan>
Date: Wed, 03 Sep 2025 13:25:18 +0300
Message-ID: <9a9d8e15947e7f11c92d390bb221ebc6e601212e@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 03 Sep 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Em Wed, 03 Sep 2025 10:47:28 +0300
> Jani Nikula <jani.nikula@intel.com> escreveu:
>
>> On Tue, 02 Sep 2025, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>> > I'm with Jon here, I wouldn't blindly override the Python interpreter
>> > selected by the user. What we could however do is print a message if we
>> > detect a version of Python that could improve performance, telling the
>> > user they could switch.  
>> 
>> Just piling on here, totally agreed.
>> 
>> Don't surprise the user. Let the user be in control. If they choose a
>> silly combo, let them. You know, they might be debugging the issues in
>> that silly combo to begin with, and don't want to jump through hoops to
>> work around tools that think they know better.
>> 
>> Letting the user know they're using a silly combo and suggesting better
>> alternatives is a whole different matter.
>
> The code can be changed to suggest a better alternative, and having an
> optional argument to load the newest one automatically, but the issue
> still remains:
>
> if one has native python3.6, for instance, and he installed a newer one
> to build htmldocs with:
>
> 	dnf install -y python3.11 # or zypper/apt-get/urpmi/... install python3.11
>
> python3 will still be a soft link to python3.5, and all attempts to
> build docs will fail.

If the user wants to shoot themselves in the foot, let them.

> With the approach I'm taken, Makefile will call sphinx-pre-install
> and sphinx-build-wrapper. They both use a function that checks for
> incompatible versions, re-running the code with one which works,
> warning the user about that. So, on openSUSE leap, for instance, 
> we have two official packages with Sphinx:
>
> 	$ grep PRETTY_NAME /etc/os-release 
> 	PRETTY_NAME="openSUSE Leap 15.6"
>
> 	$ zypper search sphinx |grep -E "python\S+\-Sphinx "
> 	   | python3-Sphinx                          | Python documentation generator                                              | package
> 	i+ | python311-Sphinx                        | Python documentation generator                                              | package
>
>
> There, python3-Sphinx is too old:
>
> 	# sphinx-build --version
> 	sphinx-build 2.3.1
>
> As docs minimal requirement is 3.4.3. Also, it is based on python3.6,
> which is not compatible with the kernel Sphinx extensions.
>
> Which the approach I took, once one installs python311-Sphinx like I did,
> the build happens cleanly:
>
> 	$ make htmldocs
> 	# sphinx-pre-install, which checks is needed packages are installed
> 	Python 3.6.15 not supported. Changing to /usr/bin/python3.11
> 	# sphinx-build-wrapper, which calls Sphinx to build the docs
> 	Python version: 3.11.9
> 	Python 3.6.15 not supported. Changing to /usr/bin/python3.11
> 	Python version: 3.11.9
> 	Using alabaster theme
> 	Using Python kernel-doc
> 	...
>
> but if we remove the switch logic:
>
>         -print(f"Python {python_ver} not supported. Changing to {new_python_cmd}")
>         -
>         -try:
>         -    os.execv(new_python_cmd, args)
>         -except OSError as e:
>         -    sys.exit(f"Failed to restart with {new_python_cmd}: {e}")
>         -
> 	+print(f"Python {python_ver} not supported.")
>
> The build will then fail:
>
> 	# make htmldocs
> 	Python 3.6.15 not supported.
> 	Python 3.6.15 not supported.
> 	Traceback (most recent call last):
> 	  File "/usr/bin/sphinx-build", line 5, in <module>
> 	    from sphinx.cmd.build import main
> 	ModuleNotFoundError: No module named 'sphinx'
>
> because:
>
> - python3.6 is not supported;
> - sphinx-build is installed with python311-Sphinx, which also installed
>   python311 package.
>
> See, in this case, the user wanted docs build to use python3.11, as
> it installed python311-Sphinx package from a distro official package.
>
> Without the version-check logic, the only option would be for the user
> to do:
>
> 	ln -sf python3 python3.11  # or something equivalent
>
> -
>
> Btw, the same type of packaging multiple versions of python and 
> Sphinx is quite common on several distributions. This is not
> an issue specific to openSUSE.
>
> Also, notice that we're talking here about building docs with
> distros that are using a 9+ years old python3, e.g.:
>
> 	- openSUSE Leap;
> 	- RHEL8-based distros;
> 	- other old LTS and EOL distros that have a too old Python 
> 	  versions.
>
> Thanks,
> Mauro

-- 
Jani Nikula, Intel

