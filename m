Return-Path: <ksummit+bounces-200-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0133A88BF
	for <lists@lfdr.de>; Tue, 15 Jun 2021 20:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 47ED53E1036
	for <lists@lfdr.de>; Tue, 15 Jun 2021 18:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8395F6D11;
	Tue, 15 Jun 2021 18:40:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A6A173
	for <ksummit@lists.linux.dev>; Tue, 15 Jun 2021 18:40:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 291F94A3;
	Tue, 15 Jun 2021 20:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1623782434;
	bh=3PIbXGv9WJI1oVxhJvXNkSPm3iTDDkwb4+U0QZuU0Og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOKnHeHlUSfcPRIdko29xFI6GP2fmpisAIJ6Onm7DlneHJGVJKPUxvVhF8FYC5NM6
	 UR2g9IMb8ZjktLcaBkak79fOt1R4hAqkpDGUuD3835VghpbN0dmve9UuPmYperfmxT
	 UdKLjXeh0fnkqPW+In7A3ix2QHQmwBRxrgekZ1yU=
Date: Tue, 15 Jun 2021 21:40:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
	David Howells <dhowells@redhat.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
	Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <YMj0Del0tnZ+dRM/@pendragon.ideasonboard.com>
References: <YLEIKk7IuWu6W4Sy@casper.infradead.org>
 <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <1745326.1623409807@warthog.procyon.org.uk>
 <e47706ee-3e4b-8f15-963f-292b5e47cb1d@metux.net>
 <YMjxqEY25A6bm47s@casper.infradead.org>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMjxqEY25A6bm47s@casper.infradead.org>

On Tue, Jun 15, 2021 at 07:30:00PM +0100, Matthew Wilcox wrote:
> On Tue, Jun 15, 2021 at 08:23:55PM +0200, Enrico Weigelt, metux IT consult wrote:
> > On 11.06.21 13:10, David Howells wrote:
> > 
> > > One thing that concerns me about flying to the US is going through multiple
> > > busy international airports - take Heathrow which didn't separate incoming
> > > travellers from red-listed countries from those of amber- or green- until like
> > > a week ago.
> > > 
> > > Would it be practical/economical to charter a plane to fly, say, from a less
> > > busy airport in Europe to a less busy airport in the US and back again if we
> > > could get enough delegates together to make it worthwhile?
> > 
> > Wouldn't just taking prophylatic meds like CDS or HCQ and/or hi-dose
> > vitamins (C, D3+K2) be way more cost effective and flexible than to
> > charter a whole plane ?
> 
> Why don't you just shine a bright light up your arse?  It'll have the
> same effect.

Could we please, as requested early on by Konstantin, restrict
COVID19-related discussions on this mailing list solely to how it would
impact travel to/from the conference ?

For those who want to debate the merits of various medicines, feel free
to create your own mailing list, or an IRC channel on Freenode.

-- 
Regards,

Laurent Pinchart

