Return-Path: <ksummit+bounces-1712-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E4A3C442
	for <lists@lfdr.de>; Wed, 19 Feb 2025 16:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87A3C7A6F63
	for <lists@lfdr.de>; Wed, 19 Feb 2025 15:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A90A1D5175;
	Wed, 19 Feb 2025 15:56:27 +0000 (UTC)
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8284C1FCCF5
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739980587; cv=none; b=jzS8pLE0FFWf7LQh8N21eXqTi+GCE9FRPNdQwjcpuyP9fag1sMTA9Mv6bq6YBMrQkTSyAdACdnVHaqkAWYA8epo1v1WpgeS5bR2RWQAALflCi1vZIRYrZ45t+tTUfsLeypbf6f0m38VzfrC9MCXkEtCXKDbCAX3nbmr2pg9g6Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739980587; c=relaxed/simple;
	bh=qPZnrOyaKEYq5hbsMRbqV7X6oIhpSL4apigxMYTnzfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7k3vMToJ1xZZ2zuQ/SLtLuxAraoPilbksBtI293ncffPEEhUJlRZVvV49ZKBDJVb1hMD3Auh+feZYAQfZZMfbv/jFkNIxpmSMt7FEhdv95DRHOFECRkp7q2ObQl54raAjQjerUYalMBUHr9+DTwO/KUGHdKbL7yUEiiZyqd/jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 51JFuHFe022922;
	Wed, 19 Feb 2025 16:56:17 +0100
Date: Wed, 19 Feb 2025 16:56:17 +0100
From: Willy Tarreau <w@1wt.eu>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>, David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <20250219155617.GH19203@1wt.eu>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
 <b7a3958e-7a0a-482e-823a-9d6efcb4b577@stanley.mountain>
 <2bcf7cb500403cb26ad04934e664f34b0beafd18.camel@HansenPartnership.com>
 <yq1mseim24a.fsf@ca-mkp.ca.oracle.com>
 <c1693d15d0a9c8b7d194535f88cbc5b07b5740e5.camel@HansenPartnership.com>
 <20250219153350.GG19203@1wt.eu>
 <e42e8e79a539849419e475ef8041e87b3bccbbfe.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e42e8e79a539849419e475ef8041e87b3bccbbfe.camel@HansenPartnership.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Feb 19, 2025 at 10:46:03AM -0500, James Bottomley wrote:
> > > > I like using cleanup attributes for some error handling. However,
> > > > I'm finding that in many cases I want to do a bit more than a
> > > > simple kfree(). And at that point things get syntactically messy
> > > > in the variable declarations and harder to read than just doing a
> > > > classic goto style unwind.
> > > 
> > > So the way systemd solves this is that they define a whole bunch of
> > > _cleanup_<type>_ annotations which encode the additional logic.  It
> > > does mean you need a globally defined function for each cleanup
> > > type, but judicious use of cleanup types seems to mean they only
> > > have a few dozen of these.
> > 
> > I may be missing something obvious, but this seems super dangerous to
> > me to perform lightly without reference counting, as it increases the
> > risks of use-after-free and double-free in case one of the allocated
> > objects in question can sometimes be returned.
> 
> Who said anything about not reference counting?

Nobody, but it was not said either that they were used at all!

>  One the things the
> _cleanup_X annotations can do is drop references (or even locks).

OK then!

> >  Users of such mechanisms must be extremely cautious never to ever
> > return a pointer derivated from a variable tagged as such, or to
> > properly NULL-assign the original object for it not to double-free.
> > So it might in the end require to be careful about null-setting on
> > return instead of explicitly freeing what was explicitly allocated.
> > I'm not sure about the overall benefit.
> > Also I suspect it encourages to multiply the return points, which
> > makes it even more difficult to possibly fix what needs to be fixed
> > without coming from a locally allocated variable (e.g. restore a
> > state in a parser etc). Maybe it's just me not seeing the whole
> > picture, but as a general case I prefer to forget a free() call
> > (worst case: memory leak) than forget a foo=NULL that may result in a
> > double free, and the description here makes me think the latter might
> > more easily happen.
> 
> Well we could all speculate about the mess we'll make with any new
> tool.  All I'm saying is that another project with a large code base
> (systemd), which you can go an look at, managed to use these
> annotations very successfully to simplify their error legs. Perhaps
> there are reasons why the kernel can't be as successful, but I think
> assuming failure from the outset isn't the best way to flush these
> reasons out.

I'm not trying to assume failure or anything, just saying that it's
probably not always as simple as calling kfree() on anything locally
allocated for error paths to be magically cleaned, and it actually is
more subtle (and Laurent confirmed my concerns illustrating that this
case is precisely covered in glib using transfer of ownership).

And the temptation to return from everywhere since it's the only
required statement (instead of a goto to a collecting place) becomes
great and should sometimes be resisted to.

Regardless I do understand how these cleanups can help in a number of
case, at least to avoid some code duplication.

Regards,
Willy

