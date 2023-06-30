Return-Path: <ksummit+bounces-944-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D397440EB
	for <lists@lfdr.de>; Fri, 30 Jun 2023 19:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF49128106E
	for <lists@lfdr.de>; Fri, 30 Jun 2023 17:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650C5171C1;
	Fri, 30 Jun 2023 17:11:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5958168B4
	for <ksummit@lists.linux.dev>; Fri, 30 Jun 2023 17:11:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B769D5CC;
	Fri, 30 Jun 2023 17:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B769D5CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1688145063; bh=SSUkUGbW+vO0Iq+4P4AJWf1A+nZlT0T8yLGnsAK1UJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WQup83A/FEs9gXs3ONtaJ0wP/ahFDnpvuAOgKx8OmPq3kcH3nErZOwwpQStKQjVtx
	 MpdmIHpeTQRWn6fJ/bylR004gMwXZNZpdugwWpbGjnPi707RZgnkHAmmWBnA64vM7D
	 jxrqTkzcgOIsK3iLwgFXQ8csKNvHHZutPqv+AeuwmSNaNxu4sEU9HpUJoFumT9BDIf
	 DMTPiHBrB7vvaUPikv1ANDOHar3mmTun6Ldv9WfXTx3cDCt3065r3OtN/ryL73M2fR
	 MoXkXRW7gWPmWDSGC5nlMM/kWS9iLAyplRrnYWkkllFxq9KVPwRW4f7Ov0Z3//8ujP
	 zuQ9x3fyCWABQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jani Nikula <jani.nikula@intel.com>, ksummit@lists.linux.dev
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
In-Reply-To: <20230630165450.GB591635@mit.edu>
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
 <87y1k2kl5a.fsf@meer.lwn.net> <20230630165450.GB591635@mit.edu>
Date: Fri, 30 Jun 2023 11:11:02 -0600
Message-ID: <878rc0lvtl.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Theodore Ts'o" <tytso@mit.edu> writes:

> On Thu, Jun 29, 2023 at 03:34:41PM -0600, Jonathan Corbet wrote:
>> There is a catch, though: In order to be able to create the cross
>> references, intersphinx has to be able to read the "objects.inv" file
>> for every other document it refers to.  That file, of course, is created
>> by building the docs.  In practice this means that, to generate a
>> complete set of manuals from a clean repository, it would be necessary
>> to do *two* complete builds - one to create the inventory files, and one
>> to use them.
>
> Yeah, that's a bit of a bummer.  It sounds a bit like TeX/LaTeX's
> various *.aux files that are used to generate the numbers for
> foornotes, et.al.  But I'll note that while I would do two passes of
> running LaTeX before doing sending out the final version of my paper,
> most of the time, I'd only run LaTeX once, and live with the fact that
> some section numbers or footnotes would be something like [???]
> instead of containing the properreference.
>
> From the perspective of someone who is editing the docs, how
> usable/unusable is the sphinx output without these inventory files?

There will be a lot of broken cross-references; the explicit ones (as
opposed to those created by the automarkup code) will generate warnings. 

> Or
> if the inventory files are out of date?  And am I right they only
> change when someone adds a new section, or a new anchor point for a
> cross reference, etc.?

Yes, in general, but code changes that affect kerneldoc comments could
also bring about a change.

> If the goal is for someone to check and see whether the output of a
> particular part of the docs looks OK after doing a quick edit (e.g.,
> did I mess up a table), it would seem that doing a single pass of a
> single "book" would be faster, right?  And would it be good enough for
> them to make sure that their edits to a particular .rst file looked
> OK?

Yes, it would.  But that can be done now with

  make SPHINXDIRS=whatever htmldocs

...with pretty much the same effect.

> I also wonder if there's a way people could download inventory files
> from some web site so their first pass run of sphinx would look
> prettier?  Assuming that intersphinx can deal with slightly
> out-of-sync inventory files, of course....

Well, we *could* set up intersphinx to fetch those files from kernel.org
automatically, but I suspect I'm not the only one who would be reluctant
to see the build start reaching out onto the net.  Alternatively, we
could add a script that would have to be run explicitly to do that
fetch.

Thanks,

jon

