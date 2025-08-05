Return-Path: <ksummit+bounces-2083-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9AB1BCC1
	for <lists@lfdr.de>; Wed,  6 Aug 2025 00:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2490B16D8C0
	for <lists@lfdr.de>; Tue,  5 Aug 2025 22:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47C124679B;
	Tue,  5 Aug 2025 22:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hQ9lVj3r"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0BB200127
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 22:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754433730; cv=none; b=TcMy1XI+eA4C5bADIFGdxYbvnvYa1ekFFjsfO0n4kLadioQaaAwYtUHJbgJR35LXE6888u9A/cDX0ZfVV40McTx7DdMWt74x0zEhUA8dMwGshKbTT+BefwfPscUw9Mx8PaBnZvzmKhajQP275WR3H0hMg+BXznTKwpsAisYLaGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754433730; c=relaxed/simple;
	bh=T1u0yGIClswHTXx2QQrPQTkGEdgfnTQ81wv/rsI+tO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBe2Z4MTWLq3aaIB4DyRZBaGMv0Yfg5guJ3Y4xGurIxY7EM18n7+z95yUMWkahM1OFEjOWI/3h03giHO95fF/U4nEEL+9pLhHmDePrfUyqZ/c+B1lcVI4xPaRThUCAot/3xeU4+8YP7W6Z36Mm6CSeFxrw2PC++f4Ji9Bc020UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hQ9lVj3r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8190AE91;
	Wed,  6 Aug 2025 00:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754433671;
	bh=T1u0yGIClswHTXx2QQrPQTkGEdgfnTQ81wv/rsI+tO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQ9lVj3rpL+IwHnCJjgUK9TwlBIHnkqlVFF5I+kDKNTZxeB9ZsJbbHkjd1Cy8biVq
	 JCfcan4UbPZH1lG8vm1RGj5ve3on4ZtAdb/Cg320YPB0oTH+9ckVAs5hyfLuLwRAMS
	 ABzJPQ1/RhSERW9pniK0MMXS6/S5wJbt0TwhBfzQ=
Date: Wed, 6 Aug 2025 01:41:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250805224145.GC16330@pendragon.ideasonboard.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <20250805180010.GA24856@pendragon.ideasonboard.com>
 <aJJKccsn_L0hGXoA@lappy>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJJKccsn_L0hGXoA@lappy>

On Tue, Aug 05, 2025 at 02:16:17PM -0400, Sasha Levin wrote:
> On Tue, Aug 05, 2025 at 09:00:10PM +0300, Laurent Pinchart wrote:
> > On Tue, Aug 05, 2025 at 01:50:57PM -0400, Sasha Levin wrote:
> >> On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
> >> > This proposal is pretty much followup/spinoff of the discussion currently
> >> > happening on LKML in one of the sub-threads of [1].
> >> >
> >> > This is not really about legal aspects of AI-generated code and patches, I
> >> > believe that'd be handled well handled well by LF, DCO, etc.
> >> >
> >> > My concern here is more "human to human", as in "if I need to talk to a
> >> > human that actually does understand the patch deeply enough, in context,
> >> > etc .. who is that?"
> >> >
> >> > I believe we need to at least settle on (and document) the way how to
> >> > express in patch (meta)data:
> >> >
> >> > - this patch has been assisted by LLM $X
> >> > - the human understanding the generated code is $Y
> >> >
> >> > We might just implicitly assume this to be the first person in the S-O-B
> >> > chain (which I personally don't think works for all scenarios, you can
> >> > have multiple people working on it, etc), but even in such case I believe
> >> > this needs to be clearly documented.
> >>
> >> The above isn't really an AI problem though.
> >>
> >> We already have folks sending "checkpatch fixes" which only make code
> >> less readable or "syzbot fixes" that shut up the warnings but are
> >> completely bogus otherwise.
> >>
> >> Sure, folks sending "AI fixes" could (will?) be a growing problem, but
> >> tackling just the AI side of it is addressing one of the symptoms, not
> >> the underlying issue.
> >
> > Perfect, let's document a policy and kill two birds with one stone then.
> 
> So I've gone through some of our docs, and we already have the following
> in submitting-patches.rst:
> 
> 	Your patch will almost certainly get comments from reviewers on
> 	ways in which the patch can be improved, in the form of a reply
> 	to your email. You must respond to those comments; ignoring
> 	reviewers is a good way to get ignored in return. You can simply
> 	reply to their emails to answer their comments. Review comments
> 	or questions that do not lead to a code change should almost
> 	certainly bring about a comment or changelog entry so that the
> 	next reviewer better understands what is going on.
> 
> 	Be sure to tell the reviewers what changes you are making and to
> 	thank them for their time.  Code review is a tiring and
> 	time-consuming process, and reviewers sometimes get grumpy.
> 	Even in that case, though, respond politely and address the
> 	problems they have pointed out.  When sending a next version,
> 	add a ``patch changelog`` to the cover letter or to individual
> 	patches explaining difference against previous submission (see
> 	:ref:`the_canonical_patch_format`).  Notify people that
> 	commented on your patch about new versions by adding them to the
> 	patches CC list.
> 
> In the context of this discussion it's a bit funny: we mandate that
> reviews will be responded to, but we don't mandate that the response
> will make any sense, which I think is Jiri's point.

I would consider that strongly implied. Are there contributors who could
in good faith consider that responses that don't make any sense are
perfectly fine ? If we had to state that explicitly, there would be
thousands of other assumptions we would need to document.

What I believe we need to document is the assumptions we make that may
not be self-evident to contributors. I assume that patches I receive are
understood by the author, as well as by the submitter unless stated
otherwise. LLMs may empower new (or existing) contributors to submit
more easily and in larger quantities patches that neither them nor
anyone else understand. If we all think nobody in their right mind would
do that, then there's nothing to document. I think the rule needs to be
stated clearly, as I'm concerned we'll see an increase in such
submissions.

> The TIP maintainer's handbook (maintainer-tip.rst) actually seems to
> tackle this:
> 
>     SOBs after the author SOB are from people handling and transporting
>     the patch, but were not involved in development. SOB chains should
>     reflect the **real** route a patch took as it was propagated to us,
>     with the first SOB entry signalling primary authorship of a single
>     author.
> 
> Should we clarify that this is true for any kernel patches?

This seems to be related to
https://lore.kernel.org/all/20250724072032.118554-1-hendrik.hamerlinck@hammernet.be/

-- 
Regards,

Laurent Pinchart

