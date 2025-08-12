Return-Path: <ksummit+bounces-2129-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D16AFB22A98
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B631C22069
	for <lists@lfdr.de>; Tue, 12 Aug 2025 14:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425EA2F5498;
	Tue, 12 Aug 2025 14:18:44 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732E2F548D
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755008324; cv=none; b=uiaQjoQOIpSa9Z6WusUZCQIR3jFFkvi9R7tocH3iZn5MQq1VRPIc1x0gygsbDVYsWBdDY+sKLkn6/9lHf6VGZeaYELxefvNMuL5tsHA+lUy6NKyL5w+W8YZYd6r4v+DH+s5Jrqs3pjqn3KLj+0gu2aJst+oSHTHIdbeA/CxKvpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755008324; c=relaxed/simple;
	bh=6uv7jEbtdCPVYj1ZCLNqwKC5Dox9Z8fy6+deay5UFEE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yzs5wOyX7x8A7uZcvzugeGQFczsmCTbogUKLkOO3INAQiMrWt7DYc1XTrYg9mGutlPOhoYGrXJVhbjjh6IlwQ+YU6YD5wKKHN0d8+Z5jbAc5UdsCdQoCGuHqVU8Bk/8mtxDWKsymBJJPppodIejKFujcjDgzhPEQON9NGAb7MVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 18E0114012E;
	Tue, 12 Aug 2025 14:18:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 5F68C20019;
	Tue, 12 Aug 2025 14:18:38 +0000 (UTC)
Date: Tue, 12 Aug 2025 10:19:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Sasha Levin <sashal@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20250812101923.2797494f@gandalf.local.home>
In-Reply-To: <2e90677a-4a0b-40fb-9428-e80eacf034fd@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
	<56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
	<c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
	<aJJP2BM658FYJdJv@lappy>
	<1ced158f-b433-46ef-a70f-d035ec413a12@lucifer.local>
	<72ee0f61379054e327d502bbe77aae3d76966d17.camel@HansenPartnership.com>
	<a1bcdee4-344b-4717-bde0-fe80bea46d67@lucifer.local>
	<8b7daa48-0f79-4948-b0de-a09a7b456513@sirena.org.uk>
	<2e90677a-4a0b-40fb-9428-e80eacf034fd@lucifer.local>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: t6jberdcqzsknotpb7ytfam5a4xe7dko
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 5F68C20019
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+6D03dO5wfH8NnVpBHgNlYAV4WjyE3Gl8=
X-HE-Tag: 1755008318-653852
X-HE-Meta: U2FsdGVkX19xoxMPFHdNuBcjkmgAxKAiMnXxu8/oO9IJAbY9EM7yrrkTrMHI/EmMsWtIh5ed1kxN2Wvd915THfL5MOCSnLWH5dI9qqlgxj1RMCUPdgjBh/KaGpA14H2+JLpPZSAxJ9ANPya0MrMfQ7Bcc2BE9qmkyCsDec6vw6kAq4GKLEGCM8W+P4Khtnuwr6NIDv2YlckULDLTpVCxzdSH4+L/KvM6HSHjqJ1QexCilX74Gv1T81aySQN634Zq1komy01zw+9rLLx/rmTr6pzSPmegbyO+kDAQbqLXzFo6SwDONTlvZqCCCC3uYQIXc0aGa2LOdUnAlZur53CbjdMQW4NiA1moiqXzrxnVwe49/j7vDhpr3A==

On Thu, 7 Aug 2025 14:00:56 +0100
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Thu, Aug 07, 2025 at 01:25:23PM +0100, Mark Brown wrote:
> > On Wed, Aug 06, 2025 at 08:26:41PM +0100, Lorenzo Stoakes wrote:
> >  
> > > - Was the commit message of this patch generated in large part by an LLM
> > >   (excluding non-native speakers using an LLM to simply assist writing it
> > >   in english)?  
> >
> > Easiest way to say that is probably to say "written by" and "translated
> > by".  I think for all these things we should just talk about tooling
> > rather than specifically LLMs, as well as avoiding any rules lawyering
> > about how precisely a given tool is implemented it's probably useful to
> > know about tools whatever the technology.  
> 
> That's a great idea!!
> 
> And agreed on language/rules lawyering, I think we have to have something
> _simple_ and robust at least to begin with.
> 
> There are inevitably blurry lines everywhere with this stuff so I think we
> have to be pragmatic and as clear as we possibly can. We can always refine
> things later as we learn.

I honestly don't care who or what writes the change log. As long as the
reason for the change is clear and I can read it and then know what the
patch is doing, and more importantly why it is doing it. Then I can be the
judge.

If I don't understand the change log, I simply send the patch back and say,
"Please explain what your are doing and why your are doing it, better".

For the longest time, I have rewritten change logs myself from other people
if they don't explain it properly. Mostly from non-native speakers.
Depending on how much of a rewrite I do, I'll get a confirmation from the
submitter to make sure it's what they intended. If it's just fixing grammar
mistakes I don't even ask.

I use to say "Can you write something like this:" and explain it better,
and the next version of the patch would always have what I suggested
written verbatim, so I stopped doing that :-p

-- Steve


