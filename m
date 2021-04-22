Return-Path: <ksummit+bounces-117-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id E544F368651
	for <lists@lfdr.de>; Thu, 22 Apr 2021 20:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A4E853E85FA
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5DD2FA0;
	Thu, 22 Apr 2021 18:03:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5605F71
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 18:03:18 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lZdfR-007Rhf-4P; Thu, 22 Apr 2021 18:03:09 +0000
Date: Thu, 22 Apr 2021 18:03:09 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@infradead.org>
Cc: Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIG6XaUrdt6jUezJ@zeniv-ca.linux.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <20210422055948.GA4171859@infradead.org>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422055948.GA4171859@infradead.org>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Apr 22, 2021 at 06:59:48AM +0100, Christoph Hellwig wrote:
> On Wed, Apr 21, 2021 at 12:32:33PM -0700, Roland Dreier wrote:
> > I also think there does need to be a strong sanction against this UMN
> > research group, since we need to make sure there are strong incentives
> > against wasting everyone's time with stunts like this.  Hopefully on
> > the academic side it can be made clear that this is not ethical
> > research - for example, why did IEEE think this was an acceptable
> > paper?
> 
> I wholeheartedly disagree.  Demonstrating this kind of "attack" has
> been long overdue, and kicked off a very important discussion.  Even
> more so as in this area malice is almost indistinguishable from normal
> incompetence.  I think they deserve a medel of honor.

Demonstrating this kind of attack would be very useful, if they bothered to
provide the raw data and their protocol.

They'd done neither, AFAICS.  There's no way to actually look at how the
submissions went, timings, etc.  We are offered what could (very generously)
be called aggregate stats illustrating the problems, along with bloody
worthless suggestions of improvements.  Use of the technics in question
is not limited to introducing UAF bugs; it's certainly possible to use
a (real or not) UAF bug as an excuse to get in something designed _not_
to be caught by any of their suggested scler^Whardening patches, etc.

There certainly are very real problems with review process, and examining
their data might provide useful insights - had any of that data been
given.

There are tons of problems with their paper, and not in the ethics part.

