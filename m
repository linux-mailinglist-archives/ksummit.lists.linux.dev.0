Return-Path: <ksummit+bounces-650-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9F55037F
	for <lists@lfdr.de>; Sat, 18 Jun 2022 10:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE8B9280AB1
	for <lists@lfdr.de>; Sat, 18 Jun 2022 08:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD09210F;
	Sat, 18 Jun 2022 08:24:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3BC7B
	for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 08:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3E9C3411A;
	Sat, 18 Jun 2022 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655540693;
	bh=YpB8x5eJNo2ZTenJ/AEcYJ+xcVHa1RlzgMTrNThO33c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WyXx/AM2ppzOLfYdIhHE1VFOALznW2iKY1fL/zs7zt9U8TECSG0RmClF4sOHt5jNj
	 f2aB1EDnIQf0P/ELl0JPwMw7wQPNN+wTkjmJNggI89zutTMxyMnYvUvwKz5pYR7KRT
	 qrT0PNqWOeNDApMMzDayPD/XAaOJPjV2vzEW6l1bxyl8zWJBAMaQkbQnMvBKFiUryc
	 LaxxM6U4Om6MrS8XBmmpjVa6Gyb+7oWdOKF/bvdQ/nwCpCKGYeJghXtisscoZsXphf
	 mmvDZXKpZ/laa0sMpMu+HpPfcUFejtYrmP9dA9TY0pB2xSmCsLkACCpSJj0pF75pYG
	 4L3x5Wpy7NnSw==
Date: Sat, 18 Jun 2022 09:24:47 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220618092447.5ebed314@sal.lan>
In-Reply-To: <87sfo3nh3t.fsf@meer.lwn.net>
References: <87sfo3nh3t.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi John,

Em Fri, 17 Jun 2022 14:57:10 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> The development community has put a lot of work into the kernel's
> documentation directory in recent years, with visible results. But the
> kernel's documentation still falls far short of the standard set by many
> other projects, and there is a great deal of "tribal knowledge" in our
> community that is not set down. I'd like to look at the successes and
> failures of the work so far, but intent to focus on a discussion of what
> our documentation should be and what we can do to get it there.
> 
> Questions to discuss include:
> 
>  - Bringing an coherent overall structure to Documentation/

Fully agreed. We dedicated a lot of resources on the past years to
convert documentation to ReST and on kernel-doc, but not so much
on placing the topics at the right order.

There are a huge amount of such documentation that describe border cases,
or have just kernel-doc tags without any (or very small) descriptions.
Kernel-doc markups are important, as they help to keep the documentation
updated, but explaining subsystem's principles is equally important, as
it can save a lot of time from maintainers if the contributors are aware
on how and why the subsystem's kAPIs were organized the way it is.

We should imagine documentation as if this is a series of books describing
every aspect of the kernel. So, I would expect it to be organized with
some structure that would place the topics on some order that would make
easier for people to read, being either new contributors or experienced
developers that need to touch other parts of the Kernel that are out of
his past experiences.

For instance to the kAPI documentation, I would expect something like:

	- How to contribute / Submission process;
	- An introductory chapter that would describe the most used
	  components that all developers need to know, like:

		- how to write a driver;
		- fs principles;
		- scheduler principles;
		- mm most used functions (kmalloc & friends);
		- wait queues;
		- kernel threads;
		- softirqs;
		- arch-dependent items to consider (like bit order), weak
		  memory model, etc;
		- ...

	  IMO, we could take a look at the index of some already-existing 
	  books like LDD 3, Linux Kernel Development and others in order to
	  get a rough idea about the items to be covered there.
	- Bus-related subsystems (USB, PCI, I2C, ...);
	- Then, place per-subsystem's documentation, all having their
	  texts explaining basic principles.

IMO, we should write an index file and a couple of new ReST files with an
skeleton for the above, and then ask people to help filling the blanks.

>  - Making it easier for developers to improve the documentation.

A well-prepared skeleton would make life easier. From time to time, we
have discussions and patches shifting documentation between different
directories.

>  - What we would like from Sphinx and what we can do to make it happen

The big missing feature on Sphinx itself is with regards to per-C-type
domain. So, if we have one struct and one function both called "foo",
the cross-references will be broken. This issue is known since Sphinx
3.1, and there are already patches fixing it since then (I remember
testing them) but, up to today, the Sphinx upstream patches meant
to fix it weren't applied yet (as far as I can tell).

Another problem is with regards to the documentation's build time.

One feature we're not using yet is intersphinx. Right now, we can
build parts of the documentation with:

	make SPHINXDIRS="foo" htmldocs

But, if "foo" have cross-references to "bar", the build will produce
warnings and the documentation's cross-references to "bar" won't work.

Properly setting interphinx would allow this to work, as such references
would point, instead, to some remote place (like kernel.org).

This could be used to help improving the documentation's build time 
during doc development.

Also, I would love to have a good way to just produce html (and pdf) from
the documents I'm actually working with. The way I do it right now is
that I create a "Documentation/foo" directory, adding there just the docs
I'm currently working with, placing them on a fake index.rst file.

This way, I can build them really fast, without needing to rebuild
everything at the same book. Perhaps something like that could be 
automated - or Sphinx itself could support something like:

	make htmldocs SPHINXFILES="foo.rst bar.rst"

>  - Making the docs build system less ugly and more maintainable

I guess shifting the minimal Sphinx version would help to remove some
bad things there.

One thing that probably be solved on a different way is to have
a better solution for things like:

	Functions for feature 1
	=======================

	.. kernel-doc:: include/some_header.h
	   :doc: Feature 1

	.. kernel-doc:: include/some_header.h
	   :functions:
		func1
		func2

	Functions for feature 2
	=======================

	.. kernel-doc:: include/some_header.h
	   :doc: Feature 2

	.. kernel-doc:: include/some_header.h
	   :functions:
		func3
		func4

Perhaps we could change Kernel-doc in a way that doing just:

	.. kernel-doc:: include/some_header.h

would be enough.

> - Integrating rustdoc documentation

Won't comment much about that, as never touched any of those.

Life would be a lot easier on this side if rustdoc could
support ReST.

Regards,
Mauro

