Return-Path: <ksummit+bounces-172-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F4394510
	for <lists@lfdr.de>; Fri, 28 May 2021 17:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 873563E0E54
	for <lists@lfdr.de>; Fri, 28 May 2021 15:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010546D11;
	Fri, 28 May 2021 15:27:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029842FB4
	for <ksummit@lists.linux.dev>; Fri, 28 May 2021 15:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 6EF09128071E;
	Fri, 28 May 2021 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1622215665;
	bh=osCrxTvDh4I+PoJ7BKkBl97R93DA/+e7bAH6MdgTeSI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=KGzcweLRpZJiNtjicmP7GawbNpp2wt/qkigwf7AsUJufRuvAoEXDVHONLV1t8YF4J
	 4Eyvf/ij6oWOzPz5wCkNeFrBGGJIUCJiYKP/0q0nyNrnVoe4Fvtab5jsxid9ABimQU
	 o7g/oKObcSQE+NgzTamNsHBWc4aBYAvuL3tleewg=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bSamE-ryG6k; Fri, 28 May 2021 08:27:45 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B1282128071C;
	Fri, 28 May 2021 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1622215665;
	bh=osCrxTvDh4I+PoJ7BKkBl97R93DA/+e7bAH6MdgTeSI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=KGzcweLRpZJiNtjicmP7GawbNpp2wt/qkigwf7AsUJufRuvAoEXDVHONLV1t8YF4J
	 4Eyvf/ij6oWOzPz5wCkNeFrBGGJIUCJiYKP/0q0nyNrnVoe4Fvtab5jsxid9ABimQU
	 o7g/oKObcSQE+NgzTamNsHBWc4aBYAvuL3tleewg=
Message-ID: <a8bbc5dab99a4af6e89a9521a5eb4cb4747d2afe.camel@HansenPartnership.com>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>, Theodore
 Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev,  linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org,  linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org,  linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org
Date: Fri, 28 May 2021 08:27:44 -0700
In-Reply-To: <YLEIKk7IuWu6W4Sy@casper.infradead.org>
References: <YH2hs6EsPTpDAqXc@mit.edu>
	 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
	 <YIx7R6tmcRRCl/az@mit.edu>
	 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
	 <YK+esqGjKaPb+b/Q@kroah.com>
	 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
	 <YLEIKk7IuWu6W4Sy@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2021-05-28 at 16:11 +0100, Matthew Wilcox wrote:
> On Fri, May 28, 2021 at 07:58:10AM -0700, James Bottomley wrote:
> > On Thu, 2021-05-27 at 15:29 +0200, Greg KH wrote:
> > > On Thu, May 27, 2021 at 03:23:03PM +0200, Christoph Lameter
> > > wrote:
> > > > On Fri, 30 Apr 2021, Theodore Ts'o wrote:
> > > > 
> > > > > I know we're all really hungry for some in-person meetups and
> > > > > discussions, but at least for LPC, Kernel Summit, and
> > > > > Maintainer's Summit, we're going to have to wait for another
> > > > > year,
> > > > 
> > > > Well now that we are vaccinated: Can we still change it?
> > > > 
> > > 
> > > Speak for yourself, remember that Europe and other parts of the
> > > world are not as "flush" with vaccines as the US currently is :(
> > 
> > The rollout is accelerating in Europe.  At least in Germany, I know
> > people younger than me are already vaccinated.  I think by the end
> > of September the situation will be better ... especially if the EU
> > and US agree on this air bridge (and the US actually agrees to let
> > EU people in).
> > 
> > One of the things Plumbers is thinking of is having a meetup at
> > what was OSS EU but which is now in Seattle.  The Maintainer's
> > summit could do the same thing.  We couldn't actually hold Plumbers
> > in Seattle because the hotels still had masks and distancing
> > requirements for events that effectively precluded the
> > collaborative aspects of microconferences, but evening events will
> > be governed by local protocols, rather than the Hotel, which are
> > already more relaxed.
> 
> Umm.  Let's remember that the vaccines are 33-93% effective [1],
> which means that there's approximately a 100% certainty that at least
> one person arriving at the event from a trans-atlantic flight has
> been exposed to someone who has the virus.  I'm not convinced that
> holding a "more relaxed protocol" event is a great idea.

Well, I'm not going to get into a debate over the effectiveness of the
current vaccines.  I will say that all conferences have to now
recognize that a sizeable proportion of former attendees will have
fears about travelling and therefore remote components are going to be
a fixture of conferences going forward.

However, while we should accommodate them, we can't let these fears
override people willing to take the risk and meet in person.

James



