Return-Path: <ksummit+bounces-729-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D49C55BAC3
	for <lists@lfdr.de>; Mon, 27 Jun 2022 17:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A59F4280CEC
	for <lists@lfdr.de>; Mon, 27 Jun 2022 15:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A70033F1;
	Mon, 27 Jun 2022 15:34:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CE133E4
	for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 15:34:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5C4B42BD;
	Mon, 27 Jun 2022 15:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5C4B42BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1656344044; bh=ThPmKJue0xkkwTZ7gsQwPqrvHCe0UUD3qyMbzuALyfY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K36jBPgoh/bausE/zkFGwJ6b/vtH7RTMAmvjkP9oXv0CtdF/G3qLjy1Kvli+TDoxd
	 p2xAi/JwqQtKatP2alNPP6oaWwakhTNlffdYYwgwOkKhZLjK43osaYgSAQ2/ZO3BAw
	 iUQslwd6GJM7p4/WZLIaVZie7EjdWda+RGg13nnFTFOg8yrJzRgYQitr4PsLt4COfu
	 mv4XsC5hG9IsxqpQCggHfuQtAdQkn6bv54I9iQ8MpfU4p7jPB3V3VvMNi9mUbVTovb
	 FkUq4ntAaKdpuwk9CDo+lLkdmCAYeP3GbpejQ/Pfbnd64/nSUXTccI/50Bi9eoSOdU
	 sEsm14IFZO2LQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jani Nikula
 <jani.nikula@intel.com>, ksummit
 <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev,
 Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
In-Reply-To: <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net> <20220624083307.159824bd@sal.lan>
 <87tu891xfv.fsf@meer.lwn.net> <20220625101029.67f14c4c@sal.lan>
 <87czew267z.fsf@meer.lwn.net>
 <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
Date: Mon, 27 Jun 2022 09:34:03 -0600
Message-ID: <87bkueyvbo.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Sat, Jun 25, 2022 at 7:00 AM Jonathan Corbet <corbet@lwn.net> wrote:
>>
>> I said "some" - this was a proof-of-concept hack.  The complexity of
>> their symbol lookup code is ... daunting ... and not something that gets
>> fixed in one place.  More research is required...
>
> Note that at least for me, the issue with building docs isn't hugely
> performance related.

Those of us who do lots of docs builds see it a bit differently :)

> Yes, yes, it would be good if it was faster. But..
>
> The primary problems I see with building the docs (and thus checking
> them, the same way I do an allmodconfig build test) is
>
>  (a) it's insanely noisy, which makes and "check that it's ok" ENTIRELY USELESS.
>
> Seriously. There's a very solid reason why I require the standard
> kernel build to be entirely warning-free. Warnings are *BAD*. Even a
> single false-positive warning invalidates all other warnings.

I totally agree, which is why fixing warnings has been at the top of the
priority list for a long time.  That has mostly been done, with Mauro
having taken on the bulk of that work.

It is hard, though, to maintain the warning-free condition.  Warnings
are easy to add and most developers don't check.  Most documentation
changes don't go through the docs tree, so I can't enforce that kind of
check (and trying to force docs changes through my tree would be a cure
far worse than the disease).

Making the docs build faster might make it easier to insist that more
checking is done.

> And the doc build isn't about some "single warning" thing.
>
>  (b) it requires some unusual build tools
>
> Now, (b) may some historical oddity, but at least if you have Fedora
> installed and it still has sphinx version 2.2.11 or something like
> that.
>
> And when you try to build docs, the makefile gives you some random pip
> install thing that is entirely bogus.

I'd be curious to know about how you got into that situation.  Fedora
handles this stuff pretty readily.  I'll take another look at what we
have there.

jon

