Return-Path: <ksummit+bounces-2188-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E4B30338
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237A71C8303B
	for <lists@lfdr.de>; Thu, 21 Aug 2025 19:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF38341AD4;
	Thu, 21 Aug 2025 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ht+qo7Hv"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A985C2FABE3
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755805954; cv=none; b=j8m993qD9NJRY67K5duRu6AnBgq7q/4oFgGy4xxA7I9wLR96NvIhSNpSE/Fw8Kgov05qPMRe8/YaH1+clFYQUM6RY5Ayj4RgZdY9DjT+ft+B9Pv8rgogmd1c7RMSOzaQoBiBwpIlUtNxkri73nW/bd0XRx5pXl8oEjcgixMpRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755805954; c=relaxed/simple;
	bh=6x1kbJyri6SDhlMOz6DdcGMsk1MK8DLYtZmg2og4J7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTLuLQItOp3Hh/5j+PmvZshlilhi6Yh83/rRqTO8koVq4LL2oFv5tcOkGCNlSK9dbuqPgTBtkvo7d23f0/l8XpuKy9/4HNw3jqmi5niBxJ4jJPlLYU5WkPEnScfDmLuiAVQvDGG8mfIIURQszherjJQbLDoBIhQSuHII7QFzUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ht+qo7Hv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DB5C4CEEB;
	Thu, 21 Aug 2025 19:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755805953;
	bh=6x1kbJyri6SDhlMOz6DdcGMsk1MK8DLYtZmg2og4J7Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ht+qo7Hvy1kg3CK2yIXW0QY9dTipVq2vNe/1KA/qBsxhGHKAiwFB8d0FIGyITNYUc
	 pB4QVVfJ0wOEDi4e4aa6XJV9HGMhNzLaL+w4BSBEyvWJTiB3mityynK6pFUItBCVgG
	 ie/F3ljl0OGAIjQI59ieSfiYVsJLrn/VFUENG8J87SGw3IUi5LJy3TlpdpXR+C4Bec
	 2S0sZkFIr1hqVthRK8IMBijerNDy4Te+Vbb23Ub5LD9q9U1zwnWgxxZMwmKAozp8EA
	 7rl355fR1mzcnmFmAV8uXmxNHjVPiQgQrC4NqKvwgAQQBc5GoU1kDCQFXvhZJ38Hz4
	 q6GcvoypQycog==
Date: Thu, 21 Aug 2025 21:52:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821215229.5f4ed387@foz.lan>
In-Reply-To: <20250821150757.26813600@gandalf.local.home>
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
	<20250821193041.398ed30b@foz.lan>
	<20250821135329.16dad71e@gandalf.local.home>
	<20250821203259.2097c63b@foz.lan>
	<20250821150757.26813600@gandalf.local.home>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 21 Aug 2025 15:07:57 -0400
Steven Rostedt <rostedt@goodmis.org> escreveu:

> On Thu, 21 Aug 2025 20:32:59 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Btw, even in the case of a bigger pattern you saw there and you
> > may be repeating, you won't be the only one doing it: an entire
> > generation that used K&C textbook are also repeating them. Plus
> > the ones that used newer books whose authors got inspired from
> > it.  
> 
> Since the authors actively encouraged people to use their examples, there's
> no incentive to go after anyone.

True.

> > In practice, even with the original book's copyright, I doubt
> > anyone could actually enforce copyrights if one picks one of the
> > book's code and use as-is (and more likely one would adjust
> > coding style, parameter pass logic, etc).  
> 
> I'm not so sure. But since most people who write coding books want people
> to use their work, there's been no precedence on someone going after
> someone for using code from a book (that I know of).
> 
> But there's a lot of assumptions in this thread, and I fear that those that
> take a too lenient approach to AI may get burned by it.

AI is new, so yeah, there's always a risk. But then again, there's a
risk already without it. I don't think the risk is too much different.
Perhaps it is even lower, as all major companies are investing in AI,
and they don't want to be sued. Plus, they're much more interested on
the direct revenue AI can produce for them. So, probably there aren't
much intent to try costly legal actions with low chances to monetize
by going  after people using AI.

Thanks,
Mauro

