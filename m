Return-Path: <ksummit+bounces-2283-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45427B41B05
	for <lists@lfdr.de>; Wed,  3 Sep 2025 12:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BDD75608E3
	for <lists@lfdr.de>; Wed,  3 Sep 2025 10:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBB62E1F06;
	Wed,  3 Sep 2025 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsCszhQj"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395282D7DE1;
	Wed,  3 Sep 2025 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893860; cv=none; b=X0XKBkppfAqChoq91cXRGQqFNEWoIaiPqXhXscQFzxH0xlOuokMV2kY3Zpcr8J6v7HT9BF0Oy/IQyphLBaXwZ/ySJTeYlPB0dBY9mCppU255oDylSwhMUnuk/YuPX8Z9qpAHNysvOd+LF72DsycUGYbJzP1vG/6YHgbMk/mVuQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893860; c=relaxed/simple;
	bh=TMUN6PFhfhcUU8RCNu4OiY2dL1oQRvq5zVR1U5sOBkk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D6KhuyJ7q1Ky79+3bK03dmoGQzgTVhpXQZYPKFtJQBYZqKuvRYFSqU+O6CF7MR56EOu0/neObWpBv4pct3SkR7GJs9s1zGp+jFJIdjPiBPhmWns5A7sAVLrcRyB4FU4IL2GHVg3ej+a4uQyOYU/vdieVfF2rGrduut3QKhN+LtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsCszhQj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6D3C4CEF0;
	Wed,  3 Sep 2025 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756893859;
	bh=TMUN6PFhfhcUU8RCNu4OiY2dL1oQRvq5zVR1U5sOBkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FsCszhQjLmKaW9ff2FSnZgd4sz9134eX3QrXWdWm63TG70bZ2FvgjZaZ7SNxbmJw6
	 nspOWcyRRV9Dcxsp/gC0+I3jA4raZhr9+1wvIeuZ6tX3tvo1wv1DvXMQp7ZuH4Jvaw
	 Qh2qHY/LwaJDA2ElNmQCFPC/oKnghGPN8iBno/JqWW7HTl5QdzaYmUyjBW5phkCbfB
	 1XpaveX8HhbZoZ0xvFW5rc9oo5OIh+6mFvdBPAJFO6GLjQYHKuQsyDtvFfwXZWYGB6
	 pVpLcNQvpg5l9KLAFYSKZxE03VT84gvLZr41TR5UPVWv5hc8JY4GCEvo90aBJVRImP
	 T3Ub1E//oiDhQ==
Date: Wed, 3 Sep 2025 12:04:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250903120409.32f3b3b0@foz.lan>
In-Reply-To: <50492e9bd0d647a6ba7eccbed73f782181f83499@intel.com>
References: <20250901204635.51b81ffd@foz.lan>
	<1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
	<j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
	<865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
	<20250902135938.35048fbc@foz.lan>
	<20250902141434.3e5b14e4@foz.lan>
	<8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
	<xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
	<87ecsox4uy.fsf@trenco.lwn.net>
	<20250902191929.504977bf@foz.lan>
	<20250902185221.GA1602@pendragon.ideasonboard.com>
	<50492e9bd0d647a6ba7eccbed73f782181f83499@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 03 Sep 2025 10:47:28 +0300
Jani Nikula <jani.nikula@intel.com> escreveu:

> On Tue, 02 Sep 2025, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > I'm with Jon here, I wouldn't blindly override the Python interpreter
> > selected by the user. What we could however do is print a message if we
> > detect a version of Python that could improve performance, telling the
> > user they could switch.  
> 
> Just piling on here, totally agreed.
> 
> Don't surprise the user. Let the user be in control. If they choose a
> silly combo, let them. You know, they might be debugging the issues in
> that silly combo to begin with, and don't want to jump through hoops to
> work around tools that think they know better.
> 
> Letting the user know they're using a silly combo and suggesting better
> alternatives is a whole different matter.

The code can be changed to suggest a better alternative, and having an
optional argument to load the newest one automatically, but the issue
still remains:

if one has native python3.6, for instance, and he installed a newer one
to build htmldocs with:

	dnf install -y python3.11 # or zypper/apt-get/urpmi/... install python3.11

python3 will still be a soft link to python3.5, and all attempts to
build docs will fail.

With the approach I'm taken, Makefile will call sphinx-pre-install
and sphinx-build-wrapper. They both use a function that checks for
incompatible versions, re-running the code with one which works,
warning the user about that. So, on openSUSE leap, for instance, 
we have two official packages with Sphinx:

	$ grep PRETTY_NAME /etc/os-release 
	PRETTY_NAME="openSUSE Leap 15.6"

	$ zypper search sphinx |grep -E "python\S+\-Sphinx "
	   | python3-Sphinx                          | Python documentation generator                                              | package
	i+ | python311-Sphinx                        | Python documentation generator                                              | package


There, python3-Sphinx is too old:

	# sphinx-build --version
	sphinx-build 2.3.1

As docs minimal requirement is 3.4.3. Also, it is based on python3.6,
which is not compatible with the kernel Sphinx extensions.

Which the approach I took, once one installs python311-Sphinx like I did,
the build happens cleanly:

	$ make htmldocs
	# sphinx-pre-install, which checks is needed packages are installed
	Python 3.6.15 not supported. Changing to /usr/bin/python3.11
	# sphinx-build-wrapper, which calls Sphinx to build the docs
	Python version: 3.11.9
	Python 3.6.15 not supported. Changing to /usr/bin/python3.11
	Python version: 3.11.9
	Using alabaster theme
	Using Python kernel-doc
	...

but if we remove the switch logic:

        -print(f"Python {python_ver} not supported. Changing to {new_python_cmd}")
        -
        -try:
        -    os.execv(new_python_cmd, args)
        -except OSError as e:
        -    sys.exit(f"Failed to restart with {new_python_cmd}: {e}")
        -
	+print(f"Python {python_ver} not supported.")

The build will then fail:

	# make htmldocs
	Python 3.6.15 not supported.
	Python 3.6.15 not supported.
	Traceback (most recent call last):
	  File "/usr/bin/sphinx-build", line 5, in <module>
	    from sphinx.cmd.build import main
	ModuleNotFoundError: No module named 'sphinx'

because:

- python3.6 is not supported;
- sphinx-build is installed with python311-Sphinx, which also installed
  python311 package.

See, in this case, the user wanted docs build to use python3.11, as
it installed python311-Sphinx package from a distro official package.

Without the version-check logic, the only option would be for the user
to do:

	ln -sf python3 python3.11  # or something equivalent

-

Btw, the same type of packaging multiple versions of python and 
Sphinx is quite common on several distributions. This is not
an issue specific to openSUSE.

Also, notice that we're talking here about building docs with
distros that are using a 9+ years old python3, e.g.:

	- openSUSE Leap;
	- RHEL8-based distros;
	- other old LTS and EOL distros that have a too old Python 
	  versions.

Thanks,
Mauro

