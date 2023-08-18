Return-Path: <ksummit+bounces-1020-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC076780F23
	for <lists@lfdr.de>; Fri, 18 Aug 2023 17:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71201C2165E
	for <lists@lfdr.de>; Fri, 18 Aug 2023 15:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111BE198B1;
	Fri, 18 Aug 2023 15:26:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A892118C36
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 15:26:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38E9EC85;
	Fri, 18 Aug 2023 17:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692372308;
	bh=JCY4SJMtKdQvUconXDpe7PhDwPTKIn5DMolxHb1teZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbcBjR3oIMOMN81N0KtYaG3OzvDw26Ww3BThCAZFqvxS9+MzNM72H8m/5C+m9JPHn
	 rtV7Znv/L1PSktElAvqSlUFPE2ZR4e5FdYGisyoGLYIMwLP4FnBo+obvmaI61vzBO4
	 0UGLmVrFex9JrXFZjYWr2WZBg5aoc5596MN3LB74=
Date: Fri, 18 Aug 2023 18:26:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230818152629.GA13558@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>

On Fri, Aug 18, 2023 at 03:55:11PM +0200, Linus Walleij wrote:
> Alexei, thanks for returning the conversation
> to this very important topic.
> 
> On Fri, Aug 18, 2023 at 1:55 AM Alexei Starovoitov wrote:
> 
> > BPF has solid CI that helps a lot, but the maintainer burnout is acutely felt.
> > The main reason for burnout is patch flood.
> 
> I agree this is an important cause.
> Even worse is any kind of social conflict or bad mood in the community.
> Science has studied stress, what we mostly run into is called "microstress".
> https://en.wikipedia.org/wiki/Psychological_stress
> 
> > The maintainer's day looks like non-stop code review.
> > The patch backlog just doesn't end.
> 
> I've been there too :(

I think most of us know the feeling. Personally, if my workload reaches
100% review for an extended period of time, without having any time for
"fun" activities such as hacking, I'm pretty sure my review efficiency
drops drastically. Maybe that's call burn out.

> > We're trying to encourage active developers to be code reviewers as well
> > via positive/negative scores:
> > https://lore.kernel.org/bpf/ZJx8sBW%2FQPOBswNF@google.com/
> >
> > It doesn't help much yet. All incoming kernel contributors assume
> > that it's a maintainer's job to do code reviews.
> > Developers just send patches and wait. It doesn't occur to them that
> > reviewing other patches will help them land their own.
> 
> The DRI/DRM community has group maintainership that works a little
> bit.
> Essentially it boils down to ask people to review your stuff and you
> will review and also merge their stuff in return.
> Sometimes this works.
> Especially if you are a circle of acquaintances working full
> time on similar things, yay! So much support.
> When you are a sporadic contributor it doesn't work as well.
> Because you cannot always find some matching contribution to
> review and you feel like begging.
> So different solutions for different contributors may be needed.

I've also experienced mixed results from "trading reviews". It's
certainly nice on paper, and it works sometimes, especially when asking
contributors to review patches that are directly related to their
business interest. I remember asking a contributor from a large company
to help me with reviews, to free some of my time to review their
patches. The contributor helped with reviewing third-party contributions
to the driver they're actively working on. When I asked for help
reviewing an entirely separate driver that their employer had no
business interest in, however, I faced the "we're busy and don't have
time" argument.

Maybe part of the solution here, to share the maintenance burden, is to
expect contributors, especially the ones with large financial resources,
to spent a certain percentage of their time reviewing code that is in
their area of expertise but not in their area of business interest.

> > To address maintainer burnout we need to change the culture of the community
> > and transform active developers to active code reviewers.
> > We're looking for ideas on how to do that.
> 
> I agree.
> 
> To deal with the symptoms (feeling stressed) when it gets too much
> for me personally I have different coping mechanisms.
> 
> The basic idea is to do stuff that generate the opposite of stress.
> This could be outside of work, but also working on stuff in the
> kernel that gives a feeling of immediate accomplishment and
> closure is good.
> 
> Such as maintaining some drivers and systems that are old,
> so nobody is begging you to fix it now now now. Paying of some
> old techical debt. That's nice.
> 
> Drilling into a specific bug that is not urgent can also be very
> de-stressing, it's hard work but nobody is dependent on you
> fixing it now. You don't even need to come up with a solution.

-- 
Regards,

Laurent Pinchart

