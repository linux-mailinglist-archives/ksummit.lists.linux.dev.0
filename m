Return-Path: <ksummit+bounces-325-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 343B63BF286
	for <lists@lfdr.de>; Thu,  8 Jul 2021 01:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 8E37D3E1064
	for <lists@lfdr.de>; Wed,  7 Jul 2021 23:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1247D2FAE;
	Wed,  7 Jul 2021 23:41:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9B070
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 23:41:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63EF3CC;
	Thu,  8 Jul 2021 01:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625701272;
	bh=VZmnpv1h682rHAbUffC/dU5V1/r77Yrmt+YjxOYBhEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBYDIeiEf++lbKGyQsCmWTbWgNV1zmZboat65tAGFXu7yClNHKZYCfw4dCJa/zOkk
	 S7dRh0XXQk9ADBXu8+Ez9Bjqg0OW6jTgYs64qfU4a5CtqN3j8T+xaJM/3FwkP1S/5q
	 IsCDRVZiBRSu4CqJq/J5C01HMDVWirIP0h8TaYjQ=
Date: Thu, 8 Jul 2021 02:40:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Roland Dreier <roland@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOY7bJ2n67XVo5cG@pendragon.ideasonboard.com>
References: <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
 <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
 <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
 <CANiq72nKao=rz89yajChtsM8Nvv2LM-xZfX+iwk686SDMhv5iw@mail.gmail.com>
 <YOYuCXKm3g1elu0t@pendragon.ideasonboard.com>
 <CANiq72=o5hKZyFqnGvd-3LeqjbR+JDsWhf=rJkimTKQSqf45pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72=o5hKZyFqnGvd-3LeqjbR+JDsWhf=rJkimTKQSqf45pg@mail.gmail.com>

Hi Miguel,

On Thu, Jul 08, 2021 at 01:21:55AM +0200, Miguel Ojeda wrote:
> On Thu, Jul 8, 2021 at 12:44 AM Laurent Pinchart wrote:
> >
> > You're comparing apples and pears though. A C++ function that is meant
> > to transfer unique ownership of an object to the caller should return a
> > std::unique_ptr<> on a container that stores the data. We're getting
> 
> Nope, I am not comparing apples and pears. I just showed you a trivial
> way to make UB in C++20 with one of the types someone else mentioned.
> 
> You mention `std::unique_ptr` now. Same deal:
> 
>     std::unique_ptr<int> f() {
>         return {}; // returns a `nullptr`
>     }
> 
> You will now reply: "oh, but you are *not* supposed to use it like
> that!". But the point is: it is not about the simple examples, it is
> about the complex cases where objects are alive for a long time,
> passed across chains of calls, manipulated in several places, across
> different threads, etc., etc. so that reasoning is non-local.
> 
> Don't get me wrong, `std::unique_ptr` is nice, and I have used it many
> times in my career with good results. Still, it is far from what Rust
> offers.
> 
> Another extremely typical example:
> 
>     std::vector<int> v;
>     ...
>     int * p = v.data(); // looks OK
>     ...
>     v.push_back(42); // looks OK
>     ...
>     f(p); // oh, wait...

I don't think anyone ever claimed that C++ offers the same kind of
compile-type checks that rust does, so there's no disagreement there.

> > off-topic though, this mail thread isn't about comparing C++ and rust
> > :-)
> 
> Well, if people bring up C++ as an alternative to Rust, they are
> implying Rust does not offer much more than C++. Which is false,
> misleading, and directly counters the Rust support proposal, thus I
> feel the need to answer.

The discussion has drifted from rust in the kernel to features that C is
missing and that make our life painful when it shouldn't be. Some of
those features are fairly basic (such as features that would allow
implementing RAII idioms with a syntax that wouldn't make all developers
want to jump through the window), and available in multiple languages,
including rust and C++. To that extent, C++ could be an alternative to
rust *if* the goal was limited to bringing those features in (I recall a
computer science teacher explaining to his class that they would program
in C+, which he defined as C++ without classes, just to use << instead
of printf...).

This being said, I don't think C++ would be a particularly good
alternative even for that limited goal, as there could be more drawbacks
than advantages. Furthermore, if we're considering supporting a second
language in the kernel, it would likely be best to pick a language to
would bring us as many benefits as possible. Rust is a good candidate,
even if I'm not convinced at this point that the gains outweight the
costs (especially when it comes to the disturbance to the development
flow, see the discussion in this mail thread about subsystem-wide or
kernel-wide changes). Time (and discussions) will tell.

> Again, don't get me wrong: while one can definitely see Rust as a
> "cleaned up" C/C++ (it is, in a way); the key is that it *also* offers
> major advantages using a few new research ideas that no other system
> language had (even SPARK had to catch up [1]). It is not just a
> sweeter syntax or a few fancy features here and there as many seem to
> imply in many fora.

Speaking of sweeter syntax, in the "if only I had a time machine"
category, I wish rust would have picked a syntax closer to C when
departing from it wasn't strictly necessary :-(

> [1] https://blog.adacore.com/using-pointers-in-spark

-- 
Regards,

Laurent Pinchart

