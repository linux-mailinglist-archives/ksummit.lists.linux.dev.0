Return-Path: <ksummit+bounces-1084-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4FF796F18
	for <lists@lfdr.de>; Thu,  7 Sep 2023 04:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FCA31C20B53
	for <lists@lfdr.de>; Thu,  7 Sep 2023 02:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A4FA5A;
	Thu,  7 Sep 2023 02:51:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FB3371
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 02:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F323CC433C8;
	Thu,  7 Sep 2023 02:51:25 +0000 (UTC)
Date: Wed, 6 Sep 2023 22:51:39 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig
 <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file
 systems
Message-ID: <20230906225139.6ffe953c@gandalf.local.home>
In-Reply-To: <ZPkz86RRLaYOkmx+@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
	<8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
	<ZPkDLp0jyteubQhh@dread.disaster.area>
	<20230906215327.18a45c89@gandalf.local.home>
	<ZPkz86RRLaYOkmx+@dread.disaster.area>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 7 Sep 2023 12:22:43 +1000
Dave Chinner <david@fromorbit.com> wrote:

> > Anyway, what about just having read-only be the minimum for supporting a
> > file system? We can say "sorry, due to no one maintaining this file system,
> > we will no longer allow write access." But I'm guessing that just
> > supporting reading an old file system is much easier than modifying one
> > (wasn't that what we did with NTFS for the longest time?)  
> 
> "Read only" doesn't mean the filesytsem implementation is in any way
> secure, robust or trustworthy - the kernel is still parsing
> untrusted data in ring 0 using unmaintained, bit-rotted, untested
> code....

It's just a way to still easily retrieve it, than going through and looking
for those old ISOs that still might exist on the interwebs. I wouldn't
recommend anyone actually having that code enabled on a system that doesn't
need access to one of those file systems.

I guess the point I'm making is, what's the burden in keeping it around in
the read-only state? It shouldn't require any updates for new features,
which is the complaint I believe Willy was having.

-- Steve

