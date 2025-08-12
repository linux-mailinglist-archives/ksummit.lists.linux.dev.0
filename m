Return-Path: <ksummit+bounces-2133-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D77B22B09
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBD752A797F
	for <lists@lfdr.de>; Tue, 12 Aug 2025 14:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFA42ECD1E;
	Tue, 12 Aug 2025 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfAxC3Tg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060EA280018
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009742; cv=none; b=m+s4G7/+bpofbc49UKbyiRWU0rcg4TudwFOW5ifD6w4TyDVIahtpUx+LoC82quFVPtl+gaB9OESuEO9UVRUojBYJIj+necw2Zk+xgnt9++jaj0uBKLOZKZGGHfU1oHq4fwaOGT/NA5k7xiD/AS2fxC5U7UvRnblKQ9GU1VaAlLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009742; c=relaxed/simple;
	bh=MbFuEL2oBujvGOhcBMQdWJfZM55JFv54dAc+D6yOUF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6ffMkSi+xhAMysn8IsRg1mDlkAKU5q+9waZQ7HGAX1xQIVJJAoDkUGMP00A81bOc7hujC1RM+v6DN4hTS05dINC0BOFvJiYQWjuq18UJvXrIojy0+3cblh3bU6YuQLkvhQIxBlJg7GGQGfVjjuBoOvhW/jKAcPjDcaiXA2pNAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfAxC3Tg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8403EC4CEF0;
	Tue, 12 Aug 2025 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755009741;
	bh=MbFuEL2oBujvGOhcBMQdWJfZM55JFv54dAc+D6yOUF0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=TfAxC3TgHHkMQ4z57mhMEfuFY4er4+A9YYE0/NhqT6jGV5UVAlGp1084qILM1CZg6
	 flniJ9lb2JH46z6y5l2alDE7YFqKp7e0JNBjURB4C9fpyNsfutf6quxMtlbca2ZgoZ
	 vAOXnJnAlYN3cts9njIr8pF1zOSOKpn9Y75SFt5n07ZPfeVKT7QkQnEwHCN2fSrNBj
	 IPiehxtzti7/N75Hqx84Cxkg6E3TL/hz63U5Q8vgDkwEP4gNvdkVie9qjqw6ySGGnj
	 jweNLhIFqljXpeHkJUyXppv4USPjvHX3cu0cXTWHRvult+k6g0ZSj3YESJDxHPNTZy
	 +nN4T2PH5lTdg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 237CCCE0AB1; Tue, 12 Aug 2025 07:42:21 -0700 (PDT)
Date: Tue, 12 Aug 2025 07:42:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>

On Tue, Aug 12, 2025 at 09:38:12AM +0100, James Bottomley wrote:
> On Mon, 2025-08-11 at 14:46 -0700, Paul E. McKenney wrote:
> > On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:
> > > On 05/08/2025 19:50, Sasha Levin wrote:
> > > > On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
> > > > > This proposal is pretty much followup/spinoff of the discussion
> > > > > currently happening on LKML in one of the sub-threads of [1].
> > > > > 
> > > > > This is not really about legal aspects of AI-generated code and
> > > > > patches, I believe that'd be handled well handled well by LF,
> > > > > DCO, etc.
> > > > > 
> > > > > My concern here is more "human to human", as in "if I need to
> > > > > talk to a human that actually does understand the patch deeply
> > > > > enough, in context, etc .. who is that?"
> > > > > 
> > > > > I believe we need to at least settle on (and document) the way
> > > > > how to express in patch (meta)data:
> > > > > 
> > > > > - this patch has been assisted by LLM $X
> > > > > - the human understanding the generated code is $Y
> > > > > 
> > > > > We might just implicitly assume this to be the first person in
> > > > > the S-O-B chain (which I personally don't think works for all
> > > > > scenarios, you can have multiple people working on it, etc),
> > > > > but even in such case I believe this needs to be clearly
> > > > > documented.
> > > > 
> > > > The above isn't really an AI problem though.
> > > > 
> > > > We already have folks sending "checkpatch fixes" which only make
> > > > code less readable or "syzbot fixes" that shut up the warnings
> > > > but are completely bogus otherwise.
> > > > 
> > > > Sure, folks sending "AI fixes" could (will?) be a growing
> > > > problem, but tackling just the AI side of it is addressing one of
> > > > the symptoms, not the underlying issue.
> > > 
> > > I think there is a important difference in process and in result
> > > between using existing tools, like coccinelle, sparse or even
> > > checkpatch, and AI-assisted coding.
> > > 
> > > For the first you still need to write actual code and since you are
> > > writing it, most likely you will compile it. Even if people fix the
> > > warnings, not the problems, they still at least write the code and
> > > thus this filters at least people who never wrote C.
> > > 
> > > With AI you do not have to even write it. It will hallucinate,
> > > create some sort of C code and you just send it. No need to compile
> > > it even!
> > 
> > Completely agreed, and furthermore, depending on how that AI was
> > trained, those using that AI's output might have some difficulty
> > meeting the requirements of the second portion of clause (a) of
> > Developer's Certificate of Origin (DCO) 1.1: "I have the right to
> > submit it under the open source license indicated in the file".
> 
> Just on the legality of this.  Under US Law, provided the output isn't
> a derivative work (and all the suits over training data have so far
> failed to prove that it is), copyright in an AI created piece of code,
> actually doesn't exist because a non human entity can't legally hold
> copyright of a work.  The US copyright office has actually issued this
> opinion (huge 3 volume report):
> 
> https://www.copyright.gov/ai/
> 
> But amazingly enough congress has a more succinct summary:
> 
> https://www.congress.gov/crs-product/LSB10922

Indeed:

	While the Constitution and Copyright Act do not explicitly define
	who (or what) may be an "author," U.S. courts to date have not
	recognized copyright in works that lack a human author—including
	works created autonomously by AI systems.

Please note the "U.S. courts *to* *date*".  :-(

> But the bottom line is that pure AI generated code is effectively
> uncopyrightable and therefore public domain which means anyone
> definitely has the right to submit it to the kernel under the DCO.
> 
> I imagine this situation might be changed by legislation in the future
> when people want to monetize AI output, but such a change can't be
> retroactive, so for now we're OK legally to accept pure AI code with
> the signoff of the submitter (and whatever AI annotation tags we come
> up with).

Except that the USA is a case-law jurisdiction, and changes
in interpretation of existing laws can be and have been applied
retroactively, give or take things like statutes of limitations.  And we
need to worry about more than just USA law.

And I do agree that many of the lawsuits seem to be motivated by an
overwhelmening desire to monetize the output of AI that was induced by
someone else's prompts, if that is what you are getting at.  It does seem
to me personally that after you have sliced and diced the training data,
fair use should apply, but last I checked, fair use was a USA-only thing.

> Of course if you take AI output and modify it before submitting, then
> the modifications do have copyright (provided a human made them).

Agreed, in that case, it is well established that the AI output would
have at least one layer of copyright protection.

							Thanx, Paul

