Return-Path: <ksummit+bounces-692-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C07557D2A
	for <lists@lfdr.de>; Thu, 23 Jun 2022 15:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 0D2882E0C26
	for <lists@lfdr.de>; Thu, 23 Jun 2022 13:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00CC1FAB;
	Thu, 23 Jun 2022 13:40:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96591FA6
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 13:40:52 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B05DF385;
	Thu, 23 Jun 2022 13:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B05DF385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1655991645; bh=7sYwfBvrRGhjCtIuYtYIX0qSRF15ZmfieRm1MCkxCZs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lgOMaTmSxwSbLjrUNxPUayE0w2lkdQCcs7o25hStiuPyCcf8NpXeQ6Pyf04YShj9L
	 0TCs7iK7QMtGLIHRTU7rYF0kxvVQv/dLyYGpWaTlfbdaygt/zp/AwPdnJ47IGls/my
	 ZCUSZvkif47evA3NJwrt+v3ki+VxlKA1AzoyHU1AfOvVHoO7y/JL0DzMxmREY6Taov
	 mET07SHOKMj5JjsvDDAc6rUyXz2CyWgdI3FLmjYAudT871I/S0WFpGyqyH3yzY+Emv
	 C5UM7ETFdoeqqYQLufQ8Q8FWD7E1Aoe13ljdOhlGyZ77z6MmiiUNQWRUenSua8ge6r
	 JpvWN1fupOCDg==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jani Nikula
 <jani.nikula@intel.com>
Cc: ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
In-Reply-To: <20220623105747.079ac92b@sal.lan>
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
Date: Thu, 23 Jun 2022 07:40:45 -0600
Message-ID: <87a6a38plu.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

>> The solution would be to finally convert the
>> script to a proper python Sphinx extension that can do caching. (This is
>> how it works in Hawkmoth, FWIW.)

I've been pondering on this for a bit, and would like to do it, but I
don't know when I might find the time for it.

> That's one solution, but see: there is already a python extension
> that currently calls kernel-doc everytime. It could, instead,
> cache the rst returned by its first run (or a parsed version of it)
> and use the cached results the other 3 times.
>
> Porting kernel-doc to python could be doable, but not trivial, due to several
> reasons:
>
> - it should keep running standalone, as otherwise debugging parsing issues
>   on kernel-doc would be a lot harder. In particular, kernel-doc --none is
>   really helpful to report kernel-doc tag errors;

Yes, of course.  As Jani noted, that's just how you would do it, not a
problem. 

> - regressions will likely be introduced on a change like that;

The nice thing is ... we already have a really nice regression test in
the form of the current docs build and diff.

> - regular contributors to kernel-doc will need to ramp up with the newer
>   version;

We have those?  That script is a nightmare and nobody goes near it if
they can possibly avoid it.  I would expect to have more contributors
with a decent Python version that doesn't include 25 years of regex
accretion.

> - a port like that could increase the script run time, as the
>   optimizations and regular expressions there could behave different on
>   python.

It could also decrease it by improving caching opportunities, getting
rid of a lot of fork()/exec() pairs and Perl interpreter startups, etc.

I've actually, in a spare moment or two, been doing some profiling of
the kernel docs build and trying to track down the sources of the
slowness.  I am thinking that nearly 700 *million* calls to the iterator
for the C-domain symbol list might have something to do with it...

> True, but independently if the script would be rewritten in python or not,
> one way would be to enrich the 'DOCS:' kernel-doc tag in order to mention 
> there the symbols that belong to each part of the document, e. g. something
> like:
>
> 	/**
> 	 * DOC: foo
> 	 *
> 	 * Some comments...
> 	 *
> 	 * symbols:
> 	 *     foo
> 	 *     bar
> 	 */
>
> One advantage is that all documentation will be on a single place,
> so hopefully it would be easier to maintain.

I'm not quite sure I get this...you want to put the TOC tree in the
source comments?  This looks like the kind of thing that nobody ever
remembers to update, but maybe I'm missing something.

Thanks,

jon


