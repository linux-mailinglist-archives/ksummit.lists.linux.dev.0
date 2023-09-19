Return-Path: <ksummit+bounces-1156-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F967A6908
	for <lists@lfdr.de>; Tue, 19 Sep 2023 18:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20DEF2819F7
	for <lists@lfdr.de>; Tue, 19 Sep 2023 16:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3863F37152;
	Tue, 19 Sep 2023 16:34:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9151347CC
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 16:34:40 +0000 (UTC)
Received: from letrec.thunk.org (c-73-8-226-230.hsd1.il.comcast.net [73.8.226.230])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 38JGYI8E028975
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 12:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1695141262; bh=NGBAkjk/YE/hENxosqRG5ZbZZ+oPURPyaV1n+mDjY4A=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=SUJaN+rRopikPSk+FjhrYbdNLPy3QXmfYPFefn5UODLHyy/H25cnUHqV9XYdsaI5e
	 nf3ucoAT4DsE66LG+0KnbJ0jtipdSiHgrn2OMBzs40DJi6DvKQvraLQnZqS9N7wDnR
	 UzQT3TL3JFlTbYRKIM0iFnZnPy0MxiwfTjthqMwqv++6yHMnlfBlHwzCO5qHy2ixEz
	 YrhunkgRly4lpkkFPUmt5vHdU29Gqs1M08jJG/IoD0nU2p/ZpRsuaEp1JUYbB4LV5O
	 N9e+5FTFbd+gBQHDxzvlYRdzD6CFpnpMRWaN0zH/voACnAVc5xXrNeKbGEUqmmypQT
	 p00dKfxBovd3A==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id AC4708C0385; Tue, 19 Sep 2023 12:34:17 -0400 (EDT)
Date: Tue, 19 Sep 2023 12:34:17 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Matthew Wilcox <willy@infradead.org>
Cc: Dave Chinner <david@fromorbit.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        NeilBrown <neilb@suse.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Eric Sandeen <sandeen@sandeen.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
        linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZQnNiTfXK81ZQGEq@mit.edu>
References: <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <ZQj2SgSKOzfKR0e3@dread.disaster.area>
 <ZQku4dvmtO56BvCr@casper.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQku4dvmtO56BvCr@casper.infradead.org>

On Tue, Sep 19, 2023 at 06:17:21AM +0100, Matthew Wilcox wrote:
> Frustratingly, it looks like buffer_heads were intended to be used as
> extents; each one has a b_size of its own.  But there's a ridiculous
> amount of code that assumes that all BHs attached to a folio have the
> same b_size as each other.

The primary reason why we need a per-bh b_size is for the benefit of
non-iomap O_DIRECT code paths.  If that goes away, then we can
simplify this significantly, since we flush the buffer cache whenever
we change the blocksize used in the buffer cache; the O_DIRECT bh's
aren't part of the buffer cache, which is when you might have bh's with
a b_size of 8200k (when doing a 8200k O_DIRECT read or write).

Cheers,

						- Ted

