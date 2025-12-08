Return-Path: <ksummit+bounces-2664-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5601ACACD82
	for <lists@lfdr.de>; Mon, 08 Dec 2025 11:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F392300F72A
	for <lists@lfdr.de>; Mon,  8 Dec 2025 10:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8DA2D9EC9;
	Mon,  8 Dec 2025 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rt+IXL0O"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2941624D5
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765189327; cv=none; b=Hx6+vg9GrchDUripfpCTqdm4SVPQbowqp887C2TRW7aao3SO+7cqUuPyW1QF2r6ZVVUqCXyE7TXg3C2R9Dqxg6xCt0mXli2gh83X83x4Ed21MuxrhALg3bWAoD8gA6v5fsrzBzIQefaAhYL3RWwnGas/2LZJxXSIDeneNYTLouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765189327; c=relaxed/simple;
	bh=mD+ieQVLq8zBszj1O57Pg61BfrO7nxSDC+cKexLA0YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKdruo8pm9S3zX4bvJEbWGTI9vsDzwp982n8UELDcM1rUgDkfl4lWNNCxuWoSaku31L6DAi4CT3o/KPlNNfpw19Ka27NcjK1yDKmLBRvuPa5qzu076GUJw43jnWdoPUOd5LuyVifu5Mdl6mqZLFsuM46m3sVFCozSMgNUzMaktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rt+IXL0O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEE0C16AAE;
	Mon,  8 Dec 2025 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765189325;
	bh=mD+ieQVLq8zBszj1O57Pg61BfrO7nxSDC+cKexLA0YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rt+IXL0OjqtvwunCegTAgCxwcQ4ylgqBo3e5gRJtPE66uk7KG0Fea2YMxEi8QtlBl
	 HrhCCu4IBd12MZBaKE+QMhSXMIbX5CV0rtH+bdib/JuyLSKC2MKTHYGgcFXeXMS01r
	 De91z6f4DkJqgYS5b9Afi1L9hI8iyga7Sq145NPGBuRKYiK96PrzMCLiOAbh9tQ8IO
	 nDqYDhh2h+CcweR+8OuEWSRzcUnlODiBkQytvY+F1g1Bi+NK8n9R4TdJF3tvtnK6tZ
	 z6pGwXGSC0DgCF1awpoyTTNQO9Tszkldg2Nu3VKuW5JfCR4D7nCkTzBBo0OLFLdtzQ
	 8Wn9QLWtFMvig==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vSYNW-00000002F8A-46b0;
	Mon, 08 Dec 2025 11:22:02 +0100
Date: Mon, 8 Dec 2025 11:22:02 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <rtxwa23krfv4xqi2c3eb6f2zygppuft4fesg532squ656v7jba@iniftynodbt2>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <aTYmE53i3FJ_lJH2@laps>
 <4BDD9351-E58A-4951-9953-00F1E9F24FB4@zytor.com>
 <87zf7tg2dk.fsf@trenco.lwn.net>
 <20251207221532.4d8747f5@debian>
 <88091c9ac1d8f20bade177212445a60c752ba8b5.camel@HansenPartnership.com>
 <20251208094116.6757ddeb@foz.lan>
 <4597dfe45c9ff2991ed5221c618602ea42993940.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4597dfe45c9ff2991ed5221c618602ea42993940.camel@HansenPartnership.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Mon, Dec 08, 2025 at 06:16:52PM +0900, James Bottomley wrote:
> On Mon, 2025-12-08 at 09:41 +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 08 Dec 2025 12:42:32 +0900
> > James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:
> > 
> > > On Sun, 2025-12-07 at 22:15 -0500, Steven Rostedt wrote:
> > > > On Sun, 07 Dec 2025 18:59:19 -0700
> > > > Jonathan Corbet <corbet@lwn.net> wrote:
> > > >   
> > > > > > I contend there is a huge difference between *code* and
> > > > > > descriptions/documentation/...  
> > > >   
> > > > > 
> > > > > As you might imagine, I'm not fully on board with that.  Code
> > > > > is assumed plagiarized, but text is not?  Subtly wrong
> > > > > documentation is OK?
> > > > > 
> > > > > I think our documentation requires just as much care as our
> > > > > code does.  
> > > > 
> > > > I assumed what hpa was mentioning about documentation, may be
> > > > either translation of original text of the submitter, or AI
> > > > looking at the code that was created and created a change log. In
> > > > either case, the text was generated from the input of the author 
> > > 
> > > I think this is precisely the problem Jon was referring to: you're
> > > saying that if AI generates *text* based on input prompts it's not
> > > a copyright problem, but if AI generates *code* based on input
> > > prompts, it is.  As simply a neural net operational issue *both*
> > > input to output sets are generated in the same way by the AI
> > > process and would have the same legal probability of being
> > > copyright problems.  i.e. if the first likely isn't a copyright
> > > problem, the second likely isn't as well (and vice versa).
> > 
> > I'd say that there are different things placed in the same box. Those
> > two, for example sound OK on my eyes:
> > 
> > - translations - either for documentation of for the code.
> >   The original copyrights maintain on any translations. This is
> > already
> >   proofed in courts: if one translates Isaac Asimov's "Foundation" to
> >   Greek, his copyright remains at the translation. Ok, if the
> > translation
> >   is done by a human, he can claim additional copyrights for the
> >   translation, but a machine doesn't have legal rights to claim for
> >   copyrights. Plus, the translation is a derivative work of the
> > original
> >   text, so, I can't see how this could ever be a problem, if the
> >   copyrights of the original author is placed at the translation;
> 
> I can explain simply how I as a translator could cause a copyright
> problem with no AI involvement: let's say I translate Foundation from
> English to French but while doing so I embed a load of quotes from the
> novels of Annie Ernaux but in a way that it nicely matches the Azimov
> original.  Now I've created a work which may be derivative of
> Foundation and partly owned by me but which also has claims of
> copyright abuse from Annie Ernaux.

A usage like that would likely be fair use/fair dealing.

> The above is directly analogous to what would happen if the AI output
> were decided to be a derivative of its training for an AI translator.

As AI would pick most likely translations, the risk of picking quotes
would be less likely.

Worse case scenario on something digitally published: one can change
the translation to a different translated text/code if a valid copyright
claim would apply.

> 
> > - code filling - if a prompt requests to automate a repetitive task,
> >   like creating a skeleton code, adding includes, review coding style
> >   and other brute force "brainless" activities, the generated code
> > won't
> >   be different than what other similar tools of what the developer
> > would
> >   do - AI is simply a tool to speedup it, just like any other similar
> >   tools. No copyright issues.
> > 
> > Things could be in gray area if one uses AI to write a patch from the
> > scratch. Still, if the training data is big enough, the weights at
> > the neuron network will be calibrated to repeat the most common
> > patterns, so the code would probably be similar to what most
> > developers would do.
> >
> > 
> > On some experiments I did myself, that's what it happened: the
> > generated code wasn't much different than what a junior student with
> > C knowledge would write, with about the same mistakes. The only thing
> > is that, instead of taking weeks, the code materialized in seconds.
> > To be something that a maintainer would pick, a senior developer
> > would be required to cleanup the mess.
> 
> How good (or not) AI is at coding is different from the question of
> whether the output has its copyright contaminated by the training data.

True.

> > 
> > > > . Where as AI generated code likely comes from somebody else's
> > > > code. Perhaps AI was trained on somebody else's text, but the
> > > > output will likely not be a derivative of it as the input is
> > > > still original. 
> > > 
> > > That's an incorrect statement: if the output is a derivative of the
> > > training (which is a big if given the current state of the legal
> > > landscape) and the training set was copyrighted, then even a
> > > translated text using that training data will pick up the copyright
> > > violation regardless of input prompting.
> > 
> > If one trains it only with internal code from an specific original 
> > product that won't have any common patterns which anyone else would
> > do, then this could be the case.
> > 
> > However, this is usually not the case: models are trained with big
> > data from lots of different developers and projects. As Neural
> > networks training is based on settings up weights based on
> > inputs/outputs, if the training data is big enough, such weights will
> > tend to follow the most repetitive patterns from similar code/text. 
> > 
> > On other words, AI training will generate a model that tends to
> > repeat sequences with the most common patterns from its training
> > data. This is not different than what a programming student would do
> > without using AI when facing a programming issue: he would likely
> > search for it on a browser. The search engine algorithms from search
> > providers are already showing results with the more likely answers
> > for such question on the top.
> 
> Patterns are not expression in the copyright sense.  Indeed, code tends
> to be much more amenable to the independent invention defence than
> literature: If I give the same programming task to a set of engineers
> with the same CS training, most of them would come up with pretty
> identical programs even if they don't collaborate.

True. Also, such common patterns that are repeated everywhere are
very likely fair use, if they originally came from copyrighted material.

> However, as long as
> they didn't copy from each other the programs they come up with are
> separate works even if they're very similar in expression.

Those are indeed separate works. A code written by some developer,
either using as basis his CS training, an AI-generated code, a text
book code or a searched code from the Internet as an example can become
copyrighted by the developer who wrote it.

For me, AI, when used as an ancillary tool, is not any different than
what developers have been doing.

Now, using AI as replacement for humans is a hole different thing:
I don't think we are on that stage yet. I'm also not convinced that
this would happen anytime soon.

On some tests I did, even the most complex engines are not currently
capable of generating proper code: it usually requires lots of
interactions to refine prompts and new prompts to modify the produced
results to something more palatable. The output was almost always
a code skeleton that requires manual work.

On such workflow, the prompts can be considered as copyright material.
As such, the transformation into code also carries copyrights from
the developer. As the output requires manual changes to reach
production level, such changes are also copyrighted by the developer.

Again, this is not different than doing a research at specialized
literature and/or the Internet: one needs to do the right research,
classify the results and modify the code examples to generate the
real code.

> Just because code is more likely to be independently invented than
> literature doesn't make it more prone to copyright violations (although
> it does give more scope to the litigious to claim this).

True, but this is not different than not using AI at all.

> 
> Regards,
> 
> James
> 
> > The AI generated code won't be much different than that, except that,
> > instead of taking just the first search result, it would use
> > a mix of the top search results for the same prompt to produce its
> > result.
> > 
> > In any case (googling or using AI), the tool-produced code examples
> > aren't ready for submission. It can be just the beginning of some
> > code that will require usually lots of work to be something that
> > could be ready for submission - or even - it can be an example of
> > what one should not do. In the latter case, the developer would need
> > to google again or to change the prompt, until it gets something that
> > might be applicable to the real use case.
> > 
> > Thanks,
> > Mauro
> > 
> 

-- 
Thanks,
Mauro

