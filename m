Return-Path: <ksummit+bounces-1082-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBC7796EB2
	for <lists@lfdr.de>; Thu,  7 Sep 2023 03:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D4A1C20AF1
	for <lists@lfdr.de>; Thu,  7 Sep 2023 01:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90C7A40;
	Thu,  7 Sep 2023 01:53:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D6BA29
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 01:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB18CC433C8;
	Thu,  7 Sep 2023 01:53:15 +0000 (UTC)
Date: Wed, 6 Sep 2023 21:53:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig
 <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file
 systems
Message-ID: <20230906215327.18a45c89@gandalf.local.home>
In-Reply-To: <ZPkDLp0jyteubQhh@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
	<8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
	<ZPkDLp0jyteubQhh@dread.disaster.area>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 7 Sep 2023 08:54:38 +1000
Dave Chinner <david@fromorbit.com> wrote:

> And let's not forget: removing a filesystem from the kernel is not
> removing end user support for extracting data from old filesystems.
> We have VMs for that - we can run pretty much any kernel ever built
> inside a VM, so users that need to extract data from a really old
> filesystem we no longer support in a modern kernel can simply boot
> up an old distro that did support it and extract the data that way.

Of course there's the case of trying to recreate a OS that can run on a
very old kernel. Just building an old kernel is difficult today because
today's compilers will refuse to build them (I've hit issues in bisections
because of that!)

You could argue that you could just install an old OS into the VM, but that
too requires access to that old OS.

Anyway, what about just having read-only be the minimum for supporting a
file system? We can say "sorry, due to no one maintaining this file system,
we will no longer allow write access." But I'm guessing that just
supporting reading an old file system is much easier than modifying one
(wasn't that what we did with NTFS for the longest time?)

-- Steve

