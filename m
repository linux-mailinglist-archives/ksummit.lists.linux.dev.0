Return-Path: <ksummit+bounces-715-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89F55AB8D
	for <lists@lfdr.de>; Sat, 25 Jun 2022 18:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 252DE2E0A71
	for <lists@lfdr.de>; Sat, 25 Jun 2022 16:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467612909;
	Sat, 25 Jun 2022 16:18:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D84B7A
	for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 16:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF910C3411C;
	Sat, 25 Jun 2022 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656173891;
	bh=B50mWZHvsp8g65dXfO/IaPZ3hnvtmzJNtt5gYTaZKAA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=npm6nkqLeLU2B83Ygdr3BlNscfygXaHSt1hw1KCYhd6gIjpMvCzJQPj2QbH7+1fBO
	 p8nptu6ERkaHzf77YT2M0UhaVuo43s4U0dUPkpox2/ovAA6zOUrhqu1P4AJHUkFf+v
	 SRhId6iVsH2SWgNysCDq4m1zCkSFsg+osTy0HZKEdLA7vTV/Y0OMUrWEkTldCFRd6d
	 6IbRGL2+fWv3VwxOOpB4ULmtDuD7xxEWnQD+b9rsKIgLmUH5VFg68W6qT2GbPYZMeF
	 kEu3xXktC/vstukc4Mi9V9Fx9laGKSdAZqITQUs2RWAaNCI2XXBKhL1u5XhV0/olZb
	 4XwkJ1mZnJXqQ==
Date: Sat, 25 Jun 2022 17:18:04 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jens Axboe 
 <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>, Miguel Ojeda 
 <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev, ksummit 
 <ksummit-discuss@lists.linuxfoundation.org>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] Rust
Message-ID: <20220625171804.63acaaa0@sal.lan>
In-Reply-To: <79e0113a7eef81f2490e5531919fc4658a71c81a.camel@HansenPartnership.com>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
	<Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
	<Yq6+p+aRCjeZ7QsS@infradead.org>
	<Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
	<2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
	<d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
	<Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
	<cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
	<20220625124522.507a5b06@sal.lan>
	<79e0113a7eef81f2490e5531919fc4658a71c81a.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 25 Jun 2022 10:15:06 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:

> On Sat, 2022-06-25 at 12:45 +0100, Mauro Carvalho Chehab wrote:
> [...]
> > Assuming that we get into a point were all the above happens for
> > subsystem XXX, at the Rust experiment validation point you mentioned
> > above, there will be some possible outcomes:
> > 
> > 1) Rust experiment fails. On such case, the efforts to make the
> > subsystem C code ready to run safe Rust code will be welcomed,
> > as Linux should be safer. The work on providing Rust bindings will 
> > be wasted on such case.   
> 
> Not entirely ... we'll still have gone through the learning exercise of
> how do you do this.  If another language promising additional safety
> features comes along we'll be better at it next time.

Indeed.

> 
> > I can't measure how much would be spent on making C code safer and 
> > how much would be on writing Rust bindings though. If such efforts 
> > would be 80%-90% for making subsystems code safer, it should 
> > worth the efforts even if Rust code ends being removed.
> > 
> > 2) Rust experiment succeeds. In long term it would mean that
> > subsystems should, at some point, stop accepting C code and start
> > using only Rust for new code, and several drivers in C would require
> > conversion to Rust or moved to staging in order to be deprecated.  
> 
> I don't think that's what success looks like.  I think we'd continue in
> dual C/Rust mode almost indefinitely. 

I disagree. The burden of maintaining both C and Rust code on subsystems
will likely force the hand to either switch to Rust or to remove it, as
it will increase with time and with more code porting to Rust or written
in C.

I mean, when new Rust code gets added, specially at subsystem's core, it
may end that some features will only work properly (or would be
thoughtfully tested) in Rust while others would only work properly in C.

So, if enough subsystem's developers got convinced about the advantages
of it, the long road to deprecate C may start happening - at least
subsystem-wide.

Granted, a full conversion will certainly require years or even decades, 
but that's a separate history.

> Look how long it took the kernel to add enough flexibility just to
> compile the existing C with clang.

It looks a lot more, but it wasn't that much of time.

Clang self-hosting started in 2010[1]. So, we're talking of ~12 years of 
since when it started compiling itself. 

During such time frame, Clang got mature enough to become compatible with 
real-world open source code, which probably happened somewhere between
Clang 3.5 (2014) and Clang 4.0 (2017).

[1] See: https://en.wikipedia.org/wiki/Clang

    IMO, before self-hosting, it was more like a compiler experiment, as
    clang wouldn't survive on a gcc-free world.

> There may be a point where we ask should we deprecate C, but that's
> independent of and probably way beyond the point where Rust is a
> success.
> 
> > 3) Some maintainers would consider it a success while others would
> > consider it a failure. That's the worse case scenario. If we reach
> > that, some Kernel/Maintainers Summit hard discussions would likely 
> > be needed, in order to avoid subsystem's fragmentation with regards 
> > to accepting or not C and/or Rust code subsystem-wide.  
> 
> So this is where we have to ask hard questions about what does success
> (or failure) actually look like. I think success is really at least one
> subsystem demonstrates support and enthusiasm for the Rust conversion
> and it doesn't cause a huge drain on those who don't embrace it.

I don't think that having a single subsystem adopting Rust would be enough for
it to be considered a success or a failure. It will very much depend on what
subsystem is, and, most importantly, how the Rust code on it will interact 
with other subsystems that depend on it.

E. g. one thing would be to have a subsystem for a new class of devices
using Rust. People that won't need such devices will barely notice it.
A very different thing would be to have a widely used subsystem
enthusiastically supporting Rust in a proper way.

> That leaves open the door for more converts but doesn't force them.  We 
> can continually evaluate the maintenance burden in this mode and debate
> whether it's too great or is acceptable. 

> I think failure is definitely no subsystem wants to embrace rust.

Agreed: this would be a failure.

> The problem case is where a subsystem embraces rust has issues but
> doesn't want to admit failure because it would lead to the failure of
> the rust project ... this one we'll need to examine in detail.

True. 

Regards,
Mauro

