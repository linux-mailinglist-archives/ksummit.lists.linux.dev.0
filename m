Return-Path: <ksummit+bounces-591-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C56540CE69
	for <lists@lfdr.de>; Wed, 15 Sep 2021 22:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 367C11C0F75
	for <lists@lfdr.de>; Wed, 15 Sep 2021 20:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2964D6D17;
	Wed, 15 Sep 2021 20:49:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCA23FC3
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 20:49:10 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 18FKmtSi032013
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Sep 2021 16:48:56 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 17EBB15C3427; Wed, 15 Sep 2021 16:48:55 -0400 (EDT)
Date: Wed, 15 Sep 2021 16:48:55 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Chris Mason <clm@fb.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Kent Overstreet <kent.overstreet@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        David Howells <dhowells@redhat.com>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINER SUMMIT] Folios as a potential Kernel/Maintainers
 Summit topic?
Message-ID: <YUJcN/dqa8f4R9w0@mit.edu>
References: <YUIwgGzBqX6ZiGgk@mit.edu>
 <f7b70227bac9a684320068b362d28fcade6b65b9.camel@HansenPartnership.com>
 <YUI5bk/94yHPZIqJ@mit.edu>
 <17242A0C-3613-41BB-84E4-2617A182216E@fb.com>
 <f066615c0e2c6fe990fa5c19dd1c17d649bcb03a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f066615c0e2c6fe990fa5c19dd1c17d649bcb03a.camel@HansenPartnership.com>

On Wed, Sep 15, 2021 at 03:15:13PM -0400, James Bottomley wrote:
> 
> My reading of the email threads is that they're iterating to an actual
> conclusion (I admit, I'm surprised) ... or at least the disagreements
> are getting less.  Since the merge window closed this is now a 5.16
> thing, so there's no huge urgency to getting it resolved next week.

My read was that it was more that people were just getting exhausted,
and not necessarily that folks were converging.  (Also, Willy is
currently on vacation.)

I'm happy to be wrong, bu the patches haven't changed since the merge
window opened, and it's not clear what *needs* to change before it can
be accepted at the next merge window.

> Well, the current one seems to be working (admittedly eventually, so
> achieving faster resolution next time might be good) ... but I'm sure
> you could propose alternatives ... especially in the time to resolution
> department.

Given how long it took for DAX to converge (years and years and years
and *multiple* LSF/MM's), I'm not as optimistic that Folios is
converge and is about to be merged at the next merge window.  But
again, I'm happy to be proven wrong.

						- Ted

