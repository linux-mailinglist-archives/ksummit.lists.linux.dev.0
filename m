Return-Path: <ksummit+bounces-198-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBB3A88A0
	for <lists@lfdr.de>; Tue, 15 Jun 2021 20:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 2C3BE3E0FFD
	for <lists@lfdr.de>; Tue, 15 Jun 2021 18:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517AF6D10;
	Tue, 15 Jun 2021 18:31:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE58E173
	for <ksummit@lists.linux.dev>; Tue, 15 Jun 2021 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LdNeCQqk9KCm4jhNoZuBIHJ86WosU4CQPfm1SU3padI=; b=KO1IdRXvN+FrSa4LuXBQM5beAj
	p6M9jwGEipbsxZZ5ZhfG9ektCNttJlPZgj6rtVgRjI/2oNQtEhx1T7e5aJRHb0UdT7hhuNdpaU4Ue
	lxyuh0pw2Y0wQnnEYiINPswBwZMvCgXM9QardUkii8XsOpypMJgS/y8ScYyE/aiwlGoaT5xLL9EE4
	0BA+1HHt2bvvTThMm/UPmFFtB30VWws5gH7o/Mfpfwf83ZdotS8ftqSlXphUO1EBACUqSENSntgUl
	7Tzee91mKhcO1T9mh6mF1mFW3mSZ4rWu7YHp3rKbAH5tmME6OcBqzCW8zNIiP1y0QaOjwJBde3/NS
	59ZrMfCg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltDp2-0077zr-Mq; Tue, 15 Jun 2021 18:30:05 +0000
Date: Tue, 15 Jun 2021 19:30:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: David Howells <dhowells@redhat.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
	Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <YMjxqEY25A6bm47s@casper.infradead.org>
References: <YLEIKk7IuWu6W4Sy@casper.infradead.org>
 <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <1745326.1623409807@warthog.procyon.org.uk>
 <e47706ee-3e4b-8f15-963f-292b5e47cb1d@metux.net>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e47706ee-3e4b-8f15-963f-292b5e47cb1d@metux.net>

On Tue, Jun 15, 2021 at 08:23:55PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 11.06.21 13:10, David Howells wrote:
> 
> > One thing that concerns me about flying to the US is going through multiple
> > busy international airports - take Heathrow which didn't separate incoming
> > travellers from red-listed countries from those of amber- or green- until like
> > a week ago.
> > 
> > Would it be practical/economical to charter a plane to fly, say, from a less
> > busy airport in Europe to a less busy airport in the US and back again if we
> > could get enough delegates together to make it worthwhile?
> 
> Wouldn't just taking prophylatic meds like CDS or HCQ and/or hi-dose
> vitamins (C, D3+K2) be way more cost effective and flexible than to
> charter a whole plane ?

Why don't you just shine a bright light up your arse?  It'll have the
same effect.

