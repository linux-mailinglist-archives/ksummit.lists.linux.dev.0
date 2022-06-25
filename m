Return-Path: <ksummit+bounces-711-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F35A555A98F
	for <lists@lfdr.de>; Sat, 25 Jun 2022 13:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 804322E09E6
	for <lists@lfdr.de>; Sat, 25 Jun 2022 11:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1E528E1;
	Sat, 25 Jun 2022 11:45:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E22F4A16
	for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 11:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA986C3411C;
	Sat, 25 Jun 2022 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656157529;
	bh=pcYH06GRG83d0k+kSSp4CW6xZ5yIjGQvGWqxMe7oUwo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UsD48D9a7aDw3wi6IZYCwjuMUP5ceeX1CSZT1zos2OTQTYIb+r0oRfwAy3t79RVg8
	 59lJaXM21RcENS3pug+dCJM/hd7jKWR4sVEPnh7osxEnPueFB7z4YQDfm2orRbm+ei
	 gbIMno866JwR3jH1h/GK2aDkccLAndbvQ+y03PXetDs2LuNUIJi6gdGpPmeQ+nHlR8
	 c5wzh6cQOfHKLWPYeSM0KZe48volU5h2ySV2YBmiKonK8u77OSvwFjLDO0jFHNcNTS
	 63fdiIPU6rWInxabJq2chLrbTmagnb0dEzTY1B2DSlsyNOwC8viLNi3mAivQ5UFuJi
	 UtFQ80JsqFXNw==
Date: Sat, 25 Jun 2022 12:45:22 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jens Axboe
 <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev, ksummit
 <ksummit-discuss@lists.linuxfoundation.org>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] Rust
Message-ID: <20220625124522.507a5b06@sal.lan>
In-Reply-To: <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
	<Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
	<Yq6+p+aRCjeZ7QsS@infradead.org>
	<Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
	<2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
	<d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
	<Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
	<cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 19 Jun 2022 10:27:08 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:

> On Sun, 2022-06-19 at 16:53 +0300, Laurent Pinchart wrote:
> > On Sun, Jun 19, 2022 at 07:19:38AM -0600, Jens Axboe wrote:  
> > > On 6/19/22 6:56 AM, James Bottomley wrote:  
> [...]
> > > > All that said, I expect once we start getting rust based patches,
> > > > it will quickly become apparent where the rust receptive
> > > > subsystems are and I would expect reviewers in those subsystems
> > > > will quickly become rust fluent.  This doesn't answer the pain vs
> > > > gain aspect, but I suspect we won't know that until we actually
> > > > try.  
> > > 
> > > FWIW, I agree with you here, James. And I have to say that the
> > > original sentiment expressed here by Laurent is weirdly elitist,
> > > and not something that seems positive if that's the case. I'd
> > > suggest re-calibrating that mindset...  
> > 
> > I'm not sure about the elitist part, but it's certainly not a
> > positive statement. I'm concerned about the pain that rust in the
> > kernel would inflict.  
> 
> I get that, and I think it's a serious concern.  I just also think we
> would waste more time second guessing this issue that we would consume
> if we just tried it.  It's not like allowing Rust into the kernel is
> some sort of Rubicon that once crossed we can never go back.  I think
> we won't know the pain vs gain until at least a year into the
> experiment of accepting Rust.  Even at that late stage, if everyone
> agrees it caused more problems than it solves, I bet it could all be
> quickly excised.
> 
> So the bottom line is I think while we have a community of volunteers
> willing to try it we let them on the understanding the results will be
> evaluated at some point.

Agreed.

> >  Whether it's worth the gain or not is not for me to decide,
> > but I'm certainly concerned that it could lead to a catastrophe if we
> > don't carefully think about the issues, acknowledge them, and find
> > ways to solve them. I don't think winging it is a real option here,
> > but I'd be more than happy to be shown that my concerns are not
> > founded :-)  
> 
> Have more faith in the community and open source process. We've screwed
> up many times (devfs anyone ...) learned from the mistake and fixed it.
> I'm happy to bet that accepting Rust will be no different from all the
> other screwups we allowed in and later fixed.  So I don't think there
> will be a catastrophe.  Either the rust experiment works or it will
> become fairly quickly apparent if it doesn't and it will get removed. 
> The worst case, I suppose, is that the benefit is marginal in which
> case there's no consensus on removal vs continuation and we simply
> continue through inertia. 

> I bet in that situation Rust penetration
> will be fairly minimal and confined to enthusiastic subsystems with the
> rest taking steps to isolate themselves from it.  

I suspect that Rust will be confined to enthusiastic subsystems for
quite a while, as porting it to more complex subsystems would require
lots of work on other subsystemd.

The thing is that using rust unsafe code doesn't make much sense, as
it won't bring any real advantage over C. So, subsystems C code will 
need to first be changed to provide the same sort of warranties that
rust will provide in safe mode. Such task should consider the 
subsystem's dependencies.

For instance, before being able to have rust (safe) code on driver 
subsystems, several other subsystems will need to be made compatible
with rust (also in safe mode):

- core parts: mm, vfs, devm_*, wait queues, threads, irq handling, driver
  core, ...;
- bus subsystems: PCI, USB, I2C, ...;
- other core driver-related subsystems like: power management, clocks,...
- finally, subsystem-specific core functions.

Which probably means that they would need to suffer some rewrite due to
rust safe mode restrictions, before finally receive Rust (safe) bindings.

Once done, such subsystem may start accepting new drivers for it either
in C or in Rust. At this point, maintainers and reviewers should be
fluent on both C and Rust.

-

Assuming that we get into a point were all the above happens for
subsystem XXX, at the Rust experiment validation point you mentioned
above, there will be some possible outcomes:

1) Rust experiment fails. On such case, the efforts to make the
subsystem C code ready to run safe Rust code will be welcomed,
as Linux should be safer. The work on providing Rust bindings will 
be wasted on such case. 

I can't measure how much would be spent on making C code safer and 
how much would be on writing Rust bindings though. If such efforts 
would be 80%-90% for making subsystems code safer, it should 
worth the efforts even if Rust code ends being removed.

2) Rust experiment succeeds. In long term it would mean that subsystems
should, at some point, stop accepting C code and start using only Rust
for new code, and several drivers in C would require conversion to Rust
or moved to staging in order to be deprecated.

3) Some maintainers would consider it a success while others would
consider it a failure. That's the worse case scenario. If we reach
that, some Kernel/Maintainers Summit hard discussions would likely 
be needed, in order to avoid subsystem's fragmentation with regards 
to accepting or not C and/or Rust code subsystem-wide.

Regards,
Mauro

