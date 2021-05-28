Return-Path: <ksummit+bounces-176-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F934394577
	for <lists@lfdr.de>; Fri, 28 May 2021 17:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 327873E0F4A
	for <lists@lfdr.de>; Fri, 28 May 2021 15:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CA26D11;
	Fri, 28 May 2021 15:55:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB51C2FB4
	for <ksummit@lists.linux.dev>; Fri, 28 May 2021 15:55:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3147E145A;
	Fri, 28 May 2021 17:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1622217327;
	bh=PYQUxKB6qr/x39dXUXRBEnFxFW0a82BQUphJx+n6PFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thVS00BUTw/GzFkiPI916NBupzLD4gZjAcLuEafGYvfQClaN6vN81nvk7Ns18XAkG
	 +w3+xT+QKa6Hr5RxqUkdZxYmMMifscU/BPwHPFUJQEfqeuI6mgJDKwvzguZP6Y4hoO
	 NtC4aeY96H2bESHDlElLvlRm5jhrgqFrA7aMFQvs=
Date: Fri, 28 May 2021 18:55:20 +0300
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
Message-ID: <YLESaAP/Bu95ACvU@pendragon.ideasonboard.com>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <YLEIKk7IuWu6W4Sy@casper.infradead.org>
 <a8bbc5dab99a4af6e89a9521a5eb4cb4747d2afe.camel@HansenPartnership.com>
 <YLEM2WE0ezdrfMPt@pendragon.ideasonboard.com>
 <15419fa8e5c0047327395387b28c09d775b35a55.camel@HansenPartnership.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <15419fa8e5c0047327395387b28c09d775b35a55.camel@HansenPartnership.com>

Hi James,

On Fri, May 28, 2021 at 08:44:23AM -0700, James Bottomley wrote:
> On Fri, 2021-05-28 at 18:31 +0300, Laurent Pinchart wrote:
> > On Fri, May 28, 2021 at 08:27:44AM -0700, James Bottomley wrote:
> [...]
> > > Well, I'm not going to get into a debate over the effectiveness of
> > > the current vaccines.  I will say that all conferences have to now
> > > recognize that a sizeable proportion of former attendees will have
> > > fears about travelling and therefore remote components are going to
> > > be a fixture of conferences going forward.
> > > 
> > > However, while we should accommodate them, we can't let these fears
> > > override people willing to take the risk and meet in person.
> > 
> > The interesting question is how we'll make sure that those people
> > will not be de facto excluded from the community, or end up as
> > second-class citizens.
> 
> Before the pandemic, there was a small contingent who refused to fly
> for various reasons.  We did sort of accommodate that by rotating the
> conference to Europe where more people could come in by train (like
> they did in Lisbon) but we didn't govern the whole conference by trying
> to make aerophobes first class citizens.
> 
> The bottom line is that as long as enough people are willing to meet in
> person and in-person delivers more value that remote (even though we'll
> try to make remote as valuable as possible) we should do it.   We
> should not handicap the desires of the one group by the fears of the
> other because that's a false equality ... it's reducing everyone to the
> level of the lowest common denominator rather than trying to elevate
> people.

This should take into account the size of each group, and I believe even
then it won't be a binary decision, there's lots of variation in local
situations, creating more than just two groups of coward/careless people
(let's not debate those two words if possible, they're not meant to
insult anyway, but to emphasize that there are more categories). While I
believe that in-person meetings will become the norm again in a
reasonably near future, 2021 seems a bit premature to me.

If we want to brainstorm alternate solutions, an option could be to
split the monolithic conference location into a small set of
geographically distributed groups (assuming local travel would be easier
and generally seen as an accepted solution compared to intercontinental
travels) and link those through video conferencing. I don't have high
hopes that this would be feasible in practice given the increase in
efforts and costs to organize multiple locations in parallel, but maybe
something interesting could come out of discussing different options.

-- 
Regards,

Laurent Pinchart

