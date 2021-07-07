Return-Path: <ksummit+bounces-321-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3F03BF234
	for <lists@lfdr.de>; Thu,  8 Jul 2021 00:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6F5931C0E38
	for <lists@lfdr.de>; Wed,  7 Jul 2021 22:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480F22FAE;
	Wed,  7 Jul 2021 22:44:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272D570
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 22:44:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F553CC;
	Thu,  8 Jul 2021 00:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625697845;
	bh=MKeDi5xA/OSIdqDASQjcenG5O8P92gHxR0Gw0WBDL4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQBmrjFbstjWolrefzcGaiPHQ02QLtu3KlbjeiqxxykPWQ0QjPDymXl4pZWpTPKfV
	 jMSz4QfOeNIcJEC2GHJgFSBS4WCZUehpQWc2cWQdqEnu68lK2i2DrkebH3xkgb+AgA
	 rG0h8dIS8qTRYqAiprZDyPXyOQJNdte14skQ5/bc=
Date: Thu, 8 Jul 2021 01:43:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Roland Dreier <roland@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOYuCXKm3g1elu0t@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
 <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
 <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
 <CANiq72nKao=rz89yajChtsM8Nvv2LM-xZfX+iwk686SDMhv5iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72nKao=rz89yajChtsM8Nvv2LM-xZfX+iwk686SDMhv5iw@mail.gmail.com>

Hi Miguel,

On Thu, Jul 08, 2021 at 12:11:16AM +0200, Miguel Ojeda wrote:
> On Wed, Jul 7, 2021 at 10:32 PM Bart Van Assche wrote:
> >
> > Thank you for having shared your opinion. You may want to know that
> > every C++ project I have worked on so far enabled at least the following
> > compiler flags: -fno-exceptions and -fno-rtti.
> >
> > What the C++ operator new does if not enough memory is available depends
> > on the implementation of that operator. We could e.g. modify the
> > behavior of operator new as follows:
> > - Add -fno-builtin-new to the compiler flags.
> > - Define a custom version of operator new.
> 
> The issue is that, even if people liked C++ a lot, there is little
> point in using C++ once Rust is an option.
> 
> Even if you discuss "modern C++" (i.e. post-C++11, and even
> post-C++17), there is really no comparison.
> 
> For instance, you mentioned `std::span` from the very latest C++20
> standard; let's build one:
> 
>     std::span<int> f() {
>         int a[] = { foo() };
>         std::span<int> s(a);
>         return s;
>     }
> 
> Now anybody that accesses the returned `std::span` has just introduced
> UB. From a quick test, neither Clang nor GCC warn about it. Even if
> they end up detecting such a simple case, it is impossible to do so in
> the general case.
> 
> Yes, it is a stupid mistake, we should not do that, and the usual
> arguments. But the point is UB is still as easy as has always been to
> introduce in both C and C++. In Rust, that mistake does not happen.

You're comparing apples and pears though. A C++ function that is meant
to transfer unique ownership of an object to the caller should return a
std::unique_ptr<> on a container that stores the data. We're getting
off-topic though, this mail thread isn't about comparing C++ and rust
:-)

-- 
Regards,

Laurent Pinchart

