Return-Path: <ksummit+bounces-2191-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F3DB307B7
	for <lists@lfdr.de>; Thu, 21 Aug 2025 23:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAA8C1D042D4
	for <lists@lfdr.de>; Thu, 21 Aug 2025 20:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545052D94AB;
	Thu, 21 Aug 2025 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2MxF4Pw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55F6222564
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 20:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755809198; cv=none; b=QkavynWjFDkkXAgeE9rJtwjraFwKVg5NZjivY74pNTxUp9qkd9z8OiHe0K+X6f7K96C15jYMb15xl7siJhlmKNvAAGzOgXIy2HmLGgL46GbuT3IeLcN1+N9D2BC6nlC7OFnKTMaUlyiyziSAO///4DMLakv0S/d13JhorCOhpcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755809198; c=relaxed/simple;
	bh=oc71pNVvXmNTX1NrzXY+f75pZ5wNwIAHatKpH7DtONw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMCSVtEam17mlFrC6XV4pi6YXFxP/azv9p5A2JGZ1uXmXPt7csvZUAuZLzCn7mCjjQh71oJ5VmbEbop9QBA7ALk9Kx3OtJvd7TXm2X0ChfaRcPwOwCIzcHVZsorT02WCIpxwD9YrjRwRT5G1js2Q5hozV8Bw909qtvm65HAHg80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2MxF4Pw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F19EC4CEF4;
	Thu, 21 Aug 2025 20:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755809197;
	bh=oc71pNVvXmNTX1NrzXY+f75pZ5wNwIAHatKpH7DtONw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=o2MxF4PwbxlcVM+ueXSzo/W8cBFKZaQsRfhL/yI/VnKNpb3WbkyB5LczrGcm5ZK/E
	 uhgLNMteRomOlvPd/E6uRFNvtZCggxHKYHSz9+8qt+CvSxriSiF6/L4oqiEz+ylzru
	 wZiTX6b1+BtUtytq8LGBc1e8Af31eveNRlRyZlPKuDAypZblxaw9RPehwwMgKYF4dQ
	 V6Z9CS2vFnVwfgAiXNsKuvu76bIjGWOKCleUx8MWAobQ1mhuZ+wdTZpM3bSsEYDF01
	 q9j3Gdt0+7SH48qTKMPzo7t1E70VTf/+pVTbeu7qLNx4GRoLZrRshLLAS1irgvyBzW
	 2pclkNaBo0LdQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B374DCE0854; Thu, 21 Aug 2025 13:46:36 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:46:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <0d0792f6-a032-4a48-bedd-05190f4feffa@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
 <20250818230729.106a8c48@foz.lan>
 <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
 <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
 <d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
 <20250821122329.03c77178@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821122329.03c77178@foz.lan>

On Thu, Aug 21, 2025 at 12:23:29PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 20 Aug 2025 14:44:00 -0700
> "Paul E. McKenney" <paulmck@kernel.org> escreveu:
> 
> > On Tue, Aug 19, 2025 at 06:16:10PM +0200, Mauro Carvalho Chehab wrote:
> > > On Tue, Aug 19, 2025 at 04:23:46PM +0100, James Bottomley wrote:  
> > > > On August 18, 2025 10:07:29 PM GMT+01:00, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:  
> > > > >Em Tue, 12 Aug 2025 07:42:21 -0700
> > > > >"Paul E. McKenney" <paulmck@kernel.org> escreveu:  
> > > > [...]  
> > > > > do agree that many of the lawsuits seem to be motivated by an  
> > > > >> overwhelmening desire to monetize the output of AI that was induced by
> > > > >> someone else's prompts, if that is what you are getting at.  It does seem
> > > > >> to me personally that after you have sliced and diced the training data,
> > > > >> fair use should apply, but last I checked, fair use was a USA-only thing.  
> > > > >
> > > > >Maybe, but other Countries have similar concepts. I remember I saw an
> > > > >interpretation of the Brazilian copyright law once from a famous layer
> > > > >at property rights matter, stating that reproducing small parts of a book, 
> > > > >for instance, could be ok, under certain circumstances (in a concept
> > > > >similar to US fair use).  
> > > > 
> > > > Yes, technically.  Article 10 of the Berne convention contains a weaker concept allowing quotations without encumbrance based on a three prong test that the quote isn't extensive,  doesn't rob the rights holder of substantial royalties and doesn't unreasonably prejudice the existing copyright rights.  
> > > 
> > > Exactly. The interpretation from such speech I mentioned is based on that.
> > > Now, exactly what is substantial is something that could be argued.
> > > 
> > > There are two scenarios to consider:
> > > 
> > > 1. AI using public domain or Open Source licensed code;
> > > 
> > > There are so many variations of the same code patterns that AI
> > > was trained, that it sounds unlikely that the produced output would
> > > contain a substantial amount of the original code.
> > > 
> > > 2. Public AI used to developt closed source 
> > > 
> > > If someone from VendorA trains a public AI to develop an IP protected driver
> > > for HardwareA with a very specialized unique code, and someone asks the
> > >  same AI to:
> > > 
> > > 	"write a driver for HardwareA"
> > > 
> > > and get about the same code, then this would be a possible legal issue. 
> > > 
> > > Yet, on such case, the developer from VendorA, by using a public AI,
> > > and allowed it to be trained with the code, opened the code to be used
> > > elsewhere, eventually violating NDA. For instance, if he used
> > > Chatgpt, this license term applies:
> > > 
> > > 	"3. License to OpenAI
> > > 
> > > 	 When you use the service, you grant OpenAI a license to use
> > > 	 your input for the purpose of providing and improving the 
> > > 	 service—this may include model training unless you’ve opted out.
> > > 
> > > 	 This license is non-exclusive, worldwide, royalty-free, 
> > > 	 sublicensable—but it's only used as outlined in the Terms of Use
> > > 	 and privacy policies."
> > > 
> > > So, if he didn't opt-out, it granted ChatGPT and its users a patent-free
> > > sublicensable code.
> > > 
> > > Ok, other LLM tools may have different terms, but if we end having
> > > to many people trying to monetize from it, the usage terms will be
> > > modified to prevent AI holders to face legal issues.
> > > 
> > > Still, while I'm not a lawyer, my understanding from the (2)
> > > is that if one uses it for closed source development and allowed
> > > implicitly or explicitly the inputs to be used for training, the one
> > > that will be be accounted for, in cases envolving IP leaking, is the
> > > person who submitted IP protected property to AI.  
> > 
> > Many of the AI players scrape the web, and might well pull in training
> > data from web pages having a restrictive copyright.  The AI's output
> > might then be influenced by that restricted training data. 
> 
> True, but this is not different than a developer seeking the web for
> answers of his development problems, reading textbooks and/or reading 
> articles.
> 
> Also, if someone publicly document something an any sort of media,
> it is expected that people will read, adquire knowledge from it and
> eventually materialize the acquired knowledge into something. This
> is fair use, and has some provision from Berne convention, although
> it may depend on each Country's specific laws.
> 
> On my view, if the trained data comes from lots of different
> places, as AI is actually a stochastic process that write
> code by predicting the next code words, if there's just one web 
> site with an specific pattern, the chances of getting exactly
> the same code are pretty low. It is a way more likely that humans
> would pick exactly the same code as written on his favorite
> textbook than an LLM feed with hundreds of thousands of web
> sites.

As I said in reply to a similar argument from James in this thread, I
do sympathize with this view and I do hope that it prevails.  However,
it is just as much wishful thinking for us as is the countering view that
goes something like "I want one euro for each time someone generates text
from an AI that might have been trained on my writings, and I deserve
that euro, and you all are going to pay me."

There are already lawsuits in flight that appear to be driven
by this philosophy, repugnant though that might be to all of us.
We simply do know know how the various courts will decide this issue.
And unfortunately, it would be completely foolish to assume that we have
a PR advantage over those seeking per-AI-output euros.

We should not risk the Linux kernel based on wishful thinking, and should
therefore exclude AI-generated code from it for the time being.

Or do you have an publicly available authoritative statement, perhaps
from the attorneys from the Linux Foundation, giving a competent legal
opinion that it is OK to accept AI-generated code into the Linux kernel?

> > Although we
> > might desperately want this not to be a problem for AI-based submissions
> > to the Linux kernel, what we want and what the various legal systems
> > actually give us are not guaranteed to have much relation to each other.
> 
> True, but that's not the point. AI is not that different than
> someone googling the net to seek for answers.

You and I can say that, but any given court of law might or might not
agree.

> The only difference is that, when AI is used, you won't know
> exactly from where the code was based.

And that is exactly one of the reasons why use of AI to generate Linux
kernel code is of greater risk than perusing references, whether on the
web or printed on dead trees.  One of the problems is that someone else
can likely work out *exactly* what that output code was based on.

> I agree that this could be problematic. But then, again, when a maintainer 
> picks a patch from someone else, the same applies: we don't have any
> guaranties that the code was not just copied-and-pasted from some place,
> except by the SoB.

Agreed, and I propose that we use SoB for the AI-generated case as well.

After all, the DCO explicitly states "I have the right to submit it
under the open source license indicated in the file".  In the case of
AI-generated code, just like for code from any other source, do you
know *for* *sure* that you have that right?  If not, you had better not
submit it.  Very simple.

> In any case (either AI, human or hybrid AI/human), if the code has issues,
> we may need to revert it.

This I agree with.

> On other words, AI doesn't radically changes it: at the end, all remains
> the same.

I agree with this, but only to the extent that the existing DCO says not
to submit code of unknown pedigree, whether from AI or from anything else.

> That's why I don't think we'll get any new information nor need to
> follow any procedure different than what we already do, if the developer
> had used AI, and to what extent.

I agree that our current procedures cover this case.  As a result, I am
shocked and dismayed that quite a few people seem to believe that it is
somehow OK to submit generic AI-generated code to the Linux kernel.

> Now, a completely different thing is if we start having "incompetent"
> developers ("incompetent" in the sense given by the Dilbert Principle) that
> have some AI bot patch-generator to write patches they can't do themselves.
> 
> I'll certainly reject such patches and place such individuals on my
> reject list.

I agree that we will always need to reserve the right to reject bad
patches, regardless of how they were created.

							Thanx, Paul

