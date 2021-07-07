Return-Path: <ksummit+bounces-286-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D13BE81B
	for <lists@lfdr.de>; Wed,  7 Jul 2021 14:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 928541C0E5E
	for <lists@lfdr.de>; Wed,  7 Jul 2021 12:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB222F80;
	Wed,  7 Jul 2021 12:38:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1570
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 12:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 9A9531281003;
	Wed,  7 Jul 2021 05:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625661528;
	bh=4MOWOisaawV94v0bXSAwQ92TBsVhud0Snsx7igWFQNE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=TfCiCh3nzUVgwNgOJuHx2iu1XbHfrpyE5ypg6u3aHxK/ykS8l6jgOJrNOqqXUdt1R
	 H+BDYQ5XJEm/PHc5Igot9JJb/B0tXMxDzODsNr9MiLix1Ru8SiMx0mJAfvoxjPTd93
	 M+F298x2Y+7/NG0LJOj4c4bEHsnbO0zRuwIeYY88=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fU5JJv5nPBAS; Wed,  7 Jul 2021 05:38:48 -0700 (PDT)
Received: from [192.168.0.73] (cpc1-seac25-2-0-cust181.7-2.cable.virginm.net [82.8.18.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 812A21280FF8;
	Wed,  7 Jul 2021 05:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625661528;
	bh=4MOWOisaawV94v0bXSAwQ92TBsVhud0Snsx7igWFQNE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=TfCiCh3nzUVgwNgOJuHx2iu1XbHfrpyE5ypg6u3aHxK/ykS8l6jgOJrNOqqXUdt1R
	 H+BDYQ5XJEm/PHc5Igot9JJb/B0tXMxDzODsNr9MiLix1Ru8SiMx0mJAfvoxjPTd93
	 M+F298x2Y+7/NG0LJOj4c4bEHsnbO0zRuwIeYY88=
Message-ID: <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Rust for Linux
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Greg KH <greg@kroah.com>
Cc: Mark Brown <broonie@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  Roland Dreier <roland@kernel.org>, Miguel
 Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Date: Wed, 07 Jul 2021 13:38:44 +0100
In-Reply-To: <YOWcCG9Pm/S+EXFw@kroah.com>
References: 
	<CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
	 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
	 <20210707105000.GA4394@sirena.org.uk>
	 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
	 <YOWcCG9Pm/S+EXFw@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-07-07 at 14:20 +0200, Greg KH wrote:
> On Wed, Jul 07, 2021 at 12:34:31PM +0100, James Bottomley wrote:
> > On Wed, 2021-07-07 at 11:50 +0100, Mark Brown wrote:
> > > On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > > > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier <
> > > > roland@kernel.org>
> > > > wrote:
> > > > > "devres" / devm_xxx was an attempt to deal with this in C,
> > > > > but it only solves some cases of this and has not received a
> > > > > lot of adoption (we can argue about the reasons).
> > > >  
> > > > Really? From my point of view that is adopted all over the map.
> > > > I add new users all the time and use it as much as I can when
> > > > writing new drivers.
> > > 
> > > Yes, it's *super* widely used in most of the kernel.  Perhaps
> > > there's some subsystems that reject it for some reason.
> > > 
> > > > I think it's a formidable success, people just need to learn to
> > > > do it more.
> > > 
> > > There *are* issues with people adopting it too enthusiastically -
> > > as well as the memory lifetime issues that Laurent mentioned it's
> > > easy for it to cause problems with interrupt handlers that are
> > > left live longer than they should be and try to use things that
> > > were already deallocated.
> > 
> > Fixing this should not be beyond the wit of humankind, though.  If
> > we delayed deallocation to module release, that would fix the
> > interrupt issue, wouldn't it?  Perhaps all devres memory for
> > devices should live until then anyway and thus be automatically
> > deallocated instead of needing an explicit free ... the problem
> > with that being compiled in devices currently optimize away the
> > module refcounting, but that should be fixable.
> 
> module code lifespans are different than device structure lifespans,
> it's when people get them confused, as here, that we have problems.

I'm not claiming they are.  What I am claiming is that module lifetime
must always encompass the device lifetimes.  Therefore, you can never
be incorrect by using a module lifetime for anything attached to a
device, just inefficient for using memory longer than potentially
needed.  However, in a lot of use cases, the device is created on
module init and destroyed on module exit, so the inefficiency is barely
noticeable.  The question I'm asking is shouldn't we optimize for this?
so let people allocate devm memory safe in the knowledge it will be
freed on module release?  It will certainly fix a lot of the use after
free reports and we can still keep devm_release around for cases where
devices really do appear and disappear multiple times over the life of
the module.

James



