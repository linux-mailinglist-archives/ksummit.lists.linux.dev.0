Return-Path: <ksummit+bounces-681-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCE8554574
	for <lists@lfdr.de>; Wed, 22 Jun 2022 12:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F948280BD9
	for <lists@lfdr.de>; Wed, 22 Jun 2022 10:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4171380;
	Wed, 22 Jun 2022 10:58:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C91137A
	for <ksummit@lists.linux.dev>; Wed, 22 Jun 2022 10:58:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB3EEDD;
	Wed, 22 Jun 2022 12:58:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655895503;
	bh=gh1RlTRhHumPzOhv9+kkYzuq6vQ1SAOwnCcJZHYS77c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f01ejDXFiPopbW4lMGmZdrH3OTlYZDg4hjBfBgLutgNrf3i8Rb36sZcmYjNERCMyY
	 0kNam8N268JvmGoLxUH6cze5a4SQkEIBCOUfjeMlKlMzuqMzENdE7R3SoqM+nHKR+K
	 UOeGaO3DPJmL7xgXNg5KW8kBW8W5Syc63QNe0nco=
Date: Wed, 22 Jun 2022 13:57:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>
Subject: Re: [Ksummit-discuss] [MAINTAINER SUMMIT] Are we becoming too
 fearful? [was Re: [TECH TOPIC] Rust]
Message-ID: <YrL1tsoKLoVTbDIH@pendragon.ideasonboard.com>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
 <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
 <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
 <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
 <CACRpkdZ9GR=nH6QHhRC7xg1jnr1UJ1BDM+P28V2VWa+uPO0DrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdZ9GR=nH6QHhRC7xg1jnr1UJ1BDM+P28V2VWa+uPO0DrQ@mail.gmail.com>

Hi Linus,

On Wed, Jun 22, 2022 at 11:59:03AM +0200, Linus Walleij wrote:
> On Sun, Jun 19, 2022 at 4:45 PM James Bottomley wrote:
> 
> > I think there's a growing problem in Linux which is exemplified by this
> > Rust debate but which goes way beyond it: We're becoming too fearful of
> > making big decisions to sustain innovation in some areas.
> 
> I agree.
> 
> > This really
> > is a creeping cancer of inertia that has destroyed many projects before
> > us and if we're not careful, we'll go the same way.
> 
> Strong words. This phenomenon is known from organization theory.
> Organization theory exist in dry and tasteless versions and some more
> colorful and spicy versions. Let's revisit the most spicy and colorful of
> them all, Cyril Norhcote Parkinson, a true representative of the
> atomic space age.
> 
> In his famous book "Parkinson's Law" from 1957 (a book passed to
> me from my great grandfather, and annoyingly relevant to this day),
> in the last chapter titled "Pension point, or the age of retirement" he
> touches on the subject. There might be an illicit copy here, page 42:
> http://sas2.elte.hu/tg/ptorv/Parkinson-s-Law.pdf
> 
> Parkinson is writing satire and it is a clear hyperbole. But it isn't funny
> if it isn't relevant. He saw the same thing as you see, and just
> state (apparently based on nothing but his own experience) that a
> persons "age of wisdom" is followed by the "age of obstruction".
> Just constant risk avoidance. Blaeh. Boring.
> 
> I don't know about eBPF, but Rust is nice. Let's merge it and see what
> happens. As one of my friends working in embedded systems said:
> "this is the only new thing I have seen in my career, the rest is just
> repetitions of the past", and I agree with that.

The past two years may have increased the reluctance of following the
strategy of "let's ignore any possible warning, it's going to be fine".

There's a set of non-technical issues around kernel development, from
community management to hiring skilled developers. I understand lots of
the concerns that have been expressed (including some by myself) in that
context. Some may be classified as unfounded fears (it would be so much
easier if we could tell in advance which ones are founded and which ones
are not), and I think using rust in Linux could actually help in some of
the non-technical areas (by attracting developers from different
horizons to the kernel for instance).

This doesn't mean that all concerns should be ignored, and I read most
of them more as constructive feedback trying to find solutions than just
attempts to stall progress here. For instance, I see a widespread
concern that, as rust spreads in more places through the kernel, it will
generate extra work for people who are not able or ready yet to handle
this. This can be handled in two ways: we can ignore that concern, and
deal later with the potential conflicts it could generate, or we could
try to address it already.

Could the second option be extra work to handle an issue that may not
materialize ? Yes, of course. I see it more as an opportunity myself.
For instance, we could address that concern by creating and advertising
a support channel for developers and maintainers who need help dealing
with rust impacting their work (e.g. when doing tree-wide reworks) could
get help, and making sure we'll have a few rust-in-linux maintainers
there who can provide support (it could be a mailing list, an IRC
channel, ...). Not only would it send the message that the rust-in-linux
community listens to concerns and cares, but it would also result in
having a useful support resource from day one, as well as showing that
this project really has the means it requires to move forward.

> My biggest worry is that the kernel community can become irrelevant
> for young people as a demographic. Young people like things like
> Rust and web-based merge requests on github. They are also very
> smart. So I see it as partly an inclusion problem.

If you put rust and github in the same bag, you'll drastically increase
the size of the mob that will chase you with pitchforks :-)

-- 
Regards,

Laurent Pinchart

