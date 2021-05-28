Return-Path: <ksummit+bounces-171-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E43944DD
	for <lists@lfdr.de>; Fri, 28 May 2021 17:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5F1DD3E0E9F
	for <lists@lfdr.de>; Fri, 28 May 2021 15:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED7C6D11;
	Fri, 28 May 2021 15:11:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457D42FB4
	for <ksummit@lists.linux.dev>; Fri, 28 May 2021 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DKqV70MMMK3G6vetpPVH3agOFHnwPsPuzF2wR4m/9r8=; b=EiNIcVQXpM/nr6D6KBoUNOviYJ
	/d+VzVV6EQmbOPYoJ2fsaoNxs+05SzPCb72qQuUNR1UVoa/DdpoGHza5kblsDuN73rG5Yh5IgXeVW
	a5tJFw8kX0WbgLn9ke23nLEhwfAycVa82ApYgkzJIAO0C8RSgVax5NS5sL4kApo1OXGk+oAYfzk0G
	cwQiIeyz8laGNuTQy9RKj5RSnZfYSNHvRNHA5aNIXouBbT1mbc3SQag5xfmqw34OBxx1r7ArBUogr
	+9z4/1YKrc6LdWlXgK0b1dGXivcm5GWP3QL/dAs5pSIWBPuIN8GG5+BBnsJlIRESAKhgjyTYq9PLm
	YPiYZekw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lme9C-006jtR-8E; Fri, 28 May 2021 15:11:39 +0000
Date: Fri, 28 May 2021 16:11:38 +0100
From: Matthew Wilcox <willy@infradead.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
	Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <YLEIKk7IuWu6W4Sy@casper.infradead.org>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>

On Fri, May 28, 2021 at 07:58:10AM -0700, James Bottomley wrote:
> On Thu, 2021-05-27 at 15:29 +0200, Greg KH wrote:
> > On Thu, May 27, 2021 at 03:23:03PM +0200, Christoph Lameter wrote:
> > > On Fri, 30 Apr 2021, Theodore Ts'o wrote:
> > > 
> > > > I know we're all really hungry for some in-person meetups and
> > > > discussions, but at least for LPC, Kernel Summit, and
> > > > Maintainer's Summit, we're going to have to wait for another
> > > > year,
> > > 
> > > Well now that we are vaccinated: Can we still change it?
> > > 
> > 
> > Speak for yourself, remember that Europe and other parts of the world
> > are not as "flush" with vaccines as the US currently is :(
> 
> The rollout is accelerating in Europe.  At least in Germany, I know
> people younger than me are already vaccinated.  I think by the end of
> September the situation will be better ... especially if the EU and US
> agree on this air bridge (and the US actually agrees to let EU people
> in).
> 
> One of the things Plumbers is thinking of is having a meetup at what
> was OSS EU but which is now in Seattle.  The Maintainer's summit could
> do the same thing.  We couldn't actually hold Plumbers in Seattle
> because the hotels still had masks and distancing requirements for
> events that effectively precluded the collaborative aspects of
> microconferences, but evening events will be governed by local
> protocols, rather than the Hotel, which are already more relaxed.

Umm.  Let's remember that the vaccines are 33-93% effective [1],
which means that there's approximately a 100% certainty that at least
one person arriving at the event from a trans-atlantic flight has been
exposed to someone who has the virus.  I'm not convinced that holding a
"more relaxed protocol" event is a great idea.

[1] Depending exactly which vaccine, which variant, how many doses, etc, etc
https://www.sciencemediacentre.org/expert-reaction-to-preprint-from-phe-on-vaccine-effectiveness-against-the-b-1-617-2-indian-variant/


