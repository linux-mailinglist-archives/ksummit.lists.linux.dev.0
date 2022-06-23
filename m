Return-Path: <ksummit+bounces-686-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A570557742
	for <lists@lfdr.de>; Thu, 23 Jun 2022 11:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25E3C280A75
	for <lists@lfdr.de>; Thu, 23 Jun 2022 09:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBF11C2E;
	Thu, 23 Jun 2022 09:57:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739043F5
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 09:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2709DC341C5;
	Thu, 23 Jun 2022 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655978273;
	bh=7Z1JBlMiCs5CKb7W24aPvXoSoJ6GQ2GuKyj9ecV9F0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gQbKSQgXQMrr2Pz0W13420Xjkj/V/TrfkhJL0ZKtOAJdboeYT7K2WnwCQzZUdE42i
	 Re63Y3X2ALIAppwaTP7LVY4uiPLYYvLOMaFyjZ/BTBL7P6Y+1Wn0a9kO/J2hLXjLom
	 OaOu0aZjzHR7+XPI5eptJeHbImNt6OxndYQMtvjGF6Ip04/whMS+szazHauyVNqRqL
	 L0BQHo/QkupRulo2Hj7+kVZ7KVrrrkLEn3kZipofo+dr/k4EeGwqob4PzxHcYazICf
	 m1HcW64QjUkma5INy3qBdh6cF0Yb5i2FjZNPFTybp5wN/76DxhR+9oUYlRZSl62VpU
	 7arw/sCWjrCew==
Date: Thu, 23 Jun 2022 10:57:47 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220623105747.079ac92b@sal.lan>
In-Reply-To: <875ykrrb45.fsf@intel.com>
References: <87sfo3nh3t.fsf@meer.lwn.net>
	<20220618092447.5ebed314@sal.lan>
	<875ykrrb45.fsf@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 23 Jun 2022 12:18:50 +0300
Jani Nikula <jani.nikula@intel.com> escreveu:

> On Sat, 18 Jun 2022, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > The big missing feature on Sphinx itself is with regards to per-C-type
> > domain. So, if we have one struct and one function both called "foo",
> > the cross-references will be broken. This issue is known since Sphinx
> > 3.1, and there are already patches fixing it since then (I remember
> > testing them) but, up to today, the Sphinx upstream patches meant
> > to fix it weren't applied yet (as far as I can tell).  
> 
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#namespacing
> 
> Integrating that needs to be done carefully, though, to not make a mess
> of it.
> 
> > One thing that probably be solved on a different way is to have
> > a better solution for things like:
> >
> > 	Functions for feature 1
> > 	=======================
> >
> > 	.. kernel-doc:: include/some_header.h
> > 	   :doc: Feature 1
> >
> > 	.. kernel-doc:: include/some_header.h
> > 	   :functions:
> > 		func1
> > 		func2
> >
> > 	Functions for feature 2
> > 	=======================
> >
> > 	.. kernel-doc:: include/some_header.h
> > 	   :doc: Feature 2
> >
> > 	.. kernel-doc:: include/some_header.h
> > 	   :functions:
> > 		func3
> > 		func4  
> 
> Yeah, currently that leads to parsing the header four times by
> kernel-doc the script.

Yes.

> The solution would be to finally convert the
> script to a proper python Sphinx extension that can do caching. (This is
> how it works in Hawkmoth, FWIW.)

That's one solution, but see: there is already a python extension
that currently calls kernel-doc everytime. It could, instead,
cache the rst returned by its first run (or a parsed version of it)
and use the cached results the other 3 times.

Porting kernel-doc to python could be doable, but not trivial, due to several
reasons:

- it should keep running standalone, as otherwise debugging parsing issues
  on kernel-doc would be a lot harder. In particular, kernel-doc --none is
  really helpful to report kernel-doc tag errors;
- regressions will likely be introduced on a change like that;
- regular contributors to kernel-doc will need to ramp up with the newer
  version;
- a port like that could increase the script run time, as the
  optimizations and regular expressions there could behave different on
  python.

> > Perhaps we could change Kernel-doc in a way that doing just:
> >
> > 	.. kernel-doc:: include/some_header.h
> >
> > would be enough.  
> 
> The order in nicely flowing documentation is not necessarily the same as
> the order in nicely flowing source code. I expect it to be much more
> acceptable to tweak the rst to achieve this than to do source code
> rearrangement to generate nice documentation.

True, but independently if the script would be rewritten in python or not,
one way would be to enrich the 'DOCS:' kernel-doc tag in order to mention 
there the symbols that belong to each part of the document, e. g. something
like:

	/**
	 * DOC: foo
	 *
	 * Some comments...
	 *
	 * symbols:
	 *     foo
	 *     bar
	 */

One advantage is that all documentation will be on a single place,
so hopefully it would be easier to maintain.

Also, on documents using `DOC:` with such new `symbols` tag, kernel-doc 
could validate if all documented symbols are singly included at all `DOC:`
sessions and if any symbols are missed/renamed/removed.

Regards,
Mauro

