Return-Path: <ksummit+bounces-1142-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1FD7A3732
	for <lists@lfdr.de>; Sun, 17 Sep 2023 20:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7485E281386
	for <lists@lfdr.de>; Sun, 17 Sep 2023 18:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ADE6D3F;
	Sun, 17 Sep 2023 18:58:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFE4A29
	for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 18:58:07 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-119-169.bstnma.fios.verizon.net [173.48.119.169])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 38HIvggW015608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Sep 2023 14:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1694977065; bh=iH9sxDfG+5MB1m5+3ayPE+TeTJxCHf134OA5mmfh9QY=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=INQWwT3/qdAH31QX0eF3YfIb0rX6DPYUxWJ64I0pd8WjrVRsrWHDCGjiWKhAkTB5X
	 TaQJLD+aOh4mgRHYMRy88TGPJRSXClegg7cuMdeR/FaGaATkIFMFTMZFfPU2MTWCwj
	 OWeXx6HYtvefa1ax9XhgFbyoN8IPCDwR74M+VbxtXt9K9vNOv3SDU0XagAhucI0yyA
	 qBE8DWdN0NR/t79DqjtnsDTE2jBadgTotnzb189pZKJWTvRu7iocQEMLNSmKaT5cUi
	 CskCkFr/TBMdRb15AxL1+Q9j4CYQXATqbbhHAsx8OFbJmxE0hd/UCWhJoUukEGFnW9
	 AJjMB5zdNHAcg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id A67E615C0346; Sun, 17 Sep 2023 14:57:42 -0400 (EDT)
Date: Sun, 17 Sep 2023 14:57:42 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: NeilBrown <neilb@suse.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Dave Chinner <david@fromorbit.com>, Eric Sandeen <sandeen@sandeen.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
        linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <20230917185742.GA19642@mit.edu>
References: <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>

On Sun, Sep 17, 2023 at 10:30:55AM -0700, Linus Torvalds wrote:
> And yes, *within* the context of a filesystem or two, the whole "try
> to avoid the buffer cache" can be a real thing.

Ext4 uses buffer_heads, and wasn't on your list because we don't use
sb_bread().  And we are thinking about getting rid of buffer heads,
mostly because (a) we want to have more control over which metadata
blocks gets cached and which doesn't, and (b) the buffer cache doesn't
have a callback function to inform the file system if the writeback
fails, so that the file system can try to work around the issue, or at
the very least, mark the file system as corrupted and to signal it via
fsnotify.

Attempts to fix (b) via enhancements buffer cache where shot down by
the linux-fsdevel bike-shedding cabal, because "the buffer cache is
deprecated", and at the time, I decided it wasn't worth pushing it,
since (a) was also a consideration, and I expect we can also (c)
reduce the memory overhead since there are large parts of struct
buffer_head that ext4 doesn't need.


There was *one* one technical argument raised by people who want to
get rid of buffer heads, which is that the change from set_bh_page()
to folio_set_bh() introduced a bug which broke bh_offset() in a way
that only showed up if you were using bh_offset() and the file system
block size was less than the page size.

Eh, it was a bug, and we caught it quickly enough once someone
actually tried to run xfstests on the commit, and it bisected pretty
quickly.  (Unfortunately, the change went in via the mm tree, and so
it wasn't noticed by the ext4 file system developers; but
fortunatelly, Zorro flagged it, and once that showed up, I
investigated it.)  As far as I'm concerned, that's working as
intended, and these sorts of things happen.  So personally, I don't
consider this an argument for nuking the buffer cache.

I *do* view it as only one of many concerns when we do make these
tree-wide changes, such as the folio migration.  Yes, these these
tree-wide can introduce regressions, such as breaking bh_offset() for
a week or so before the regression tests catch it, and another week
before the fix makes its way to Linus's tree.  That's the system
working as designed.

But that's not the only concern; the other problem with these
tree-wide changes is that it tends to break automatic backports of bug
fixes to the LTS kernels, which now require manual handling by the
file system developers (or we could leave the LTS kernels with the
bugs unfixed, but that tends to make customers cranky :-).

Anyway, it's perhaps natural that the people who make these sorts of
tree-wide changes may get cranky when they need to modify, or at least
regression test, 20+ legacy file systems, and it does kind of suck
that many of these legacy file systems can't easily be tested by
xfstests because we don't even have a mkfs program for them.  (OTOH,
we recently merged ntfs3 w/o a working, or at least open-source, mkfs
program, so this isn't *just* the fault of legacy file systems.)

So sure, they may wish that we could make the job of landing these
sorts of tree-wide changes to make their job easier.  But we don't do
tree-wide changes all that often, and so it's a mistake to try to
optimize for this non-common case.

Cheers,

					- Ted

