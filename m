Return-Path: <ksummit+bounces-706-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD343559440
	for <lists@lfdr.de>; Fri, 24 Jun 2022 09:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0B3280C79
	for <lists@lfdr.de>; Fri, 24 Jun 2022 07:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6743E23BF;
	Fri, 24 Jun 2022 07:33:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F257923B5
	for <ksummit@lists.linux.dev>; Fri, 24 Jun 2022 07:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A702C341C0;
	Fri, 24 Jun 2022 07:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656055993;
	bh=cFdz5QkDVbfb4GlZdtZ9belGaTPZpUe9NhCWIbg3/K4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZigKowsMT+x2n3PWVip+cTFuVu9M1lv55p4eW3qrawNQgQl2jULUY/wL2ADsg3Pap
	 2HSz0DC3FBWYzXDEEMSqLmSgCqUS0zeWKxG01wkpYPiiD+aWij90FG6B6DDsvFnwiC
	 i69oRCWDlOpfZaX3Mi2QtHuD26MPYy8+z83Gv2GBFE1r8Byj+Aok0kzgj8kpwnuqcS
	 /4yPMmf1ulZWi3tlsoRxrS6fHU9tiK+exIX0z++8Sj2nIVdrFnGPBfCrHpq1VCAZ+V
	 KXvW+2nAXFac9FRbtiOfxhDALwvF6ZX7u/vZU1KnTkQOIOB2sipDijPhcgGqJAoS2z
	 QQcMaNDJ67vmw==
Date: Fri, 24 Jun 2022 08:33:07 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@intel.com>,
 ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev, Markus
 Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220624083307.159824bd@sal.lan>
In-Reply-To: <87a6a38plu.fsf@meer.lwn.net>
References: <87sfo3nh3t.fsf@meer.lwn.net>
	<20220618092447.5ebed314@sal.lan>
	<875ykrrb45.fsf@intel.com>
	<20220623105747.079ac92b@sal.lan>
	<87a6a38plu.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 23 Jun 2022 07:40:45 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab@kernel.org> writes:
> 
> >> The solution would be to finally convert the
> >> script to a proper python Sphinx extension that can do caching. (This is
> >> how it works in Hawkmoth, FWIW.)  
> 
> I've been pondering on this for a bit, and would like to do it, but I
> don't know when I might find the time for it.

There is already a version of kernel-doc written in Python, made by
Markus Heiser:

	https://github.com/return42/linuxdoc/blob/master/linuxdoc/kernel_doc.py

It could be a starting point.

> > That's one solution, but see: there is already a python extension
> > that currently calls kernel-doc everytime. It could, instead,
> > cache the rst returned by its first run (or a parsed version of it)
> > and use the cached results the other 3 times.
> >
> > Porting kernel-doc to python could be doable, but not trivial, due to several
> > reasons:
> >
> > - it should keep running standalone, as otherwise debugging parsing issues
> >   on kernel-doc would be a lot harder. In particular, kernel-doc --none is
> >   really helpful to report kernel-doc tag errors;  
> 
> Yes, of course.  As Jani noted, that's just how you would do it, not a
> problem. 
> 
> > - regressions will likely be introduced on a change like that;  
> 
> The nice thing is ... we already have a really nice regression test in
> the form of the current docs build and diff.

True. We can test the results with both versions and even check how
performance is affected.

> > - regular contributors to kernel-doc will need to ramp up with the newer
> >   version;  
> 
> We have those?  That script is a nightmare and nobody goes near it if
> they can possibly avoid it.  I would expect to have more contributors
> with a decent Python version that doesn't include 25 years of regex
> accretion.

Well, the kernel-doc version from Markus in python is ~23% bigger
than our current kernel-doc. Granted, it could be due to comments and
blank lines, but basically, the same regexes that are in perl would
also be need to be replicated in python, as parsing a C code with
regexes is not a trivial task.

So, in terms of complexity, I doubt much would change by porting it
to python.

Now, one of the things that the kernel-doc does is that it has the
parse code and the output logic, which actually has an an abstraction
to let it to produce results on different formats (currently, none, man
and rst - we dropped some other formats from it). This abstraction
increases its complexity. This is something that doesn't need to be
replicated on any ports. 

> > - a port like that could increase the script run time, as the
> >   optimizations and regular expressions there could behave different on
> >   python.  
> 
> It could also decrease it by improving caching opportunities, getting
> rid of a lot of fork()/exec() pairs and Perl interpreter startups, etc.
> 
> I've actually, in a spare moment or two, been doing some profiling of
> the kernel docs build and trying to track down the sources of the
> slowness.  I am thinking that nearly 700 *million* calls to the iterator
> for the C-domain symbol list might have something to do with it...

Wow, that's a lot!

> > True, but independently if the script would be rewritten in python or not,
> > one way would be to enrich the 'DOCS:' kernel-doc tag in order to mention 
> > there the symbols that belong to each part of the document, e. g. something
> > like:
> >
> > 	/**
> > 	 * DOC: foo
> > 	 *
> > 	 * Some comments...
> > 	 *
> > 	 * symbols:
> > 	 *     foo
> > 	 *     bar
> > 	 */
> >
> > One advantage is that all documentation will be on a single place,
> > so hopefully it would be easier to maintain.  
> 
> I'm not quite sure I get this...you want to put the TOC tree in the
> source comments?  This looks like the kind of thing that nobody ever
> remembers to update, but maybe I'm missing something.

No, it won't generate a TOC tree. It would instead reorder how
kernel-doc would output the symbols.

That's no different than what we have already at the .kernel-doc
directives, e. g. it would be a replacement for:


	.. kernel-doc:: include/some_header.h
	   :doc: foo

	.. kernel-doc:: include/some_header.h
	   :functions:
		foo
		bar

The problem we currently have is that the above pattern means that
one or more .rst files would contain a list of symbols that are
actually documented at some_header.h. People updating such file
will very likely forget to update .rst files, leading to missing
documentation. Also, the same symbol could be included on different
.rst files.

I remember I had to fix myself duplicated symbols inclusion while
trying to reduce the docs build time on a few *.h files that
were included hundreds of times. I bet if someone checks again,
duplicated inclusions of the same symbol and missed symbols that
are documented on their sources, but aren't included at any .rst file.

Currently, detecting it is very hard, because the symbol lists
are on different files and the same header are sometimes included
on different rst files. By placing the symbol list inside the source
file, it makes very simple for kernel-doc to check if all documented 
symbols are inside the "DOC:" markups, producing errors otherwise.

Regards,
Mauro

