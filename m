Return-Path: <ksummit+bounces-666-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEA5550B3A
	for <lists@lfdr.de>; Sun, 19 Jun 2022 16:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A4D280ABC
	for <lists@lfdr.de>; Sun, 19 Jun 2022 14:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9B92583;
	Sun, 19 Jun 2022 14:45:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41957B
	for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655649902;
	bh=fJPkA62fgfmVs/hnWivoF8CBXeslkpEcdFD+ZdmddaQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=mMBxgGQmsvYHNWd4cVgKSkFpJ1z/PVH1OyirYT/gApRENG76gWVe6uSkYlmJ6oCgS
	 nqzOSO/A9g6Yz1O7mAJrhvquOGJYy3PShnJUa4sMIbhakP2ljVPuEVB4eD1GvUcXGM
	 smqEZQ9Sk8ink4Bd1+JdCOaoNhR7CwRA1oZUrYLY=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 366DD128070E;
	Sun, 19 Jun 2022 10:45:02 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLRBT9mTDAVj; Sun, 19 Jun 2022 10:45:02 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655649902;
	bh=fJPkA62fgfmVs/hnWivoF8CBXeslkpEcdFD+ZdmddaQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=mMBxgGQmsvYHNWd4cVgKSkFpJ1z/PVH1OyirYT/gApRENG76gWVe6uSkYlmJ6oCgS
	 nqzOSO/A9g6Yz1O7mAJrhvquOGJYy3PShnJUa4sMIbhakP2ljVPuEVB4eD1GvUcXGM
	 smqEZQ9Sk8ink4Bd1+JdCOaoNhR7CwRA1oZUrYLY=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 779B31280402;
	Sun, 19 Jun 2022 10:45:01 -0400 (EDT)
Message-ID: <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
Subject: [MAINTAINER SUMMIT] Are we becoming too fearful? [was Re: [TECH
 TOPIC] Rust]
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jens Axboe
	 <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>, Miguel Ojeda
	 <miguel.ojeda.sandonis@gmail.com>, ksummit
	 <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Date: Sun, 19 Jun 2022 10:45:00 -0400
In-Reply-To: <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
References: 
	<CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
	 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
	 <Yq6+p+aRCjeZ7QsS@infradead.org>
	 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
	 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
	 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
	 <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
	 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2022-06-19 at 10:27 -0400, James Bottomley wrote:
> On Sun, 2022-06-19 at 16:53 +0300, Laurent Pinchart wrote:
[...]
> >  Whether it's worth the gain or not is not for me to decide,
> > but I'm certainly concerned that it could lead to a catastrophe if
> > we don't carefully think about the issues, acknowledge them, and
> > find ways to solve them. I don't think winging it is a real option
> > here, but I'd be more than happy to be shown that my concerns are
> > not founded :-)
> 
> Have more faith in the community and open source process. We've
> screwed up many times (devfs anyone ...) learned from the mistake and
> fixed it. I'm happy to bet that accepting Rust will be no different
> from all the other screwups we allowed in and later fixed.  So I
> don't think there will be a catastrophe.  Either the rust experiment
> works or it will become fairly quickly apparent if it doesn't and it
> will get removed.  The worst case, I suppose, is that the benefit is
> marginal in which case there's no consensus on removal vs
> continuation and we simply continue through inertia.  I bet in that
> situation Rust penetration will be fairly minimal and confined to
> enthusiastic subsystems with the rest taking steps to isolate
> themselves from it.  What we'd need in this case is some opinionated
> person running the tree and able to make the call for us ... now who
> could that be?

I think there's a growing problem in Linux which is exemplified by this
Rust debate but which goes way beyond it: We're becoming too fearful of
making big decisions to sustain innovation in some areas.  This really
is a creeping cancer of inertia that has destroyed many projects before
us and if we're not careful, we'll go the same way.

The biggest area where we currently squelch innovation is around
anything that touches the user space ABI.  Allegations of having to get
everything right ab initio because we have to support it "forever" and
all the subsequent wittering and second guessing are really stifling
innovation in pretty much anything that could be exposed to user space.
I really think, to counter this, we need a crash course reminder of all
of our mistakes and how we climbed out of the hole they dug us into,
because without that we're becoming too fearful of making mistakes.

The object is not to avoid mistakes at any cost, it's to be confident
that if you make them, you're good enough to find a pathway out of them
again.

James



