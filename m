Return-Path: <ksummit+bounces-1070-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7878D665
	for <lists@lfdr.de>; Wed, 30 Aug 2023 16:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 518391C208DA
	for <lists@lfdr.de>; Wed, 30 Aug 2023 14:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643396AA2;
	Wed, 30 Aug 2023 14:07:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4713FFB
	for <ksummit@lists.linux.dev>; Wed, 30 Aug 2023 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TukzlC5Spp+/gapZ9N8BtFW9oYA5bh7dnxW32trZiQc=; b=kbf/OKou2W5PCFLgHm8sLBhYoH
	XXUiHr0ySrPElULbp0uCIqWess6zAJm4twDR8XsiNeXhtW6l3Ct7yt0IdND3e7XONogvaa7nuS0nf
	IVAj3bWzvkPuObfzbRkAU9WkTValvqyhpRu4QExjUxPpsekX/uQ2XSSgX1w6nxikZ6xO3N6jshfiZ
	FudmpYphLeUgdJ3kF2SK22LHT8jLyXnB/vCLu5crW1NhopJWEgH4ipOpQuDgcYVrn82ZjNvXylR69
	yfYJku/Xd+sAHchnQhA2ZyqQs02CLYflKReSCGb2u/clEBgy6rSd05nhsidjpgW7j6oVS0LF2Tf0f
	hmfZNa6Q==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLrD-00De9q-0P;
	Wed, 30 Aug 2023 14:07:43 +0000
Date: Wed, 30 Aug 2023 16:07:39 +0200
From: Christoph Hellwig <hch@infradead.org>
To: ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZO9NK0FchtYjOuIH@infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

we have a lot of on-disk file system drivers in Linux, which I consider
a good thing as it allows a lot of interoperability.  At the same time
maintaining them is a burden, and there is a lot expectation on how
they are maintained.

Part 1: untrusted file systems

There has been a lot of syzbot fuzzing using generated file system
images, which I again consider a very good thing as syzbot is good
a finding bugs.  Unfortunately it also finds a lot of bugs that no
one is interested in fixing.   The reason for that is that file system
maintainers only consider a tiny subset of the file system drivers,
and for some of them a subset of the format options to be trusted vs
untrusted input.  It thus is not just a waste of time for syzbot itself,
but even more so for the maintainers to report fuzzing bugs in other
implementations.

What can we do to only mark certain file systems (and format options)
as trusted on untrusted input and remove a lot of the current tension
and make everyone work more efficiently?  Note that this isn't even
getting into really trusted on-disk formats, which is a security
discussion on it's own, but just into formats where the maintainers
are interested in dealing with fuzzed images.

Part 2: unmaintained file systems

A lot of our file system drivers are either de facto or formally
unmaintained.  If we want to move the kernel forward by finishing
API transitions (new mount API, buffer_head removal for the I/O path,
->writepage removal, etc) these file systems need to change as well
and need some kind of testing.  The easiest way forward would be
to remove everything that is not fully maintained, but that would
remove a lot of useful features.

E.g. the hfsplus driver is unmaintained despite collecting odd fixes.
It collects odd fixes because it is really useful for interoperating
with MacOS and it would be a pity to remove it.  At the same time
it is impossible to test changes to hfsplus sanely as there is no
mkfs.hfsplus or fsck.hfsplus available for Linux.  We used to have
one that was ported from the open source Darwin code drops, and
I managed to get xfstests to run on hfsplus with them, but this
old version doesn't compile on any modern Linux distribution and
new versions of the code aren't trivially portable to Linux.

Do we have volunteers with old enough distros that we can list as
testers for this code?  Do we have any other way to proceed?

If we don't, are we just going to untested API changes to these
code bases, or keep the old APIs around forever?

