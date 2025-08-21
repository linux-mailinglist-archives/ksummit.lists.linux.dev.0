Return-Path: <ksummit+bounces-2176-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FBB3007F
	for <lists@lfdr.de>; Thu, 21 Aug 2025 18:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50032165362
	for <lists@lfdr.de>; Thu, 21 Aug 2025 16:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C932E282D;
	Thu, 21 Aug 2025 16:50:38 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2332E1720
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755795038; cv=none; b=oL1PBLd4mR+ngr7rsbo6I7IObJNmGJajLZ6lmIMqfEZkvNAsH3ZYYKYYGCvA2Q6HJj40frqf3H7ue++Zrn1W8HfgjLvsZBayN1NUNUlLroxa9eq3wfBkPTqlGZQWCQU+LtFntZX8e/ZpHkRZKT/qkmi19rHl+pJedPxh8+oXWDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755795038; c=relaxed/simple;
	bh=jIObUoPUYArZQ+79F5dGctKTb4fQkO8+Y2iFCCw6OfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YglaHr973PwSlXnG+PhutNNu9kR7fi3ZE4fE677fKfH6LxjHRni58Ng7eQZuYBsC/xhBStXc4U2zarHkDiIhE09JNDsgDJmNyQ06+eLysF/SenmKi0ka5+Mvmd+G5U0XNiOcbrI6WZbpaCyZdIVBi/7uVl5BoOLQPHRNDa7/n78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id E52D91A04C9;
	Thu, 21 Aug 2025 16:50:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 3CC2320010;
	Thu, 21 Aug 2025 16:50:33 +0000 (UTC)
Date: Thu, 21 Aug 2025 12:50:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821125037.5cf5be3d@gandalf.local.home>
In-Reply-To: <20250821122329.03c77178@foz.lan>
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
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3CC2320010
X-Stat-Signature: cxbizsmek48n3pexrcwck1ok36nuz7ik
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18T0VVSziXv+MG0XytasnD32J+7JPeGAIA=
X-HE-Tag: 1755795033-762036
X-HE-Meta: U2FsdGVkX185pDBi6XIUFMNI0/e2X8TOmyAIdvrY0EJy0Qr5fgsW5MOZdPcGJe6SUXaDS0XowG+aAvW+h0imv8JSLQ/RcfMpT5pvovqI2evkyQuiHoP4kD86ATDQdzxs4I1Za6/XFNqc00VAXl4uuLcJUM0RjJ7h4mV410Cnw4SVv616dd31e4F1fnWLN9Xt48kY/LLHZYNeKmQmfjC2naTlrfdiXNyCBkslWiWtVHOQ72D08eVlczSM2wou1Jmrggt2r2NLiiWDE5HVSW38BLEZ1Y3iYyLzs4p6yHKFb3+s39oqGzYLXtR+tNDChBg8rMhJGV4aDnlLzwYAsTMh4xM+9zdZsA3N

On Thu, 21 Aug 2025 12:23:29 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> > Many of the AI players scrape the web, and might well pull in training
> > data from web pages having a restrictive copyright.  The AI's output
> > might then be influenced by that restricted training data.   
> 
> True, but this is not different than a developer seeking the web for
> answers of his development problems, reading textbooks and/or reading 
> articles.

The difference I believe is that AI is still a computer program. It could,
in theory, copy something exactly as is, where copyright does matter.

If you read something and was able to rewrite it verbatim, you would be
subject to copyright infringement if what you read had limits on how you
could reproduce it.

> 
> Also, if someone publicly document something an any sort of media,
> it is expected that people will read, adquire knowledge from it and
> eventually materialize the acquired knowledge into something. This
> is fair use, and has some provision from Berne convention, although
> it may depend on each Country's specific laws.

You can learn from it, but it also comes down to how much you actually copy
from it.

> 
> On my view, if the trained data comes from lots of different
> places, as AI is actually a stochastic process that write
> code by predicting the next code words, if there's just one web 
> site with an specific pattern, the chances of getting exactly
> the same code are pretty low. It is a way more likely that humans
> would pick exactly the same code as written on his favorite
> textbook than an LLM feed with hundreds of thousands of web
> sites.

The issue I have with the above statement is, how would you know if the AI
copied something verbatim or not? Are you going to ask it? "Hey, AI, was
this code a direct copy of anything?" Would you trust its answer?

For a human to do the same, they would have to knowingly have done the copy.

-- Steve

