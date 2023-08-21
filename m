Return-Path: <ksummit+bounces-1037-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCBA782DFE
	for <lists@lfdr.de>; Mon, 21 Aug 2023 18:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A4491C2090B
	for <lists@lfdr.de>; Mon, 21 Aug 2023 16:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAEB8BE2;
	Mon, 21 Aug 2023 16:13:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B38460
	for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 16:13:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADB223F1;
	Mon, 21 Aug 2023 18:11:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692634313;
	bh=SVyyNUQ8jycHKON/6Uh2mPsiRUeAjdX3UTu2MDs5Wkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXjwmQ65jiTdZQS1n6Dw4RfzMwx+SShRjAO3+6c12drMkbnyisapL1xfPLUh7fooR
	 UaM6jb+kOuBWvHGdpLZyf+P/zxfOurO7UJXh5vNdzihTXAH8SH/7OgIa+X0ClY2fNh
	 CZK9sK2CoNdbwWLaIzSBQ9PM9EFVBB81svoNnuYQ=
Date: Mon, 21 Aug 2023 19:13:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230821161317.GL10135@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818152629.GA13558@pendragon.ideasonboard.com>
 <ZN-Q8AsMwaQ4JMP4@char.us.oracle.com>
 <15756423-d769-4dc2-8d24-04b37f20f2be@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <15756423-d769-4dc2-8d24-04b37f20f2be@sirena.org.uk>

On Fri, Aug 18, 2023 at 07:36:44PM +0100, Mark Brown wrote:
> On Fri, Aug 18, 2023 at 11:40:32AM -0400, Konrad Rzeszutek Wilk wrote:
> > On Fri, Aug 18, 2023 at 06:26:29PM +0300, Laurent Pinchart wrote:
> > >
> > > Maybe part of the solution here, to share the maintenance burden, is to
> > > expect contributors, especially the ones with large financial resources,
> > > to spent a certain percentage of their time reviewing code that is in
> > > their area of expertise but not in their area of business interest.
> >
> > May I add an point that I had struggled in the past with (and it could
> > be very well this is not an issue in your subsystem in which case please
> > ignore it):
> >
> > This idea assumes you trust them to have the same level of expertise
> > that you have.
> >
> > That is say they do a review but miss the more esoteric semantics (say
> > hardware quirks that are documented but only for folks that *grok* the
> > hardware). You may know it, but they don't. You accept their patches and
> > months later it all blows up. You are unhappy, Linus is screaming about
> > it. Burn-out ++.
> 
> For those of us working more with drivers for embedded systems this can
> be a bit different in that for a lot of drivers realistically nobody is
> going to have access to the hardware outside of a fully integrated
> product, including you.  I remember talking with someone submitting
> drivers for devices like that and them being surprised that I was much
> more focused on if the driver was a pain for subsystem integration and
> ongoing maintainance than if this undocumented thing I had no access to
> worked.

As I wrote in a separate e-mail in this thread, my main focus with a
subsystem core developer/maintainer hat is usage of in-kernel and
userspace APIs. This is related to subsystem ongoing maintenance, as
badly used in-kernel APIs will hinder future refactoring, and badly used
userspace APIs will need to be kept forever as we can't break userspace
that depends on them. This knowledge is easier (by not easy) to build
across a larger number of developers, compared to device-specific
knowledge.

With my other hat of driver maintainer, I'm certainly more conservative
reviewing patches for drivers that are used by a very large number of
people, for fear of introducing breakages. Automated tests can help to
some extent, but I don't have a good answer to this problem.

> Of course it's not like you can completely ignore things and some
> drivers get more exposure to general users than others, but it does help
> quite a bit to feed into the risk profile of patches.
> 
> > Perhaps the question should be: How to grow the community so that members
> > collectively have the same knowledge as you?
> 
> And also identify the areas where that's already happening and actually
> take advantage of that fact.

-- 
Regards,

Laurent Pinchart

