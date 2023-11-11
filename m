Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7D7E8B57
	for <lists@lfdr.de>; Sat, 11 Nov 2023 16:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 484C9280EF9
	for <lists@lfdr.de>; Sat, 11 Nov 2023 15:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579A2168C9;
	Sat, 11 Nov 2023 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="m4fpGv/5"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D65D179BF
	for <ksummit@lists.linux.dev>; Sat, 11 Nov 2023 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Received: from localhost (unknown [IPv6:2601:281:8300:73::e2d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 90E0A378;
	Sat, 11 Nov 2023 15:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 90E0A378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1699715692; bh=UDgQRkB6AHqGi0UlLa9ZeRlicr0tVvFAtrmSUdIncII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m4fpGv/5OnHCys0cPEeikLUW4YY3WwG2SqJqPCdx1E21i8ttcZBXH0YakVaWgqYfC
	 QlhdOP71VVsb/UIco33jvPSO08ZUPib60qwSokWZ7maKqFoCQrpAWTcYvTd/G1DRQ/
	 yaNcbxUmZ4zDY/hKEBRJ4gXn9xUEk405pircAZ3P9lxfzdqoTl0YPAJXZES4zVoAOy
	 9H5R0oE5oSks5Mv44LOCkp3tPwx+NfUghSQF0YzOu9wlqQqqD/mzBVih8WacXYR6hK
	 W25OlT6ALDkplV9/x/CtAR4d6lfolLKFr0QLNZ3YqN5DzXThGO0wvMIsmyiopO+dHC
	 0yxkut6ShGX2w==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Cc: linux-doc@vger.kernel.org
Subject: Re: [TECH TOPIC] Kernel documentation
In-Reply-To: <e79d53e2-4a1a-4f7e-850c-7f412ba43d35@oracle.com>
References: <87fs6rxppz.fsf@meer.lwn.net>
 <e79d53e2-4a1a-4f7e-850c-7f412ba43d35@oracle.com>
Date: Sat, 11 Nov 2023 08:14:51 -0700
Message-ID: <87cywg8gpg.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> This is coming a bit late, but I saw that there is going to be a session
> on kernel documentation on the 15th [1] and I wanted to contribute a few
> thoughts before that.

Quite a few it seems :)  Yes, this would have been more helpful a bit
sooner; I'll try to respond quickly to some of this.

> First of, regarding the structure, what is the best way to contribute
> such changes? Large structural changes would presumably be a patch
> series potentially touching a lot of documents from different subsystems
> and the individual patches won't necessarily make sense in isolation.

Obviously depends on the specific changes.  You can look at the move of
all the architecture docs as one example of how to do it.  It took
months and a modest number of merge conflicts, but (with 6.7) we got it
done. 

> How do we gather consensus for big changes like that? Is it better to
> collect acks from subsystem maintainers and then let the documentation
> maintainer merge it all at once? Should all the maintainers be Cc'ed on
> the cover letter and their individual patches or do they want to be
> Cc'ed on everything? What if one or two maintainers don't agree with the
> overall approach, does that block the whole series? Does the
> documentation maintainer have a veto?  Or do we prefer trickle of small,
> incremental patches, going through the individual maintainers? Ideally,
> I'd like to see these questions answered in the documentation
> subsystem's maintainer entry -- it has a paragraph about the boundaries
> of documentation being "fuzzier than normal", but it doesn't offer much
> practical or actionable advice IMHO.

The maintainer entry has remarkably little power to dictate how other
maintainers must respond to docs changes.  The answer is that we handle
them like all other cross-subsystem changes - on a case-by-case basis
and with a certain tolerance for pain.

> The Maintainer Entry Profile supplements the top-level process documents
> (submitting-patches, submitting drivers...) with
> subsystem/device-driver-local customs as well as details about the patch
> submission life-cycle. A contributor uses this document to level set
> their expectations and avoid common mistakes; maintainers may use these
> profiles to look across subsystems for opportunities to converge on
> common practices.
> """
>
> We currently only have 7 of these and I think it would be great to
> spread awareness of their existence so that we can have more. Please
> mention this if there is a room full of subsystem maintainers ;-)

I routinely mention it at the maintainers summit...progress is slow. 

> I also think it would be great if we could amend these with
> subsystem-specific review checklists. I'm thinking of very hands-on
> code-technical things that maintainers will be checking in all their
> incoming patches, things that aren't obvious and don't necessarily show
> up easily in testing -- things like: for new /proc entries, is extra
> permission checking done at ->open() or ->write() time? (This is a
> non-obvious potential security issue.) The idea here is for maintainers
> to document how they review patches to _their_ subsystems and thus also
> make it easier for others (outsiders, newcomers) to review for those
> same things. I know it would give me more confidence, actually both when
> submitting my own patches and potentially also when reviewing others'
> patches.

Documentation aimed at helping reviewers would be a great thing.  I do
feel that as little of it as possible should be subsystem-specific,
though.  We need fewer local quirks (IMO) rather than more.

> One potential issue here is deciding whether certain things fit
> better with the Core API and Driver API sections of the documentation --
> for example, should subsystem-specific lock nesting orders be part of a
> review checklist or does that belong in the source files themselves? How
> do we avoid duplication and things getting stale? Can we add a new
> kerneldoc directive that gets collected from the C sources and
> automatically put into a subsystem-specific review checklist? (I'd be
> happy to try implementing this, if people like the idea.)

You can certainly put that material in DOC blocks now.

> Finally, I'd like to suggest a number of specific structural changes:
>
> 1. the HTML sidebar is a bit of an unreadable mess, at least with the
> current alabaster theme (the sphinx_rtd_theme is better in this respect,
> IMHO, but that's a separate topic).

The sidebar is on my list to raise at the session; people like to
complain about it, but I'm not sure we have a consensus on what should
be there.  I dug into the theming code a while back; reproducing the RTD
sidebar is relatively easily done if we want that, but I'm not convinced
it's better.

> I think the top-level front page
> sidebar should _only_ contain the "books", and then you can click
> through/expand to the section that you need.

I think that might be an improvement, yes.

> 2. some documents currently exist at multiple places in the toctree. As
> an example, "Core API Documentation" is available from both "Internal
> API manuals" and "Internal API manuals -> Kernel subsystem documentation
> -> Core subsystems" (i.e. both Documentation/index.rst and
> Documentation/subsystem-apis.rst). This is both weird and confusing from
> a navigational point of view; it's as if a real book had 20 chapters at
> the beginning but also the exact same chapters nested deeply inside
> another chapter somewhere else in the book. We should be using
> cross-referencing instead. Moreover, do we have a way to detect these
> multiple inclusions (e.g. a sphinx-build warning)?

Nope, nothing automated.  Not a huge problem, IMO, and easy enough to
fix wen it comes up.

> 3. I'm wondering if it wouldn't be appropriate to have a top-level
> "Community" book (maybe even the very first one) that would detail
> things like the CoC, mailing lists and etiquette (but not
> process-oriented details like how to submit a patch; we should link to
> those, though!), references to IRC channels and social.kernel.org,
> kernelnewbies.org, maybe eventually other things like governance
> structure, etc. The main idea here is to put the community in focus, as
> I think that's something we're lacking slightly -- the kernel community
> is large and diverse and in many ways highly fractured. Many things are
> not written anywhere at all and other things that are written somewhere
> are maybe scattered all over the place. By having a dedicated place to
> put community-related documentation it would show that this is something
> we actually care about and make the kernel more welcoming to newcomers
> and outsiders.

That is part of what the process book is meant to be - how to work with
our community.  Reworking the process-book top page is another thing I
want to mention in the session, we can do better, but I'm not convinced
that splitting that information out entirely is an improvement.

> 4. "translations" also doesn't need to be a top-level document that
> appears in the top-level sidebar; in [5] I submitted a Sphinx extension
> that would add a language selection bar to the top of the rendered HTML,
> which would allow you to change the language of _any_ document that has
> translations, including the front page. I'll still need to submit my v2
> of this.

..and I still need to look at it; it's been waiting for the merge
window to pass (though LPC and holidays are going to slow me down too).

> 5. I think architecture-specific information should be split up along
> the user+admin/userspace-dev/kernel-dev lines and moved into their
> respective books instead of being a top-level document. This goes
> counter to the idea that Documentation/ should mirror the structure of
> the kernel sources, but I think it makes sense to make an exception in
> this case.

Now that we've just finished moving all the arch docs around, I'm not
sure I want to do that to the arch maintainers again soon :)  Longer
term, this could be considered if we think it makes things better.

Thanks,

jon

