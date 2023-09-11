Return-Path: <ksummit+bounces-1128-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3AA79AC17
	for <lists@lfdr.de>; Tue, 12 Sep 2023 01:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD5751C20A5E
	for <lists@lfdr.de>; Mon, 11 Sep 2023 23:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412538F6B;
	Mon, 11 Sep 2023 23:05:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417B5699
	for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 23:05:53 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c0c6d4d650so42078875ad.0
        for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 16:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694473552; x=1695078352; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuOvAuitgVpwNW68IEhm3g9qIi8Riz123zMf3hveQBs=;
        b=j3ODYq0KYreF0x32K6q0mNUzXcPkILOtol+MjYnzmjXoJvhCzWZ3JckPLgNdemxfup
         gHLXaX+pA50Y6HfLMSkB/M/Ss2DPfdsnHbs81AkZ+kBji1d/nQyK6K5rT114tzzqhJ+F
         OBKcOQkV1xQrqXc5+/BLMlWg6VX7Bu3kjhDYT8JNJ3k8z3WHYjz8sQ5yNyjkDZo724AM
         TQzx3xbd1R6GZOcNR8coGYgySU79122XuGmXV8VD1B6d0r1V9Gkx6K0LHWSCXOkPTiGv
         txASXzfZyHQFQjRsdaoctYLfucOjPWAszenlKJnJYYleKBwDoKNAokaCBhtrXoIfDs57
         WDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694473552; x=1695078352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuOvAuitgVpwNW68IEhm3g9qIi8Riz123zMf3hveQBs=;
        b=HrSeubI3/R13UMmDvd2Bmlw6aow/hH2UxoWFi5rwF1ExxE/YhCVpCvhoKK0zMrOV1l
         UoJDOPTqzj1+O2OHSjcVSbqsUgFvijyFl5v9SgijmE/o/7JjHDz+LKy75j81gknOhBlm
         T3Vj6FiWjy3svmVTLR8FmDlyvonwGUSlGtysm5XrGCa6Xhc7adIVRNJMM8fLCUUnRLjv
         3BsjHxzP0APF9+e95I+CK1hWDyW+m+UuZdb8SGnoYeK8QJao/Gt1PGkFPhwWOml2Y7jP
         BxzHktIuEFFYJWAkMdzQLSW0Q1Wq5D9/m3M3vftBQEIry9fCcLr2ApGlrNvhP4Edbik5
         8xVg==
X-Gm-Message-State: AOJu0YyGRnXXMbUro5IvMR3rnyovCNkdK6lMN77uaTzQeacwBT43hmNN
	itMcGAaj75Pi3hUj/Zq9buulpA==
X-Google-Smtp-Source: AGHT+IHBqWEpAfZoVXfFa5/vR2XzTrXg9hy5GECmWfGXDiZ4BuZu7eo2+Nh2xoOFUY2UwQvCoBZtIw==
X-Received: by 2002:a17:902:e84e:b0:1b8:6cae:3570 with SMTP id t14-20020a170902e84e00b001b86cae3570mr13674878plg.11.1694473552602;
        Mon, 11 Sep 2023 16:05:52 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902dac700b001b392bf9192sm6987910plx.145.2023.09.11.16.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 16:05:52 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qfpyX-00Dyh3-1h;
	Tue, 12 Sep 2023 09:05:49 +1000
Date: Tue, 12 Sep 2023 09:05:49 +1000
From: Dave Chinner <david@fromorbit.com>
To: David Disseldorp <ddiss@suse.de>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, Hajime Tazaki <thehajime@gmail.com>,
	Octavian Purdila <tavi.purdila@gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZP+dTfwJP44wZwSV@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <20230909224230.3hm4rqln33qspmma@moria.home.lan>
 <ZP5nxdbazqirMKAA@dread.disaster.area>
 <20230911012914.xoeowcbruxxonw7u@moria.home.lan>
 <ZP52S8jPsNt0IvQE@dread.disaster.area>
 <20230911153515.2a256856@echidna.fritz.box>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911153515.2a256856@echidna.fritz.box>

On Mon, Sep 11, 2023 at 03:35:15PM +0200, David Disseldorp wrote:
> On Mon, 11 Sep 2023 12:07:07 +1000, Dave Chinner wrote:
> > On Sun, Sep 10, 2023 at 09:29:14PM -0400, Kent Overstreet wrote:
> > > What I've got in bcachefs-tools is a much thinner mapping from e.g.
> > > kthreads -> pthreads, block layer -> aio, etc.  
> > 
> > Right, and we've got that in userspace for XFS, too. If we really
> > cared that much about XFS-FUSE, I'd be converting userspace to use
> > ublk w/ io_uring on top of a port of the kernel XFS buffer cache as
> > the basis for a performant fuse implementation. However, there's a
> > massive amount of userspace work needed to get a native XFS FUSE
> > implementation up and running (even ignoring performance), so it's
> > just not a viable short-term - or even medium-term - solution to the
> > current problems.
> > 
> > Indeed, if you do a fuse->fs ops wrapper, I'd argue that lklfuse is
> > the place to do it so that there is a single code base that supports
> > all kernel filesystems without requiring anyone to support a
> > separate userspace code base. Requiring every filesystem to do their
> > own FUSE ports and then support them doesn't reduce the overall
> > maintenance overhead burden on filesystem developers....
> 
> LKL is still implemented as a non-mmu architecture. The only fs specific
> downstream change that lklfuse depends on is non-mmu xfs_buf support:
> https://lore.kernel.org/linux-xfs/1447800381-20167-1-git-send-email-octavian.purdila@intel.com/

That was proposed in 2015.

> Does your lklfuse enthusiasm here imply that you'd be willing to
> reconsider Octavian's earlier proposal for XFS non-mmu support?

8 years a long time, circumstances change and we should always be
open to changing our minds when presented with new circumstances
and/or evidence.

Context: back in 2015 I was in the middle of a significant revamp of
the kernel and userspace code - that was when the shared libxfs
codebase was new and being actively developed, along with a
significant rework of all the userspace shims.  One of the things
that I was looking at the time was pulling everything into userspace
via libxfs that was needed for a native XFS-FUSE implementation.
That project never got that far - maintainer burnout happened before
that ever became a reality.

In that context, lklfuse didn't really make a whole lot of sense for
providing userspace XFS support via fuse because a native FUSE
solution would be much better in most regards (especially
performance). Things have changed a whole lot since then. We have
less fs developers, we have a antagonistic, uncooperative testing
"community", we have more code and releases to support, etc.

If we go back to what I said earlier about the minimum requirements
for a "community supported filesystem", it was about needing three
things:

- mkfs and fsck coverage
- fstests support
- syzbot doesn't get run on it

Now reconsider lklfuse from this perspective. We have #1 for most
filesystems, #2 is pretty trivial, and #3 is basically "syzbot +
lklfuse > /dev/null"...

IOWs, we can largely validate that lklfuse doesn't eat your data
with relatively little extra effort. We can provide userspace with a
viable, supported mechanism for unprivileged mounts of untrusted
filesystem images that can't lead to kernel compromise. And,
largely, we retain control of the quality of the lklfuse
implementation because it's running the kernel code that we already
maintain and support.

Times change, circumstances change, and if we aren't willing to
change our minds because we need to solve the new challenges
presented to us then we should not be in decision making
positions....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

