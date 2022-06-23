Return-Path: <ksummit+bounces-687-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A39B35577E2
	for <lists@lfdr.de>; Thu, 23 Jun 2022 12:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76773280C1C
	for <lists@lfdr.de>; Thu, 23 Jun 2022 10:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E131C2E;
	Thu, 23 Jun 2022 10:30:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E429A1365
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655980215; x=1687516215;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=bJxmfVQIcblbP8Cs20136jUfMg1S9rl6upB2BNj3j5s=;
  b=mZ0AIc0Q2ECo2XOzMI8fLgmeqqs9uX38tr7USCRhKIcSLb5xZo5Noy98
   /zn1JSDWhLUvObaC64UXHgNNxQc8Y75Bctc7iJwMtI3PCpLjWdMMRGlx4
   Fft+bS06qGjLNhsd9VT8gJWZ1bVmyYjGMEw5SMwnDrFPGncABsUMPN5oX
   Hf2fCU+w+CpcOYLbEp8nQBWLu/Ce7Eid5sTSu2wb8Gu+rmg2Kiv5K4fnY
   U1FKjH69LGHOWMY3E34pF+/Xe3Y0X+n+H5uwrGD6ZPJJPZ0IAmr5Y92y9
   eJb2gIeQNgtvp+t5VLhbNbdmuFO8oYeTRdBrWVlyKtYkf3WDeuG5Oi6B7
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="279450896"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="279450896"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 03:30:15 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="644674023"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost) ([10.252.61.112])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 03:30:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
In-Reply-To: <20220623105747.079ac92b@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
Date: Thu, 23 Jun 2022 13:30:11 +0300
Message-ID: <871qvfr7t8.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 23 Jun 2022, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> Em Thu, 23 Jun 2022 12:18:50 +0300
> Jani Nikula <jani.nikula@intel.com> escreveu:
>
>> On Sat, 18 Jun 2022, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>> > The big missing feature on Sphinx itself is with regards to per-C-type
>> > domain. So, if we have one struct and one function both called "foo",
>> > the cross-references will be broken. This issue is known since Sphinx
>> > 3.1, and there are already patches fixing it since then (I remember
>> > testing them) but, up to today, the Sphinx upstream patches meant
>> > to fix it weren't applied yet (as far as I can tell).  
>> 
>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#namespacing
>> 
>> Integrating that needs to be done carefully, though, to not make a mess
>> of it.
>> 
>> > One thing that probably be solved on a different way is to have
>> > a better solution for things like:
>> >
>> > 	Functions for feature 1
>> > 	=======================
>> >
>> > 	.. kernel-doc:: include/some_header.h
>> > 	   :doc: Feature 1
>> >
>> > 	.. kernel-doc:: include/some_header.h
>> > 	   :functions:
>> > 		func1
>> > 		func2
>> >
>> > 	Functions for feature 2
>> > 	=======================
>> >
>> > 	.. kernel-doc:: include/some_header.h
>> > 	   :doc: Feature 2
>> >
>> > 	.. kernel-doc:: include/some_header.h
>> > 	   :functions:
>> > 		func3
>> > 		func4  
>> 
>> Yeah, currently that leads to parsing the header four times by
>> kernel-doc the script.
>
> Yes.
>
>> The solution would be to finally convert the
>> script to a proper python Sphinx extension that can do caching. (This is
>> how it works in Hawkmoth, FWIW.)
>
> That's one solution, but see: there is already a python extension
> that currently calls kernel-doc everytime. It could, instead,
> cache the rst returned by its first run (or a parsed version of it)
> and use the cached results the other 3 times.

This would mean having kernel-doc the perl script output meta
information about the constructs, complicating it even more.

> Porting kernel-doc to python could be doable, but not trivial, due to several
> reasons:
>
> - it should keep running standalone, as otherwise debugging parsing issues
>   on kernel-doc would be a lot harder. In particular, kernel-doc --none is
>   really helpful to report kernel-doc tag errors;

This is trivial and sensible to do in the python extension too.

> - regressions will likely be introduced on a change like that;

Any change can cause regressions... but previously a diff on the html
outputs generated by both versions has been an effective way of
verifying the changes.

> - regular contributors to kernel-doc will need to ramp up with the newer
>   version;

You say it like it's a bad thing. :p

Sometimes I regret not throwing kernel-doc the script in the curb while
doing the Sphinx conversion.

> - a port like that could increase the script run time, as the
>   optimizations and regular expressions there could behave different on
>   python.

This is certainly possible. It's somewhat countered by the python
extension being able to cache stuff.

>
>> > Perhaps we could change Kernel-doc in a way that doing just:
>> >
>> > 	.. kernel-doc:: include/some_header.h
>> >
>> > would be enough.  
>> 
>> The order in nicely flowing documentation is not necessarily the same as
>> the order in nicely flowing source code. I expect it to be much more
>> acceptable to tweak the rst to achieve this than to do source code
>> rearrangement to generate nice documentation.
>
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

I believe preprocessing of what's supposed to be rst leads to
problems. It's difficult to define proper escaping to ensure stuff gets
parsed at the correct stage in the correct way. It should just be rst.

Part of the reason the old docbook thing was such a big mess were the
"impedance mismatches" at each separate stage of processing.

In general, stick to the mechanisms provided by rst and Sphinx. Extend
on them using Sphinx extensions, not by manually parsing rst.

BR,
Jani.

> One advantage is that all documentation will be on a single place,
> so hopefully it would be easier to maintain.
>
> Also, on documents using `DOC:` with such new `symbols` tag, kernel-doc 
> could validate if all documented symbols are singly included at all `DOC:`
> sessions and if any symbols are missed/renamed/removed.
>
> Regards,
> Mauro

-- 
Jani Nikula, Intel Open Source Graphics Center

