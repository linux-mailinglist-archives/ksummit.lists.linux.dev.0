Return-Path: <ksummit+bounces-2194-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 735BDB30847
	for <lists@lfdr.de>; Thu, 21 Aug 2025 23:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E51125A4A40
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5872C0267;
	Thu, 21 Aug 2025 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDRYU/Qo"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A982877F1
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755811274; cv=none; b=OpqZ7gSQSZjJ0UyupStzxAS56SeGxN9DevsbKqieKBhQ23lKe6nPCHa/tVtfWHmxu0XTx+FzDkqrcMboC9CvPDd3ZcZLTwLN7oT9houeu4SuY3EYYwE8bLlhM5pFqfssvhDOG55oU3p6Xu06zNe2tDas0eIeILCFAjKw9bhJc3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755811274; c=relaxed/simple;
	bh=AnIkvBPe6sLWZF9VkDl1QjFrj71J5wOsuXQyRmKYCik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/HdprXWYAFXs/ddoc4t3NQ5TGrDbvcOVrH2fEYxkMo0RnE88KvgqhLxvFhXAA0rsYqWrcCQCSiPXjaxz/FUasc55MisFdQpAm2pi1wJVVO4idR2pZgnfXbYkq8rMUWMkPvRy7/+H9CP8+mfJ5e1njF8Y/CifbOPYS30vxxiViI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDRYU/Qo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05953C4CEEB;
	Thu, 21 Aug 2025 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755811274;
	bh=AnIkvBPe6sLWZF9VkDl1QjFrj71J5wOsuXQyRmKYCik=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=fDRYU/QoiNfzkdMOURc+tvzoVP3Zb6R+CLuLTHy3km0YpEuUlOEWFQ5SISMEuqd2m
	 MgoVLLsGEefI0oDoxplE92agQAEB8tUWrft18UIiQEN84Eg+GaKZ6ogrh0L4rYD67i
	 JJAYlgZFYu/C0nSRu6Xz70q4hTYTiaT6QVOMXbnCdleIsgjM7BJsKPhZo3qtj13Z85
	 lj8e12lzEtoolHEi0Z4kWUqt+yW/BAJc3cHwu+UXA5iuQeiyz0YG1b2I4hUJm4H28u
	 SJt5uq6MogVQXgOrOURWwKcn1e6fKfrCHoPm5HaqSSvZKtzocGyq7PtdEzC/tI4NZE
	 Ha1wuMSCyOGNA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9C234CE0854; Thu, 21 Aug 2025 14:21:13 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:21:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jiri Kosina <jkosina@suse.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <7c199d68-cf81-4507-b66d-d743bda34c81@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
 <20250818230729.106a8c48@foz.lan>
 <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
 <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
 <d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
 <20250821122329.03c77178@foz.lan>
 <20250821125037.5cf5be3d@gandalf.local.home>
 <20250821193041.398ed30b@foz.lan>
 <DS7PR11MB60772F52AF3A152B5AB04A1CFC32A@DS7PR11MB6077.namprd11.prod.outlook.com>
 <20250821200159.1bcdf0c9@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821200159.1bcdf0c9@foz.lan>

On Thu, Aug 21, 2025 at 08:01:59PM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 21 Aug 2025 17:36:54 +0000
> "Luck, Tony" <tony.luck@intel.com> escreveu:
> 
> > > Do you remember the first time you saw that, and what copyrights
> > > were there? :-)  
> > 
> > Kernighan and Ritche "The C programming language" - First edition.
> 
> I saw it there too, but I probably saw it before that, on an "80 Micro"
> Magazine edition which I don't recall anymore.
> 
> Btw, Wikipedia says it came from a BCPL code (*). So, K&R were not the
> original authors.
> 
> (*) https://en.wikipedia.org/wiki/%22Hello,_World!%22_program
> 
> Anyway, the point is: i we weren't trained with such pattern, 
> a printf() with "Hey" or "Hi" would be a more likely answer.

But having engaged in some risky behavior in the past does not obligate
us to engate in risky behavior in the future.

In addition, in happy contrast to AI-generated output, I am not aware of
any in-flight lawsuits involving "Hello, World!".  So I don't find your
example at all applicable to the current situation with AI-generated
output.

> That's said, in the early programming days, I used a lot more
> this pattern (**):
> 
> 	The quick brown fox jumps over the lazy dog
> 
> (**) https://en.wikipedia.org/wiki/The_quick_brown_fox_jumps_over_the_lazy_dog
> 
> with has all 23 English characters. I have absolutely no glue when
> I first saw it, but it was before I got "C Programming Language" 
> book in hands, as I used it for a code I developed in Assembler
> before learning C.
> 
> Yet, as I saw a lot more the "Hello world", I haven't using the
> brown fox pattern for years.

"Sphynx of black quartz: Judge my vow!"

> Anyway, the point is: AI repeat patterns, but it will very likely
> repeat the ones that are used on tons of different places, where
> it is really hard to have any copyrights applied (as they become
> common sense). Humans do the same.

That might well be.  But AI output has been also known to include obscure
text.  And average behavior is not always helpful in legal matters.
For example, I would strongly advise against attempting to get out of a
speeding ticket by arguing that your average speed over the past month
was below the posted speed limit.  I suspect that you would find that
the court would instead look at your instantaneous speed at the time
in question.

							Thanx, Paul

