Return-Path: <ksummit+bounces-173-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E196139451C
	for <lists@lfdr.de>; Fri, 28 May 2021 17:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CCFC81C0EA1
	for <lists@lfdr.de>; Fri, 28 May 2021 15:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810C86D11;
	Fri, 28 May 2021 15:31:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6832FB4
	for <ksummit@lists.linux.dev>; Fri, 28 May 2021 15:31:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45CC9145A;
	Fri, 28 May 2021 17:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1622215904;
	bh=TmOoDl2AnuV3du1VYtibh4qbuBDtuSYfs6d1I6SCWhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhF4pb1Wjnrn71yvp1POtRJnTOXT0enKJ3i50tGGPYdJy4NuV39F4wBxcBJiebE/n
	 40xUUHPJapmH0uneXcELM+yZx28Aj/9EMPVR2iCrMw+G7zyRSQ03DoY5WKWr0xLEzM
	 DA4F/ZzdqyLM8SZbkMuhO/xzuY3dM3vqzAfB8Vpo=
Date: Fri, 28 May 2021 18:31:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Matthew Wilcox <willy@infradead.org>, Greg KH <greg@kroah.com>,
	Christoph Lameter <cl@gentwo.de>, Theodore Ts'o <tytso@mit.edu>,
	Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	netdev@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <YLEM2WE0ezdrfMPt@pendragon.ideasonboard.com>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <YLEIKk7IuWu6W4Sy@casper.infradead.org>
 <a8bbc5dab99a4af6e89a9521a5eb4cb4747d2afe.camel@HansenPartnership.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8bbc5dab99a4af6e89a9521a5eb4cb4747d2afe.camel@HansenPartnership.com>

On Fri, May 28, 2021 at 08:27:44AM -0700, James Bottomley wrote:
> On Fri, 2021-05-28 at 16:11 +0100, Matthew Wilcox wrote:
> > On Fri, May 28, 2021 at 07:58:10AM -0700, James Bottomley wrote:
> > > On Thu, 2021-05-27 at 15:29 +0200, Greg KH wrote:
> > > > On Thu, May 27, 2021 at 03:23:03PM +0200, Christoph Lameter
> > > > wrote:
> > > > > On Fri, 30 Apr 2021, Theodore Ts'o wrote:
> > > > > 
> > > > > > I know we're all really hungry for some in-person meetups and
> > > > > > discussions, but at least for LPC, Kernel Summit, and
> > > > > > Maintainer's Summit, we're going to have to wait for another
> > > > > > year,
> > > > > 
> > > > > Well now that we are vaccinated: Can we still change it?
> > > > 
> > > > Speak for yourself, remember that Europe and other parts of the
> > > > world are not as "flush" with vaccines as the US currently is :(
> > > 
> > > The rollout is accelerating in Europe.  At least in Germany, I know
> > > people younger than me are already vaccinated.  I think by the end
> > > of September the situation will be better ... especially if the EU
> > > and US agree on this air bridge (and the US actually agrees to let
> > > EU people in).
> > > 
> > > One of the things Plumbers is thinking of is having a meetup at
> > > what was OSS EU but which is now in Seattle.  The Maintainer's
> > > summit could do the same thing.  We couldn't actually hold Plumbers
> > > in Seattle because the hotels still had masks and distancing
> > > requirements for events that effectively precluded the
> > > collaborative aspects of microconferences, but evening events will
> > > be governed by local protocols, rather than the Hotel, which are
> > > already more relaxed.
> > 
> > Umm.  Let's remember that the vaccines are 33-93% effective [1],
> > which means that there's approximately a 100% certainty that at least
> > one person arriving at the event from a trans-atlantic flight has
> > been exposed to someone who has the virus.  I'm not convinced that
> > holding a "more relaxed protocol" event is a great idea.
> 
> Well, I'm not going to get into a debate over the effectiveness of the
> current vaccines.  I will say that all conferences have to now
> recognize that a sizeable proportion of former attendees will have
> fears about travelling and therefore remote components are going to be
> a fixture of conferences going forward.
> 
> However, while we should accommodate them, we can't let these fears
> override people willing to take the risk and meet in person.

The interesting question is how we'll make sure that those people will
not be de facto excluded from the community, or end up as second-class
citizens.

-- 
Regards,

Laurent Pinchart

