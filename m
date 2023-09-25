Return-Path: <ksummit+bounces-1186-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6660A7AD4A3
	for <lists@lfdr.de>; Mon, 25 Sep 2023 11:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id AFB20B2098C
	for <lists@lfdr.de>; Mon, 25 Sep 2023 09:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CD913FEE;
	Mon, 25 Sep 2023 09:38:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9558B13FFB
	for <ksummit@lists.linux.dev>; Mon, 25 Sep 2023 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xkLcGwG2sfMkHkxG4/noaW4YYdP1mkNN6we6wlmfT00=; b=LaICF3w3iIyyZUNhfYP4OPuj+K
	4V7sR3px/7x3riN+8pPbbbeQh2W6psT4kJ4M1Qs69/bjUoHPIlmo4P6JOuhpjUc+9ioZtgQ0Ve+MJ
	+vBLbe9kpLUzqK9EHx5LTCK2lyVTjAE2pgj6wxodrixYc/t1xXZvgMeXLkYR7RtEpjMhPVBSYe7XI
	0RanCTpizHSRn+YCwgtv9dOn1L+dMeF7Th630EWuBdwnxG+Qh+U9WFBBeCDnii3GSPzWOE3nwvRM9
	npJ6wdrpYzEjEhU1+LYJ/GEWIZvQbPz0KzK9hvKvVKhsfCipddqaPnDm6wX5p/u9m7EXt5X3/p4Pz
	vAvupWuw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qki35-00Ds7v-1M;
	Mon, 25 Sep 2023 09:38:39 +0000
Date: Mon, 25 Sep 2023 02:38:39 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eric Sandeen <sandeen@sandeen.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dave Chinner <david@fromorbit.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZRFVH3iJX8scrFvn@infradead.org>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Sep 13, 2023 at 10:03:55AM -0700, Linus Torvalds wrote:
> I haven't actually heard a good reason to really stop supporting
> these. Using some kind of user-space library is ridiculous. It's *way*
> more effort than just keeping them in the kernel. So anybody who says
> "just move them to user space" is just making things up.
> 
> The reasons I have heard are:
> 
>  - security
> 
> Yes, don't enable them, and if you enable them, don't auto-mount them
> on hot-pkug devices. Simple. People in this thread have already
> pointed to the user-space support for it happening.

Which honetly doesn't work, as the status will change per kernel
version.  If we are serius about it we need proper in-kernel flagging.

>  - syzbot issues.
> 
> Ignore them for affs & co.

And still get spammed?  Again, we need some good common way to stop
them even bothering instead of wasting their and our resources.

> 
>  - "they use the buffer cache".
> 
> Waah, waah, waah. The buffer cache is *trivial*. If you don't like the
> buffer cache, don't use it. It's that simple.

FYI, IFF this is a response to my original mail and not some of the
weirder ideas floating around on the lists, I've never said remove the
buffer cache, quite to the contrary.  What is problematic, and what I
want to go away is the buffer_head based helpers for while I/O.  Which
unlike using buffer_heads for the actual metadata buffer_cache has
very useful replacements already.


