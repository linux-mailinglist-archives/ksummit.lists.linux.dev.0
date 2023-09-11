Return-Path: <ksummit+bounces-1121-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96B79A0FB
	for <lists@lfdr.de>; Mon, 11 Sep 2023 03:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3884C1C208C8
	for <lists@lfdr.de>; Mon, 11 Sep 2023 01:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6389617D1;
	Mon, 11 Sep 2023 01:29:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from out-219.mta1.migadu.com (out-219.mta1.migadu.com [95.215.58.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE117C8
	for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 01:29:20 +0000 (UTC)
Date: Sun, 10 Sep 2023 21:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1694395758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a/067N3kX+ABJDEuP6c43RBjZCPIIWi7C+j2z8M68tY=;
	b=kQNIn3zWOTrxcr9QErpabo2qo29sdXDkHwVXFQaRX5eE8vQKeFwU/PWjUoDRGRHMH603Fz
	fnapEZr8W2VrSSXqN55pf6QSlY+Q5sxxFXRiv+pD6jwt9e1MBgJcWtmc5eAbY1HEyKvcSi
	Nz2u2vAva1xNw8fHxw98SPeUOxOOKvE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Dave Chinner <david@fromorbit.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <20230911012914.xoeowcbruxxonw7u@moria.home.lan>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <20230909224230.3hm4rqln33qspmma@moria.home.lan>
 <ZP5nxdbazqirMKAA@dread.disaster.area>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZP5nxdbazqirMKAA@dread.disaster.area>
X-Migadu-Flow: FLOW_OUT

On Mon, Sep 11, 2023 at 11:05:09AM +1000, Dave Chinner wrote:
> On Sat, Sep 09, 2023 at 06:42:30PM -0400, Kent Overstreet wrote:
> > On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:
> > > So why can't we figure out that easier way? What's wrong with trying to
> > > figure out if we can do some sort of helper or library set that assists
> > > supporting and porting older filesystems. If we can do that it will not
> > > only make the job of an old fs maintainer a lot easier, but it might
> > > just provide the stepping stones we need to encourage more people climb
> > > up into the modern VFS world.
> > 
> > What if we could run our existing filesystem code in userspace?
> 
> You mean like lklfuse already enables?

I'm not seeing that it does?

I just had a look at the code, and I don't see anything there related to
the VFS - AFAIK, a VFS -> fuse layer doesn't exist yet.

And that looks a lot heavier than what we'd ideally want, i.e. a _lot_
more kernel code would be getting pulled in. The entire block layer,
probably the scheduler as well.

What I've got in bcachefs-tools is a much thinner mapping from e.g.
kthreads -> pthreads, block layer -> aio, etc.

