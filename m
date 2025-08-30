Return-Path: <ksummit+bounces-2241-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92BB3CFDB
	for <lists@lfdr.de>; Sun, 31 Aug 2025 00:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC9C95E7E54
	for <lists@lfdr.de>; Sat, 30 Aug 2025 22:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAF7259CAF;
	Sat, 30 Aug 2025 22:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZoT8uBAj"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71BB54758
	for <ksummit@lists.linux.dev>; Sat, 30 Aug 2025 22:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756592657; cv=none; b=ZU87x0Xkj4F6F6MCkRM3Vac/mr/T606Zk8wNmS5foU3IdSpyN9Vv1zoZ5p2SIaogwu8FbyxYqU0O8RPPHtNTP1WhUo/oU7AAXAYd1kq/SlWLMglBGbjqr/2Ou7SjcH+ZtUe07LCXhpEXOJzgsuRAO4p32qSVhTSnOJ4mi85OvlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756592657; c=relaxed/simple;
	bh=ez0F0saNjhmaO6KlAwr0jJ62u6JJFdeagC2ExPAC+bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxJQoIG9sHvqUFK4zvJxMnL8tiH1pShpE29FhYOfHfWabfMZ4Ht6VwO/6Nf8c2vNNJ8dFlJNSLeCXPsJ9fV5wL/rAceEhIDYpMNZlabyYH2jTEE/c4h/BmOtceJgAbEPZTmdAfA9FP6ufasO78lETY9bZMWYpaX9GXU6chDvi/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZoT8uBAj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C9EB4EFE;
	Sun, 31 Aug 2025 00:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756592586;
	bh=ez0F0saNjhmaO6KlAwr0jJ62u6JJFdeagC2ExPAC+bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZoT8uBAjzladoaONq+yMM8SUSg9Pd0Tqil6I2x3SM9un8DB0rpUN77Gj6C5/hxvfh
	 dXYyrt9UNQUi22zcxgVxIXfwsTIUnKy1Fu1hsN4UA8NayvqlKAK2doTCEl6Vhl5/cm
	 4L6+3B/DNSc1JtIyjAJBLO0YNFRGO2tZrvPObXdM=
Date: Sun, 31 Aug 2025 00:23:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <20250830222351.GA1705@pendragon.ideasonboard.com>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>

On Sat, Aug 30, 2025 at 06:00:42PM +0200, Vegard Nossum wrote:
> 
> (Added linux-doc and some more people to Cc)
> 
> On 30/08/2025 15:37, Jonathan Corbet wrote:
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> >> On Fri, Aug 22, 2025 at 04:55:51PM -0600, Jonathan Corbet wrote:
> >>> The last year has seen a massive amount of work in our documentation
> >>> build infrastructure and continuous improvement in the docs themselves.
> >>> This session will provide a brief update of what has happened recently,
> >>> followed by discussion on what we want to do next.  How would we like
> >>> our documentation to evolve in the next year or three?
> >>
> >> One area that I think could be improved is making documentation more
> >> accessible, in particular to newcomers. We have a really impressive (and
> >> ever increasing) amount of documentation that has mostly grown in an
> >> organic fashion. As a consequence, many answers can be found when one
> >> knows what they're searching for, but reading documentation is painful
> >> for newcomers. It doesn't flow naturally, and lots of concepts are used
> >> before being introduced much later (or in entirely different locations).
> > 
> > Trust me, I get it.  That's why I have pushed so hard to try to organize
> > the docs with the intended reader in mind.  I think that has worked out
> > well but, so far, the main effect has been to take a massive unorganized
> > pile of stuff and arrange it into several pile of stuff, hopefully with
> > slightly better organization.

It's been a clear a noticeable improvement, even if there's still work
to do. I trust that you understand the issue.

> +100 for continuing to organize the docs with the intended reader in mind.
> 
> If I may refer to my old email from the corresponding 2023 tech topic
> thread, which also discusses the structure somewhat:
> 
> https://lore.kernel.org/all/e79d53e2-4a1a-4f7e-850c-7f412ba43d35@oracle.com/
> 
> """
> On the topic of the overall structure of the documentation: [4]
> describes the idea that the kernel documentation is set of "books" --
> user and admin guide, core API, drivers API, userspace API. I think this
> needs to be emphasized more, as that _is_ the (philosophy of the)
> current high-level organization of the documentation and it feels a bit
> hidden where it currently is; maybe it should be placed prominently at
> the top of that file and called "Organization and philosophy" or
> something. At least I was very confused when I came across a passage
> that read something like "This book covers ..." and I had no idea why a
> kernel document was talking about books.
> 
> [4] 
> https://docs.kernel.org/doc-guide/contributing.html#documentation-coherency
> """
> 
> > Occasionally I make an attempt to attack one of the top-level books and
> > create a bit more order there.  But my teaspoon is going to take a while
> > to drain that ocean.
> 
> I took a very small stab at organizing stuff in the right places last year:
> 
> https://lore.kernel.org/all/20240104160946.3450743-1-vegard.nossum@oracle.com/
> 
> I probably should have spun a v2 and pushed harder to get things done
> but it might be worth taking a step back and try to analyze what
> happened in this thread. As a submitter, it's hard to know how long to
> wait for comments from others before sending a v2, it's not clear
> whether people's comments are meant as improvement suggestions, if they
> consider them blockers... should the maintainer be chiming in? Etc.
> 
> In general, it might be worth merging docs patches more aggressively and
> requesting incremental fixups for non-critical things (it's not like
> docs patches will ever result in unbootable kernels or corrupted
> filesystems). This way we keep the flow going and don't get contributors
> stuck on waiting, rebasing, resolving any conflicts that might appear in
> the interim, and resubmitting... for what might be relatively minor issues.
> 
> At least I have a tendency to simply drop it and move on if my patches
> meet resistance (and perhaps especially if the patches are relatively
> inconsequential). I admit that this is largely my own fault, but I'm
> guessing I'm not the only one either.

I wouldn't use the word "fault" here, I don't think you should take any
blame for this. Looking at that particulat patch series, I think sending
a v2 would have helped moving forward.

> Another example that I don't think ever got merged (even with an ack
> from Randy?), though admittedly that was RFC:
> 
> https://lore.kernel.org/all/e398ebb1-1d42-49ff-b355-b4bc3258fc10@oracle.com/#t

For this one, Jon replied with a comment, and the discussion died out.
Replying to that could have helped.

> Looking at my local branches, I have a bunch of restructuring patches
> that never even got sent out because the first parts were stuck in
> limbo. Again, probably mostly my fault, but what do I do differently?

In general I'd say you shouldn't be afraid to ping.

> >> While some documents are clearly meant to be reference material, other
> >> target developers who are not familiar with the topic being described.
> >> They would benefit from being written in linear, story-telling way. I
> >> don't know how to best achieve that though: developers writing any kind
> >> of documentation in the first place is already an achievement, and
> >> writing the documentation while putting yourself in the shoes of someone
> >> not familiar with the topic is not an easy task.
> > 
> > It is common to divide technical documentation into four broad
> > categories: tutorials (for learning), howtos (getting tasks done),
> > explanation (understanding what's going on), and reference.  Each is
> > aimed at a different audience.
> > 
> > Most of what we have is reference.  There's an occasional howto, and
> > some explanation in spots.  We don't have much in the way of tutorials.
> > 
> > It would be nice to (1) recognize those categories in the organization
> > of our documentation, and (2) fill them out somewhat.  But, as you note,
> > getting people to do that is hard.  Doing it properly requires somebody
> > whose job is to create that sort of material...and, as I've harped on
> > for years:
> > 
> > 	Despite the fact that there are large number of people paid to
> > 	work on the kernel, there is not a single person whose job is to
> > 	work on kernel documentation.
> > 
> > Last year we tried an experiment with a bit of funding from the LF to
> > create a bit of paid documentation; for a number of reasons, that
> > experiment did not work out.  But it seems there should be a way to make
> > some forward progress on this front.

Is there anything we can learn from that failure and that number of
reasons to make the next attempt more successful ?

> I don't know if this has been suggested before, we seem to have a number
> of people who are interested in documentation in its own right and I was
> wondering if we could do more for community building around it: monthly
> zoom call (which some other subsystems/interest groups do), IRC/Matrix/
> Discord channel, a roadmap for docs (KernelNewbies project?).
> 
> (Speaking of which, why isn't linux-doc@ Cc'ed on this thread?)

Just an oversight I suppose.

> I would personally be very happy to see a slightly less formal place
> off-list to throw out some patches for quick feedback before submitting
> them on the list so that I don't spend hours on something that's going
> be met with either a wall of silence and zero enthusiasm or what I would
> call mildly discouraging comments.

When I'm really not sure if something is a good idea, or when I'm
convinced it's a good idea but I fear other may disagree, I often ask
relevant maintainers and developers on IRC. I don't know if there's an
IRC channel for the Linux kernel documentation, if there are enough
people interested in the topic, it could be useful.

> Perhaps it sounds a bit hypocritical,
> after all I have barely reviewed or acked any docs patches myself, but I
> think it actually goes both ways: I was really happy to see the
> kerneldoc perl-to-Python conversion (and the subsequent cleanups) but I
> didn't have the time to look at it in detail at the time and chiming in
> just to say "I like this" felt like I would just be adding noise.
> 
> Returning to the topic of getting people to do stuff, I think Jani (or
> somebody, I forget who/where/when) suggested using the 'todo' Sphinx
> plugin at some point, it basically lets you add todo:: nodes in .rst
> (which can be rendered or hidden), which might be a good way to track
> stuff that still needs to be done in docs land without having to do it
> all at once -- and maybe draw in some contributions from others who come
> across them?

I really don't know if we could count on newcomers interested in getting
into kernel development to start their journey in Documentation/. I can
imagine in theory that someone who tries to follow our documentation and
finds it suboptimal could send patches as a side product of whatever
work they're doing (without wanting to show off, that's how I wrote the
initial documentation for the KMS in-kernel API: I had to write a KMS
driver, had no idea how it worked, and there was no doc), but that will
be a rare occurence and most probably would come from an experienced
kernel contributor. We seem to scare lots of new contributors in
general, so I have a hard time imagining they would actively work on
documentation improvements. There could be exception, but I don't think
we should count on them.

> Anyway, I don't mean to complain too much. Lots of great progress has
> been made. Thanks Jon, Mauro, Randy, Bagas, and others -- good work!

-- 
Regards,

Laurent Pinchart

