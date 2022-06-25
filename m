Return-Path: <ksummit+bounces-714-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D284A55AAC1
	for <lists@lfdr.de>; Sat, 25 Jun 2022 16:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9727280CB5
	for <lists@lfdr.de>; Sat, 25 Jun 2022 14:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4817F28EE;
	Sat, 25 Jun 2022 14:15:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955597C
	for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1656166508;
	bh=eGp2hd3ilI4hghM1EzkpoV5kSHP+5nu7e9KLSlD8wOo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=wo0CaNoIjpif30a/6gZEJm20KiFTGcQzRnpcI7VnhFYtmyMRuaxWFTt/lOKLjbIva
	 TqO0fyQ4XpuLkqKDfTWHNpjdAj3UfoAI4+3Z97afE3ENmUnnlaFdKiiU+362AtYZBu
	 qBGYnHx9UjDxirtJODgyh8HBzAblNlDp2gzsXPkM=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 98B2912802F8;
	Sat, 25 Jun 2022 10:15:08 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2LkK4cFi461; Sat, 25 Jun 2022 10:15:08 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1656166508;
	bh=eGp2hd3ilI4hghM1EzkpoV5kSHP+5nu7e9KLSlD8wOo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=wo0CaNoIjpif30a/6gZEJm20KiFTGcQzRnpcI7VnhFYtmyMRuaxWFTt/lOKLjbIva
	 TqO0fyQ4XpuLkqKDfTWHNpjdAj3UfoAI4+3Z97afE3ENmUnnlaFdKiiU+362AtYZBu
	 qBGYnHx9UjDxirtJODgyh8HBzAblNlDp2gzsXPkM=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D87931280164;
	Sat, 25 Jun 2022 10:15:07 -0400 (EDT)
Message-ID: <79e0113a7eef81f2490e5531919fc4658a71c81a.camel@HansenPartnership.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] Rust
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jens Axboe
	 <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>, Miguel Ojeda
	 <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev, ksummit
	 <ksummit-discuss@lists.linuxfoundation.org>
Date: Sat, 25 Jun 2022 10:15:06 -0400
In-Reply-To: <20220625124522.507a5b06@sal.lan>
References: 
	<CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
	 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
	 <Yq6+p+aRCjeZ7QsS@infradead.org>
	 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
	 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
	 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
	 <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
	 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
	 <20220625124522.507a5b06@sal.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sat, 2022-06-25 at 12:45 +0100, Mauro Carvalho Chehab wrote:
[...]
> Assuming that we get into a point were all the above happens for
> subsystem XXX, at the Rust experiment validation point you mentioned
> above, there will be some possible outcomes:
> 
> 1) Rust experiment fails. On such case, the efforts to make the
> subsystem C code ready to run safe Rust code will be welcomed,
> as Linux should be safer. The work on providing Rust bindings will 
> be wasted on such case. 

Not entirely ... we'll still have gone through the learning exercise of
how do you do this.  If another language promising additional safety
features comes along we'll be better at it next time.

> I can't measure how much would be spent on making C code safer and 
> how much would be on writing Rust bindings though. If such efforts 
> would be 80%-90% for making subsystems code safer, it should 
> worth the efforts even if Rust code ends being removed.
> 
> 2) Rust experiment succeeds. In long term it would mean that
> subsystems should, at some point, stop accepting C code and start
> using only Rust for new code, and several drivers in C would require
> conversion to Rust or moved to staging in order to be deprecated.

I don't think that's what success looks like.  I think we'd continue in
dual C/Rust mode almost indefinitely.  Look how long it took the kernel
to add enough flexibility just to compile the existing C with clang.

There may be a point where we ask should we deprecate C, but that's
independent of and probably way beyond the point where Rust is a
success.

> 3) Some maintainers would consider it a success while others would
> consider it a failure. That's the worse case scenario. If we reach
> that, some Kernel/Maintainers Summit hard discussions would likely 
> be needed, in order to avoid subsystem's fragmentation with regards 
> to accepting or not C and/or Rust code subsystem-wide.

So this is where we have to ask hard questions about what does success
(or failure) actually look like. I think success is really at least one
subsystem demonstrates support and enthusiasm for the Rust conversion
and it doesn't cause a huge drain on those who don't embrace it.  That
leaves open the door for more converts but doesn't force them.  We can
continually evaluate the maintenance burden in this mode and debate
whether it's too great or is acceptable.  I think failure is definitely
no subsystem wants to embrace rust.  The problem case is where a
subsystem embraces rust has issues but doesn't want to admit failure
because it would lead to the failure of the rust project ... this one
we'll need to examine in detail.

James



