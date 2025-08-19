Return-Path: <ksummit+bounces-2165-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A6B2C864
	for <lists@lfdr.de>; Tue, 19 Aug 2025 17:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5710C1BC6B9E
	for <lists@lfdr.de>; Tue, 19 Aug 2025 15:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D279285412;
	Tue, 19 Aug 2025 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrwhShd9"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203CE2253FC
	for <ksummit@lists.linux.dev>; Tue, 19 Aug 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755617140; cv=none; b=APeNTbewmktwVc0L/FUD11K1mxjNKqnZ/di3XU/lN4cS9uCJLVt7mDjvNt5U2fM+bpyUk3zjYO+EzvlQ5PW9tJrbcw0EZ+G3MiZiqFKmMK/IsqO67LtIJAOHfx9znPMSfljDoHkqID0gWoRZ60BGiUAMnxCB/O6497hgdmvKj00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755617140; c=relaxed/simple;
	bh=XVlry02Sy+iE1y8lQ/A7ccD7z90WogZ9YWXg58dzWaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTThWVKSXYeH4s5nhIfV8TtXauNhKhHkbf39DC10W++hCawNHxoArGmopdkIxFbhpF8nG3aq0DXDqMPtuvW56+WsQwX455faE7SwxlaqsENB021S/4SjM0j5Pv3YjBaBaAy0Z9cc1ALHk4doCPlF7NIP3YE6PpmKjWgsZ8qqBJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrwhShd9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A265BC4CEF4;
	Tue, 19 Aug 2025 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755617139;
	bh=XVlry02Sy+iE1y8lQ/A7ccD7z90WogZ9YWXg58dzWaU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=JrwhShd9yBilShNrlqx8J0LB2zkN4uz5WF96LjFeLCnJnWxY21V0XZ6jHrNjJLRkr
	 fRUrVO7OyFxrvllwK7BuuiEyLU8LpoRbKZDnCMO1Wiw8otaYRZUSzfJvPZtaQitzAL
	 I5vq3lhfwVUpD8xv8ZxwJdp9zUqbWmYb2Ni3oSkM+Dob+WSMb5vbBqQIHCK/2uYjiJ
	 Cbt9ipykZcmaIz48bVrajWmUp5/litQgLnmFawHF5f+yobkpX1PTb3kHB63ATZMehZ
	 Lmg8thIvLg26CbSs1uxKEBi3IbLF/p66N40Gu48/GOU7Kgm7KYO21U+nTc8EXRr7Wl
	 V7UNk1VSIm9gQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4805FCE0853; Tue, 19 Aug 2025 08:25:39 -0700 (PDT)
Date: Tue, 19 Aug 2025 08:25:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <4dae36f1-b737-4ea0-b3d5-6a7784967578@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpqo48FgDLglg-p@bombadil.infradead.org>
 <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
 <20250818232332.0701fea2@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818232332.0701fea2@foz.lan>

On Mon, Aug 18, 2025 at 11:23:32PM +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 11 Aug 2025 15:51:48 -0700
> "Paul E. McKenney" <paulmck@kernel.org> escreveu:
> 
> > On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:
> > > On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E. McKenney wrote:  
> > > > depending on how that AI was
> > > > trained, those using that AI's output might have some difficulty meeting
> > > > the requirements of the second portion of clause (a) of Developer's
> > > > Certificate of Origin (DCO) 1.1: "I have the right to submit it under
> > > > the open source license indicated in the file".  
> > > 
> > > If the argument is that cetain LLM generated code cannot be used for code under
> > > the DCO, then:
> > > 
> > > a) isn't this debatable? Do we want to itemize a safe list for AI models
> > >    which we think are safe to adopt for AI generated code?  
> > 
> > For my own work, I will continue to avoid use of AI-generated artifacts
> > for open-source software projects unless and until some of the more
> > consequential "debates" are resolved favorably.
> > 
> > > b) seems kind of too late  
> > 
> > Why?
> > 
> > > c) If something like the Generated-by tag is used, and we trust it, then
> > >    if we do want to side against merging AI generated code, that's perhaps our
> > >    only chance at blocking that type of code. Its however not bullet proof.  
> > 
> > Nothing is bullet proof.  ;-)
> 
> Let's face reality: before AI generation, more than one time I
> received completely identical patches from different developers
> with exactly the same content. Sometimes, even the descriptions
> were similar. I got one or twice the same description even.

But of course.  And in at least some jurisdictions, one exception to
copyright is when there is only one way to express a given concept.

> Granted, those are bug fixes for obvious fixes (usually one liners), but
> the point is: there are certain software patterns that are so common 
> that there are lots of developers around the globe whose are familiar
> with. This is not different from a AI: if one asks it to write a DPS code 
> in some language (C, C++, Python, you name it), I bet the code will be
> at least 90% similar to any other code you or anyone else would write.
> 
> The rationale is that we're all trained directly or indirectly
> (including AI) with the same textbook algorithms or from someone
> that used such textbooks.

That may be true, but we should expect copyright law to continue to be
vigorously enforced from time to time.  Yes, I believe that the Linux
kernel community is a great group of people, but there is neverthelss
no shortage of people who would be happy to take legal action against
us if they thought doing so might benefit them.

> I can't see AI making it any better or worse from what we already
> have.

My assumption is that any time I ask an AI a question, neither the
question nor the answer is in any way private to me.  In contrast, as
far as I know, my own thoughts are private to me.  Yes, yes, give or take
facial expression, body language, pheromones, and similar, but I do not
believe even the best experts are going to deduce my technical innovations
from such clues.  Naive of me, perhaps, but that is my firm belief.  ;-)

That difference is highly nontrivial, and could quite possibly make
things far worse for us.

							Thanx, Paul

