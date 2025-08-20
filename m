Return-Path: <ksummit+bounces-2168-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D09A2B2E7A9
	for <lists@lfdr.de>; Wed, 20 Aug 2025 23:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9686F189BF80
	for <lists@lfdr.de>; Wed, 20 Aug 2025 21:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF573314BF;
	Wed, 20 Aug 2025 21:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiV1VlEM"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1E326E71E
	for <ksummit@lists.linux.dev>; Wed, 20 Aug 2025 21:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755726241; cv=none; b=I7XG3wnXq+lN2Bw6bkiYvekMgCL9jmSRkQKK2mSClBmGx34MwrMcbOowEYpGJVKsrG+zwZsYgAwaTL7R+9Oxu7XR4JmZ1k/Xw3tGE1HsWev9GCV0LnPZFO8oJ+sEAooDX1WiCn4D0HxjSLruSOUQtqW9VBJ4cueRuyCUaSekwiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755726241; c=relaxed/simple;
	bh=LPvMBz8kqpwINwJJ2RjRUfTQ0URq6VFjExpXKlKoIo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOZatnp32B29W6wcBstMJ4syq8UltojwqNfTbJ86FTwg5BxUI8fn/bRSk7t0CirUdMoIYp4yoSyDsgz0p8y2vftRHnB80NHk7bd1nbvknKnOSzK4RJE20eaWJPMCqYP5WgKfknHz8QGQuDj3dXtWROVWI0w1ND7nFIfmU/2/o88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiV1VlEM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F193AC4CEE7;
	Wed, 20 Aug 2025 21:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755726241;
	bh=LPvMBz8kqpwINwJJ2RjRUfTQ0URq6VFjExpXKlKoIo8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=EiV1VlEMlQkURPny3SOg/eBeCF2IF42FgpfvQeEuhyJ6YXpH+p+YNt1p5Xd9U0IyF
	 Dt1IkkOYrQFWR6seXiRJIPyteNef3BZx1G95CIrPAKil3aPvA0A+Xo/r/SoY3T30uq
	 h9P7wsWi7y39EYRsOozFQT2v3zhKfa0Ko3+e8cILLaHqPUTlfxcVkGxZHdxxEfLFQx
	 lch+Z8/X3tVgdpLrpqDe4NBbfn3zYt09SZB8vLKkeXy0J2Lx2xbVP6yIqkbdBI7wFR
	 ZPqYegEvTFqlFRkxHmDCZq3GD4VXHonGOWLW+4Hz2AA2fEldbdsYQR5Z57rqBsYKOV
	 lJpxSpYqOdVXw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9C7A6CE09F9; Wed, 20 Aug 2025 14:44:00 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:44:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
 <20250818230729.106a8c48@foz.lan>
 <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
 <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>

On Tue, Aug 19, 2025 at 06:16:10PM +0200, Mauro Carvalho Chehab wrote:
> On Tue, Aug 19, 2025 at 04:23:46PM +0100, James Bottomley wrote:
> > On August 18, 2025 10:07:29 PM GMT+01:00, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >Em Tue, 12 Aug 2025 07:42:21 -0700
> > >"Paul E. McKenney" <paulmck@kernel.org> escreveu:
> > [...]
> > > do agree that many of the lawsuits seem to be motivated by an
> > >> overwhelmening desire to monetize the output of AI that was induced by
> > >> someone else's prompts, if that is what you are getting at.  It does seem
> > >> to me personally that after you have sliced and diced the training data,
> > >> fair use should apply, but last I checked, fair use was a USA-only thing.
> > >
> > >Maybe, but other Countries have similar concepts. I remember I saw an
> > >interpretation of the Brazilian copyright law once from a famous layer
> > >at property rights matter, stating that reproducing small parts of a book, 
> > >for instance, could be ok, under certain circumstances (in a concept
> > >similar to US fair use).
> > 
> > Yes, technically.  Article 10 of the Berne convention contains a weaker concept allowing quotations without encumbrance based on a three prong test that the quote isn't extensive,  doesn't rob the rights holder of substantial royalties and doesn't unreasonably prejudice the existing copyright rights.
> 
> Exactly. The interpretation from such speech I mentioned is based on that.
> Now, exactly what is substantial is something that could be argued.
> 
> There are two scenarios to consider:
> 
> 1. AI using public domain or Open Source licensed code;
> 
> There are so many variations of the same code patterns that AI
> was trained, that it sounds unlikely that the produced output would
> contain a substantial amount of the original code.
> 
> 2. Public AI used to developt closed source 
> 
> If someone from VendorA trains a public AI to develop an IP protected driver
> for HardwareA with a very specialized unique code, and someone asks the
>  same AI to:
> 
> 	"write a driver for HardwareA"
> 
> and get about the same code, then this would be a possible legal issue. 
> 
> Yet, on such case, the developer from VendorA, by using a public AI,
> and allowed it to be trained with the code, opened the code to be used
> elsewhere, eventually violating NDA. For instance, if he used
> Chatgpt, this license term applies:
> 
> 	"3. License to OpenAI
> 
> 	 When you use the service, you grant OpenAI a license to use
> 	 your input for the purpose of providing and improving the 
> 	 service—this may include model training unless you’ve opted out.
> 
> 	 This license is non-exclusive, worldwide, royalty-free, 
> 	 sublicensable—but it's only used as outlined in the Terms of Use
> 	 and privacy policies."
> 
> So, if he didn't opt-out, it granted ChatGPT and its users a patent-free
> sublicensable code.
> 
> Ok, other LLM tools may have different terms, but if we end having
> to many people trying to monetize from it, the usage terms will be
> modified to prevent AI holders to face legal issues.
> 
> Still, while I'm not a lawyer, my understanding from the (2)
> is that if one uses it for closed source development and allowed
> implicitly or explicitly the inputs to be used for training, the one
> that will be be accounted for, in cases envolving IP leaking, is the
> person who submitted IP protected property to AI.

Many of the AI players scrape the web, and might well pull in training
data from web pages having a restrictive copyright.  The AI's output
might then be influenced by that restricted training data.  Although we
might desperately want this not to be a problem for AI-based submissions
to the Linux kernel, what we want and what the various legal systems
actually give us are not guaranteed to have much relation to each other.

							Thanx, Paul

