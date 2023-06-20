Return-Path: <ksummit+bounces-938-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED733737515
	for <lists@lfdr.de>; Tue, 20 Jun 2023 21:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C5491C20DD5
	for <lists@lfdr.de>; Tue, 20 Jun 2023 19:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5DC17FF0;
	Tue, 20 Jun 2023 19:30:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE52317AB5
	for <ksummit@lists.linux.dev>; Tue, 20 Jun 2023 19:30:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8C7AF536;
	Tue, 20 Jun 2023 19:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8C7AF536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1687289435; bh=cEmpD4INzL8qfn9/2DxNwECzXembT7BEGso6eIwpgpU=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=YJ/HaST+NYN1XncgmMT94W6R7/UhKOJAyYSQRS16XUB3xzVVh0SGkeHErw4A3PaNV
	 wT84oCPVVTv+KAnHUhdLh4o2ZWneWl0peRr3LgXPgo3qB4V6gqP+OA5WvGQkBCBxf9
	 CIDMnRBpfYP9d8I+m06VUzvprhc+zycnaG87JpGhWYBrfoLb4zwJ9kvnJ+aXN2t13W
	 PLVh8P/0khZOa7USmeYACsmzzNNOa2hIiZqzfAN49UXcBVa6Hv7EIB2Av+rTL66XtC
	 1JJQEmzEt/dPdXpi0F42xOJ4jeMHdNUX29kYVYe6aYmfGf1Va/QMJ9ljejBeIAKwtS
	 J9fQo8g4dpldw==
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@intel.com>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Kernel documentation
In-Reply-To: <871qi6glzl.fsf@intel.com>
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
Date: Tue, 20 Jun 2023 13:30:34 -0600
Message-ID: <87v8fiq6cl.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@intel.com> writes:

> It should be more feasible to build the documentation. Make it faster,
> reduce the warnings.
>
> Some ideas to make it faster:
>
> - Bump the minimum Sphinx version requirement if it helps the speed. I
>   don't think it needs to be as conservative as the compiler.

Alas, newer versions of Sphinx are slower, not faster; 2.4 takes about
half the time to build the docs that 5.x does.

A while back, I went into Sphinx with a hatchet and managed to take
about 20% off the build time.  The C domain stuff builds a data
structure of incredible complexity, then just tosses much of it away.
I've never had the time to figure out why they do that or to try to get
my hack job into a condition where I'd be willing to show it to my dog,
much less the Sphinx developers.

I wish we had an active presence in the Sphinx community, but I've never
been able to make that happen myself.

> - Cache kernel-doc results per document. A bunch of .rst files use
>   multiple kernel-doc directives for the same source file to better
>   control the documentation order [1]. Each directive causes the same
>   source to be parsed. (I'm not sure how bad the effect is though.)

That would help, but I don't think this is our biggest problem.

> - Simplify the rst output kernel-doc produces. For example, use rst
>   native field lists for parameter and member descriptions instead of
>   hand-crafting them. See [2]. Drop the "definition" part from
>   structures, as nobody relies on it anyway. If necessary, add links to
>   source instead.

Seems worth a try.

> - Default to Sphinx parallel build.

We *do* default to that, or so I thought.  Much of the build doesn't
actually parallelize, though.

> - Consider splitting the whole documentation to multiple smaller
>   projects, and linking between them using intersphinx. (This may be a
>   tall order.)

This would be nice.  I looked into it a little while back and ran into
some roadblocks; I'll need to go back to my notes to remind myself of
where the problems were.

> Some ideas to reduce warnings:
>
> - W=1 already includes kernel-doc warnings for .c. In i915 we've added
>   that to the regular build as well as a separate target to test
>   headers, and use kernel-doc -Werror for development. Try to get more
>   folks on board.
>
> - Add more warning levels to kernel-doc similar to compilers, and reduce
>   the default warnings. For example, I'm not sure it's necessary to warn
>   about each undocumented parameter/member by default. That could be a
>   verbose option. Bump up the warnings after we've fixed the more
>   glaring issues.

This seems like a good idea.

> - For more verbose checking without Sphinx, it should be possible to
>   lint the rst produced by kernel-doc (originating from source), and
>   check that as part of the build. But that's clearly W=2 stuff or on a
>   subsystem/driver basis.
>
> - Making the Sphinx build faster would also get more people on board
>   fixing the warnings too.

This, I think, is the key point.  The build speed is a real pain point
that impedes contribution.

jon

