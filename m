Return-Path: <ksummit+bounces-283-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id F076F3BE71C
	for <lists@lfdr.de>; Wed,  7 Jul 2021 13:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id AA4FF3E1011
	for <lists@lfdr.de>; Wed,  7 Jul 2021 11:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637AC2FAD;
	Wed,  7 Jul 2021 11:27:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B97772
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 11:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 08E7D1280A28;
	Wed,  7 Jul 2021 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625657257;
	bh=8LZAxj+ejQcE3BY2h9PkufRloC7mWyRc4jjgZJaJkhE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=T2VGJUlEDNq90Lp0pUAt7UtkGM+XlpNE7EY+CJTQaZGBRxUjQZBo3fFG1rhRdQIVt
	 /rYHO3EgsqcBB6zeOB8L2dIhKZ6hqToRsfTFmQPOyhK9TCSzyGXj0DuZKXH03YgIUa
	 IniiA5iitDOAjFSwIfYbWIKXteR5HYBE+Uv9Kasg=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIVCO4r7QLVE; Wed,  7 Jul 2021 04:27:36 -0700 (PDT)
Received: from [192.168.0.73] (cpc1-seac25-2-0-cust181.7-2.cable.virginm.net [82.8.18.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 364B71280A12;
	Wed,  7 Jul 2021 04:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625657256;
	bh=8LZAxj+ejQcE3BY2h9PkufRloC7mWyRc4jjgZJaJkhE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=tK5RKVooX6QjDs7grOYSnPXgNN+gpeIOBjpIKQyvtfUQ/9DAyytpiikRato0bxZ8K
	 W5Vh0rJTyp2+SPmUTWOD0C4p82aaYM/24n6idC5puZLBD2WZvFLCO3ryHg9D+O8BuR
	 AznisN7vplZTddd4CYWjOLxk0uJ8JlpepZbIe/tg=
Message-ID: <a0fab593b51681c2f3f1ec4aec4239e1fbd0a0a6.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Rust for Linux
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Julia Lawall <julia.lawall@inria.fr>, Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Roland Dreier
 <roland@kernel.org>,  Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 ksummit@lists.linux.dev
Date: Wed, 07 Jul 2021 12:27:32 +0100
In-Reply-To: <alpine.DEB.2.22.394.2107071251500.10037@hadrien>
References: 
	<CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
	 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
	 <20210707105000.GA4394@sirena.org.uk>
	 <alpine.DEB.2.22.394.2107071251500.10037@hadrien>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-07-07 at 12:56 +0200, Julia Lawall wrote:
> 
> On Wed, 7 Jul 2021, Mark Brown wrote:
> 
> > On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier <roland@kernel.org>
> > > wrote:
> > > > "devres" / devm_xxx was an attempt to deal with this in C, but
> > > > it only solves some cases of this and has not received a lot of
> > > > adoption (we can argue about the reasons).
> > >  
> > > Really? From my point of view that is adopted all over the map.
> > > I add new users all the time and use it as much as I can when
> > > writing new drivers.
> > 
> > Yes, it's *super* widely used in most of the kernel.  Perhaps
> > there's some subsystems that reject it for some reason.
> > 
> > > I think it's a formidable success, people just need to learn to
> > > do it more.
> > 
> > There *are* issues with people adopting it too enthusiastically -
> > as well as the memory lifetime issues that Laurent mentioned it's
> > easy for it to cause problems with interrupt handlers that are left
> > live longer than they should be and try to use things that were
> > already deallocated.
> 
> I was also wondering what would be done with Rust in the case of this
> issue.

Pretty much nothing.  Rust has a tracking system for exclusive memory
allocations, which is where it gets its memory safety guarantees. 
However, once you move the reference counting the guarantees become
much weaker.  The best it can do for us is the same as the current
kasan: detect use after free at runtime but not at compile time.

To have compile time tracking of reference counts, we'd have to encode
the lifetime rules semantically somehow and have a labelling mechanism
to encode the expectations in the consumer routines ... even if you put
a PhD student on it, I bet what we'd get back would be too complex to
be usable.

James



