Return-Path: <ksummit+bounces-1097-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B494797228
	for <lists@lfdr.de>; Thu,  7 Sep 2023 14:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B81101C20B08
	for <lists@lfdr.de>; Thu,  7 Sep 2023 12:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34116613A;
	Thu,  7 Sep 2023 12:05:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0695695
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 12:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vzKuZ842cAzlIH6IxVey8/Ja6H/+16lqE7iCte1YoSI=; b=qw4opL36m1OgTXUi6aWEL+F0fl
	ChDxJryGV+TgtKo9TBuCDMR7osiXYqegOEHct7cUTn/4N3BvOgIoLVFZlycA6Ach30G0K7H/StV8k
	7CyH6XSNJTLv91+cgXsgyEywDbAkWkbLnJAfoozkbAs29kaUStoJ2T69vsjt3yQyZFjJbI/GuLRiQ
	Y8uskT6ZqJiOWN6K8wEa8CEx+bXnnMHL9zrHlrfXaQ6lSbFGj05Vf+Bsc9Ikx4gHNvJyoIfW2bRVU
	9QZcj7bRC0ZC5qxEnvA0w+XKnXCFZgncYSXTuax69IF64za2U+C0byznhusGABzZ0NDg05yTO5s3d
	OXTexkJw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qeDkk-00Ai9y-5E; Thu, 07 Sep 2023 12:04:54 +0000
Date: Thu, 7 Sep 2023 13:04:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Christian Brauner <brauner@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dave Chinner <david@fromorbit.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPm8ZpGzlY+Sgc7j@casper.infradead.org>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlC0pf2XA1ZGr6j@casper.infradead.org>
 <c89ebbb2-1249-49f3-b80f-0b08711bc29b@leemhuis.info>
 <20230907-kauern-kopfkissen-d8147fb40469@brauner>
 <d62225ae-73dc-4b45-a1d9-078137224eb5@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d62225ae-73dc-4b45-a1d9-078137224eb5@leemhuis.info>

On Thu, Sep 07, 2023 at 01:18:27PM +0200, Thorsten Leemhuis wrote:
> On 07.09.23 12:29, Christian Brauner wrote:
> >> So why can't that work similarly for unmaintained file systems? We could
> >> even establish the rule that Linus should only apply patches to some
> >> parts of the kernel if the test suite for unmaintained file systems
> >> succeeded without regressions. And only accept new file system code if a
> > 
> > Reading this mail scared me.
> 
> Sorry about that, I can fully understand that. It's just that some
> statements in this thread sounded a whole lot like "filesystems want to
> opt-out of the no regression rule" to me. That's why I at some point
> thought I had to speak up.

It's the very opposite of that.  We're all highly conscious of not eating
user data.  Which means that filesystem development often grinds to a
halt while we investigatee bugs.  This is why syzbot is so freaking
dangerous.  It's essentially an automated assault on fs developers.
Worse, Google released syzkaller to the public and now we have random
arseholes running it who have "made proprietary changes to it", and have
no idea how to decide if a report from it is in any way useful.

> But what about hfsplus? From hch's initial mail of this thread it sounds
> like that is something users would miss. So removing it without a very
> strong need[1] seems wrong to me. That's why I got involved in this
> discussion.
> 
> [1] e.g. data loss or damage (as mentioned in my earlier mail) or
> substantial security problems (forgot to mentioned them in my earlier mail)

That's the entire problem!  A seemingly innocent change can easily
lose HFS+ data and we wouldn't find out for years because there's no
test-suite.  A properly tested filesystem looks like this:

https://lore.kernel.org/linux-ext4/20230903120001.qjv5uva2zaqthgk2@zlang-mailbox/

I inadvertently introduced a bug in ext4 with 1kB block size; it's
picked up in less than a week, and within a week of the initial report,
it's diagnosed and fixed.

If that same bug had been introduced to HFS+, how long would it have
taken for anyone to find the bug?  How much longer would it have taken
to track down and fix?


