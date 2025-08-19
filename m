Return-Path: <ksummit+bounces-2167-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD70B2C9A2
	for <lists@lfdr.de>; Tue, 19 Aug 2025 18:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 383727A8D10
	for <lists@lfdr.de>; Tue, 19 Aug 2025 16:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF673260566;
	Tue, 19 Aug 2025 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5qCpqYt"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F6725C810
	for <ksummit@lists.linux.dev>; Tue, 19 Aug 2025 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755620843; cv=none; b=fsCr0CgoFWdflyrIpyJOyb0x2uyTAVV6iQdmaOV4MeFf39fFZx4wPzOcemvDeOPbh9VThGYVtUwTYAm3+sy0OvQsuSM6HJfrSiX+R1vTXeuiEqogtwEpiO1P70ZfEa2cVmFxVuc/thzMj9ZFdaabxD4MEBRwIuKV38wclyIEbIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755620843; c=relaxed/simple;
	bh=Ts8bMei7rCisim36is3dNoZPXbG6XdAtuz4D8DAt8zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc9pqj9G2UNltigbQouphyn66sGaQGi89EyW+IAya2SMDV5taV/jXS8A4JV/bJMwS+lK/MIj5Ad2TWVbDFcQVdSr7LbFv35EB3iOSRbnTNLgCzdzYgerTz2CMwcMkmhn2L+1wXlixTIU0ThIdSWa94R4F+slcK6q8DcySTjDVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5qCpqYt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D5FC4CEF4;
	Tue, 19 Aug 2025 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755620842;
	bh=Ts8bMei7rCisim36is3dNoZPXbG6XdAtuz4D8DAt8zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5qCpqYtIhBHdOe7SQPL/qmSEvXku+9E9Y20u6nYcwfOZzXNRTaF8x+DnAMk5NJ0H
	 osxmCD9cDU1W8CsDmPetBzQ1JB3C1W88ko2DL4YknJmwD1ON9b3hLX/MhR16dkCuco
	 bU2TB3y3NKV3U1g+wMWmrPUj8rCw+sDetyRPOYZhvi1IqxcCKVnDA6KaDEV/+zHBFJ
	 5APvOn4uvtrfuRQjY9Cmxq8JwfDqwozLzbC/+ZbAFOZl7mzNBk6yRhv3V0LresFYB0
	 2qg2BhaF24PVx+S+xbm9MJrMlWq38rH+Xg39b7bw/DW6UYvSIaGxjdQUeTQp3E/jaT
	 l9dxujD61JcLw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uoPBA-00000007Ms1-0qwA;
	Tue, 19 Aug 2025 18:27:20 +0200
Date: Tue, 19 Aug 2025 18:27:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Paul E. McKenney" <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Luis Chamberlain <mchehab+huawei@kernel.org>, 
	Krzysztof Kozlowski <mchehab+huawei@kernel.org>, 
	Sasha Levin <mchehab+huawei@kernel.org>, 
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <wznbwwz2lywki34l5bdl327bpvdzvsmiwzjhdfe5ys7e7puwfy@652l53zffvnl>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpqo48FgDLglg-p@bombadil.infradead.org>
 <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
 <20250818232332.0701fea2@foz.lan>
 <4dae36f1-b737-4ea0-b3d5-6a7784967578@paulmck-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dae36f1-b737-4ea0-b3d5-6a7784967578@paulmck-laptop>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Tue, Aug 19, 2025 at 08:25:39AM -0700, Paul E. McKenney wrote:
> On Mon, Aug 18, 2025 at 11:23:32PM +0200, Mauro Carvalho Chehab wrote:
> > Em Mon, 11 Aug 2025 15:51:48 -0700
> > "Paul E. McKenney" <paulmck@kernel.org> escreveu:
> > 
> > > On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:
> > > > On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E. McKenney wrote:  
> > > > > depending on how that AI was
> > > > > trained, those using that AI's output might have some difficulty meeting
> > > > > the requirements of the second portion of clause (a) of Developer's
> > > > > Certificate of Origin (DCO) 1.1: "I have the right to submit it under
> > > > > the open source license indicated in the file".  
> > > > 
> > > > If the argument is that cetain LLM generated code cannot be used for code under
> > > > the DCO, then:
> > > > 
> > > > a) isn't this debatable? Do we want to itemize a safe list for AI models
> > > >    which we think are safe to adopt for AI generated code?  
> > > 
> > > For my own work, I will continue to avoid use of AI-generated artifacts
> > > for open-source software projects unless and until some of the more
> > > consequential "debates" are resolved favorably.
> > > 
> > > > b) seems kind of too late  
> > > 
> > > Why?
> > > 
> > > > c) If something like the Generated-by tag is used, and we trust it, then
> > > >    if we do want to side against merging AI generated code, that's perhaps our
> > > >    only chance at blocking that type of code. Its however not bullet proof.  
> > > 
> > > Nothing is bullet proof.  ;-)
> > 
> > Let's face reality: before AI generation, more than one time I
> > received completely identical patches from different developers
> > with exactly the same content. Sometimes, even the descriptions
> > were similar. I got one or twice the same description even.
> 
> But of course.  And in at least some jurisdictions, one exception to
> copyright is when there is only one way to express a given concept.
> 
> > Granted, those are bug fixes for obvious fixes (usually one liners), but
> > the point is: there are certain software patterns that are so common 
> > that there are lots of developers around the globe whose are familiar
> > with. This is not different from a AI: if one asks it to write a DPS code 
> > in some language (C, C++, Python, you name it), I bet the code will be
> > at least 90% similar to any other code you or anyone else would write.
> > 
> > The rationale is that we're all trained directly or indirectly
> > (including AI) with the same textbook algorithms or from someone
> > that used such textbooks.
> 
> That may be true, but we should expect copyright law to continue to be
> vigorously enforced from time to time.  Yes, I believe that the Linux
> kernel community is a great group of people, but there is neverthelss
> no shortage of people who would be happy to take legal action against
> us if they thought doing so might benefit them.
> 
> > I can't see AI making it any better or worse from what we already
> > have.
> 
> My assumption is that any time I ask an AI a question, neither the
> question nor the answer is in any way private to me.

If you use a public service: no. If you run AI on ollama, for instance,
you're running AI locally on your machine, in priciple without access
to the Internet.

> In contrast, as
> far as I know, my own thoughts are private to me. 

Yes, up to the point you materialize them into something like a patch
and let others see your work. If you do it on a public ML, it is now
open to the public to know your ideas.

If one uses AI, his input data can be used to train the next version
of the model, after some time. So, it may still be closed to the
main audience for a couple of days/weeks/months (all depends on the
training policies - and on the AI vendor release windows).

So, if you don't want ever that other see your code, don't use AI,
maybe except via a local service like ollama. But, if you're using
AI to help with open source development, and you won't take too
much time to publish your work or it doesn't contain any special
recipe, it is probably ok to use a public AI service.

In the middle there are also paywalled AIs where the vendor
gives some assurances about using (or not) your data for the
model training.

> Yes, yes, give or take
> facial expression, body language, pheromones, and similar, but I do not
> believe even the best experts are going to deduce my technical innovations
> from such clues.  Naive of me, perhaps, but that is my firm belief.  ;-)
> 
> That difference is highly nontrivial, and could quite possibly make
> things far worse for us.

-- 
Thanks,
Mauro

