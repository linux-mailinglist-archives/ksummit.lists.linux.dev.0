Return-Path: <ksummit+bounces-584-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id E80F540CBD7
	for <lists@lfdr.de>; Wed, 15 Sep 2021 19:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 218F81C0EF3
	for <lists@lfdr.de>; Wed, 15 Sep 2021 17:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEDB3FD8;
	Wed, 15 Sep 2021 17:42:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2CA3FC4
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 17:42:43 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 18FHgO2e004544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Sep 2021 13:42:25 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 360D215C3424; Wed, 15 Sep 2021 13:42:24 -0400 (EDT)
Date: Wed, 15 Sep 2021 13:42:24 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kent Overstreet <kent.overstreet@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        David Howells <dhowells@redhat.com>, ksummit@lists.linux.dev
Subject: [MAINTAINER SUMMIT] Folios as a potential Kernel/Maintainers Summit
 topic?
Message-ID: <YUIwgGzBqX6ZiGgk@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Back when we could fit all or most of the Maintainers plus interested
developers in a single room, the question of how to make forward
progress on something like Folios.  These days, all of the interested
parties wouldn't fit in a single room, which is why Maintainers summit
focuses only on development process issues.

However, this means that when we need to make a call about what needs
to happen before Folios can be merged, we don't seem to have a good
way to make that happen.  And being a file system developer who is
eagerly looking forward to what Folios will enable, I'm a bit biased
in terms of wanting to see how we can break the logjam and move
forward.

So.... I have a proposal.  We could potentially schedule a Wither
Folios LPC BOF during one of the time slots on Friday when the
Maintainers Summit is taking place, and we arrange to have all of the
Maintainers switch over to the LPC BOF room.  If enough of the various
stakeholders for Folios are going to be attending LPC or Maintainer's
Summit, and folks (especially Linus, who ultiamtely needs to make the
final decision), this is something we could do.

Would this be helpful?  (Or Linus could pull either the folio or
pageset branch, and make this proposal obsolete, which would be great.  :-)

	    	      	       		 - Ted

