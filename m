Return-Path: <ksummit+bounces-327-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id E80523BF328
	for <lists@lfdr.de>; Thu,  8 Jul 2021 02:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 548653E108C
	for <lists@lfdr.de>; Thu,  8 Jul 2021 00:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4CF2F80;
	Thu,  8 Jul 2021 00:56:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C22173
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 00:56:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7399DE7;
	Thu,  8 Jul 2021 02:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625705806;
	bh=660DfIQs9fPLTpCpbVmySPOnDB5citEYt+flNL8eQdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHcjKWwXCsvfVBvmu1pfDi/x31DXsScyY3W3LuwVet7c3Rmr6YSOXmvBDX6mdt1DV
	 kfgIKpSth3/q4mNJXKNPapZlqrdD5tCqDfif2NO99qJIvCuAmfwWrE3J9HbgEthu31
	 Ep4bIrG5r6k+wvCw1QVvUFGAy8/ZZU0uQk3AD+94=
Date: Thu, 8 Jul 2021 03:56:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Roland Dreier <roland@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOZNIu1vPF1G/QyT@pendragon.ideasonboard.com>
References: <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
 <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
 <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
 <CANiq72nKao=rz89yajChtsM8Nvv2LM-xZfX+iwk686SDMhv5iw@mail.gmail.com>
 <YOYuCXKm3g1elu0t@pendragon.ideasonboard.com>
 <CANiq72=o5hKZyFqnGvd-3LeqjbR+JDsWhf=rJkimTKQSqf45pg@mail.gmail.com>
 <YOY7bJ2n67XVo5cG@pendragon.ideasonboard.com>
 <CANiq72kD7BqTgzOdHALDjMDzBXpz56n13+=rDCzs5RuSnLWpcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72kD7BqTgzOdHALDjMDzBXpz56n13+=rDCzs5RuSnLWpcg@mail.gmail.com>

Hi Miguel,

On Thu, Jul 08, 2021 at 02:27:47AM +0200, Miguel Ojeda wrote:
> On Thu, Jul 8, 2021 at 1:41 AM Laurent Pinchart wrote:
> >
> > I don't think anyone ever claimed that C++ offers the same kind of
> > compile-type checks that rust does, so there's no disagreement there.
> 
> My apologies if I have misinterpreted your claims (or those of Bart).
> 
> The thing is, claims such as "C++ is as safe as Rust, you just need to
> use modern C++ properly!" are still way too common online, and many
> developers are unfamiliar with Rust, thus I feel we need to be crystal
> clear (in a thread about Rust support) that it is a strict improvement
> over C++, and not a small one at that.
> 
> In any case, please note that I am not a Rust "fan" or "believer"
> (somebody mentioned that word) -- if the C committee opens up to add
> these kind of things, I will gladly work on that as my free time
> permits. But Rust works, and it works today, and the language brings
> many other things too in a fairly well-designed package (though it is
> not perfect either).
> 
> > The discussion has drifted from rust in the kernel to features that C is
> > missing and that make our life painful when it shouldn't be. Some of
> > those features are fairly basic (such as features that would allow
> > implementing RAII idioms with a syntax that wouldn't make all developers
> > want to jump through the window), and available in multiple languages,
> 
> The C committee is looking into adding `defer`, so you may actually
> get RAII in C ;)

That would be nice.

> They are also looking into adding lambdas (with a similar syntax to C++'s).
> 
> > This being said, I don't think C++ would be a particularly good
> > alternative even for that limited goal, as there could be more drawbacks
> > than advantages. Furthermore, if we're considering supporting a second
> > language in the kernel, it would likely be best to pick a language to
> > would bring us as many benefits as possible. Rust is a good candidate,
> > even if I'm not convinced at this point that the gains outweight the
> > costs (especially when it comes to the disturbance to the development
> > flow, see the discussion in this mail thread about subsystem-wide or
> > kernel-wide changes). Time (and discussions) will tell.
> 
> This is fair, thank you.
> 
> > Speaking of sweeter syntax, in the "if only I had a time machine"
> > category, I wish rust would have picked a syntax closer to C when
> > departing from it wasn't strictly necessary :-(
> 
> Interesting -- in which regard? i.e. it is actually quite close, their
> designers were clearly going for something relatively familiar to
> C/C++ programmers (at least in its current state, not the very early
> design iterations of Rust).

One particular point that comes to my mind is function parameters,
declared as "variable_name: type" instead of "type variable_name", or
the need to prefix functions with "fn". It's not a huge deal, but if
small things like that could have been kept closer to C, it would have
been nice.

-- 
Regards,

Laurent Pinchart

