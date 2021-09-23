Return-Path: <ksummit+bounces-630-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B1415B9B
	for <lists@lfdr.de>; Thu, 23 Sep 2021 11:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 688EE3E1041
	for <lists@lfdr.de>; Thu, 23 Sep 2021 09:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1286F3FD4;
	Thu, 23 Sep 2021 09:59:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180B3FC8
	for <ksummit@lists.linux.dev>; Thu, 23 Sep 2021 09:58:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8860645E;
	Thu, 23 Sep 2021 11:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1632390567;
	bh=41s0n6AK6hKATBOE3PdExCNGGwDnKkbOWPPK1wH+Ul4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5qaSpQ3gSPaANy6Pe/MST1aOBp5XFVaZ/7QaTH6TbsI628boUc6oCsh/IuE7SDPm
	 HA6ovvmLzB1t+cqV6KBaIyZqprDmSN+ADXccZP9YkiegPyZ/uKKRk+tXcde0eLXXPQ
	 /2077yuMzy/qRusc6CTBMgHhjtvG7YxFj3c82+98=
Date: Thu, 23 Sep 2021 12:49:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: ksummit@lists.linux.dev
Subject: Re: Potential topics for the 2021 Maintainer's Summit
Message-ID: <YUxNpVkO68dllK/N@pendragon.ideasonboard.com>
References: <YUwOE5ExtvMye2t/@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUwOE5ExtvMye2t/@mit.edu>

Hi Ted,

On Thu, Sep 23, 2021 at 01:18:11AM -0400, Theodore Ts'o wrote:
> 
> After discussions amongst the program committee, and looking at some
> of the discussions to date at the LPC and the Kernel Summit, we've
> come up with the following potential topics for the Maintainer's
> Summit.
> 
> This is not the final agenda.  We are soliciting suggestions and
> comments about these topics.  Is there anything we are missing?  Is
> there something you think wouldn't be productive for us to discuss?
> 
> 
> 		  Potential Maintainer Summit topics
> 
> * Reviewing how we reacted to the University of Minnesota issue
>     After Greg K-H gives a non-technical summary of what
>     happened, and we would have a discussion about what should be
>     done differently next time.
> 
> * User-space requirementrs for accelerator drivers
>     There was some good discussion on the ksummit list, but there still isn't
>     a clear consensus of what the policy should be.  From Jon's message
>     kicking off that thread:
> 
>     - Under which circumstances should the kernel community require the
>       existence of freely licensed user-space code that exercises all
>       functionalities of a proposed kernel driver or feature?
> 
>     - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
>       are only available to drivers with a free user-space implementation?
>       Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> 
>     - What constitutes an acceptable user-space implementation in cases
>       where these restrictions apply?

Just a quick comment on this. if it can be useful information, I'd be
happy to briefly explain and answer questions about the ongoing effort
to build a camera stack for Linux. We're running into the exact same
issues, and have been trying to build bridges with SoC vendors over the
past few years (with various levels of success).

> * Acceptance criteria of patch sets
>     The discussion over the folio patch set seems to be making forward
>     progress, but it's not the only case where we've had some disagreements
>     over large code contribuions: ntfs3 and ksmbd come to mind.
>     Also from the kernel summit, see slide 10 ("Upstreaming Agony) at: 
>     https://linuxplumbersconf.org/event/11/contributions/964/attachments/802/1511/Ksummit%20%283%29.pdf
> 
>     "We want to upstream everything. It makes Linux better and our lives easier.
>     However:
>     * High variability in maintainer responsiveness
>     	 * Some subsystems are really great
>     	 * Some armitecture maintainers are not as easy to work with
>     	 * Some subsystems are just stuck (e.g. memory management)
>     * Replies often come with “helpful” suggestions of radical product redesign
>          * E.g. preempt count passthrough for VMs to improve scheduling of
> 	   guests
>     * Plus usual stuff, e.g. “oh sure we can apply this two liner… *after*
>        you rewrite the subsystem”
>     Wishlist:
>     * Consistent maintainer responsiveness and acceptance criteria
>         * A maintainer CoC or expectations doc?
>     * More data driven decision making (e.g. which benchmarks are generally
>       agreed to be important for each subsystem)
>     * More openness to experimentation
>         * How can we enable this?"
> 
> * Rust in the Kernel
>     We could potentially invite Miguel so we can give him feedback, concerns,
>     etc. regarding Rust in the kernel.  In particular, Miguel asked
>     some questions at the end of his talk at the Kernel Summit:
>     https://youtu.be/mF10hgVIx9o?t=15245
>     for which feedback from the maintainers might be helpful --- if
>     we are ready to give an opinion, which is not clear.
> 
> * Is Linus happy/unhappy with the development process of Linux?
>     Anything else we need to discuss or address?
> 
> 
> Also, this is the current list of invitees to the Maintainer's Summit
> (including sponsored attendees).  As we finalize the topics, there may
> be one or two additional invites.  (For example, if we do decide to
> pursue the Rust in the kernel topic, we would need to invite Miguel,
> assuming he would be available on Friday.)
> 
> Al Viro
> Alex Deucher
> Alexei Starovoitov
> Andrew Morton
> Arnd Bergmann
> Bjorn Helgaas
> Borislav Petkov
> Chris Mason
> Christoph Hellwig
> Damien Le Moal
> Dave Airlie
> David S. Miller
> Greg Kroah-Hartman
> Ingo Molnar
> Jakub Kicinski
> Jens Axboe
> Jon Corbet
> Kees Cook
> Linus Torvalds
> Mark Brown
> Martin K. Petersen
> Michael Ellerman
> Rafael J. Wysocki
> Sasha Levin
> Stephen Rothwell
> Theodore Ts'o
> Thomas Gleixner
> Vasily Gorbik
> Will Deacon

-- 
Regards,

Laurent Pinchart

