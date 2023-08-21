Return-Path: <ksummit+bounces-1036-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360A782DB9
	for <lists@lfdr.de>; Mon, 21 Aug 2023 18:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3180280F01
	for <lists@lfdr.de>; Mon, 21 Aug 2023 16:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE329882D;
	Mon, 21 Aug 2023 16:04:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646628460
	for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 16:04:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06A183F1;
	Mon, 21 Aug 2023 18:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692633765;
	bh=FchihxCKYdKngHG7f+tybiBZlWbgj7Zz3HIh3QtUed8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJkDQlswq1iTBcbTZlHZTBhXPJjQt7BOKNE4QH1BF7wlwBue+2myQYHD+DB/uDN29
	 p85u/vfx0mSbulbACOmfqcqG37Y58XeMjuX4KQqCIp5jB8d9Eks0zDg061p9pYydNG
	 q27lG7jJpVTc+qEZt4V4MmGqivW1nN5Kxhp7TMOI=
Date: Mon, 21 Aug 2023 19:04:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230821160408.GK10135@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818152629.GA13558@pendragon.ideasonboard.com>
 <e1b0f9e6-8e40-4365-868b-8340153e6a9c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e1b0f9e6-8e40-4365-868b-8340153e6a9c@sirena.org.uk>

On Fri, Aug 18, 2023 at 05:10:07PM +0100, Mark Brown wrote:
> On Fri, Aug 18, 2023 at 06:26:29PM +0300, Laurent Pinchart wrote:
> > On Fri, Aug 18, 2023 at 03:55:11PM +0200, Linus Walleij wrote:
> 
> > > The DRI/DRM community has group maintainership that works a little
> > > bit.
> > > Essentially it boils down to ask people to review your stuff and you
> > > will review and also merge their stuff in return.
> > > Sometimes this works.
> > > Especially if you are a circle of acquaintances working full
> > > time on similar things, yay! So much support.
> > > When you are a sporadic contributor it doesn't work as well.
> > > Because you cannot always find some matching contribution to
> > > review and you feel like begging.
> > > So different solutions for different contributors may be needed.
> 
> > I've also experienced mixed results from "trading reviews". It's
> > certainly nice on paper, and it works sometimes, especially when asking
> > contributors to review patches that are directly related to their
> > business interest. I remember asking a contributor from a large company
> > to help me with reviews, to free some of my time to review their
> > patches. The contributor helped with reviewing third-party contributions
> > to the driver they're actively working on. When I asked for help
> > reviewing an entirely separate driver that their employer had no
> > business interest in, however, I faced the "we're busy and don't have
> > time" argument.
> >
> > Maybe part of the solution here, to share the maintenance burden, is to
> > expect contributors, especially the ones with large financial resources,
> > to spent a certain percentage of their time reviewing code that is in
> > their area of expertise but not in their area of business interest.
> 
> That issue with people having the background knowledge needed to
> adequately review things they don't have specific experience with can be
> a problem here.  It's not typically *harmful* other than issues with
> people doing disproportionately pedantic reviews (which can be a
> problem) but you do still need to keep an eye on things it can feel a
> bit make work so there's a balance with making it an explicit
> requirement.

Most of my reviews point of issues with usage of in-kernel and userspace
APIs, rather than problems specific to the hardware at hand. Developers
who contribute drivers with similar usage patterns of APIs should be
able to help there.

-- 
Regards,

Laurent Pinchart

