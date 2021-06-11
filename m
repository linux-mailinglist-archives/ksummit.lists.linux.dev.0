Return-Path: <ksummit+bounces-196-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6B3A40DD
	for <lists@lfdr.de>; Fri, 11 Jun 2021 13:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 062A41C0EB9
	for <lists@lfdr.de>; Fri, 11 Jun 2021 11:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DC12FBF;
	Fri, 11 Jun 2021 11:10:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9270
	for <ksummit@lists.linux.dev>; Fri, 11 Jun 2021 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623409817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dh0bJRcSaHuNu8U4NSShPd3vbPRVolZwKmUYsaTKAQw=;
	b=dotiEiwy4aaU3Y4UEvLZkayeanyp8SjZCnTBwv8evA2IIUgk+mFhvHVVuLsZRJjv5oeXqu
	w2qMqDBU9lhLOQwFAAAAq0CoOduBmsKZuhHEew3IS7XWA47F80r1vtDZvwLMjO/mkIm0pg
	jG8/N0ChnYTA7CvzmYYdPVzYrnNj4Fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-7nA1G_z5PKijruvWiu4UjA-1; Fri, 11 Jun 2021 07:10:13 -0400
X-MC-Unique: 7nA1G_z5PKijruvWiu4UjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C87B08BB401;
	Fri, 11 Jun 2021 11:10:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com [10.10.112.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCFA81001281;
	Fri, 11 Jun 2021 11:10:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YLEIKk7IuWu6W4Sy@casper.infradead.org>
References: <YLEIKk7IuWu6W4Sy@casper.infradead.org> <YH2hs6EsPTpDAqXc@mit.edu> <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm> <YIx7R6tmcRRCl/az@mit.edu> <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de> <YK+esqGjKaPb+b/Q@kroah.com> <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: dhowells@redhat.com,
    James Bottomley <James.Bottomley@hansenpartnership.com>,
    Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
    Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
    ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1745325.1623409807.1@warthog.procyon.org.uk>
Date: Fri, 11 Jun 2021 12:10:07 +0100
Message-ID: <1745326.1623409807@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

Matthew Wilcox <willy@infradead.org> wrote:

> Umm.  Let's remember that the vaccines are 33-93% effective [1],
> which means that there's approximately a 100% certainty that at least
> one person arriving at the event from a trans-atlantic flight has been
> exposed to someone who has the virus.  I'm not convinced that holding a
> "more relaxed protocol" event is a great idea.

One thing that concerns me about flying to the US is going through multiple
busy international airports - take Heathrow which didn't separate incoming
travellers from red-listed countries from those of amber- or green- until like
a week ago.

Would it be practical/economical to charter a plane to fly, say, from a less
busy airport in Europe to a less busy airport in the US and back again if we
could get enough delegates together to make it worthwhile?

Chartering seems to be costed on miles flown rather than passenger count, but
I've only looked into it very briefly.

David


