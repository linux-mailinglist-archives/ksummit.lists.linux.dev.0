Return-Path: <ksummit+bounces-708-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6171E559EBD
	for <lists@lfdr.de>; Fri, 24 Jun 2022 18:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85311280C8E
	for <lists@lfdr.de>; Fri, 24 Jun 2022 16:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B27F3FE3;
	Fri, 24 Jun 2022 16:46:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp4.goneo.de (smtp4.goneo.de [85.220.129.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D97C
	for <ksummit@lists.linux.dev>; Fri, 24 Jun 2022 16:46:21 +0000 (UTC)
Received: from hub1.goneo.de (hub1.goneo.de [IPv6:2001:1640:5::8:52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp4.goneo.de (Postfix) with ESMTPS id 41BAD10A32F0;
	Fri, 24 Jun 2022 18:37:59 +0200 (CEST)
Received: from hub1.goneo.de (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPS id 6FD3910A1E88;
	Fri, 24 Jun 2022 18:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=darmarit.de; s=DKIM001;
	t=1656088677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhywetsL0obLZkSkB8eYhOvL8i09tlz4F/Bt1CvMYPE=;
	b=mFjhzo4dN3bKlcbvY8/p1tSAGRj1Buhry0O4n1Mpkhw8vdg1SOWnDYytue2LZ95DxfYfTP
	b7BbqJUnL7qQqGHPII4mDLzTn7EWYprzdcatRfSdjVWxFX5SqGQijTw3jw9s9BtiUb9p9t
	cVf0JbT3G/hCLF+WVYD4rDX911oprgQ3jhBIp3qVuSrTH4Zn3SQRmdMyA/vVbsMYnpAPCF
	eRRwoDfjA5wk1mQigunfs5lmtAgS0jERaS+AkUmvuU5ykMWQIUetfY+6onBSv7qPlVrND0
	kmIYtBfvozhW/6tldCGbQheVvZFeGMvPGV2Uw37x++/YYjz2td+Sg/vhAjozIg==
Received: from [192.168.44.218] (vpn31.hotsplots.net [185.46.137.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPSA id 826D610A1E87;
	Fri, 24 Jun 2022 18:37:56 +0200 (CEST)
Message-ID: <963dd061-47ba-6f96-72e2-4f34cc952b8c@darmarit.de>
Date: Fri, 24 Jun 2022 18:37:56 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
Content-Language: de-DE
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@intel.com>,
 ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net> <20220624083307.159824bd@sal.lan>
From: Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <20220624083307.159824bd@sal.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-UID: e752d0
X-Rspamd-UID: 7c03c2

Hi Jon, Mauro,

   with great interest I have read this thread !

If I can help, I'm happy to participate again.  TBH: The kernel-doc
implementation from mine could only be a piece of the puzzle to
improve the process (not without raising other questions).

But similar to Jani, I see the priority problems on a different level
level.

We have too many demands that reach into the smallest niches.  I
believe that some parts must be generalized and some request must
be abandoned.

In my opinion, many problems are homemade, to take just one example:

IMO It is unnecessary that the build-chain must run on all
platforms and with all distributions.

Who observes the Sphinx-doc & docutils development since (>15)
years is aware that with various (old) Sphinx-doc & docutils
versions no stable results can be produced, not without
complicating the build-chain.  And this is exactly the situation
we are facing today.

The build chain of documentation has nothing to do with kernel
development (at least in my opinion) and should be decoupled from it:
maintaining one defined build environment is enough work ... this
becomes especially clear if you (as Jani recommends) rely more on
sphinx-modules and widely used tools.

Another point on which I now have a clear view are the regular
expressions: no one likes them (me too), but I can't think of a
general solution (parser) given the number of requirements for
parsing source code we have.

I would like to support the kernel community again, but at the
moment I have difficulties to follow the many exceptions. I would
be happy if you keep me in CC .. may be I find my place again
back in the kernel-doc development :-)

Thanks and with best regards

   -- Markus --


Am 24.06.22 um 09:33 schrieb Mauro Carvalho Chehab:
> Em Thu, 23 Jun 2022 07:40:45 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
>> Mauro Carvalho Chehab <mchehab@kernel.org> writes:
>>
>>>> The solution would be to finally convert the
>>>> script to a proper python Sphinx extension that can do caching. (This is
>>>> how it works in Hawkmoth, FWIW.)
>>
>> I've been pondering on this for a bit, and would like to do it, but I
>> don't know when I might find the time for it.
> 
> There is already a version of kernel-doc written in Python, made by
> Markus Heiser:
> 
> 	https://github.com/return42/linuxdoc/blob/master/linuxdoc/kernel_doc.py
> 
> It could be a starting point.
> 
>>> That's one solution, but see: there is already a python extension
>>> that currently calls kernel-doc everytime. It could, instead,
>>> cache the rst returned by its first run (or a parsed version of it)
>>> and use the cached results the other 3 times.
>>>
>>> Porting kernel-doc to python could be doable, but not trivial, due to several
>>> reasons:
>>>
>>> - it should keep running standalone, as otherwise debugging parsing issues
>>>    on kernel-doc would be a lot harder. In particular, kernel-doc --none is
>>>    really helpful to report kernel-doc tag errors;
>>
>> Yes, of course.  As Jani noted, that's just how you would do it, not a
>> problem.
>>
>>> - regressions will likely be introduced on a change like that;
>>
>> The nice thing is ... we already have a really nice regression test in
>> the form of the current docs build and diff.
> 
> True. We can test the results with both versions and even check how
> performance is affected.
> 
>>> - regular contributors to kernel-doc will need to ramp up with the newer
>>>    version;
>>
>> We have those?  That script is a nightmare and nobody goes near it if
>> they can possibly avoid it.  I would expect to have more contributors
>> with a decent Python version that doesn't include 25 years of regex
>> accretion.
> 
> Well, the kernel-doc version from Markus in python is ~23% bigger
> than our current kernel-doc. Granted, it could be due to comments and
> blank lines, but basically, the same regexes that are in perl would
> also be need to be replicated in python, as parsing a C code with
> regexes is not a trivial task.
> 
> So, in terms of complexity, I doubt much would change by porting it
> to python.
> 
> Now, one of the things that the kernel-doc does is that it has the
> parse code and the output logic, which actually has an an abstraction
> to let it to produce results on different formats (currently, none, man
> and rst - we dropped some other formats from it). This abstraction
> increases its complexity. This is something that doesn't need to be
> replicated on any ports.
> 
>>> - a port like that could increase the script run time, as the
>>>    optimizations and regular expressions there could behave different on
>>>    python.
>>
>> It could also decrease it by improving caching opportunities, getting
>> rid of a lot of fork()/exec() pairs and Perl interpreter startups, etc.
>>
>> I've actually, in a spare moment or two, been doing some profiling of
>> the kernel docs build and trying to track down the sources of the
>> slowness.  I am thinking that nearly 700 *million* calls to the iterator
>> for the C-domain symbol list might have something to do with it...
> 
> Wow, that's a lot!
> 
>>> True, but independently if the script would be rewritten in python or not,
>>> one way would be to enrich the 'DOCS:' kernel-doc tag in order to mention
>>> there the symbols that belong to each part of the document, e. g. something
>>> like:
>>>
>>> 	/**
>>> 	 * DOC: foo
>>> 	 *
>>> 	 * Some comments...
>>> 	 *
>>> 	 * symbols:
>>> 	 *     foo
>>> 	 *     bar
>>> 	 */
>>>
>>> One advantage is that all documentation will be on a single place,
>>> so hopefully it would be easier to maintain.
>>
>> I'm not quite sure I get this...you want to put the TOC tree in the
>> source comments?  This looks like the kind of thing that nobody ever
>> remembers to update, but maybe I'm missing something.
> 
> No, it won't generate a TOC tree. It would instead reorder how
> kernel-doc would output the symbols.
> 
> That's no different than what we have already at the .kernel-doc
> directives, e. g. it would be a replacement for:
> 
> 
> 	.. kernel-doc:: include/some_header.h
> 	   :doc: foo
> 
> 	.. kernel-doc:: include/some_header.h
> 	   :functions:
> 		foo
> 		bar
> 
> The problem we currently have is that the above pattern means that
> one or more .rst files would contain a list of symbols that are
> actually documented at some_header.h. People updating such file
> will very likely forget to update .rst files, leading to missing
> documentation. Also, the same symbol could be included on different
> .rst files.
> 
> I remember I had to fix myself duplicated symbols inclusion while
> trying to reduce the docs build time on a few *.h files that
> were included hundreds of times. I bet if someone checks again,
> duplicated inclusions of the same symbol and missed symbols that
> are documented on their sources, but aren't included at any .rst file.
> 
> Currently, detecting it is very hard, because the symbol lists
> are on different files and the same header are sometimes included
> on different rst files. By placing the symbol list inside the source
> file, it makes very simple for kernel-doc to check if all documented
> symbols are inside the "DOC:" markups, producing errors otherwise.
> 
> Regards,
> Mauro

