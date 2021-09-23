Return-Path: <ksummit+bounces-629-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039A4157CD
	for <lists@lfdr.de>; Thu, 23 Sep 2021 07:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1A7F21C0F49
	for <lists@lfdr.de>; Thu, 23 Sep 2021 05:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CB93FCC;
	Thu, 23 Sep 2021 05:18:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E443FC7
	for <ksummit@lists.linux.dev>; Thu, 23 Sep 2021 05:18:19 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 18N5IBIu025776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Sep 2021 01:18:12 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id A7F8C15C375F; Thu, 23 Sep 2021 01:18:11 -0400 (EDT)
Date: Thu, 23 Sep 2021 01:18:11 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: ksummit@lists.linux.dev
Subject: Potential topics for the 2021 Maintainer's Summit
Message-ID: <YUwOE5ExtvMye2t/@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


After discussions amongst the program committee, and looking at some
of the discussions to date at the LPC and the Kernel Summit, we've
come up with the following potential topics for the Maintainer's
Summit.

This is not the final agenda.  We are soliciting suggestions and
comments about these topics.  Is there anything we are missing?  Is
there something you think wouldn't be productive for us to discuss?


		  Potential Maintainer Summit topics

* Reviewing how we reacted to the University of Minnesota issue
    After Greg K-H gives a non-technical summary of what
    happened, and we would have a discussion about what should be
    done differently next time.

* User-space requirementrs for accelerator drivers
    There was some good discussion on the ksummit list, but there still isn't
    a clear consensus of what the policy should be.  From Jon's message
    kicking off that thread:

    - Under which circumstances should the kernel community require the
      existence of freely licensed user-space code that exercises all
      functionalities of a proposed kernel driver or feature?

    - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
      are only available to drivers with a free user-space implementation?
      Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?

    - What constitutes an acceptable user-space implementation in cases
      where these restrictions apply?

* Acceptance criteria of patch sets
    The discussion over the folio patch set seems to be making forward
    progress, but it's not the only case where we've had some disagreements
    over large code contribuions: ntfs3 and ksmbd come to mind.
    Also from the kernel summit, see slide 10 ("Upstreaming Agony) at: 
    https://linuxplumbersconf.org/event/11/contributions/964/attachments/802/1511/Ksummit%20%283%29.pdf

    "We want to upstream everything. It makes Linux better and our lives easier.
    However:
    * High variability in maintainer responsiveness
    	 * Some subsystems are really great
    	 * Some armitecture maintainers are not as easy to work with
    	 * Some subsystems are just stuck (e.g. memory management)
    * Replies often come with “helpful” suggestions of radical product redesign
         * E.g. preempt count passthrough for VMs to improve scheduling of
	   guests
    * Plus usual stuff, e.g. “oh sure we can apply this two liner… *after*
       you rewrite the subsystem”
    Wishlist:
    * Consistent maintainer responsiveness and acceptance criteria
        * A maintainer CoC or expectations doc?
    * More data driven decision making (e.g. which benchmarks are generally
      agreed to be important for each subsystem)
    * More openness to experimentation
        * How can we enable this?"

* Rust in the Kernel
    We could potentially invite Miguel so we can give him feedback, concerns,
    etc. regarding Rust in the kernel.  In particular, Miguel asked
    some questions at the end of his talk at the Kernel Summit:
    https://youtu.be/mF10hgVIx9o?t=15245
    for which feedback from the maintainers might be helpful --- if
    we are ready to give an opinion, which is not clear.

* Is Linus happy/unhappy with the development process of Linux?
    Anything else we need to discuss or address?


Also, this is the current list of invitees to the Maintainer's Summit
(including sponsored attendees).  As we finalize the topics, there may
be one or two additional invites.  (For example, if we do decide to
pursue the Rust in the kernel topic, we would need to invite Miguel,
assuming he would be available on Friday.)

Al Viro
Alex Deucher
Alexei Starovoitov
Andrew Morton
Arnd Bergmann
Bjorn Helgaas
Borislav Petkov
Chris Mason
Christoph Hellwig
Damien Le Moal
Dave Airlie
David S. Miller
Greg Kroah-Hartman
Ingo Molnar
Jakub Kicinski
Jens Axboe
Jon Corbet
Kees Cook
Linus Torvalds
Mark Brown
Martin K. Petersen
Michael Ellerman
Rafael J. Wysocki
Sasha Levin
Stephen Rothwell
Theodore Ts'o
Thomas Gleixner
Vasily Gorbik
Will Deacon

