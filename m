Return-Path: <ksummit+bounces-2140-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 073D6B22CA4
	for <lists@lfdr.de>; Tue, 12 Aug 2025 18:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E814C4E3C77
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFD42F83B5;
	Tue, 12 Aug 2025 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rIqfVPom"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AB02F83A4
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755014158; cv=none; b=TNPxKRXVON7KM0HbuMnyWssKsDhrw+znX2hamzGjbOuFa/GoWYNAPacI+dDZhpKJBVA7c7n8rCYpjDefbTPNyHE/LKw4Jt2eSPNmWnkA5K8kOTh3pVT3OIZg29B3lHDtY+PSiPQ1fQZelMXrMRRZrTJDYMJ3eYfSMcu/65km/VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755014158; c=relaxed/simple;
	bh=Pgxl1gSjY+D9Gmvapf3IUHpcBhdWWBV+FI0x2BBgGFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zv2lZ8ZfaUL8tWG+bb8dT4nVDlZkRTqD97jjY0YGuwV4PGq5CAjMUYakI1HEzhIu+uxStC5q08f7/83mSNHYGYHu07032pKRxepWRMEmuuTKLT3UWl/L0Dwkh2mF7e3cQSHO7Z1sgwDG6AkqBjdkOgvn5KcTXzVuYqeR5wMm5Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rIqfVPom; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 610E610D4;
	Tue, 12 Aug 2025 17:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755014101;
	bh=Pgxl1gSjY+D9Gmvapf3IUHpcBhdWWBV+FI0x2BBgGFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIqfVPomUXBnPPrS90P4Lp12Bv5IPAPEavLFaZ6KMlWwR2k/so4z+42X8HCfaCLFp
	 RZYct3gjNQpqXoDdWHsulJuOa29MQANnPzg8T0wKF33gYjtuCWigH2J1yBT+/L5pWG
	 VPU4SAQBANyujf7SOtVexB0u8XLuSAoiuL1dYWg8=
Date: Tue, 12 Aug 2025 18:55:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250812155536.GP30054@pendragon.ideasonboard.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>

On Tue, Aug 12, 2025 at 07:42:21AM -0700, Paul E. McKenney wrote:
> On Tue, Aug 12, 2025 at 09:38:12AM +0100, James Bottomley wrote:
> > On Mon, 2025-08-11 at 14:46 -0700, Paul E. McKenney wrote:
> > > On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:
> > > > On 05/08/2025 19:50, Sasha Levin wrote:
> > > > > On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
> > > > > > This proposal is pretty much followup/spinoff of the discussion
> > > > > > currently happening on LKML in one of the sub-threads of [1].
> > > > > > 
> > > > > > This is not really about legal aspects of AI-generated code and
> > > > > > patches, I believe that'd be handled well handled well by LF,
> > > > > > DCO, etc.
> > > > > > 
> > > > > > My concern here is more "human to human", as in "if I need to
> > > > > > talk to a human that actually does understand the patch deeply
> > > > > > enough, in context, etc .. who is that?"
> > > > > > 
> > > > > > I believe we need to at least settle on (and document) the way
> > > > > > how to express in patch (meta)data:
> > > > > > 
> > > > > > - this patch has been assisted by LLM $X
> > > > > > - the human understanding the generated code is $Y
> > > > > > 
> > > > > > We might just implicitly assume this to be the first person in
> > > > > > the S-O-B chain (which I personally don't think works for all
> > > > > > scenarios, you can have multiple people working on it, etc),
> > > > > > but even in such case I believe this needs to be clearly
> > > > > > documented.
> > > > > 
> > > > > The above isn't really an AI problem though.
> > > > > 
> > > > > We already have folks sending "checkpatch fixes" which only make
> > > > > code less readable or "syzbot fixes" that shut up the warnings
> > > > > but are completely bogus otherwise.
> > > > > 
> > > > > Sure, folks sending "AI fixes" could (will?) be a growing
> > > > > problem, but tackling just the AI side of it is addressing one of
> > > > > the symptoms, not the underlying issue.
> > > > 
> > > > I think there is a important difference in process and in result
> > > > between using existing tools, like coccinelle, sparse or even
> > > > checkpatch, and AI-assisted coding.
> > > > 
> > > > For the first you still need to write actual code and since you are
> > > > writing it, most likely you will compile it. Even if people fix the
> > > > warnings, not the problems, they still at least write the code and
> > > > thus this filters at least people who never wrote C.
> > > > 
> > > > With AI you do not have to even write it. It will hallucinate,
> > > > create some sort of C code and you just send it. No need to compile
> > > > it even!
> > > 
> > > Completely agreed, and furthermore, depending on how that AI was
> > > trained, those using that AI's output might have some difficulty
> > > meeting the requirements of the second portion of clause (a) of
> > > Developer's Certificate of Origin (DCO) 1.1: "I have the right to
> > > submit it under the open source license indicated in the file".
> > 
> > Just on the legality of this.  Under US Law, provided the output isn't
> > a derivative work (and all the suits over training data have so far
> > failed to prove that it is), copyright in an AI created piece of code,
> > actually doesn't exist because a non human entity can't legally hold
> > copyright of a work.  The US copyright office has actually issued this
> > opinion (huge 3 volume report):
> > 
> > https://www.copyright.gov/ai/
> > 
> > But amazingly enough congress has a more succinct summary:
> > 
> > https://www.congress.gov/crs-product/LSB10922
> 
> Indeed:
> 
> 	While the Constitution and Copyright Act do not explicitly define
> 	who (or what) may be an "author," U.S. courts to date have not
> 	recognized copyright in works that lack a human author—including
> 	works created autonomously by AI systems.
> 
> Please note the "U.S. courts *to* *date*".  :-(
> 
> > But the bottom line is that pure AI generated code is effectively
> > uncopyrightable and therefore public domain which means anyone
> > definitely has the right to submit it to the kernel under the DCO.
> > 
> > I imagine this situation might be changed by legislation in the future
> > when people want to monetize AI output, but such a change can't be
> > retroactive, so for now we're OK legally to accept pure AI code with
> > the signoff of the submitter (and whatever AI annotation tags we come
> > up with).
> 
> Except that the USA is a case-law jurisdiction, and changes
> in interpretation of existing laws can be and have been applied
> retroactively, give or take things like statutes of limitations.  And we
> need to worry about more than just USA law.
> 
> And I do agree that many of the lawsuits seem to be motivated by an
> overwhelmening desire to monetize the output of AI that was induced by
> someone else's prompts, if that is what you are getting at.  It does seem
> to me personally that after you have sliced and diced the training data,
> fair use should apply, but last I checked, fair use was a USA-only thing.

I've read many legal arguments or concerns in this mail thread. While
fair use has legal definitions, we seem to have avoided discussing the
ethical aspect so far.

The vast majority of free software licenses were written at a point
where most people were not predicting how open-source code would be used
to train LLMs by large commercial actors. This may not be much of an
issue for the more permissive licenses: if I release code under CC0-1.0,
it can probably be fairlyo assumed I won't oppose to any specific usage
of it, LLM training or otherwise. For copyleft code, on the other hand,
it is way less clear if code authors who picked a specific copyleft
license would approve of proprietary LLMs being trained on their code.
While those authors may or may not have a say from a legal point of view
(far from universally clear at this point), it doesn't meant the Linux
kernel should approve (explicitly or tacitly) a practice that may be
legal but could be considered unethical by a part of the community.

Regardless of the decision we make, I think it's important to take the
ethical argument into consideration. If the kernel decides to approve
usage of LLMs for code generation purpose, those who make that decision
should be accountable for its ethical aspect as well.

> > Of course if you take AI output and modify it before submitting, then
> > the modifications do have copyright (provided a human made them).
> 
> Agreed, in that case, it is well established that the AI output would
> have at least one layer of copyright protection.

-- 
Regards,

Laurent Pinchart

