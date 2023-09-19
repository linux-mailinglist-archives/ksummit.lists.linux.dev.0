Return-Path: <ksummit+bounces-1155-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 156787A5944
	for <lists@lfdr.de>; Tue, 19 Sep 2023 07:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26FF81C20CAF
	for <lists@lfdr.de>; Tue, 19 Sep 2023 05:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7213134CEF;
	Tue, 19 Sep 2023 05:17:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF3C10E3
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 05:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JbEsJiZbiePyr03jReWi7ze2b4drn08csPH6tc8v8PE=; b=ZsHi1QrJzYiMSgzP+GrmnFRwFr
	QaCeJAjNuUVM6hWTJZdA1NSSD0l1BxTQvbhikWZA9EEmEoxGdNqv9XwqdbOO751W+N3WIvAix9abi
	2M1iS/fo02Kqu7DUpZHkdzhNa3zm/T09KP9hOMPiobcljOs9+TziBV7yUiM/aXPfqTb2SXBR19A0+
	TC3oAIyMPer8UiiapNFOTmN3m2h4rHbnmUjVdsovwVqGXFF/oFTVmW9BivU2yWse1JOQAZjJZgPZL
	MMiSNHzTuWQVM6d4m23Otkk8Q1CnFvfXT9MxBVPrNAorGrBE+qQ54zlykccPRNhWEYD8PsI8bNNRH
	cZWnUQmg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qiT6v-00FLZz-6i; Tue, 19 Sep 2023 05:17:21 +0000
Date: Tue, 19 Sep 2023 06:17:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	NeilBrown <neilb@suse.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Eric Sandeen <sandeen@sandeen.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZQku4dvmtO56BvCr@casper.infradead.org>
References: <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <ZQj2SgSKOzfKR0e3@dread.disaster.area>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQj2SgSKOzfKR0e3@dread.disaster.area>

On Tue, Sep 19, 2023 at 11:15:54AM +1000, Dave Chinner wrote:
> This was easy to do with iomap based filesystems because they don't
> carry per-block filesystem structures for every folio cached in page
> cache - we carry a single object per folio that holds the 2 bits of
> per-filesystem block state we need for each block the folio maps.
> Compare that to a bufferhead - it uses 56 bytes of memory per
> fielsystem block that is cached.

56?1  What kind of config do you have?  It's 104 bytes on Debian:
buffer_head          936   1092    104   39    1 : tunables    0    0    0 : slabdata     28     28      0

Maybe you were looking at a 32-bit system; most of the elements are
word-sized (pointers, size_t or long)

> So we have to consider that maybe it is less work to make high-order
> folios work with bufferheads. And that's where we start to get into
> the maintenance problems with old filesysetms using bufferheads -
> how do we ensure that the changes for high-order folio support in
> bufferheads does not break the way one of these old filesystems
> that use bufferheads?

I don't think we can do it.  Regardless of the question you're proposing
here, the model where we complete a BIO, then walk every buffer_head
attached to the folio to determine if we can now mark the folio as being
(uptodate / not-under-writeback) just doesn't scale when you attach more
than tens of BHs to the folio.  It's one bit per BH rather than having
a summary bitmap like iomap has.

I have been thinking about spitting the BH into two pieces, something
like this:

struct buffer_head_head {
	spinlock_t b_lock;
	struct buffer_head *buffers;
	unsigned long state[];
};

and remove BH_Uptodate and BH_Dirty in favour of setting bits in state
like iomap does.

But, as you say, there are a lot of filesystems that would need to be
audited and probably modified.

Frustratingly, it looks like buffer_heads were intended to be used as
extents; each one has a b_size of its own.  But there's a ridiculous
amount of code that assumes that all BHs attached to a folio have the
same b_size as each other.

