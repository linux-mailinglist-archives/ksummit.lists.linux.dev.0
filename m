Return-Path: <ksummit+bounces-661-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEDC550AB3
	for <lists@lfdr.de>; Sun, 19 Jun 2022 14:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96964280BED
	for <lists@lfdr.de>; Sun, 19 Jun 2022 12:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6C8645;
	Sun, 19 Jun 2022 12:56:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3FA7B
	for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655643414;
	bh=T9acGvNvteH/N+kA5sUNwnWopI1wQX4f5QhbPkscgXU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=RPXSZBeT1Pml1uysvPEf9QQjSqcCzuqti311EkWMOzGTIZmQnQOqQwkw04Sj5lmIk
	 F3hUabWjKGc157s3hzcyWQyyjNlvWv9F2mjqUkbWiNYmekdDnUw6hN+7uVHOAo9LIt
	 l9S7vX0iWkxBJ7dcNAA6wTTGniUNRzOXBTrbXfH8=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 65DD71280BF9;
	Sun, 19 Jun 2022 08:56:54 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgE4Z1Srj2QT; Sun, 19 Jun 2022 08:56:54 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655643414;
	bh=T9acGvNvteH/N+kA5sUNwnWopI1wQX4f5QhbPkscgXU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=RPXSZBeT1Pml1uysvPEf9QQjSqcCzuqti311EkWMOzGTIZmQnQOqQwkw04Sj5lmIk
	 F3hUabWjKGc157s3hzcyWQyyjNlvWv9F2mjqUkbWiNYmekdDnUw6hN+7uVHOAo9LIt
	 l9S7vX0iWkxBJ7dcNAA6wTTGniUNRzOXBTrbXfH8=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id ABFE31280B6A;
	Sun, 19 Jun 2022 08:56:53 -0400 (EDT)
Message-ID: <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Rust
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Christoph Hellwig
	 <hch@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit
	 <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Date: Sun, 19 Jun 2022 08:56:46 -0400
In-Reply-To: <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
References: 
	<CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
	 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
	 <Yq6+p+aRCjeZ7QsS@infradead.org>
	 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2022-06-19 at 13:04 +0300, Laurent Pinchart wrote:
> On Sat, Jun 18, 2022 at 11:13:59PM -0700, Christoph Hellwig wrote:
> > On Sat, Jun 18, 2022 at 11:42:07PM +0300, Laurent Pinchart wrote:
> > > All previous topics but this one are technical. To restore the
> > > balance a bit (and also because I believe it's important to the
> > > success of this project :-)), I'd like to also discuss the impact
> > > on the kernel maintenance at large, beyond just the maintainers
> > > who opt in to be early adopters of rust in their subsystem.
> > 
> > Yes.  That is I think the most important point.
> > 
> > I've played around with rust a bit for userspace project, and there
> > is things I like a lot like strict type safety and the ownership
> > model, and things I detest like verbose and unlogic syntax, the
> > cargo cult of vendoring libraries instead of a sane shared library
> > and versioning model (althought that should be largerly irrelevant
> > for the kernel), and compared to many other languages it seems
> > overall rather sane.

This is more or less my assessment from playing with rust as well.

> > But I'm really worried about the impact on the kernel, as interface
> > between languages are a real pain, and so far I'm not convinced at
> > all that this pain is worth the gain, even if that could change in
> > the future.
> 
> One point I'd like to explicitly address, as it seems to be very
> relevant to me when it comes to whether or not the pain is worth the
> gain, is how we'll deal with the fact that the rust compiler will
> tell a non-negligible [*] part of the kernel developers that they
> don't have the skills to write kernel code. Will we have a credible
> option to offer there to help people improve their skills set, and
> how will we deal with the fact that some people will be left on the
> side of the road ? Or would we acknowledge what may be the elephant
> in the room that this would actually be a good thing for the kernel
> code quality ? What about the impact on a community that is already
> overworked and prone to burn-out ?
> 
> [*] I have no way to quantify this at the moment, maybe I'm overly
> pessimistic, and the number will likely vary depending on areas,
> probably impacting BSPs differently than mainline.

I don't think that's a huge concern.  After all rust isn't going to
penetrate every subsystem all at once ... and realistically it will
only penetrate some subsystems if there's the ability to review it.

I really doubt anyone at the maintainer or reviewer level of the kernel
doesn't have the ability to learn rust (now whether they have the
desire to is quite another matter) and I'd be surprised if we can find
any kernel developer who only speaks C.  I think the biggest problem
with rust is that there's definitely an anti-C bias in the language. 
What I mean by that is if you look at Java they chose to be as close to
C where possible to make the language easier to learn.  Rust seems to
have taken the opposite view and picked a lot of things which could
have been C like (typing, function calls, returns, mutability, etc.)
and done them differently just because they wanted to be different from
C.  That does cause issues for C people because you tend to trip over
the anti-C biases in the language and are constantly having to look the
basic syntax up.  This really increases the learning curve going from C
to rust, which gets annoying very fast, but it's not insurmountable.

All that said, I expect once we start getting rust based patches, it
will quickly become apparent where the rust receptive subsystems are
and I would expect reviewers in those subsystems will quickly become
rust fluent.  This doesn't answer the pain vs gain aspect, but I
suspect we won't know that until we actually try.

James



