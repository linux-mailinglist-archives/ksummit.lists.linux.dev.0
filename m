Return-Path: <ksummit+bounces-683-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7508554602
	for <lists@lfdr.de>; Wed, 22 Jun 2022 14:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD59F280BE9
	for <lists@lfdr.de>; Wed, 22 Jun 2022 12:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2A0139B;
	Wed, 22 Jun 2022 12:09:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C74D1386
	for <ksummit@lists.linux.dev>; Wed, 22 Jun 2022 12:09:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47ED8DD;
	Wed, 22 Jun 2022 14:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655899790;
	bh=oqChBu3/PfOBuo3x9FhCdHIiSKsnyTDKREZVv3Wzzx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmxD9C5QC2a5SHeoMoBXNTUej5DEEtv/Shrqvy5DOgintZxRhyf/kgUHjlWR9KIEs
	 V+33XKyGVo7klPIA7HSH28xXB2Goena1lr10RV7K8+CtJayqfIEJt1nO3FDyrzemMI
	 e+Yhu5RkbVHbc0mJj6t6j6/ZID/WU/fHJys8L4FA=
Date: Wed, 22 Jun 2022 15:09:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>
Subject: Re: [Ksummit-discuss] [MAINTAINER SUMMIT] Are we becoming too
 fearful? [was Re: [TECH TOPIC] Rust]
Message-ID: <YrMGfpZgJqSr1Snx@pendragon.ideasonboard.com>
References: <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
 <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
 <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
 <CACRpkdZ9GR=nH6QHhRC7xg1jnr1UJ1BDM+P28V2VWa+uPO0DrQ@mail.gmail.com>
 <YrL1tsoKLoVTbDIH@pendragon.ideasonboard.com>
 <CACRpkdYB62O_OxD+6aFxrzX695dg1wLWcmWsy-TM-V=KF1Ea5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdYB62O_OxD+6aFxrzX695dg1wLWcmWsy-TM-V=KF1Ea5Q@mail.gmail.com>

On Wed, Jun 22, 2022 at 02:01:02PM +0200, Linus Walleij wrote:
> On Wed, Jun 22, 2022 at 12:58 PM Laurent Pinchart wrote:
> 
> > This doesn't mean that all concerns should be ignored, and I read most
> > of them more as constructive feedback trying to find solutions than just
> > attempts to stall progress here. For instance, I see a widespread
> > concern that, as rust spreads in more places through the kernel, it will
> > generate extra work for people who are not able or ready yet to handle
> > this. This can be handled in two ways: we can ignore that concern, and
> > deal later with the potential conflicts it could generate, or we could
> > try to address it already.
> 
> I agree. My first reactions to Miguel's and Wedsons Rust patches were
> not the most enthusiastic either, more along the lines "you think you
> can do better than 50 years of C?"
> 
> Then I looked closer and saw how Rust is designed to join imperative
> and functional programming to get the best of all worlds, to use the
> latter to solve some of the problems with the former. So now I am
> theoretically convinced that it will add real value.

I think the theoretical technical value has been sold properly now. I
see less push back on that alone, more about whether the pain is worth
the gain.

> > Could the second option be extra work to handle an issue that may not
> > materialize ? Yes, of course. I see it more as an opportunity myself.
> > For instance, we could address that concern by creating and advertising
> > a support channel for developers and maintainers who need help dealing
> > with rust impacting their work (e.g. when doing tree-wide reworks) could
> > get help, and making sure we'll have a few rust-in-linux maintainers
> > there who can provide support (it could be a mailing list, an IRC
> > channel, ...).
> 
> Why not both.

I'd rather have both indeed. In some cases e-mail works best, but when
you're actively working on a task and hit a roadblocker, being able to
get help immediately is much better. This is especially true if we want
to take the psychological aspect into account, I think it would be
crucial here to offer very quick support for the first few problems a
developer or maintainer will encounter. Not that it should become sloppy
after that, but I think people will be much more likely to try and find
a solution by themselves if they have been helped before and know
support is available than when they hit the first issue.

> https://lore.kernel.org/rust-for-linux/ <- this exists!
> I bet Miguel has an IRC channel as well.

It's even better if no new process has to be put in place, then all that
remains to do is properly advertise this to ensure that nobody will miss
it. Is there a way we could get those resources advertised when hitting
a rust-related build failure for instance ?

> > Not only would it send the message that the rust-in-linux
> > community listens to concerns and cares, but it would also result in
> > having a useful support resource from day one, as well as showing that
> > this project really has the means it requires to move forward.
> 
> I agree. What I pointed out to Miguel & Wedson was that I expect commitment
> of a personal type, what you once said (at a conference) required to
> have kernel development in the open in your DNA. To feel personally
> responsible. In clear: I expect the Rust-in-linux people to keep reading
> the mailing list and respond to questions even if they no longer have
> funding, even if it is not their current dayjob. The task will become too
> important on a personal level to be left on the roadside.
> 
> The role model for that is Torvalds working at Transmeta a few years
> back and not losing focus on Linux. That is a social responsibility that
> goes beyond the dayjob. This request is probably more than a little
> intimidating, but it is what we are looking for. If one does not find it as fun
> and rewarding as to go to such lengths, then one should not go and
> change core kernel infrastructure.
> 
> So it does not need to be a lot of people, but it needs to be dedicated
> people. Such as the people who made Kasan, which we accepted
> pretty quickly and we were not too conservative about Kasan despite
> it being so intrusive.
> 
> > > My biggest worry is that the kernel community can become irrelevant
> > > for young people as a demographic. Young people like things like
> > > Rust and web-based merge requests on github. They are also very
> > > smart. So I see it as partly an inclusion problem.
> >
> > If you put rust and github in the same bag, you'll drastically increase
> > the size of the mob that will chase you with pitchforks :-)
> 
> Ha ha I know. But I have seen many beautiful projects on GitHub,
> especially PostmarketOS, as a review tool it still lacks compared to email.

-- 
Regards,

Laurent Pinchart

