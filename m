Return-Path: <ksummit+bounces-1101-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 437C67972E9
	for <lists@lfdr.de>; Thu,  7 Sep 2023 15:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 342811C20B25
	for <lists@lfdr.de>; Thu,  7 Sep 2023 13:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350F56FBA;
	Thu,  7 Sep 2023 13:56:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616F6AA5
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 13:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A054C3278D;
	Thu,  7 Sep 2023 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694094981;
	bh=4fDTcWfGOx0uv2rdjfjvg4Xdz6s4azE6jhc61rQcYEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lM+9amy+/Q+aVwWRqcMWNg6hfYTA7LZf41KLVrOrYmCeHJOYIXb9G9EAop1IsAk8k
	 A9ij8PuzO143upVh6n7QhhiqZxXB4RymGjGvDiZzmgHvxDw1LwnzwygBfLd8Riy1R+
	 s8bxZjovUPT4d0qOyi+LVcrbn4QidXRfw4vnsCEYtAqJHVN0g4bW5oiNsX7qVgJXcu
	 8HjkNswHrejuAIX9yEiYCxi0/ENPbuL7Ja08oThqhqenbzo0zaFKDU/oqg354IPmO/
	 O7+RYEz72yamF002tt/HrcSjzEOphRi4a/xUNak/HX3++Wnk2yzq6TtlUwXMTL0zgT
	 lkXronVTYCiew==
Date: Thu, 7 Sep 2023 15:56:17 +0200
From: Christian Brauner <brauner@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Matthew Wilcox <willy@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dave Chinner <david@fromorbit.com>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <20230907-hochrangig-eindecken-6340628d209c@brauner>
References: <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlC0pf2XA1ZGr6j@casper.infradead.org>
 <c89ebbb2-1249-49f3-b80f-0b08711bc29b@leemhuis.info>
 <20230907-kauern-kopfkissen-d8147fb40469@brauner>
 <d62225ae-73dc-4b45-a1d9-078137224eb5@leemhuis.info>
 <0ece94aa-141e-564c-f43c-2d6d4b9e61c4@roeck-us.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ece94aa-141e-564c-f43c-2d6d4b9e61c4@roeck-us.net>

On Thu, Sep 07, 2023 at 05:57:47AM -0700, Guenter Roeck wrote:
> On 9/7/23 04:18, Thorsten Leemhuis wrote:
> > On 07.09.23 12:29, Christian Brauner wrote:
> > > > So why can't that work similarly for unmaintained file systems? We could
> > > > even establish the rule that Linus should only apply patches to some
> > > > parts of the kernel if the test suite for unmaintained file systems
> > > > succeeded without regressions. And only accept new file system code if a
> > > 
> > > Reading this mail scared me.
> > 
> > Sorry about that, I can fully understand that. It's just that some
> > statements in this thread sounded a whole lot like "filesystems want to
> > opt-out of the no regression rule" to me. That's why I at some point
> > thought I had to speak up.
> > 
> > > The list of reiserfs bugs alone is crazy.
> > 
> > Well, we regularly remove drivers or even support for whole archs
> > without getting into conflict with the "no regressions" rule, so I'd say
> > that should be possible for file systems as well.
> > 
> > And I think for reiserfs we are on track with that.
> > 
> > But what about hfsplus? From hch's initial mail of this thread it sounds
> > like that is something users would miss. So removing it without a very
> > strong need[1] seems wrong to me. That's why I got involved in this
> > discussion.
> > 
> 
> The original mail also suggested that there would be essentially no means
> to create a hfsplus file system in Linux. That would mean it would, for all
> practical purposes, be untestable.
> 
> However:
> 
> $ sudo apt-get install hfsprogs
> $ truncate -s 64M filesystem.hfsplus
> $ mkfs.hfsplus filesystem.hfsplus
> Initialized filesystem.hfsplus as a 64 MB HFS Plus volume
> $ file filesystem.hfsplus
> filesystem.hfsplus: Macintosh HFS Extended version 4 data last mounted by: '10.0', created: Thu Sep  7 05:41:21 2023, last modified: Thu Sep  7 12:41:21 2023, last checked: Thu Sep  7 12:41:7
> 
> So I am not really sure I understand what the problem actually is.
> 
> No a side note, the crash I observed with ntfs3 was introduced by
> commit a4f64a300a29 ("ntfs3: free the sbi in ->kill_sb").

I just gave you a fix to test for your report.

(ntfs3 was holding on to inodes past ->put_super(). Anyway, not relevant
for this discussion here.)

