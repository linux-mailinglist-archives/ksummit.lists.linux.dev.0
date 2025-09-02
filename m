Return-Path: <ksummit+bounces-2280-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2D7B41010
	for <lists@lfdr.de>; Wed,  3 Sep 2025 00:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2708B7A73C7
	for <lists@lfdr.de>; Tue,  2 Sep 2025 22:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749BE27144A;
	Tue,  2 Sep 2025 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G75Txxdf"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C67223DFD;
	Tue,  2 Sep 2025 22:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756852511; cv=none; b=ntD0DcNBzqkC4kk4Cm8JLSRkceg1wtbU/zQJrHUVzMbVuORzOxait5D1znJK4yFUKDZhwgey1U0Hlrk7l0fWbWGHNMrHO4meYU+UcLrCIi/kx1wrA5M8Y6DKyemGcZ26mHOjC1djYqbE7jU0jwa4VYuDQrsdG66a0KfUpeNKAxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756852511; c=relaxed/simple;
	bh=zotwYrVJd2kBHoZA1kYRe96xp5CwRuaBP61XYB4yInE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miXyRUxpMQQwTEbrfpOUpfb2AJ52/Dz0d3IUmPK70oumRbRYl0CUTQEUlHj+YVgCaNOadySbKGy/oAUvGgj28aqyAhxVfvknr2r5gyJu3lWk/i0HI16jWDE1d1C+oicUvpdZYCQU7T3RIb8HQ8xcs22PNq/fv6bVKIi2r9rjfOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G75Txxdf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28ED0C4CEED;
	Tue,  2 Sep 2025 22:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756852511;
	bh=zotwYrVJd2kBHoZA1kYRe96xp5CwRuaBP61XYB4yInE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G75TxxdfqdfN9qDH/Bhjv897GSdXJ3FT4XgxGXZd6+silhwbMDx7HMmMyCcZwg1zn
	 GCBrcMmh629UJnWzVKXxwAi4kLd+fCOI+x/lckrxUmb7Ds0gu2dvu99pPbV04CMVlB
	 AWVD6YI2rw0vXOLIyJFmmSaDQPl9k3vZQkoI5Exx2FiL1AlQvQnaIIsa/crut+1/Cw
	 zydMpzh2/2B0oz2t9U0p2xB3RxRk3giIaSiocY0X9IiglUeVqPju/bkka5x8Bg2uKm
	 WGUitsym0hHm+BuLEqv/wclKZKv1eyKHJtlvIsLMePUpe3lbqi4O1Yoo8Gs5ckqRk4
	 v/OoMMCpUMqoQ==
Date: Wed, 3 Sep 2025 00:35:06 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula
 <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250903003506.0861debd@foz.lan>
In-Reply-To: <87frd4vfys.fsf@trenco.lwn.net>
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
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 02 Sep 2025 12:58:51 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Em Tue, 02 Sep 2025 09:15:49 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >  
> >> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >>   
> >> > To sum-up those discussions, I can propose a patchset for the next
> >> > merge window that would:
> >> >
> >> > 1. change kernel-doc exec to re-run using the latest available python
> >> >    version if version < 3.11, on a similar same way to what
> >> >    scripts-pre-install and scripts-build-wrapper does(*);    
> >> 
> >> I have to confess that I still feel some discomfort with this sort of
> >> "pick a better version" magic.  Should we really be overriding the
> >> search path that the user has set up?  
> >
> > The idea is not to override the search path: instead, to use it to
> > check if the user installed other /usr/bin/python3.* files (or on
> > some other part of PATH). Most distributions nowadays come with 
> > multiple python versions. I can't see a downside (*) of not using 
> > a newer version that the user had installed on his system and
> > has it on PATH.  
> 
> But overriding the path is exactly what this would be doing.  It doesn't
> seem right to say "we know better than you do" and circumvent the
> configured path; 

Again, it is not the path: it is the "alternatives" - well, except that
Python doesn't use alternatives.

This is on Fedora:

	$ ls -lctra /usr/bin/python???? /usr/bin/python? /usr/bin/python
	-rwxr-xr-x 1 root root 11704 ago 21 17:09 /usr/bin/python3.13
	lrwxrwxrwx 1 root root    10 ago 21 17:09 /usr/bin/python3 -> python3.13
	lrwxrwxrwx 1 root root     9 ago 21 17:09 /usr/bin/python -> ./python3
	-rwxr-xr-x 2 root root 11728 ago 21 17:09 /usr/bin/python3.6m
	-rwxr-xr-x 1 root root 11704 set  2 16:07 /usr/bin/python3.11
	-rwxr-xr-x 1 root root 11704 set  2 16:09 /usr/bin/python3.12
	-rwxr-xr-x 1 root root 11712 set  2 16:18 /usr/bin/python3.10

This is on openSuse Leap, after using the procedures recommended
by sphinx-pre-install:

	# ls -l /usr/bin/python*
	lrwxrwxrwx 1 root root     9 Apr  9  2024 /usr/bin/python3 -> python3.6
	-rwxr-xr-x 1 root root  6280 May 18  2024 /usr/bin/python3.11
	-rwxr-xr-x 2 root root 10560 Apr  9  2024 /usr/bin/python3.6
	-rwxr-xr-x 2 root root 10560 Apr  9  2024 /usr/bin/python3.6m

Recommending the user to run:

	# ln -sf python3.11 /usb/bin/python
	# ln -sf python3.11 /usb/bin/python3

Doesn't seem to be right. See below.

Also, adding at .bashrc is not enough, as running "make htmldocs" after
installing the packages will fail except if the user manually runs it.

So, at least for doc build, I still think that getting a python
compatible version is still the better solution - at least for doc
building.

> the user may well have reasons for setting things up
> the way they did. 

There are very good reasons why not doing that: replacing it
will very likely break the system. If I'm not mistaken, even package
install can break if one does something like that on some distros that
tries to run python at install time and whose scripts may not be 
forward-compatible with newer python versions.

The same problem occurs even if a bash alias would be created and placed
under .bashrc (plus, such procedure assumes shell is bash):

	alias python3=/usr/bin/python3.11

So, if doing something like that won't work, the other alternatives
are:

1. don't use Makefile; instead run:

	python3.11 scripts/tools/sphinx-build-wrapper htmldocs

2. create a <kernel_tree>/bin directory and add there an alias.
   every time you want to build docs, set:

	PATH=<kernel_tree>/bin:$PATH

3. use venv (probably the simplest solution)

the first two are IMHO, a lot more hackish than picking
/usr/bin/python3.11 from the patch where the user already installed
via a distro package and use it.

The third option works, but some developers don't like installing
packages outside the distro-provided package manager.

> Do you know of any other tool that behaves this way?

Not exactly this way. What several other build toolchains do is
to directly download everything that is needed to build (gcc,
make, python, ld, ...) - or to build themselves from the source
before starting building stuff.

> If we're really going to do it, I'd feel better if it had to be enabled
> with a --fastest-python flag or some such.

Makes sense for kernel-doc.

> > For make htmldocs, if version is < 3.7 (or maybe 3.6), this is
> > mandatory: creating docs without that will fail. So, this is
> > actually a fallback measure in an attempt to save the day.  
> 
> Honestly, I'm not entirely convinced even here.  It really feels like
> the kind of magic that may bite us one of these days.

If it bites, we can deal with it, but see: the alternative is to 
refuse to build the docs and bail out. IMHO, a worse solution(*).

Besides that, we already have since ever things like that, when,
for instance, we check if latexmk is available, falling back
to xelatex if not. The only difference here is that, instead of
requiring a non-python script (or makefile rule), we're handling
with multiple versions of the toolchain directly inside the
python script.

(*) Ok, with the new wrapper tool, he can still build docs by 
prepending "python3.11".

> > This is specially important for OpenSuse Leap, were we recommend
> > python311-sphinx package, which obviously require python 3.11
> > to run. The same applies for RHEL8-based distros and likely
> > old RHEL9 ones.  
> 
> ...in which case, it seems to me we need to recommend that the path be
> configured appropriately as well.

How? I can't see a way to recommend a solution without either
propose a hack or risk breaking the system.

Thanks,
Mauro

