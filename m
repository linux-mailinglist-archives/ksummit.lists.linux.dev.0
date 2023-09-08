Return-Path: <ksummit+bounces-1106-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA61D79847A
	for <lists@lfdr.de>; Fri,  8 Sep 2023 10:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C1021C20C5B
	for <lists@lfdr.de>; Fri,  8 Sep 2023 08:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FB420F3;
	Fri,  8 Sep 2023 08:55:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3D1849
	for <ksummit@lists.linux.dev>; Fri,  8 Sep 2023 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H8K/XrghSHxCL6s/bo9FD1IkrVMvH7WV4gO6kwb9oWI=; b=E5vl7U9ac+Qs05naYWAfjpTo4o
	paN9NxhCtlikWZuR9SUxdcZz8fBxo88NSG3YeJ1xPJpS2dmRC8lv+K0xTDRPXp6Lg2+lD40LpRLT7
	D7M3z0NXcUAEoUoDVg6qwEnCwWz7daF3ya/IAHrAVL7SWlkK/DP3G+yW0f7Tzy1VYGE8ZWCf1T6fy
	8xbAkIvMqh1dQpW5JyuE4oFwb9RE8WbtRJLXu+aQFqQLQKYgTZjyqkxpMOusTADldiTrJ4wftN/TR
	+hxZM1m3+epgGztWecvqGznVRZFxJrHbih5ONUPZleGX4TN7/qY7mA2op64/yOiAsH8P9xRhz7pgr
	PUtYoURg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qeXGh-00DM5M-23;
	Fri, 08 Sep 2023 08:55:11 +0000
Date: Fri, 8 Sep 2023 01:55:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPrhb9ncxrylmVyP@infradead.org>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPe0bSW10Gj7rvAW@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Sep 06, 2023 at 09:06:21AM +1000, Dave Chinner wrote:
> I think this completely misses the point of contention of the larger
> syzbot vs filesystem discussion: the assertion that "testing via
> syzbot means the subsystem is secure" where "secure" means "can be
> used safely for operations that involve trust model violations".
> 
> Fundamentally, syzbot does nothing to actually validate the
> filesystem is "secure". Fuzzing can only find existing bugs by
> simulating an attacker, but it does nothing to address the
> underlying issues that allow that attack channel to exist.

I don't think anyone makes that assertation.  Instead the assumptions
is something that is handling untrusted input should be available to
surive fuzzing by syzbot, and that's an assumption I agree with.  That
doesn't imply anything surving syzbot is secure, but it if doesn't
survive syzbot it surely can't deal with untrusted input.

> > unmaintained.  If we want to move the kernel forward by finishing
> > API transitions (new mount API, buffer_head removal for the I/O path,
> > ->writepage removal, etc) these file systems need to change as well
> > and need some kind of testing.  The easiest way forward would be
> > to remove everything that is not fully maintained, but that would
> > remove a lot of useful features.
> 
> Linus has explicitly NACKed that approach.
> 
> https://lore.kernel.org/linux-fsdevel/CAHk-=wg7DSNsHY6tWc=WLeqDBYtXges_12fFk1c+-No+fZ0xYQ@mail.gmail.com/

.. and that is why I'm bring this up in a place where we can have
a proper procedural discussion instead of snarky remarks.  This is
a fundamental problem we;ll need to sort out.

> Which is a problem, because historically we've taken code into
> the kernel without requiring a maintainer, or the people who
> maintained the code have moved on, yet we don't have a policy for
> removing code that is slowly bit-rotting to uselessness.

... and we keep merging crap that goes against all established normal
requirements when people things it's new and shiny and cool :(


