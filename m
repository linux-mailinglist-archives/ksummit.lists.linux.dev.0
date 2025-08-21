Return-Path: <ksummit+bounces-2177-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46365B3011E
	for <lists@lfdr.de>; Thu, 21 Aug 2025 19:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9E45A8718
	for <lists@lfdr.de>; Thu, 21 Aug 2025 17:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34EB3218C3;
	Thu, 21 Aug 2025 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fetuIph2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4963D2E7F36
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755797447; cv=none; b=ki0Y82PecTENsnCR0707mQ/s/B1qH4TDKTR0WW5EkJUK3nT7/mc5xgmqDkUOPJr16McSNonb/2OOLo31J99qcazaSIgTcGxksSqHZolHgUVmadAz15j9a/WmNzO8YtP3hf10XrxiW3x1BA15Gl5rkO12+27FpflEqNvtIZo/WSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755797447; c=relaxed/simple;
	bh=+Dy7kQ/IZYHp0mrOKizs5onoKFHoyAof/7mU2CvK7QE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n5yl8+iCHx6/PoW0t5tcnAzc5dvQfUTp2c+jsD0hlI19ATQ/WXJ7tZW+HdeeD0lqa4QLXnNX/Hg3vPUuNhBjQX8LqX2z8TUdE6+3WPXgGsAD4iCxPtdnAbNI1TZBk+KyHsbkm7fSxrFd1Y9T0VqnUlATLhbDw6Vkl6EsVXzy9mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fetuIph2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72263C4CEEB;
	Thu, 21 Aug 2025 17:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755797446;
	bh=+Dy7kQ/IZYHp0mrOKizs5onoKFHoyAof/7mU2CvK7QE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fetuIph25qeeew0a3Fnkz+zodP2BuoTq3eXmbN3n/rXFZegVKuN8yFp25acgOcfvF
	 GAfpHQTDU58jvwp1P0mfSQDpSPE9hTfUyBcUFWnymK2kGaM1/DCmNDzcSnCmeCYpwb
	 +O/V727ZXFCzxmHrW1j7qnOfS5hoxJp7ZrZdF4awm0hr/1zwjhTcoOjxpCAXG/vHn8
	 5sBpwV3WJtfAqLIOwuPYZi+2KNOzX6PgrSiS5ufliMqrPsc5nAIDQGsGrNYSHTqb1t
	 yB5M8er41wHSLX4Uxd/FN8tg88vhbTgM3njDH0QoflnAbapIrUa4odDTCOYwNYc1Bp
	 i20T4/j9Ehb2Q==
Date: Thu, 21 Aug 2025 19:30:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821193041.398ed30b@foz.lan>
In-Reply-To: <20250821125037.5cf5be3d@gandalf.local.home>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
	<9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
	<20250818230729.106a8c48@foz.lan>
	<9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
	<4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
	<d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
	<20250821122329.03c77178@foz.lan>
	<20250821125037.5cf5be3d@gandalf.local.home>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 21 Aug 2025 12:50:37 -0400
Steven Rostedt <rostedt@goodmis.org> escreveu:

> On Thu, 21 Aug 2025 12:23:29 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > > Many of the AI players scrape the web, and might well pull in training
> > > data from web pages having a restrictive copyright.  The AI's output
> > > might then be influenced by that restricted training data.     
> > 
> > True, but this is not different than a developer seeking the web for
> > answers of his development problems, reading textbooks and/or reading 
> > articles.  
> 
> The difference I believe is that AI is still a computer program. It could,
> in theory, copy something exactly as is, where copyright does matter.
> 
> If you read something and was able to rewrite it verbatim, you would be
> subject to copyright infringement if what you read had limits on how you
> could reproduce it.

Maybe at the early days of LLM this could be true, but now that they're
massively trained by bots, the number of places it retrieves data for
its training is very large, and considering how artificial neurons
work, they will only store patterns with a high number of repetitions. 

Now, if one asks it to do a web search, then the result can be 
biased, just like if you google it at the web.

> > Also, if someone publicly document something an any sort of media,
> > it is expected that people will read, adquire knowledge from it and
> > eventually materialize the acquired knowledge into something. This
> > is fair use, and has some provision from Berne convention, although
> > it may depend on each Country's specific laws.  
> 
> You can learn from it, but it also comes down to how much you actually copy
> from it.
> 
> > 
> > On my view, if the trained data comes from lots of different
> > places, as AI is actually a stochastic process that write
> > code by predicting the next code words, if there's just one web 
> > site with an specific pattern, the chances of getting exactly
> > the same code are pretty low. It is a way more likely that humans
> > would pick exactly the same code as written on his favorite
> > textbook than an LLM feed with hundreds of thousands of web
> > sites.  
> 
> The issue I have with the above statement is, how would you know if the AI
> copied something verbatim or not? Are you going to ask it? "Hey, AI, was
> this code a direct copy of anything?" Would you trust its answer?
> 
> For a human to do the same, they would have to knowingly have done the copy.

Heh, if I ask you to write a C code to write something...

...
...
...
... 

I bet that one of the first things (if not the first) you
considered was: printf("Hello world!"). 

I also bet you can't remember the first time you saw it.

Ok, this is a very small code, but still there are some patterns
that we learn over time and we keep repeating on our code without
knowing from where they came from, nor remembering if there was
a copyright from where we picked it or not.

In my case, I probably saw my first "Hello world" either on a book
or on some magazine a lot of time ago that was copyrighted by its
authors, but I can't tell you for sure when I first saw it.

Do you remember the first time you saw that, and what copyrights
were there? :-)

Thanks,
Mauro

